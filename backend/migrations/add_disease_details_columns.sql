-- =====================================================
-- Migration: Add disease detail columns to dim_benh
-- Created: 2025-12-30
-- Description: Thêm các cột thông tin chi tiết cho bệnh
-- =====================================================

-- Tổng quan bệnh
ALTER TABLE dim_benh ADD COLUMN IF NOT EXISTS mo_ta TEXT;

-- Nguyên nhân
ALTER TABLE dim_benh ADD COLUMN IF NOT EXISTS nguyen_nhan TEXT;

-- Triệu chứng thường gặp (bổ sung cho bảng trieu_chung riêng)
ALTER TABLE dim_benh ADD COLUMN IF NOT EXISTS trieu_chung_chinh TEXT;

-- Đối tượng nguy cơ
ALTER TABLE dim_benh ADD COLUMN IF NOT EXISTS doi_tuong_nguy_co TEXT;

-- Cách phòng ngừa
ALTER TABLE dim_benh ADD COLUMN IF NOT EXISTS phong_ngua TEXT;

-- Khi nào cần đi khám
ALTER TABLE dim_benh ADD COLUMN IF NOT EXISTS khi_nao_can_kham TEXT;

-- Biến chứng có thể
ALTER TABLE dim_benh ADD COLUMN IF NOT EXISTS bien_chung TEXT;

-- Lưu ý quan trọng
ALTER TABLE dim_benh ADD COLUMN IF NOT EXISTS luu_y TEXT;

-- Nguồn tham khảo
ALTER TABLE dim_benh ADD COLUMN IF NOT EXISTS nguon_tham_khao TEXT;

-- Verify columns added
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'dim_benh' 
ORDER BY ordinal_position;
