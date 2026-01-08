// =====================================================
// FORGOT-PASSWORD.JS - Handle forgot password flow
// =====================================================

// API Configuration
const isLocalhost = window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1';
const API_BASE_URL = isLocalhost
    ? 'http://localhost:3000/api'
    : 'https://herbmed-production.up.railway.app/api';

// State
let currentPhoneNumber = '';
let currentTokenId = null;
let countdownInterval = null;
let remainingSeconds = 300; // 5 minutes

// ===== UTILITY FUNCTIONS =====

function togglePwd(id, btn) {
    const el = document.getElementById(id);
    if (!el) return;
    const showing = el.type === 'text';
    el.type = showing ? 'password' : 'text';
}

function setErr(name, msg = '') {
    const el = document.querySelector(`.error[data-for="${name}"]`);
    if (el) el.textContent = msg;
}

function showStep(stepNumber) {
    // Hide all sections
    document.querySelectorAll('.form-section').forEach(s => s.classList.remove('active'));
    document.querySelectorAll('.step').forEach(s => s.classList.remove('active', 'completed'));

    // Show current section
    const stepIds = ['step1', 'step2', 'step3', 'stepSuccess'];
    const stepEl = document.getElementById(stepIds[stepNumber - 1]);
    if (stepEl) stepEl.classList.add('active');

    // Update indicators
    for (let i = 1; i <= 3; i++) {
        const indicator = document.getElementById(`step${i}-indicator`);
        if (i < stepNumber) {
            indicator.classList.add('completed');
        } else if (i === stepNumber) {
            indicator.classList.add('active');
        }
    }
}

function startCountdown() {
    remainingSeconds = 300;
    const countdownEl = document.getElementById('countdown');
    const timerEl = document.getElementById('otpTimer');
    const resendBtn = document.getElementById('resendBtn');

    resendBtn.disabled = true;

    if (countdownInterval) clearInterval(countdownInterval);

    countdownInterval = setInterval(() => {
        remainingSeconds--;
        const mins = Math.floor(remainingSeconds / 60);
        const secs = remainingSeconds % 60;
        countdownEl.textContent = `${mins}:${secs.toString().padStart(2, '0')}`;

        if (remainingSeconds <= 0) {
            clearInterval(countdownInterval);
            timerEl.classList.add('expired');
            countdownEl.textContent = 'Hết hạn';
            resendBtn.disabled = false;
        }
    }, 1000);
}

// ===== OTP INPUT HANDLING =====

function setupOtpInputs() {
    const inputs = document.querySelectorAll('.otp-digit');

    inputs.forEach((input, index) => {
        // Auto-focus next input on input
        input.addEventListener('input', (e) => {
            const value = e.target.value;

            // Only allow numbers
            e.target.value = value.replace(/[^0-9]/g, '');

            if (value && index < inputs.length - 1) {
                inputs[index + 1].focus();
            }

            // Update hidden input with full OTP
            updateOtpCode();
        });

        // Handle backspace
        input.addEventListener('keydown', (e) => {
            if (e.key === 'Backspace' && !e.target.value && index > 0) {
                inputs[index - 1].focus();
            }
        });

        // Handle paste
        input.addEventListener('paste', (e) => {
            e.preventDefault();
            const pastedData = e.clipboardData.getData('text').replace(/[^0-9]/g, '').slice(0, 6);

            for (let i = 0; i < pastedData.length && i < inputs.length; i++) {
                inputs[i].value = pastedData[i];
            }

            if (pastedData.length > 0) {
                const focusIndex = Math.min(pastedData.length, inputs.length - 1);
                inputs[focusIndex].focus();
            }

            updateOtpCode();
        });
    });
}

function updateOtpCode() {
    const inputs = document.querySelectorAll('.otp-digit');
    let otp = '';
    inputs.forEach(input => otp += input.value);
    document.getElementById('otpCode').value = otp;
}

function clearOtpInputs() {
    const inputs = document.querySelectorAll('.otp-digit');
    inputs.forEach(input => input.value = '');
    document.getElementById('otpCode').value = '';
}

// ===== API CALLS =====

// Step 1: Request OTP
document.getElementById('phoneForm')?.addEventListener('submit', async (e) => {
    e.preventDefault();
    setErr('phoneNumber', '');

    const phoneNumber = document.getElementById('phoneNumber').value.trim();

    // Validate phone number (Vietnamese format)
    const phoneRegex = /^(0|\+84)[0-9]{9,10}$/;
    if (!phoneRegex.test(phoneNumber)) {
        setErr('phoneNumber', 'Số điện thoại không hợp lệ. Ví dụ: 0912345678');
        return;
    }

    currentPhoneNumber = phoneNumber;

    try {
        const submitBtn = e.target.querySelector('button[type="submit"]');
        submitBtn.disabled = true;
        submitBtn.textContent = 'Đang gửi...';

        const res = await fetch(`${API_BASE_URL}/forgot-password`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ phoneNumber })
        });

        const data = await res.json();

        if (!res.ok) {
            setErr('phoneNumber', data.message || 'Lỗi không xác định');
            submitBtn.disabled = false;
            submitBtn.textContent = 'Gửi mã OTP';
            return;
        }

        // Show demo OTP box
        const demoContainer = document.getElementById('demoOtpContainer');
        if (data.demoOtp) {
            demoContainer.innerHTML = `
                <div class="demo-otp-box">
                    <div class="demo-warning">⚠️ CHẾ ĐỘ DEMO - Mã OTP hiển thị trực tiếp</div>
                    <div class="otp-code">${data.demoOtp}</div>
                    <div class="demo-warning">Trong môi trường thực, mã này sẽ được gửi qua SMS</div>
                </div>
            `;
        }

        // Move to step 2
        showStep(2);
        startCountdown();
        clearOtpInputs();
        document.querySelector('.otp-digit')?.focus();

        submitBtn.disabled = false;
        submitBtn.textContent = 'Gửi mã OTP';

    } catch (err) {
        console.error('Request OTP error:', err);
        setErr('phoneNumber', 'Không thể kết nối server. Vui lòng thử lại sau.');
        const submitBtn = e.target.querySelector('button[type="submit"]');
        submitBtn.disabled = false;
        submitBtn.textContent = 'Gửi mã OTP';
    }
});

// Step 2: Verify OTP
document.getElementById('otpForm')?.addEventListener('submit', async (e) => {
    e.preventDefault();
    setErr('otp', '');

    const otpCode = document.getElementById('otpCode').value;

    if (otpCode.length !== 6) {
        setErr('otp', 'Vui lòng nhập đủ 6 số');
        return;
    }

    try {
        const submitBtn = e.target.querySelector('button[type="submit"]');
        submitBtn.disabled = true;
        submitBtn.textContent = 'Đang xác thực...';

        const res = await fetch(`${API_BASE_URL}/verify-otp`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                phoneNumber: currentPhoneNumber,
                otpCode
            })
        });

        const data = await res.json();

        if (!res.ok) {
            setErr('otp', data.message || 'Mã OTP không đúng');
            submitBtn.disabled = false;
            submitBtn.textContent = 'Xác nhận OTP';
            return;
        }

        // Save token ID for next step
        currentTokenId = data.tokenId;
        document.getElementById('tokenId').value = data.tokenId;
        document.getElementById('usernameDisplay').textContent = data.username;

        // Stop countdown
        if (countdownInterval) clearInterval(countdownInterval);

        // Move to step 3
        showStep(3);
        document.getElementById('newPassword')?.focus();

        submitBtn.disabled = false;
        submitBtn.textContent = 'Xác nhận OTP';

    } catch (err) {
        console.error('Verify OTP error:', err);
        setErr('otp', 'Không thể kết nối server. Vui lòng thử lại sau.');
        const submitBtn = e.target.querySelector('button[type="submit"]');
        submitBtn.disabled = false;
        submitBtn.textContent = 'Xác nhận OTP';
    }
});

// Step 3: Reset Password
document.getElementById('passwordForm')?.addEventListener('submit', async (e) => {
    e.preventDefault();
    setErr('newPassword', '');
    setErr('confirmPassword', '');

    const newPassword = document.getElementById('newPassword').value;
    const confirmPassword = document.getElementById('confirmPassword').value;
    const tokenId = document.getElementById('tokenId').value;

    // Validate
    if (newPassword.length < 8) {
        setErr('newPassword', 'Mật khẩu phải có ít nhất 8 ký tự');
        return;
    }

    if (newPassword !== confirmPassword) {
        setErr('confirmPassword', 'Mật khẩu xác nhận không khớp');
        return;
    }

    try {
        const submitBtn = e.target.querySelector('button[type="submit"]');
        submitBtn.disabled = true;
        submitBtn.textContent = 'Đang xử lý...';

        const res = await fetch(`${API_BASE_URL}/reset-password`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ tokenId, newPassword })
        });

        const data = await res.json();

        if (!res.ok) {
            setErr('newPassword', data.message || 'Lỗi không xác định');
            submitBtn.disabled = false;
            submitBtn.textContent = 'Đặt lại mật khẩu';
            return;
        }

        // Show success
        showStep(4);

    } catch (err) {
        console.error('Reset password error:', err);
        setErr('newPassword', 'Không thể kết nối server. Vui lòng thử lại sau.');
        const submitBtn = e.target.querySelector('button[type="submit"]');
        submitBtn.disabled = false;
        submitBtn.textContent = 'Đặt lại mật khẩu';
    }
});

// Resend OTP
document.getElementById('resendBtn')?.addEventListener('click', async () => {
    const resendBtn = document.getElementById('resendBtn');
    resendBtn.disabled = true;
    resendBtn.textContent = 'Đang gửi...';

    try {
        const res = await fetch(`${API_BASE_URL}/forgot-password`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ phoneNumber: currentPhoneNumber })
        });

        const data = await res.json();

        if (res.ok && data.demoOtp) {
            // Update demo OTP box
            const demoContainer = document.getElementById('demoOtpContainer');
            demoContainer.innerHTML = `
                <div class="demo-otp-box">
                    <div class="demo-warning">⚠️ CHẾ ĐỘ DEMO - Mã OTP hiển thị trực tiếp</div>
                    <div class="otp-code">${data.demoOtp}</div>
                    <div class="demo-warning">Trong môi trường thực, mã này sẽ được gửi qua SMS</div>
                </div>
            `;

            startCountdown();
            clearOtpInputs();
            document.getElementById('otpTimer').classList.remove('expired');
        }

        resendBtn.textContent = 'Gửi lại';

    } catch (err) {
        console.error('Resend OTP error:', err);
        resendBtn.disabled = false;
        resendBtn.textContent = 'Gửi lại';
    }
});

// Initialize
document.addEventListener('DOMContentLoaded', () => {
    setupOtpInputs();
});
