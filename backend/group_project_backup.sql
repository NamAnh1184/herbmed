-- =====================================================
-- HERBMED DATABASE - FULL BACKUP
-- Exported: 2025-12-31T04:28:41.649Z
-- Tổng số bảng: 15
-- Hướng dẫn: Mở DataGrip/pgAdmin, chọn database, chạy file này
-- =====================================================

-- BƯỚC 1: Tạo database (chạy riêng dòng này trước nếu chưa có database)
-- CREATE DATABASE group_project;

-- BƯỚC 2: Chọn database group_project rồi chạy phần còn lại

-- Tạo bảng dim_benh
DROP TABLE IF EXISTS "dim_benh" CASCADE;
CREATE TABLE "dim_benh" (
  "benh_sk" INTEGER,
  "ten_benh" VARCHAR(255),
  "image_url" VARCHAR(500),
  "mo_ta" TEXT,
  "nguyen_nhan" TEXT,
  "trieu_chung_chinh" TEXT,
  "doi_tuong_nguy_co" TEXT,
  "phong_ngua" TEXT,
  "khi_nao_can_kham" TEXT,
  "bien_chung" TEXT,
  "luu_y" TEXT,
  "nguon_tham_khao" TEXT
);

-- Dữ liệu bảng dim_benh (65 dòng)
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (62, 'Ho do cảm nóng', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqHL4ZqYsRa_QSskFHmxXqie0ve5CA6BMdRw&s', 'Ho do cảm nóng thường kèm triệu chứng nhiệt, khác với cảm lạnh về bản chất.', '• Nhiễm virus trong thời tiết nóng
• Uống nước lạnh khi nóng
• Sốc nhiệt
• Viêm họng do nóng', '• Ho khan, rát họng
• Khát nước
• Môi khô
• Sốt
• Đổ mồ hôi', '• Người làm việc ngoài trời
• Trẻ em
• Thay đổi nhiệt độ đột ngột', '• Uống đủ nước
• Tránh thay đổi nhiệt đột ngột
• Không uống nước đá khi quá nóng
• Nghỉ ngơi nơi mát', '• Ho kéo dài
• Sốt cao
• Khó thở
• Triệu chứng nặng', '• Viêm họng
• Viêm phế quản
• Mất nước', '• Uống nước ấm
• Nghỉ ngơi
• Thuốc giảm ho nếu cần
• Tránh nước đá', 'Y học cổ truyền, Vinmec');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (41, 'Herpes zoster-zona thần kinh', 'https://benhviendalieuhanoi.com/wp-content/uploads/2021/07/zona-1.jpg.webp', 'Zona thần kinh (Herpes Zoster) là tái hoạt virus thủy đậu, gây phát ban đau dọc dây thần kinh.', '• Tái hoạt virus Varicella-Zoster
• Tuổi cao, miễn dịch giảm
• Stress, mệt mỏi
• Thuốc ức chế miễn dịch', '• Đau rát một vùng da trước phát ban
• Mụn nước cụm dọc dây thần kinh
• Một bên cơ thể
• Đau dữ dội
• Sốt, mệt mỏi', '• Người > 50 tuổi
• Suy giảm miễn dịch
• Đã mắc thủy đậu
• Stress mạn tính', '• Vaccine Shingrix
• Quản lý stress
• Duy trì sức khỏe tốt
• Điều trị sớm nếu mắc', '• Nghi ngờ zona
• Tổn thương gần mắt
• Đau dữ dội
• Miễn dịch kém', '• Đau sau zona (phổ biến)
• Mất thị lực (zona mắt)
• Yếu liệt cơ
• Nhiễm trùng da', '• Acyclovir/Valacyclovir trong 72h đầu
• Giảm đau, chống trầm cảm
• Vaccine phòng ngừa
• Không lây qua đường hô hấp', 'Vinmec, CDC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (43, 'Bệnh vòng, nấm da', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTouIsF0YFPBVxWfBNNfOXLj0sqZmvzObql1Q&s', 'Bệnh vòng (nấm da thân) là nhiễm nấm da gây mảng đỏ hình vòng đặc trưng, ngứa.', '• Nấm dermatophyte
• Lây từ người, động vật, đất
• Môi trường ẩm ướt
• Tiếp xúc trực tiếp', '• Mảng đỏ hình vòng tròn
• Bờ nổi gờ, có vảy
• Trung tâm trong hơn
• Ngứa
• Lan rộng từ từ', '• Trẻ em
• Tiếp xúc động vật
• Môi trường ẩm
• Miễn dịch kém', '• Giữ da khô ráo
• Không dùng chung đồ
• Điều trị vật nuôi nếu nhiễm
• Vệ sinh sạch sẽ', '• Không đáp ứng thuốc OTC
• Lan rộng
• Nấm da đầu
• Tái phát nhiều lần', '• Lan rộng
• Bội nhiễm
• Nhiễm nấm sâu (hiếm)
• Sẹo', '• Thuốc bôi chống nấm 2-4 tuần
• Thuốc uống nếu lan rộng/da đầu
• Tiếp tục điều trị sau hết triệu chứng
• Vệ sinh môi trường', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (22, 'Thiếu máu', 'https://images.unsplash.com/photo-1615461066841-6116e61058f4?w=400', 'Thiếu máu thiếu sắt là loại thiếu máu phổ biến nhất, do thiếu sắt làm giảm sản xuất hemoglobin.', '• Mất máu (kinh nguyệt, xuất huyết tiêu hóa)
• Thiếu sắt trong chế độ ăn
• Giảm hấp thu (celiac, cắt dạ dày)
• Nhu cầu tăng (thai kỳ)', '• Mệt mỏi, yếu
• Da xanh xao
• Khó thở khi gắng sức
• Đau đầu, chóng mặt
• Móng tay giòn, lõm thìa', '• Phụ nữ kinh nhiều
• Thai phụ
• Trẻ em, vị thành niên
• Người ăn chay', '• Ăn thực phẩm giàu sắt
• Vitamin C tăng hấp thu sắt
• Bổ sung sắt khi mang thai
• Điều trị nguyên nhân mất máu', '• Mệt mỏi kéo dài
• Xanh xao, khó thở
• Phân đen hoặc có máu
• Kinh nguyệt quá nhiều', '• Suy tim
• Chậm phát triển (trẻ em)
• Sinh non, nhẹ cân
• Giảm miễn dịch', '• Xét nghiệm để xác định
• Bổ sung sắt 3-6 tháng
• Tìm nguyên nhân mất máu
• Ferritin đánh giá dự trữ sắt', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (1, 'Cảm lạnh', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2023/11/14/cam-lanh-1644818345647419702308-1699967954607311537853.png', 'Cảm lạnh là bệnh nhiễm virus đường hô hấp trên phổ biến, thường tự khỏi trong 7-10 ngày. Bệnh lây lan qua giọt bắn khi ho, hắt hơi hoặc tiếp xúc với bề mặt nhiễm virus.', '• Virus rhinovirus (chiếm 30-50% trường hợp)
• Coronavirus, Adenovirus, RSV
• Lây qua đường hô hấp, tiếp xúc trực tiếp
• Thời tiết lạnh, thay đổi đột ngột', '• Sổ mũi, nghẹt mũi
• Hắt hơi liên tục
• Đau họng, rát họng
• Ho khan hoặc ho có đờm
• Sốt nhẹ (thường dưới 38.5°C)
• Mệt mỏi, đau đầu nhẹ', '• Trẻ em dưới 6 tuổi
• Người cao tuổi trên 65
• Người suy giảm miễn dịch
• Người tiếp xúc đông người', '• Rửa tay thường xuyên bằng xà phòng
• Tránh chạm tay lên mắt, mũi, miệng
• Tránh tiếp xúc gần người bệnh
• Tăng cường vitamin C, nghỉ ngơi đủ giấc', '• Sốt cao trên 39°C kéo dài hơn 3 ngày
• Khó thở, thở khò khè
• Đau ngực, đau tai nặng
• Triệu chứng không cải thiện sau 10 ngày', '• Viêm xoang cấp
• Viêm tai giữa
• Viêm phế quản
• Viêm phổi (hiếm gặp)', '• Không tự ý dùng kháng sinh (không hiệu quả với virus)
• Uống nhiều nước ấm
• Nghỉ ngơi đầy đủ
• Có thể dùng thuốc giảm triệu chứng', 'Vinmec, Bệnh viện Bạch Mai, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (2, 'Cúm', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2025/7/11/acc89nh-chucca3p-macc80n-hicc80nh-2021-07-14-lucc81c-53357-ch-1752208504499-1752208505328584595380.png', 'Cúm là bệnh nhiễm trùng đường hô hấp do virus influenza gây ra, có thể gây biến chứng nghiêm trọng. Bệnh thường bùng phát theo mùa, đặc biệt vào mùa đông-xuân.', '• Virus Influenza A, B, C
• Lây qua giọt bắn khi ho, hắt hơi
• Tiếp xúc với bề mặt nhiễm virus
• Thay đổi thời tiết, mùa lạnh', '• Sốt cao đột ngột (39-40°C)
• Ớn lạnh, rét run
• Đau cơ, đau khớp toàn thân
• Đau đầu dữ dội
• Mệt mỏi rã rời
• Ho khan, đau họng', '• Trẻ em dưới 5 tuổi
• Người trên 65 tuổi
• Phụ nữ mang thai
• Người mắc bệnh mạn tính (tim, phổi, tiểu đường)', '• Tiêm vaccine cúm hàng năm
• Rửa tay thường xuyên
• Đeo khẩu trang nơi đông người
• Tránh tiếp xúc người bệnh
• Tăng cường sức đề kháng', '• Sốt cao không đáp ứng thuốc hạ sốt
• Khó thở, đau ngực
• Lơ mơ, lú lẫn
• Triệu chứng nặng lên sau khi đã thuyên giảm', '• Viêm phổi
• Viêm cơ tim, viêm màng não
• Suy hô hấp
• Tử vong (đặc biệt ở nhóm nguy cơ cao)', '• Thuốc kháng virus (Tamiflu) hiệu quả trong 48h đầu
• Nghỉ ngơi tuyệt đối
• Cách ly để tránh lây lan
• Uống đủ nước', 'Vinmec, WHO, Bộ Y tế Việt Nam');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (3, 'Hen phế quản', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgm-mgngGug8girpO9Hy8dl_wM1FghG6NG-w&s', 'Hen phế quản là bệnh viêm mạn tính đường thở, gây co thắt phế quản, khó thở. Bệnh có thể kiểm soát tốt với điều trị đúng cách.', '• Di truyền (gia đình có người bị hen)
• Dị ứng: bụi nhà, phấn hoa, lông thú
• Nhiễm trùng đường hô hấp
• Ô nhiễm không khí, khói thuốc lá
• Thay đổi thời tiết', '• Khó thở, thở khò khè
• Ho khan, đặc biệt về đêm
• Tức ngực, nặng ngực
• Cơn hen cấp: khó thở dữ dội', '• Người có tiền sử dị ứng
• Gia đình có người bị hen
• Béo phì
• Tiếp xúc khói thuốc lá thường xuyên', '• Tránh các tác nhân gây dị ứng
• Không hút thuốc, tránh khói thuốc
• Giữ nhà cửa sạch sẽ
• Dùng thuốc phòng ngừa theo chỉ định', '• Cơn hen nặng không đáp ứng thuốc
• Môi, móng tay tím tái
• Không thể nói được câu dài
• Lồng ngực co kéo khi thở', '• Suy hô hấp cấp
• Xẹp phổi
• Tràn khí màng phổi
• Ảnh hưởng chất lượng cuộc sống', '• Luôn mang theo thuốc cắt cơn
• Tuân thủ điều trị dự phòng
• Tái khám định kỳ
• Tránh gắng sức khi thời tiết xấu', 'Vinmec, MEDLATEC, Hội Hô hấp Việt Nam');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (4, 'Viêm xoang', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2021/10/18/hinh-anh-viem-xoang-16345462507641040891966.jpg', 'Viêm xoang là tình trạng viêm niêm mạc các xoang cạnh mũi, có thể cấp hoặc mạn tính. Bệnh thường gặp sau nhiễm trùng đường hô hấp trên.', '• Nhiễm virus, vi khuẩn
• Dị ứng (viêm mũi dị ứng)
• Polyp mũi, vẹo vách ngăn
• Ô nhiễm không khí
• Bơi lội trong nước bẩn', '• Nghẹt mũi một hoặc hai bên
• Chảy dịch mũi đặc, có thể có mủ
• Đau nhức vùng mặt, trán
• Đau đầu, nặng đầu
• Giảm hoặc mất khứu giác', '• Người viêm mũi dị ứng
• Người có bất thường cấu trúc mũi
• Người hút thuốc
• Người suy giảm miễn dịch', '• Điều trị dứt điểm cảm cúm
• Rửa mũi bằng nước muối sinh lý
• Tránh khói bụi, ô nhiễm
• Điều trị viêm mũi dị ứng kịp thời', '• Triệu chứng kéo dài trên 10 ngày
• Sốt cao, đau mặt dữ dội
• Sưng quanh mắt
• Dịch mũi có máu', '• Viêm xoang mạn tính
• Áp xe quanh ổ mắt
• Viêm màng não
• Viêm xương', '• Không tự ý dùng kháng sinh kéo dài
• Xịt mũi co mạch không quá 7 ngày
• Uống đủ nước
• Xông hơi nước ấm giúp giảm nghẹt', 'Vinmec, Bệnh viện Tai Mũi Họng TW, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (5, 'Viêm dạ dày', 'https://bvlkphcn.vn/upload/2005757/fck/files/viem-da-day-cap-tinh_90b19.jpg', 'Viêm dạ dày là tình trạng viêm niêm mạc dạ dày, có thể cấp hoặc mạn tính. Bệnh gây đau bụng, khó tiêu và có thể dẫn đến loét dạ dày.', '• Vi khuẩn Helicobacter pylori (H. pylori)
• Thuốc giảm đau NSAIDs (Aspirin, Ibuprofen)
• Rượu bia, thuốc lá
• Stress kéo dài
• Ăn uống không điều độ', '• Đau thượng vị, nóng rát
• Buồn nôn, nôn
• Đầy bụng, chướng hơi
• Ợ hơi, ợ chua
• Chán ăn, giảm cân', '• Người nhiễm H. pylori
• Người dùng NSAIDs kéo dài
• Người uống rượu bia nhiều
• Người stress thường xuyên', '• Ăn uống điều độ, đúng giờ
• Hạn chế rượu bia, thuốc lá
• Tránh thức ăn cay nóng, chua
• Quản lý stress hiệu quả', '• Đau bụng dữ dội kéo dài
• Nôn ra máu hoặc dịch nâu đen
• Đi ngoài phân đen
• Sụt cân không rõ nguyên nhân', '• Loét dạ dày tá tràng
• Xuất huyết tiêu hóa
• Thủng dạ dày
• Ung thư dạ dày (hiếm)', '• Nội soi nếu triệu chứng kéo dài
• Điều trị diệt H. pylori nếu dương tính
• Không bỏ bữa
• Ăn chậm, nhai kỹ', 'Vinmec, Bệnh viện Bạch Mai, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (64, 'Ho có đờm', 'https://thaythuocvietnam.vn/wp-content/uploads/2022/11/ho-co-dom.jpg', 'Ho có đờm là ho kèm theo tiết dịch nhầy từ đường hô hấp, thường do nhiễm trùng.', '• Nhiễm trùng hô hấp
• Viêm phế quản
• Viêm phổi
• COPD
• Dị ứng, hen', '• Ho có đờm đặc hoặc loãng
• Đờm trong, vàng, xanh
• Khạc đờm khó
• Có thể kèm sốt
• Khó thở (nặng)', '• Người hút thuốc
• COPD, hen
• Suy giảm miễn dịch
• Người cao tuổi', '• Không hút thuốc
• Tiêm vaccine phòng cúm, phế cầu
• Vệ sinh đường hô hấp
• Tập thở sâu', '• Đờm xanh vàng, có mủ
• Sốt cao
• Khó thở
• Ho ra máu', '• Viêm phổi
• Tắc nghẽn đường thở
• Suy hô hấp
• Nhiễm trùng lan rộng', '• Thuốc long đờm (Acetylcysteine)
• Uống nước nhiều
• Xông hơi
• Kháng sinh nếu nhiễm khuẩn', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (39, 'Hỗ trợ miễn dịch', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2021/12/22/1-1640142474725798871619.png', 'Hỗ trợ miễn dịch: Hệ miễn dịch bảo vệ cơ thể khỏi tác nhân gây bệnh. Có thể tăng cường qua lối sống và dinh dưỡng.', '• Suy giảm miễn dịch: stress, thiếu ngủ
• Dinh dưỡng kém
• Thiếu vitamin D, C, kẽm
• Tuổi cao
• Bệnh mạn tính', '• Dễ nhiễm trùng, ốm lặp lại
• Vết thương lâu lành
• Mệt mỏi thường xuyên
• Nhiễm trùng kéo dài', '• Người cao tuổi
• Trẻ nhỏ
• Người suy dinh dưỡng
• Người stress mạn tính', '• Dinh dưỡng cân bằng
• Ngủ đủ 7-8 tiếng
• Tập thể dục đều
• Tiêm vaccine đủ', '• Nhiễm trùng tái phát thường xuyên
• Nhiễm trùng kéo dài bất thường
• Vết thương không lành
• Mệt mỏi kéo dài', '• Nhiễm trùng nặng
• Nhiễm trùng cơ hội
• Ung thư
• Bệnh tự miễn', '• Vitamin C, D, kẽm hỗ trợ
• Probiotics có lợi
• Tránh thuốc bổ không rõ nguồn gốc
• Không lạm dụng kháng sinh', 'Vinmec, Harvard Health');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (18, 'Đau đầu do căng thẳng', 'https://suckhoedoisong.qltns.mediacdn.vn/Images/duylinh/2020/09/10/20190901_144048_965776_dau-dau-cang-co.max-800x800_resize.jpg', 'Đau đầu căng thẳng là loại đau đầu phổ biến nhất, thường do stress, mệt mỏi hoặc căng cơ vùng đầu cổ.', '• Stress, lo âu
• Mệt mỏi, thiếu ngủ
• Căng cơ cổ vai gáy
• Làm việc với máy tính nhiều
• Tư thế không đúng', '• Đau đầu hai bên như bó chặt
• Đau nhẹ đến vừa
• Không buồn nôn
• Không tăng khi vận động
• Căng cơ cổ vai', '• Người làm việc căng thẳng
• Nhân viên văn phòng
• Người hay lo âu
• Người thiếu ngủ', '• Giảm stress
• Nghỉ ngơi đủ giấc
• Tập thể dục đều
• Điều chỉnh tư thế làm việc', '• Đau đầu mới hoặc thay đổi kiểu
• Đau kèm sốt, cứng cổ
• Tần suất tăng
• Không đáp ứng thuốc', '• Đau đầu mạn tính
• Lạm dụng thuốc giảm đau
• Trầm cảm
• Giảm chất lượng sống', '• Paracetamol, NSAIDs hiệu quả
• Massage, thư giãn
• Tránh lạm dụng thuốc
• Điều trị căn nguyên stress', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (11, 'Tăng huyết áp', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2024/10/1/20190419101355402670tang-huyet-ap-1max-800x800-1-1727754596965685511169.jpg', 'Tăng huyết áp là tình trạng áp lực máu trong động mạch tăng cao kéo dài (≥140/90 mmHg). Là yếu tố nguy cơ hàng đầu của bệnh tim mạch và đột quỵ.', '• Nguyên phát (90-95%): không rõ nguyên nhân
• Thứ phát: bệnh thận, nội tiết
• Yếu tố nguy cơ: ăn mặn, béo phì, stress, ít vận động', '• Thường không có triệu chứng (sát thủ thầm lặng)
• Đau đầu vùng chẩm
• Chóng mặt, ù tai
• Chảy máu cam
• Đánh trống ngực', '• Người trên 40 tuổi
• Béo phì
• Gia đình có người tăng huyết áp
• Người ăn mặn, uống rượu nhiều', '• Giảm muối (< 5g/ngày)
• Tập thể dục đều đặn
• Duy trì cân nặng hợp lý
• Hạn chế rượu bia, bỏ thuốc lá', '• Huyết áp ≥140/90 mmHg
• Đau đầu dữ dội
• Đau ngực, khó thở
• Yếu liệt, nói khó', '• Đột quỵ não
• Nhồi máu cơ tim
• Suy tim, suy thận
• Tổn thương mắt', '• Đo huyết áp đúng cách
• Uống thuốc đều đặn, không tự ý ngưng
• Theo dõi huyết áp tại nhà
• Tái khám định kỳ', 'Vinmec, Hội Tim mạch Việt Nam, WHO');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (12, 'Rối loạn mỡ máu', 'https://www.vinmec.com/static/uploads/20200301_172437_676575_ieu_tri_roi_loan_li_max_1800x1800_jpg_cd66d486d7.jpg', 'Rối loạn mỡ máu là tình trạng bất thường lipid máu (cholesterol, triglyceride), tăng nguy cơ xơ vữa động mạch và bệnh tim mạch.', '• Chế độ ăn nhiều chất béo bão hòa
• Ít vận động, béo phì
• Di truyền
• Tiểu đường, suy giáp
• Rượu bia quá mức', '• Thường không có triệu chứng
• Phát hiện qua xét nghiệm máu
• Khi nặng: u vàng ở da, giác mạc', '• Gia đình có người mỡ máu cao
• Béo phì
• Tiểu đường, tăng huyết áp
• Người ít vận động', '• Chế độ ăn ít chất béo bão hòa
• Tập thể dục đều đặn
• Duy trì cân nặng hợp lý
• Xét nghiệm mỡ máu định kỳ', '• Xét nghiệm mỡ máu bất thường
• Có nhiều yếu tố nguy cơ tim mạch
• Đau ngực, khó thở', '• Xơ vữa động mạch
• Nhồi máu cơ tim
• Đột quỵ
• Bệnh động mạch ngoại biên', '• Thay đổi lối sống là nền tảng
• Thuốc statin nếu được chỉ định
• Theo dõi men gan khi dùng statin
• Kiểm tra mỡ máu mỗi 3-6 tháng', 'Vinmec, Hội Tim mạch Việt Nam, ESC Guidelines');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (20, 'Trầm cảm', 'https://images.unsplash.com/photo-1493836512294-502baa1986e2?w=400', 'Trầm cảm là rối loạn tâm thần phổ biến, gây buồn bã kéo dài, mất hứng thú, ảnh hưởng suy nghĩ và hành vi.', '• Mất cân bằng chất dẫn truyền thần kinh
• Di truyền
• Sang chấn, stress
• Bệnh mạn tính
• Thiếu hỗ trợ xã hội', '• Buồn bã, trống rỗng kéo dài
• Mất hứng thú mọi hoạt động
• Thay đổi ngủ, ăn
• Mệt mỏi, không có năng lượng
• Suy nghĩ tiêu cực, tự tử', '• Nữ giới
• Tiền sử gia đình
• Người cô đơn
• Mắc bệnh mạn tính', '• Duy trì kết nối xã hội
• Tập thể dục thường xuyên
• Ngủ đủ giấc
• Tìm kiếm hỗ trợ sớm', '• Triệu chứng kéo dài > 2 tuần
• Không thể làm việc bình thường
• Có ý định tự hại
• Lạm dụng rượu/thuốc', '• Tự tử
• Lạm dụng chất
• Bệnh tim mạch
• Mất khả năng lao động', '• Trầm cảm là bệnh có thể chữa được
• Thuốc kháng trầm cảm + tâm lý trị liệu
• Không phải do yếu đuối
• Cần 4-6 tuần thuốc phát huy tác dụng', 'Vinmec, WHO, Viện SKTT');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (59, 'Khô mắt', 'https://prod-cdn.pharmacity.io/blog/kho-mat-1.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAUYXZVMJMURHIYJSN%2F20240731%2Fap-southeast-1%2Fs3%2Faws4_request&X-Amz-Date=20240731T071813Z&X-Amz-SignedHeaders=host&X-Amz-Expires=600&X-Amz-Signature=20f161301acf080d7d72073a866c3e96f30de73b5ebeab3b86c56368505ed4c8', 'Khô mắt là tình trạng mắt không đủ nước mắt hoặc nước mắt kém chất lượng, gây khó chịu.', '• Tuổi cao
• Nhìn màn hình nhiều
• Điều hòa, gió
• Bệnh tự miễn (Sjogren)
• Thuốc (kháng histamine, chống trầm cảm)', '• Khô, rát mắt
• Cảm giác cộm, có dị vật
• Mờ mắt thoáng qua
• Chảy nước mắt phản xạ
• Mỏi mắt', '• Người > 50 tuổi
• Dùng máy tính nhiều
• Đeo kính áp tròng
• Bệnh tự miễn', '• Chớp mắt thường xuyên
• Nghỉ mắt 20-20-20
• Dùng máy tạo độ ẩm
• Uống đủ nước', '• Khô mắt kéo dài
• Đau, đỏ mắt
• Nhìn mờ
• Nhạy cảm ánh sáng nhiều', '• Nhiễm trùng mắt
• Tổn thương giác mạc
• Giảm chất lượng sống
• Khó đọc sách, lái xe', '• Nước mắt nhân tạo thường xuyên
• Thuốc kê đơn nếu nặng
• Omega-3 có thể giúp
• Điều trị bệnh nền', 'Vinmec, AAO');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (15, 'Bệnh gút', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2022/6/27/1-16563083354662076149744.jpg', 'Bệnh gút là rối loạn chuyển hóa purine gây tăng acid uric máu, lắng đọng tinh thể urat trong khớp gây viêm khớp cấp tính rất đau.', '• Tăng acid uric máu
• Ăn nhiều thịt đỏ, hải sản
• Uống nhiều bia, rượu
• Béo phì, tiểu đường
• Thuốc lợi tiểu', '• Đau khớp dữ dội, đột ngột (thường về đêm)
• Sưng đỏ nóng khớp
• Thường ở ngón chân cái
• Cơn kéo dài vài ngày đến tuần
• Hạt tophi (giai đoạn mạn)', '• Nam giới trung niên
• Béo phì
• Uống nhiều bia, rượu
• Gia đình có người bị gút', '• Hạn chế thịt đỏ, nội tạng, hải sản
• Không uống bia rượu
• Uống đủ nước (2-3 lít/ngày)
• Duy trì cân nặng hợp lý', '• Cơn đau khớp cấp tính
• Acid uric máu cao
• Có hạt tophi
• Cơn tái phát thường xuyên', '• Viêm khớp mạn tính
• Biến dạng khớp
• Sỏi thận acid uric
• Suy thận do gút', '• Điều trị cơn cấp: Colchicine, NSAIDs
• Dự phòng: thuốc hạ acid uric
• Chế độ ăn rất quan trọng
• Theo dõi acid uric máu định kỳ', 'Vinmec, Hội Thấp khớp Việt Nam, ACR Gout Guidelines');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (16, 'Đau lưng / căng cơ', 'https://www.vinmec.com/static/uploads/large_20200720_042039_760042_cang_co_that_lung_max_1800x1800_jpg_2dda708641.jpg', 'Đau lưng là triệu chứng phổ biến, có thể do căng cơ, thoái hóa cột sống, thoát vị đĩa đệm hoặc các nguyên nhân khác.', '• Căng cơ do ngồi sai tư thế
• Thoái hóa cột sống
• Thoát vị đĩa đệm
• Mang vác nặng
• Ít vận động', '• Đau âm ỉ hoặc nhói vùng lưng
• Đau tăng khi cúi, xoay người
• Co cứng cơ cạnh sống
• Đau lan xuống chân (thoát vị)', '• Nhân viên văn phòng
• Lao động nặng
• Người thừa cân
• Người trên 40 tuổi', '• Ngồi đúng tư thế
• Tập thể dục đều đặn
• Nâng vật nặng đúng cách
• Duy trì cân nặng hợp lý', '• Đau kéo dài trên 2 tuần
• Đau lan xuống chân, tê bì
• Yếu chân, rối loạn tiểu tiện
• Sốt kèm theo', '• Đau mạn tính
• Teo cơ, yếu chi
• Rối loạn cảm giác
• Hạn chế vận động', '• Chườm nóng/lạnh giảm đau
• Vật lý trị liệu hiệu quả
• Phẫu thuật khi thực sự cần
• Tránh nằm một chỗ quá lâu', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (17, 'Đau nửa đầu', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7ZLKED_qGWI1psZ_V4Kh5_YuqrhHnPw6_qw&s', 'Đau nửa đầu (Migraine) là bệnh thần kinh gây đau đầu dữ dội từng cơn, thường kèm buồn nôn và nhạy cảm ánh sáng.', '• Di truyền
• Thay đổi hormone (kinh nguyệt)
• Stress, thiếu ngủ
• Một số thức ăn (rượu, chocolate)
• Thay đổi thời tiết', '• Đau một bên đầu, theo nhịp mạch đập
• Buồn nôn, nôn
• Sợ ánh sáng, tiếng ồn
• Tiền triệu: nhìn thấy chớp sáng
• Kéo dài 4-72 giờ', '• Nữ giới (gấp 3 lần nam)
• Tuổi 15-55
• Có tiền sử gia đình
• Người hay stress', '• Ngủ đủ giấc, đúng giờ
• Tránh yếu tố khởi phát
• Quản lý stress
• Tập thể dục đều đặn', '• Đau đầu dữ dội đột ngột
• Đau kèm sốt, cứng cổ
• Thay đổi tính chất cơn đau
• Yếu liệt, nói khó', '• Migraine mạn tính
• Trầm cảm, lo âu
• Lạm dụng thuốc giảm đau
• Đột quỵ (hiếm)', '• Thuốc cắt cơn: Triptan
• Thuốc dự phòng nếu cơn thường xuyên
• Ghi nhật ký đau đầu
• Nghỉ ngơi phòng tối khi lên cơn', 'Vinmec, MEDLATEC, IHS');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (19, 'Lo âu', 'https://images.unsplash.com/photo-1474418397713-7ede21d49118?w=400', 'Rối loạn lo âu là tình trạng lo lắng quá mức, kéo dài, không tương xứng với thực tế, ảnh hưởng đến cuộc sống hàng ngày.', '• Di truyền
• Mất cân bằng hóa chất não
• Sang chấn tâm lý
• Stress kéo dài
• Bệnh lý cơ thể', '• Lo lắng quá mức
• Bồn chồn, khó thư giãn
• Khó tập trung
• Mất ngủ
• Triệu chứng cơ thể: run, vã mồ hôi, tim đập nhanh', '• Nữ giới
• Tiền sử gia đình
• Người từng sang chấn
• Người nghiện chất', '• Tập thể dục đều đặn
• Thiền, mindfulness
• Ngủ đủ giấc
• Hạn chế caffeine, rượu', '• Lo âu ảnh hưởng công việc, học tập
• Cơn hoảng sợ
• Có ý định tự hại
• Không thể kiểm soát lo âu', '• Trầm cảm
• Lạm dụng chất
• Cô lập xã hội
• Bệnh tim mạch', '• Trị liệu tâm lý (CBT) hiệu quả
• Thuốc (SSRI) nếu cần
• Không tự ý dùng thuốc an thần
• Hỗ trợ gia đình quan trọng', 'Vinmec, Viện Sức khỏe Tâm thần');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (27, 'Mụn trứng cá', 'https://www.vinmec.com/static/uploads/20200113_093629_396219_mun_trung_ca_max_1800x1800_jpg_00652a6581.jpg', 'Mụn trứng cá là bệnh da phổ biến, do viêm nang lông và tuyến bã nhờn, thường ở mặt, ngực, lưng.', '• Tăng tiết bã nhờn
• Vi khuẩn P. acnes
• Tắc nang lông
• Hormone androgen
• Di truyền', '• Mụn đầu đen, đầu trắng
• Mụn viêm đỏ, mụn mủ
• Nốt, nang sâu (nặng)
• Thường ở mặt, lưng, ngực
• Để lại sẹo (nặng)', '• Tuổi dậy thì
• Gia đình có tiền sử
• Da dầu
• Stress, hormone', '• Rửa mặt đúng cách
• Không nặn mụn
• Sử dụng mỹ phẩm không gây mụn
• Chế độ ăn lành mạnh', '• Mụn nặng, viêm nhiều
• Mụn để lại sẹo
• Không đáp ứng thuốc OTC
• Mụn ở nữ kèm kinh không đều', '• Sẹo lõm, sẹo lồi
• Tăng sắc tố
• Ảnh hưởng tâm lý
• Trầm cảm', '• Retinoid, BPO là thuốc cơ bản
• Kháng sinh nếu viêm nhiều
• Isotretinoin cho nặng
• Kiên trì điều trị 2-3 tháng', 'Vinmec, SkinVietnam');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (25, 'Đau bụng kinh', 'https://suckhoedoisong.qltns.mediacdn.vn/Images/quangcao/2020/07/21/nuvuong211.jpg', 'Đau bụng kinh (thống kinh) là cơn đau vùng bụng dưới trước và trong kỳ kinh nguyệt, rất phổ biến ở phụ nữ.', '• Prostaglandin gây co thắt tử cung
• Lạc nội mạc tử cung
• U xơ tử cung
• Hẹp cổ tử cung
• Dụng cụ tử cung', '• Đau quặn bụng dưới
• Đau lan xuống lưng, đùi
• Buồn nôn, nôn
• Tiêu chảy
• Đau đầu, mệt mỏi', '• Tuổi < 30
• Dậy thì sớm
• Kinh nhiều, kéo dài
• Tiền sử gia đình', '• Tập thể dục đều đặn
• Chườm ấm bụng
• Giảm stress
• Uống thuốc dự phòng trước kỳ kinh', '• Đau nặng không đáp ứng thuốc
• Đau tăng theo tuổi
• Kèm kinh nhiều bất thường
• Nghi ngờ lạc nội mạc tử cung', '• Ảnh hưởng học tập, công việc
• Trầm cảm, lo âu
• Lạc nội mạc tử cung (nếu có)', '• NSAIDs hiệu quả (Ibuprofen)
• Thuốc tránh thai giảm đau
• Omega-3, magie có thể giúp
• Siêu âm loại trừ bệnh lý', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (24, 'Phì đại tuyến tiền liệt', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5OmZc4Ka35_hUNw3vkbKDK7KkKWeoTEYJ5g&s', 'Phì đại tuyến tiền liệt lành tính (BPH) là tình trạng tuyến tiền liệt to ra ở nam giới lớn tuổi, gây rối loạn tiểu tiện.', '• Lão hóa tự nhiên
• Thay đổi hormone (testosterone, estrogen)
• Yếu tố di truyền
• Béo phì', '• Tiểu khó, tiểu yếu
• Tiểu không hết, nhỏ giọt
• Tiểu đêm nhiều lần
• Tiểu gấp, tiểu rắt
• Bí tiểu (nặng)', '• Nam > 50 tuổi
• Gia đình có người BPH
• Béo phì
• Tiểu đường, bệnh tim', '• Duy trì cân nặng
• Tập thể dục đều
• Hạn chế caffeine, rượu
• Khám định kỳ sau 50 tuổi', '• Triệu chứng tiểu tiện bất thường
• Tiểu đêm > 2 lần
• Bí tiểu
• Tiểu ra máu', '• Bí tiểu cấp
• Nhiễm trùng tiểu
• Sỏi bàng quang
• Suy thận', '• Thuốc alpha-blocker, 5-ARI
• Không phải ung thư
• Phẫu thuật khi thuốc không hiệu quả
• Theo dõi PSA loại trừ ung thư', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (35, 'Viêm mũi dị ứng', 'https://benhvienvanhanh.vn/wp-content/uploads/2013/04/viem-mui-di-ung.png', 'Viêm mũi dị ứng là phản ứng của niêm mạc mũi với dị nguyên (phấn hoa, bụi nhà, lông thú).', '• Dị ứng phấn hoa (theo mùa)
• Bụi nhà, mạt nhà
• Lông thú
• Nấm mốc
• Di truyền', '• Hắt hơi liên tục
• Ngứa mũi, mắt, họng
• Chảy mũi nước trong
• Nghẹt mũi
• Mắt đỏ, chảy nước mắt', '• Gia đình có dị ứng
• Có hen, chàm
• Tiếp xúc dị nguyên nhiều
• Trẻ em', '• Tránh dị nguyên đã biết
• Giữ nhà sạch, ít bụi
• Dùng máy lọc không khí
• Rửa mũi nước muối', '• Triệu chứng nặng, kéo dài
• Ảnh hưởng giấc ngủ, công việc
• Không đáp ứng thuốc OTC
• Nghi ngờ viêm xoang', '• Viêm xoang
• Hen phế quản
• Rối loạn giấc ngủ
• Polyp mũi', '• Kháng histamine hiệu quả
• Xịt mũi corticoid
• Xét nghiệm dị ứng xác định tác nhân
• Miễn dịch trị liệu (nặng)', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (29, 'Nấm da', 'https://hongngochospital.vn/wp-content/uploads/2013/11/benh-nam-da-2.jpg', 'Nấm da là nhiễm trùng da do nấm, gây mảng đỏ, ngứa, bong vảy, có thể ở thân, bẹn, chân.', '• Nấm dermatophyte
• Lây từ người hoặc động vật
• Môi trường ẩm ướt
• Mang giày kín, đổ mồ hôi
• Miễn dịch kém', '• Mảng đỏ hình vòng, bờ rõ
• Ngứa
• Bong vảy, nứt da
• Ở bẹn, chân, thân, đầu
• Móng dày, đổi màu (nấm móng)', '• Vận động viên
• Đổ mồ hôi nhiều
• Tiểu đường
• Dùng corticoid', '• Giữ da khô ráo
• Không dùng chung đồ cá nhân
• Thay tất, giày thường xuyên
• Điều trị vật nuôi nếu nhiễm', '• Không đáp ứng thuốc OTC
• Lan rộng hoặc tái phát
• Nấm da đầu, nấm móng
• Miễn dịch kém', '• Lan rộng ra các vùng khác
• Bội nhiễm vi khuẩn
• Nấm móng khó trị
• Tái phát thường xuyên', '• Thuốc bôi chống nấm 2-4 tuần
• Thuốc uống cho nặng/móng
• Điều trị đủ thời gian
• Vệ sinh môi trường', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (30, 'Lành vết thương', 'https://mediworld.vn/wp-content/uploads/2023/10/qua-trinh-lanh-vet-thuong-ho-dien-ra-nhu-the-nao.jpg', 'Lành vết thương là quá trình tự nhiên của cơ thể phục hồi tổn thương da. Có thể bị chậm do nhiều yếu tố.', '• Quá trình sinh lý bình thường
• Chậm lành: tiểu đường, tuần hoàn kém
• Thiếu dinh dưỡng
• Nhiễm trùng
• Thuốc (corticoid)', '• Giai đoạn cầm máu
• Giai đoạn viêm (sưng, đỏ)
• Giai đoạn tăng sinh (mô hạt)
• Giai đoạn tái tạo
• Sẹo', '• Bệnh nhân tiểu đường
• Người cao tuổi
• Suy dinh dưỡng
• Bệnh mạch máu', '• Kiểm soát tốt bệnh nền
• Dinh dưỡng đầy đủ protein
• Giữ vết thương sạch
• Không hút thuốc', '• Vết thương không lành > 2 tuần
• Có dấu hiệu nhiễm trùng
• Đau tăng, có mủ
• Sốt kèm theo', '• Nhiễm trùng
• Loét mạn tính
• Sẹo xấu
• Hoại tử', '• Rửa vết thương đúng cách
• Băng gạc phù hợp
• Dinh dưỡng tốt
• Tiêm phòng uốn ván nếu cần', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (31, 'Bỏng nhẹ', 'https://medlatec.vn/media/11598/content/20210321_cac-cap-do-cua-bong-1.png', 'Bỏng là tổn thương da do nhiệt, hóa chất, điện hoặc bức xạ. Mức độ phụ thuộc vào độ sâu và diện tích.', '• Nhiệt (lửa, nước sôi)
• Hóa chất
• Điện
• Bức xạ
• Ma sát', '• Độ I: đỏ, đau, không phồng
• Độ II: phồng nước, đau nhiều
• Độ III: trắng/đen, không đau
• Sưng nề xung quanh', '• Trẻ nhỏ
• Người cao tuổi
• Người làm việc với nhiệt
• Người tàn tật', '• Cẩn thận với nước nóng
• Để chất nóng xa tầm trẻ
• Kiểm tra nhiệt độ nước tắm
• An toàn điện', '• Bỏng độ II > 3 inch
• Bỏng độ III
• Bỏng mặt, tay, chân, bộ phận sinh dục
• Bỏng hóa chất, điện', '• Nhiễm trùng
• Sẹo co kéo
• Mất nước, sốc (nặng)
• Tử vong (bỏng nặng)', '• Làm mát bằng nước lạnh 10-20 phút
• Không bôi kem đánh răng, dầu
• Che phủ bằng gạc sạch
• Cấp cứu nếu nặng', 'Vinmec, WHO Burns');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (32, 'Đau răng', 'https://medlatec.vn/media/6703/content/20220415_cach-tri-nhuc-rang-1.jpg', 'Đau răng là triệu chứng phổ biến, có thể do sâu răng, viêm tủy, viêm nha chu hoặc các nguyên nhân khác.', '• Sâu răng
• Viêm tủy răng
• Viêm nha chu
• Răng khôn mọc lệch
• Nứt, vỡ răng', '• Đau nhức răng
• Ê buốt khi nóng/lạnh
• Đau tăng khi nhai
• Sưng nướu, má
• Sốt (nếu nhiễm trùng)', '• Vệ sinh răng miệng kém
• Ăn nhiều đường
• Không khám răng định kỳ
• Miệng khô', '• Đánh răng 2 lần/ngày
• Dùng chỉ nha khoa
• Khám răng 6 tháng/lần
• Hạn chế đường', '• Đau dữ dội kéo dài
• Sưng mặt, má
• Sốt
• Đau lan lên đầu, tai', '• Áp xe răng
• Mất răng
• Nhiễm trùng lan rộng
• Nhiễm trùng huyết (hiếm)', '• Paracetamol, NSAIDs giảm đau tạm
• Súc miệng nước muối
• Không đặt aspirin lên răng
• Cần khám nha khoa', 'Vinmec, Hội Răng Hàm Mặt VN');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (33, 'Viêm lợi', 'https://duoclieungocchau.vn/wp-content/uploads/2020/07/cach-chua-viem-loi-co-mu.jpg', 'Viêm lợi (nướu) là viêm mô nướu do mảng bám vi khuẩn, giai đoạn đầu của bệnh nha chu.', '• Mảng bám vi khuẩn
• Vệ sinh răng miệng kém
• Hút thuốc lá
• Thay đổi hormone
• Tiểu đường', '• Nướu đỏ, sưng
• Chảy máu khi đánh răng
• Hơi thở hôi
• Nướu mềm, nhạy cảm
• Không đau (thường)', '• Vệ sinh răng kém
• Hút thuốc
• Tiểu đường
• Thai kỳ', '• Đánh răng 2 lần/ngày đúng cách
• Dùng chỉ nha khoa
• Khám răng định kỳ
• Cạo vôi răng', '• Chảy máu nướu thường xuyên
• Nướu tụt, răng lung lay
• Hơi thở hôi kéo dài
• Đau nướu', '• Viêm nha chu
• Tụt nướu, lộ chân răng
• Mất răng
• Liên quan bệnh tim mạch', '• Có thể hồi phục hoàn toàn
• Cạo vôi răng định kỳ
• Nước súc miệng kháng khuẩn
• Điều trị sớm quan trọng', 'Vinmec, ADA');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (34, 'Hôi miệng', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaKeCcdr7-_eCteHOx8XhfwUiyBWeq0BXZ2A&s', 'Hôi miệng là tình trạng hơi thở có mùi khó chịu, có thể do nhiều nguyên nhân từ răng miệng hoặc toàn thân.', '• Vi khuẩn trong miệng
• Vệ sinh răng miệng kém
• Khô miệng
• Bệnh nha chu
• Thức ăn (tỏi, hành)', '• Hơi thở có mùi hôi
• Vị khó chịu trong miệng
• Lưỡi trắng, có cặn
• Khô miệng', '• Vệ sinh răng kém
• Hút thuốc
• Mang răng giả
• Bệnh nha chu', '• Đánh răng, lưỡi đúng cách
• Dùng chỉ nha khoa
• Uống đủ nước
• Hạn chế thức ăn gây mùi', '• Hôi miệng kéo dài dù vệ sinh tốt
• Triệu chứng khác (khô miệng, đau họng)
• Nghi ngờ bệnh toàn thân', '• Ảnh hưởng xã hội
• Tự ti, lo âu
• Dấu hiệu bệnh tiềm ẩn', '• 90% do nguyên nhân từ miệng
• Cạo lưỡi quan trọng
• Nước súc miệng hỗ trợ
• Kiểm tra bệnh toàn thân nếu cần', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (57, 'Cholesterol cao', 'https://prod-cdn.pharmacity.io/blog/mo-mau-cao1.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAUYXZVMJMURHIYJSN%2F20240730%2Fap-southeast-1%2Fs3%2Faws4_request&X-Amz-Date=20240730T100250Z&X-Amz-SignedHeaders=host&X-Amz-Expires=600&X-Amz-Signature=40c9f16856a157a4da19e1031243de2162ade0309a299d90dc8b9bca9ac359c4', 'Cholesterol cao là tình trạng mỡ máu tăng, làm tăng nguy cơ xơ vữa động mạch và bệnh tim.', '• Ăn nhiều chất béo bão hòa
• Di truyền
• Ít vận động
• Béo phì
• Tiểu đường, suy giáp', '• Thường không triệu chứng
• Phát hiện qua xét nghiệm
• U vàng (nặng)
• Đau ngực (nếu biến chứng)', '• Tiền sử gia đình
• Béo phì
• Ít vận động
• Ăn nhiều mỡ động vật', '• Ăn ít mỡ động vật
• Tập thể dục đều
• Giữ cân nặng lý tưởng
• Xét nghiệm định kỳ', '• LDL > 130 mg/dL
• Có yếu tố nguy cơ tim mạch
• Tiền sử gia đình mỡ máu cao
• Từ 20 tuổi nên kiểm tra', '• Xơ vữa động mạch
• Nhồi máu cơ tim
• Đột quỵ
• Bệnh mạch ngoại biên', '• Thay đổi lối sống trước
• Thuốc statin nếu cần
• Theo dõi men gan
• Kiểm tra mỗi 3-6 tháng', 'Vinmec, ACC/AHA');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (40, 'Herpes labialis', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Herpes%28PHIL_1573_lores%29.jpg/250px-Herpes%28PHIL_1573_lores%29.jpg', 'Herpes labialis (mụn rộp môi) là nhiễm virus HSV-1 gây mụn nước ở môi, có thể tái phát nhiều lần.', '• Virus Herpes Simplex type 1
• Lây qua tiếp xúc trực tiếp
• Dùng chung đồ cá nhân
• Tái phát: stress, sốt, mệt mỏi', '• Ngứa, rát ở môi (tiền triệu)
• Mụn nước nhỏ cụm lại
• Đau, vỡ ra, đóng vảy
• Tự lành sau 7-10 ngày', '• Người đã nhiễm HSV-1
• Stress, mệt mỏi
• Miễn dịch kém
• Tiếp xúc ánh nắng nhiều', '• Tránh tiếp xúc khi có mụn
• Không dùng chung son môi, cốc
• Dùng kem chống nắng môi
• Quản lý stress', '• Mụn lan rộng
• Kèm sốt cao
• Tổn thương mắt
• Miễn dịch kém', '• Nhiễm trùng thứ phát
• Herpes mắt
• Lan rộng (miễn dịch kém)
• Viêm não (hiếm)', '• Thuốc kháng virus (Acyclovir)
• Điều trị sớm trong 72h đầu
• Giữ sạch, khô tổn thương
• Virus tồn tại suốt đời', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (28, 'Viêm da', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkC4tIECWeLyrg2veiCS4-i45WjeiFvP0lbQ&s', 'Viêm da dị ứng (chàm) là bệnh da mạn tính, gây ngứa và viêm, thường bắt đầu từ nhỏ.', '• Di truyền, cơ địa dị ứng
• Rối loạn hàng rào bảo vệ da
• Dị nguyên (bụi nhà, phấn hoa)
• Khí hậu khô, lạnh
• Stress', '• Ngứa dữ dội
• Da đỏ, khô, nứt
• Dày da do gãi
• Mụn nước ở trẻ em
• Thường ở nếp gấp', '• Gia đình có dị ứng
• Hen, viêm mũi dị ứng
• Trẻ em
• Khí hậu khô', '• Dưỡng ẩm da thường xuyên
• Tránh dị nguyên đã biết
• Tắm nước ấm, không quá lâu
• Mặc vải cotton mềm', '• Ngứa ảnh hưởng giấc ngủ
• Da bội nhiễm
• Không đáp ứng dưỡng ẩm
• Triệu chứng lan rộng', '• Bội nhiễm da
• Dày da, lichen hóa
• Ảnh hưởng giấc ngủ
• Trầm cảm', '• Dưỡng ẩm là nền tảng
• Corticoid bôi ngắn hạn
• Thuốc ức chế calcineurin
• Điều trị kéo dài', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (14, 'Viêm khớp dạng thấp', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEjwYT6BJ7x2zfgyAvumS2hhjGHeqzxbgkeQ&s', 'Viêm khớp dạng thấp là bệnh tự miễn mạn tính, gây viêm nhiều khớp đối xứng, có thể dẫn đến biến dạng và tàn phế.', '• Bệnh tự miễn (hệ miễn dịch tấn công khớp)
• Yếu tố di truyền
• Nhiễm trùng là yếu tố khởi phát
• Hút thuốc lá tăng nguy cơ', '• Viêm nhiều khớp đối xứng
• Cứng khớp buổi sáng kéo dài > 1 giờ
• Sưng, nóng, đau khớp
• Mệt mỏi toàn thân
• Biến dạng khớp (giai đoạn muộn)', '• Nữ giới (gấp 2-3 lần nam)
• Tuổi 30-60
• Có tiền sử gia đình
• Người hút thuốc lá', '• Bỏ thuốc lá
• Chẩn đoán và điều trị sớm
• Duy trì cân nặng hợp lý
• Tập thể dục nhẹ nhàng', '• Đau, sưng nhiều khớp > 6 tuần
• Cứng khớp buổi sáng kéo dài
• Mệt mỏi, sốt nhẹ kèm theo
• Không đáp ứng thuốc giảm đau thông thường', '• Biến dạng, phá hủy khớp
• Tàn phế, mất chức năng
• Biến chứng ngoài khớp (phổi, tim)
• Loãng xương', '• Điều trị sớm rất quan trọng
• Thuốc DMARDs, sinh học
• Theo dõi tác dụng phụ thuốc
• Vật lý trị liệu hỗ trợ', 'Vinmec, Hội Thấp khớp Việt Nam, ACR Guidelines');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (38, 'Mệt mỏi mãn tính', 'https://www.vinmec.com/static/uploads/large_20200617_161705_328135_met_moi_14853130850_max_1800x1800_jpg_9ec202ab4c.jpg', 'Mệt mỏi mạn tính là tình trạng mệt mỏi kéo dài trên 6 tháng, không hồi phục dù nghỉ ngơi, ảnh hưởng sinh hoạt.', '• Chưa rõ hoàn toàn
• Nhiễm virus
• Rối loạn miễn dịch
• Stress, sang chấn
• Yếu tố di truyền', '• Mệt mỏi nặng kéo dài
• Không hồi phục sau nghỉ ngơi
• Đau cơ, khớp
• Suy giảm trí nhớ, tập trung
• Rối loạn giấc ngủ', '• Nữ giới
• Tuổi 40-60
• Tiền sử dị ứng
• Người hay stress', '• Quản lý stress
• Ngủ đủ giấc
• Tập thể dục vừa phải
• Dinh dưỡng cân bằng', '• Mệt mỏi kéo dài > 6 tháng
• Ảnh hưởng công việc sinh hoạt
• Loại trừ bệnh khác
• Suy giảm nhận thức', '• Trầm cảm
• Cô lập xã hội
• Mất khả năng lao động
• Giảm chất lượng sống', '• Chẩn đoán loại trừ
• Điều trị triệu chứng
• Liệu pháp nhận thức hành vi
• Tập thể dục theo mức độ chịu đựng', 'Vinmec, CDC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (37, 'Gan nhiễm mỡ', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEanq1kz8JPEPIibG3CNP-TIrEgXfYnMxBew&s', 'Gan nhiễm mỡ là tình trạng mỡ tích tụ trong tế bào gan, có thể tiến triển thành xơ gan nếu không điều trị.', '• Béo phì, thừa cân
• Tiểu đường type 2
• Rối loạn mỡ máu
• Uống rượu nhiều
• Thuốc (corticoid, tamoxifen)', '• Thường không triệu chứng
• Mệt mỏi nhẹ
• Đau tức vùng gan (đôi khi)
• Phát hiện qua siêu âm
• Tăng men gan', '• Béo phì
• Tiểu đường
• Tuổi trung niên
• Hội chứng chuyển hóa', '• Duy trì cân nặng lý tưởng
• Hạn chế rượu bia
• Ăn uống lành mạnh
• Tập thể dục đều', '• Men gan tăng
• Siêu âm thấy gan nhiễm mỡ
• Có nhiều yếu tố nguy cơ
• Đau tức vùng gan', '• Viêm gan nhiễm mỡ
• Xơ gan
• Ung thư gan
• Suy gan', '• Chưa có thuốc đặc hiệu
• Giảm cân 7-10% cải thiện đáng kể
• Kiểm tra men gan định kỳ
• Điều trị bệnh kèm', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (50, 'Chuột rút', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNiGlFJEGjZZri8nY2l4l98_FYmv3vtanidw&s', 'Chuột rút là co thắt cơ đột ngột, không tự chủ, gây đau dữ dội, thường ở bắp chân.', '• Mất nước, điện giải
• Vận động quá sức
• Ngồi/nằm lâu
• Thiếu kali, magie, canxi
• Mang thai', '• Co cứng cơ đột ngột
• Đau dữ dội
• Cơ căng cứng sờ được
• Thường về đêm
• Tự hết sau vài phút', '• Vận động viên
• Người cao tuổi
• Phụ nữ mang thai
• Người dùng lợi tiểu', '• Uống đủ nước
• Khởi động trước tập
• Giãn cơ sau tập
• Bổ sung điện giải khi mất mồ hôi nhiều', '• Chuột rút thường xuyên
• Không rõ nguyên nhân
• Kèm yếu cơ
• Không đáp ứng điều trị', '• Ảnh hưởng giấc ngủ
• Đau cơ kéo dài
• Dấu hiệu bệnh tiềm ẩn (hiếm)', '• Kéo giãn cơ khi bị
• Massage nhẹ
• Chườm nóng/lạnh
• Magie có thể giúp', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (45, 'Viêm mô tế bào', 'https://prod-cdn.pharmacity.io/blog/viem-mo-te-bao-1.webp?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAUYXZVMJMURHIYJSN%2F20240820%2Fap-southeast-1%2Fs3%2Faws4_request&X-Amz-Date=20240820T094615Z&X-Amz-SignedHeaders=host&X-Amz-Expires=600&X-Amz-Signature=fed64af81ed3763156a0c4135493e4119427595b41a7492b7c71388ec25db77a', 'Viêm mô tế bào là nhiễm trùng da và mô dưới da do vi khuẩn, gây sưng đỏ nóng đau.', '• Vi khuẩn (Streptococcus, Staphylococcus)
• Xâm nhập qua vết thương
• Nấm da, côn trùng cắn
• Phẫu thuật, tiểu đường', '• Da đỏ, sưng, nóng
• Đau tăng dần
• Ranh giới không rõ
• Sốt, ớn lạnh
• Hạch bạch huyết sưng', '• Tiểu đường
• Suy giảm miễn dịch
• Béo phì
• Bệnh mạch máu ngoại biên', '• Vệ sinh vết thương tốt
• Điều trị nấm da sớm
• Kiểm soát tiểu đường
• Bảo vệ da khỏi tổn thương', '• Da đỏ sưng lan nhanh
• Sốt
• Vùng tổn thương tăng đau
• Đường đỏ từ vết thương', '• Áp xe
• Nhiễm trùng huyết
• Viêm xương tủy
• Hoại tử cân mạc (hiếm)', '• Kháng sinh toàn thân cần thiết
• Nâng cao chi bị ảnh hưởng
• Theo dõi sát tiến triển
• Nhập viện nếu nặng', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (47, 'Rụng tóc', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2023/11/6/rung-toc-16992575458031662012176.jpg', 'Rụng tóc có nhiều loại: androgen, mảng, toàn thể. Có thể do di truyền, hormone, stress hoặc bệnh lý.', '• Di truyền (hói nam)
• Hormone (mãn kinh, sau sinh)
• Stress, bệnh nặng
• Thiếu dinh dưỡng
• Thuốc (hóa trị)', '• Tóc mỏng đi từ từ
• Mảng trọc tròn (alopecia areata)
• Rụng đột ngột sau stress
• Tóc yếu, dễ gãy', '• Nam giới (hói nam)
• Tiền sử gia đình
• Sau sinh, mãn kinh
• Stress mạn tính', '• Dinh dưỡng đầy đủ
• Tránh kéo tóc quá chặt
• Quản lý stress
• Điều trị nguyên nhân sớm', '• Rụng tóc đột ngột nhiều
• Mảng trọc
• Kèm triệu chứng khác
• Rụng tiến triển nhanh', '• Hói hoàn toàn
• Ảnh hưởng tâm lý
• Tự ti xã hội', '• Minoxidil, Finasteride cho hói nam
• Steroid bôi cho alopecia areata
• Cấy tóc là lựa chọn
• Telogen effluvium thường tự hồi phục', 'Vinmec, AAD');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (46, 'Gàu', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2024/9/20/gau-1726819772320295330309.jpg', 'Gàu là tình trạng da đầu bong vảy, có thể do da khô, viêm da tiết bã hoặc nấm Malassezia.', '• Nấm Malassezia
• Viêm da tiết bã
• Da đầu khô
• Ít gội đầu
• Phản ứng với sản phẩm tóc', '• Vảy trắng trên da đầu, vai
• Ngứa da đầu
• Da đầu đỏ (viêm da tiết bã)
• Tăng khi stress, mùa lạnh', '• Nam giới
• Da dầu
• Hệ miễn dịch yếu
• Bệnh thần kinh (Parkinson)', '• Gội đầu đều đặn
• Dùng dầu gội phù hợp
• Quản lý stress
• Hạn chế sản phẩm tóc có dầu', '• Gàu nặng không bớt
• Ngứa dữ dội
• Da đỏ viêm nhiều
• Lan ra mặt, cơ thể', '• Viêm da tiết bã
• Ảnh hưởng thẩm mỹ
• Nhiễm trùng thứ phát do gãi', '• Dầu gội chống gàu (ketoconazole, selenium)
• Gội đúng cách, để ngấm
• Có thể dùng lâu dài nếu cần
• Tránh gãi mạnh', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (49, 'Lành xương', 'https://i.ytimg.com/vi/uuDU2M5MPWU/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLDxs4hv34QO6mMei8vj7wLYN4TbNg', 'Lành xương là quá trình tự nhiên phục hồi sau gãy xương. Có thể bị ảnh hưởng bởi nhiều yếu tố.', '• Quá trình sinh lý tự nhiên
• Chậm lành: tiểu đường, hút thuốc
• Nhiễm trùng, tuần hoàn kém
• Dinh dưỡng thiếu
• Di lệch xương không cố định', '• Đau giảm dần
• Sưng giảm
• Hình thành cal xương
• Phục hồi chức năng', '• Người cao tuổi
• Tiểu đường
• Hút thuốc
• Suy dinh dưỡng', '• Dinh dưỡng đủ canxi, protein
• Bỏ thuốc lá
• Kiểm soát bệnh nền
• Tuân thủ bất động', '• Đau tăng sau điều trị
• Sưng, đỏ bất thường
• Không tiến triển lành
• Biến dạng', '• Khớp giả (không lành)
• Lành lệch
• Nhiễm trùng xương
• Mất chức năng', '• Bất động đủ thời gian
• Vật lý trị liệu sau
• Siêu âm kích thích lành xương
• Phẫu thuật nếu cần', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (56, 'Tiêu hoá kém', 'https://www.vinmec.com/static/uploads/20211008_131727_811215_he_tieu_hoa_yeu_nen_max_1800x1800_jpg_010871717b.jpg', 'Tiêu hóa kém là tình trạng khó tiêu, đầy bụng sau ăn do rối loạn chức năng tiêu hóa.', '• Ăn quá nhanh, quá no
• Thức ăn nhiều dầu mỡ
• Stress
• Hút thuốc, rượu bia
• Thuốc (NSAIDs, kháng sinh)', '• Đầy bụng, chướng hơi
• Ợ hơi, ợ chua
• Buồn nôn sau ăn
• Cảm giác no sớm
• Nóng rát thượng vị', '• Người ăn uống không điều độ
• Stress mạn tính
• Người cao tuổi
• Bệnh lý dạ dày', '• Ăn chậm, nhai kỹ
• Chia nhỏ bữa ăn
• Tránh thức ăn khó tiêu
• Quản lý stress', '• Triệu chứng kéo dài > 2 tuần
• Sụt cân
• Nôn ra máu, phân đen
• Khó nuốt', '• Suy dinh dưỡng
• Lo âu về ăn uống
• Có thể là triệu chứng bệnh nặng hơn', '• Thuốc kháng acid, trợ tiêu hóa
• Enzyme tiêu hóa
• Probiotics
• Tìm nguyên nhân nếu kéo dài', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (26, 'Vảy nến', 'https://media.loveitopcdn.com/4527/135927-bvdk-medic-bd-3.jpg', 'Vảy nến là bệnh tự miễn mạn tính, gây tăng sinh tế bào da quá mức, tạo mảng đỏ có vảy trắng bạc.', '• Bệnh tự miễn
• Di truyền
• Stress, nhiễm trùng
• Thuốc (lithium, beta-blocker)
• Chấn thương da', '• Mảng da đỏ, dày, có vảy trắng
• Ngứa, đau, nứt chảy máu
• Thường ở khuỷu, đầu gối, da đầu
• Móng dày, rỗ
• Viêm khớp vảy nến', '• Tiền sử gia đình
• Béo phì
• Người hút thuốc
• HIV/AIDS', '• Giữ da ẩm
• Tránh tổn thương da
• Quản lý stress
• Không hút thuốc', '• Mảng da lan rộng
• Đau khớp
• Ảnh hưởng chất lượng sống
• Không đáp ứng điều trị tại chỗ', '• Viêm khớp vảy nến
• Bệnh tim mạch
• Trầm cảm
• Tiểu đường type 2', '• Không chữa khỏi hoàn toàn
• Kiểm soát triệu chứng
• Thuốc sinh học cho nặng
• Ánh sáng trị liệu', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (52, 'Viêm gan', 'https://careplusvn.com/files/viem-gan-1(1).jpg', 'Viêm gan là viêm tế bào gan, có thể do virus (A, B, C), rượu, thuốc hoặc tự miễn.', '• Virus viêm gan A, B, C, D, E
• Rượu bia
• Thuốc, hóa chất
• Bệnh tự miễn
• Gan nhiễm mỡ', '• Mệt mỏi, chán ăn
• Vàng da, vàng mắt
• Đau tức vùng gan
• Nước tiểu sẫm màu
• Phân bạc màu', '• Tiêm chích ma túy
• Quan hệ không an toàn
• Y tế không tiệt trùng
• Nghiện rượu', '• Tiêm vaccine viêm gan A, B
• Quan hệ tình dục an toàn
• Không dùng chung kim tiêm
• Hạn chế rượu', '• Vàng da, vàng mắt
• Mệt mỏi kéo dài
• Đau tức vùng gan
• Tiếp xúc nguy cơ', '• Xơ gan
• Ung thư gan
• Suy gan
• Tử vong', '• Viêm gan B, C cần điều trị kháng virus
• A, E thường tự khỏi
• Không uống rượu khi viêm gan
• Theo dõi định kỳ', 'Vinmec, WHO Hepatitis');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (48, 'Loãng xương', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2023/6/8/loang-xuong-o-tre-1-1686210062513157379482.jpg', 'Loãng xương là tình trạng mật độ xương giảm, xương giòn dễ gãy. Phổ biến ở phụ nữ sau mãn kinh.', '• Giảm estrogen (mãn kinh)
• Thiếu canxi, vitamin D
• Ít vận động
• Hút thuốc, rượu
• Thuốc (corticoid dài hạn)', '• Thường không triệu chứng
• Gãy xương do chấn thương nhẹ
• Đau lưng (gãy đốt sống)
• Giảm chiều cao
• Gù lưng', '• Phụ nữ sau mãn kinh
• Tiền sử gia đình
• Thể trạng nhỏ
• Dùng corticoid lâu', '• Bổ sung canxi 1000-1200mg/ngày
• Vitamin D đủ
• Tập thể dục chịu lực
• Bỏ thuốc lá, hạn chế rượu', '• Phụ nữ > 65 hoặc sau mãn kinh có nguy cơ
• Gãy xương do chấn thương nhẹ
• Giảm chiều cao bất thường
• Dùng corticoid lâu dài', '• Gãy xương (hông, cột sống, cổ tay)
• Tàn phế
• Tử vong (gãy cổ xương đùi)
• Đau mạn tính', '• Đo mật độ xương DEXA
• Thuốc bisphosphonate, denosumab
• Điều trị lâu dài
• Phòng ngã quan trọng', 'Vinmec, MEDLATEC, NOF');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (54, 'Buồn nôn', 'https://suckhoedoisong.qltns.mediacdn.vn/Images/duylinh/2016/07/06/buon_non_la_dau_hieu_cua_nhieu_benh_nguy_hiem.jpg', 'Buồn nôn là cảm giác khó chịu ở dạ dày muốn nôn, có thể do nhiều nguyên nhân khác nhau.', '• Rối loạn tiêu hóa
• Nhiễm trùng, ngộ độc thức ăn
• Say tàu xe
• Thuốc (hóa trị, kháng sinh)
• Mang thai', '• Cảm giác muốn nôn
• Khó chịu vùng thượng vị
• Tăng tiết nước bọt
• Vã mồ hôi
• Có thể kèm nôn', '• Phụ nữ mang thai
• Bệnh nhân hóa trị
• Người say tàu xe
• Rối loạn tiêu hóa', '• Ăn chín uống sôi
• Ăn từ từ, không quá no
• Tránh thức ăn gây kích ứng
• Không nằm ngay sau ăn', '• Buồn nôn kéo dài
• Kèm đau ngực, đau đầu dữ dội
• Nôn ra máu
• Sụt cân', '• Mất nước (nôn nhiều)
• Mất điện giải
• Suy dinh dưỡng
• Dấu hiệu bệnh nặng', '• Nghỉ ngơi, uống nước từng ngụm nhỏ
• Gừng, bạc hà có thể giúp
• Thuốc chống nôn nếu cần
• Tìm nguyên nhân', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (53, 'Say tàu xe', 'https://statics.vinpearl.com/Hinh-anh-phong-chong-say-tau-xe-hieu-qua-so-1.jpg', 'Say tàu xe là tình trạng buồn nôn, chóng mặt khi di chuyển bằng phương tiện, do xung đột thông tin cảm giác.', '• Xung đột giữa thị giác và tiền đình
• Rung lắc xe, tàu, máy bay
• Đọc sách khi di chuyển
• Không nhìn ra ngoài', '• Buồn nôn, nôn
• Chóng mặt
• Vã mồ hôi lạnh
• Xanh xao, mệt mỏi
• Tăng tiết nước bọt', '• Trẻ em 2-12 tuổi
• Phụ nữ (kinh nguyệt, mang thai)
• Người có migraine
• Tiền sử say tàu xe', '• Ngồi ghế trước xe
• Nhìn ra xa
• Không đọc sách khi đi xe
• Ăn nhẹ trước khi đi', '• Nôn nhiều, mất nước
• Chóng mặt kéo dài sau dừng
• Triệu chứng nặng bất thường
• Ảnh hưởng cuộc sống', '• Mất nước (nôn nhiều)
• Hiếm có biến chứng nặng
• Ảnh hưởng du lịch', '• Thuốc chống nôn (Dimenhydrinat)
• Uống 30-60 phút trước khi đi
• Gừng có thể giúp
• Băng cổ tay bấm huyệt', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (55, 'Chán ăn', 'https://www.vinmec.com/static/uploads/20190301_035536_090296_an_khong_ngon_mieng_max_1800x1800_jpg_e1041794c8.jpg', 'Chán ăn là giảm hoặc mất cảm giác thèm ăn, có thể do bệnh lý, tâm lý hoặc thuốc.', '• Nhiễm trùng, bệnh cấp
• Trầm cảm, lo âu
• Thuốc (hóa trị, kháng sinh)
• Bệnh mạn tính (ung thư, COPD)
• Tuổi cao', '• Không thèm ăn
• Ăn ít hơn bình thường
• Sụt cân không chủ ý
• Mệt mỏi, yếu
• Chán ghét thức ăn', '• Người mắc bệnh mạn tính
• Người cao tuổi
• Trầm cảm
• Bệnh nhân ung thư', '• Ăn đa dạng, ngon miệng
• Ăn bữa nhỏ, thường xuyên
• Điều trị bệnh nền
• Duy trì hoạt động', '• Chán ăn kéo dài > 2 tuần
• Sụt cân không giải thích
• Kèm triệu chứng khác
• Ảnh hưởng sức khỏe', '• Sụt cân, suy dinh dưỡng
• Yếu cơ, mệt mỏi
• Suy giảm miễn dịch
• Chậm lành vết thương', '• Tìm nguyên nhân quan trọng
• Chia nhỏ bữa ăn
• Thức ăn yêu thích
• Bổ sung dinh dưỡng nếu cần', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (65, 'Ho khan nhiều, rát họng', 'https://nhatnhat.com/pic/Customer/images/xit%20hong%20NN%20%2020%2005%202021%20800x600.jpg', 'Ho khan nhiều, rát họng thường do viêm họng hoặc kích ứng đường hô hấp trên.', '• Viêm họng virus/vi khuẩn
• Khô không khí
• Nói nhiều, la hét
• Trào ngược
• Dị ứng', '• Ho khan liên tục
• Rát họng, đau họng
• Khàn tiếng
• Khó nuốt
• Ngứa họng', '• Người nói nhiều (ca sĩ, giáo viên)
• Dị ứng
• GERD
• Môi trường khô', '• Uống đủ nước
• Không la hét
• Tránh khói thuốc
• Dùng máy tạo ẩm', '• Ho > 2 tuần
• Nuốt đau nhiều
• Sốt cao
• Khó thở', '• Viêm thanh quản
• Khàn tiếng kéo dài
• Mất giọng tạm thời', '• Súc họng nước muối
• Mật ong, chanh
• Kẹo ngậm
• Nghỉ giọng', 'Vinmec, Y học cổ truyền');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (63, 'Ho khan', 'https://cdn.tiemchunglongchau.com.vn/ho_khan_55841bed6b.jpeg', 'Ho khan là ho không có đờm, thường do kích ứng đường hô hấp hoặc dị ứng.', '• Dị ứng, hen
• Trào ngược dạ dày
• Thuốc (ACE inhibitor)
• Hậu COVID-19
• Khô đường thở', '• Ho không có đờm
• Ngứa họng, cổ họng
• Ho nhiều về đêm
• Có thể kèm khó thở', '• Người dị ứng
• Dùng thuốc ACE inhibitor
• GERD
• Hậu nhiễm trùng', '• Tránh dị nguyên
• Điều trị GERD
• Uống đủ nước
• Tránh khói bụi', '• Ho > 3 tuần
• Khó thở
• Sụt cân
• Ho ra máu', '• Ho mạn tính
• Ảnh hưởng giấc ngủ
• Tiểu không tự chủ (ho mạnh)', '• Thuốc ức chế ho (Dextromethorphan)
• Mật ong
• Ngậm kẹo
• Điều trị nguyên nhân', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (42, 'Ghẻ', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2025/3/13/ghe01-1024x638-1741875244040-1741875245132157862085.png', 'Ghẻ là bệnh da do ký sinh trùng Sarcoptes scabiei, gây ngứa dữ dội, đặc biệt về đêm.', '• Ký sinh trùng Sarcoptes scabiei
• Lây qua tiếp xúc da trực tiếp
• Dùng chung quần áo, chăn
• Môi trường đông đúc', '• Ngứa dữ dội, tăng về đêm
• Mụn nước nhỏ, đường hầm
• Ở kẽ ngón, cổ tay, nách, bẹn
• Nhiều người trong gia đình bị', '• Sống đông đúc
• Trại tập trung, nhà dưỡng lão
• Vệ sinh kém
• Tiếp xúc người nhiễm', '• Không dùng chung đồ cá nhân
• Giặt chăn ga nóng
• Điều trị toàn bộ gia đình
• Vệ sinh môi trường', '• Ngứa không rõ nguyên nhân
• Nhiều người trong nhà bị
• Không đáp ứng điều trị
• Bội nhiễm', '• Bội nhiễm vi khuẩn
• Chàm hóa
• Ghẻ vảy (ở miễn dịch kém)
• Viêm thận sau nhiễm trùng', '• Permethrin cream 5% qua đêm
• Ivermectin uống
• Điều trị toàn gia đình cùng lúc
• Giặt sôi đồ dùng', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (61, 'Ho do cảm lạnh', 'https://images.unsplash.com/photo-1584017911766-d451b3d0e843?w=400', 'Ho do cảm lạnh là triệu chứng phổ biến của nhiễm virus đường hô hấp trên, thường tự khỏi.', '• Virus rhinovirus, coronavirus
• Kích ứng đường thở do dịch mũi
• Viêm họng
• Thời tiết lạnh', '• Ho khan hoặc có đờm loãng
• Kèm sổ mũi, nghẹt mũi
• Đau họng
• Sốt nhẹ
• Mệt mỏi', '• Trẻ em
• Người suy giảm miễn dịch
• Tiếp xúc đông người
• Thời tiết lạnh', '• Rửa tay thường xuyên
• Tránh người bệnh
• Tăng cường vitamin C
• Giữ ấm cơ thể', '• Ho kéo dài > 3 tuần
• Sốt cao > 39°C
• Khó thở
• Ho ra máu', '• Viêm phế quản
• Viêm phổi
• Viêm xoang
• Ho mạn tính', '• Uống nhiều nước ấm
• Mật ong (trẻ > 1 tuổi)
• Thuốc ho OTC
• Không cần kháng sinh', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (23, 'Sỏi thận', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2024/3/14/soi-than-1710387026439273059742.jpg', 'Sỏi thận là khối cứng hình thành trong thận từ các chất trong nước tiểu, có thể gây đau dữ dội khi di chuyển.', '• Uống ít nước
• Ăn nhiều muối, protein
• Béo phì
• Tiền sử gia đình
• Nhiễm trùng tiểu tái phát', '• Đau quặn thận dữ dội (sườn)
• Đau lan xuống bụng dưới, bẹn
• Tiểu ra máu
• Buồn nôn, nôn
• Tiểu buốt, tiểu rắt', '• Nam giới
• Người uống ít nước
• Tiền sử sỏi thận
• Béo phì', '• Uống đủ 2-3 lít nước/ngày
• Giảm muối, protein động vật
• Ăn đủ canxi (thực phẩm)
• Hạn chế đường, oxalate', '• Đau dữ dội không đáp ứng thuốc
• Sốt, ớn lạnh
• Tiểu ra máu nhiều
• Không tiểu được', '• Tắc nghẽn niệu quản
• Nhiễm trùng tiểu
• Thận ứ nước
• Suy thận', '• Sỏi nhỏ có thể tự ra
• Tán sỏi ngoài cơ thể (ESWL)
• Nội soi lấy sỏi
• Phân tích thành phần sỏi', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (60, 'Bỏng do mặt trời', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRR7XqzfMkXsk3CPVyJfBBf9esKuXsOa1eiSw&s', 'Bỏng nắng là tổn thương da do tia UV từ mặt trời, gây đỏ, đau, và có thể phồng rộp.', '• Tiếp xúc tia UV quá mức
• Không bôi kem chống nắng
• Da sáng màu nhạy cảm
• Phản xạ từ nước, cát, tuyết', '• Da đỏ, nóng
• Đau khi chạm
• Phồng rộp (nặng)
• Bong da sau vài ngày
• Sốt, ớn lạnh (nặng)', '• Da sáng, tóc vàng/đỏ
• Trẻ em
• Làm việc ngoài trời
• Không dùng chống nắng', '• Bôi kem chống nắng SPF 30+
• Ở trong nhà 10h-16h
• Mặc áo dài tay, đội mũ
• Tránh giường tanning', '• Phồng rộp rộng
• Sốt cao, ớn lạnh
• Đau dữ dội
• Dấu hiệu nhiễm trùng', '• Nhiễm trùng da
• Lão hóa da sớm
• Ung thư da
• Say nắng kèm theo', '• Làm mát bằng nước lạnh
• Gel lô hội làm dịu
• Uống đủ nước
• Không chọc vỡ mụn nước', 'Vinmec, AAD');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (21, 'Mất ngủ', 'https://images.unsplash.com/photo-1541781774459-bb2af2f05b55?w=400', 'Mất ngủ là rối loạn giấc ngủ phổ biến, khó đi vào giấc ngủ hoặc duy trì giấc ngủ, ảnh hưởng chất lượng sống.', '• Stress, lo âu, trầm cảm
• Thói quen ngủ kém
• Caffeine, rượu
• Bệnh lý (đau, trào ngược)
• Thuốc (steroid, thuốc huyết áp)', '• Khó ngủ, thức giấc đêm
• Dậy sớm không ngủ lại được
• Mệt mỏi ban ngày
• Khó tập trung
• Cáu gắt', '• Người cao tuổi
• Nữ giới
• Người làm ca đêm
• Người stress', '• Ngủ và dậy cùng giờ
• Tránh màn hình trước ngủ
• Không caffeine sau 2pm
• Môi trường ngủ thoải mái', '• Mất ngủ > 3 tuần
• Ảnh hưởng công việc
• Nghi ngờ ngưng thở khi ngủ
• Mất ngủ kèm trầm cảm', '• Tai nạn giao thông, lao động
• Béo phì, tiểu đường
• Bệnh tim mạch
• Trầm cảm', '• Vệ sinh giấc ngủ quan trọng
• Thuốc ngủ chỉ ngắn hạn
• CBT-I hiệu quả
• Tránh lạm dụng rượu để ngủ', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (10, 'Đái tháo đường typ 2', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvGEhs2HMYsK212FPZREmqsbiSRdlJGpvBMA&s', 'Đái tháo đường type 2 là bệnh chuyển hóa mạn tính, cơ thể không sử dụng insulin hiệu quả, gây tăng đường huyết. Chiếm 90-95% các trường hợp tiểu đường.', '• Kháng insulin
• Béo phì, thừa cân
• Ít vận động
• Di truyền
• Chế độ ăn nhiều đường, tinh bột', '• Khát nước nhiều
• Tiểu nhiều lần
• Đói nhiều
• Sụt cân không rõ lý do
• Mệt mỏi, mờ mắt
• Vết thương lâu lành', '• Người thừa cân, béo phì
• Trên 45 tuổi
• Gia đình có người tiểu đường
• Phụ nữ tiểu đường thai kỳ
• Người ít vận động', '• Duy trì cân nặng hợp lý
• Tập thể dục 150 phút/tuần
• Ăn uống lành mạnh, ít đường
• Kiểm tra đường huyết định kỳ', '• Có các triệu chứng nghi ngờ
• Thuộc nhóm nguy cơ cao
• Đường huyết không kiểm soát được
• Xuất hiện biến chứng', '• Bệnh tim mạch, đột quỵ
• Bệnh thận, suy thận
• Bệnh thần kinh, tê bì chân tay
• Mù lòa, loét bàn chân', '• Theo dõi đường huyết thường xuyên
• Tuân thủ điều trị suốt đời
• Khám mắt, thận định kỳ
• Chăm sóc bàn chân hàng ngày', 'Vinmec, ADA Diabetes Guidelines, Hội Nội tiết Việt Nam');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (8, 'Táo bón', 'https://cdn2.tuoitre.vn/thumb_w/480/2018/2/9/image001-15181636853651862487530.jpg', 'Táo bón là tình trạng đại tiện khó khăn, phân cứng hoặc đại tiện ít hơn 3 lần/tuần. Thường gặp và có thể điều trị được.', '• Thiếu chất xơ trong chế độ ăn
• Uống ít nước
• Ít vận động
• Nhịn đi vệ sinh
• Thuốc (opioid, thuốc chống trầm cảm)', '• Đại tiện ít hơn 3 lần/tuần
• Phân cứng, khô
• Rặn nhiều khi đại tiện
• Cảm giác đi không hết phân
• Đầy bụng, khó chịu', '• Người cao tuổi
• Người ít vận động
• Phụ nữ mang thai
• Người dùng thuốc gây táo bón', '• Ăn nhiều rau xanh, trái cây
• Uống đủ 2 lít nước/ngày
• Tập thể dục hàng ngày
• Đi vệ sinh đúng giờ, không nhịn', '• Táo bón kéo dài trên 3 tuần
• Đi ngoài ra máu
• Đau bụng dữ dội
• Sụt cân không rõ nguyên nhân', '• Trĩ
• Nứt hậu môn
• Phân rắn (fecal impaction)
• Sa trực tràng', '• Thuốc nhuận tràng chỉ dùng ngắn hạn
• Probiotics có thể giúp
• Tư thế ngồi toilet đúng cách
• Tăng chất xơ từ từ để tránh đầy hơi', 'Vinmec, MEDLATEC, American Gastroenterological Association');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (51, 'Viêm gân', 'https://images.unsplash.com/photo-1609252509102-aa73d8e52d04?w=400', 'Viêm gân là viêm hoặc kích ứng gân - mô nối cơ với xương, gây đau và hạn chế vận động.', '• Vận động lặp đi lặp lại
• Chấn thương
• Tư thế làm việc sai
• Tuổi cao (gân thoái hóa)
• Một số bệnh (tiểu đường, gút)', '• Đau tại vị trí gân
• Đau tăng khi vận động
• Sưng nhẹ
• Cứng, hạn chế vận động
• Tiếng lạo xạo', '• Vận động viên
• Công việc lặp lại động tác
• Người trên 40 tuổi
• Tiểu đường, gút', '• Khởi động trước vận động
• Tư thế làm việc đúng
• Nghỉ ngơi xen kẽ
• Tập tăng cường cơ', '• Đau kéo dài > 1-2 tuần
• Sưng, nóng đỏ
• Hạn chế vận động nhiều
• Không đáp ứng nghỉ ngơi', '• Viêm gân mạn tính
• Đứt gân
• Vôi hóa gân
• Mất chức năng', '• Nghỉ ngơi là quan trọng nhất
• Chườm lạnh, NSAIDs
• Vật lý trị liệu
• Tiêm corticoid nếu cần', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (58, 'Say nắng', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2024/6/3/say-nang-1717385281859935696129.png', 'Say nắng/say nóng là tình trạng cơ thể quá nhiệt do tiếp xúc nhiệt độ cao, có thể đe dọa tính mạng.', '• Tiếp xúc nắng nóng kéo dài
• Làm việc ngoài trời
• Uống ít nước
• Mặc quần áo kín
• Tập luyện cường độ cao', '• Đau đầu, chóng mặt
• Buồn nôn, nôn
• Da đỏ, nóng, khô hoặc ẩm
• Sốt cao (>40°C)
• Lú lẫn, mất ý thức (nặng)', '• Người làm việc ngoài trời
• Người cao tuổi, trẻ nhỏ
• Bệnh tim mạch
• Dùng thuốc lợi tiểu', '• Uống đủ nước
• Tránh nắng 11h-15h
• Mặc quần áo nhẹ, sáng màu
• Nghỉ ngơi nơi mát', '• Sốt cao không giảm
• Lú lẫn, co giật
• Không tiểu được
• Da khô nóng đỏ', '• Sốc nhiệt
• Tổn thương não
• Suy đa tạng
• Tử vong', '• Đưa vào nơi mát ngay
• Làm mát bằng nước
• Uống nước nếu tỉnh
• Cấp cứu nếu sốc nhiệt', 'Vinmec, CDC Heat');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (44, 'Trĩ', 'https://giaan115.com/uploads/files/2019/06/28/benh-tri-1.jpg', 'Trĩ là tình trạng giãn tĩnh mạch vùng hậu môn-trực tràng, có thể nội hoặc ngoại, gây đau và chảy máu.', '• Táo bón mạn tính
• Rặn khi đại tiện
• Ngồi lâu
• Mang thai
• Béo phì, ít vận động', '• Chảy máu khi đại tiện
• Ngứa, đau hậu môn
• Sa búi trĩ (nội)
• Cục sưng đau (ngoại)
• Tiết dịch nhầy', '• Táo bón thường xuyên
• Phụ nữ mang thai
• Ngồi làm việc nhiều
• Ăn ít chất xơ', '• Ăn nhiều chất xơ
• Uống đủ nước
• Không rặn quá mức
• Không ngồi toilet lâu', '• Chảy máu kéo dài
• Đau dữ dội
• Búi trĩ không tự về
• Nghi ngờ bệnh khác', '• Thiếu máu (chảy máu lâu)
• Nghẹt búi trĩ
• Nhiễm trùng
• Hoại tử (hiếm)', '• Kem bôi giảm triệu chứng
• Ngồi ngâm nước ấm
• Thủ thuật nếu cần
• Phẫu thuật cho nặng', 'Vinmec, MEDLATEC');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (36, 'Béo phì', 'https://www.vinmec.com/static/uploads/20190808_030135_986366_beo_phi_max_1800x1800_jpg_ccd654e690.jpg', 'Béo phì là tình trạng tích tụ mỡ quá mức (BMI ≥30), tăng nguy cơ nhiều bệnh mạn tính.', '• Ăn nhiều calo hơn tiêu hao
• Ít vận động
• Di truyền
• Nội tiết (suy giáp, Cushing)
• Thuốc, stress', '• Cân nặng cao (BMI ≥30)
• Mỡ tích tụ bụng
• Khó thở khi gắng sức
• Đau khớp
• Ngáy, ngưng thở khi ngủ', '• Lối sống ít vận động
• Chế độ ăn nhiều calo
• Tiền sử gia đình
• Stress mạn tính', '• Ăn uống lành mạnh
• Tập thể dục đều đặn
• Kiểm soát cân nặng
• Ngủ đủ giấc', '• BMI ≥30 hoặc ≥25 có bệnh kèm
• Khó giảm cân
• Biến chứng (tiểu đường, tim mạch)
• Cân tăng nhanh bất thường', '• Tiểu đường type 2
• Bệnh tim mạch
• Ung thư
• Tử vong sớm', '• Giảm cân từ từ 0.5-1kg/tuần
• Thay đổi lối sống là chính
• Thuốc/phẫu thuật nếu cần
• Cần duy trì lâu dài', 'Vinmec, WHO');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (13, 'Thoái hóa khớp', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2023/3/13/thoai-hoa-xuong-khop-1678702535211462256895.png', 'Thoái hóa khớp là bệnh mạn tính gây tổn thương sụn khớp và xương dưới sụn, thường gặp ở khớp gối, háng, cột sống và bàn tay.', '• Lão hóa tự nhiên
• Chấn thương khớp
• Béo phì (tăng áp lực lên khớp)
• Di truyền
• Nghề nghiệp (đứng nhiều, mang vác nặng)', '• Đau khớp khi vận động
• Cứng khớp buổi sáng (< 30 phút)
• Hạn chế vận động khớp
• Tiếng lạo xạo khi cử động
• Sưng khớp nhẹ', '• Người trên 50 tuổi
• Béo phì
• Nữ giới (sau mãn kinh)
• Có tiền sử chấn thương khớp', '• Duy trì cân nặng hợp lý
• Tập thể dục phù hợp
• Tránh chấn thương khớp
• Bổ sung canxi, vitamin D', '• Đau khớp kéo dài
• Hạn chế vận động nhiều
• Sưng đỏ nóng khớp
• Đau không đáp ứng thuốc giảm đau', '• Biến dạng khớp
• Mất chức năng vận động
• Cần thay khớp nhân tạo
• Ảnh hưởng chất lượng sống', '• Không có thuốc chữa khỏi hoàn toàn
• Glucosamine/Chondroitin có thể giúp
• Vật lý trị liệu quan trọng
• Phẫu thuật thay khớp khi cần', 'Vinmec, Hội Thấp khớp Việt Nam, OARSI Guidelines');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (9, 'Tiêu chảy', 'https://prod-cdn.pharmacity.io/blog/tieu-chay-1.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAUYXZVMJMURHIYJSN%2F20240711%2Fap-southeast-1%2Fs3%2Faws4_request&X-Amz-Date=20240711T065429Z&X-Amz-SignedHeaders=host&X-Amz-Expires=600&X-Amz-Signature=d8ee5383d0528f023b118419cd5e473e0f517e1838ede1e43122d566987df44a', 'Tiêu chảy là tình trạng đại tiện phân lỏng trên 3 lần/ngày. Có thể cấp tính (vài ngày) hoặc mạn tính (trên 4 tuần).', '• Nhiễm virus (Rotavirus, Norovirus)
• Nhiễm vi khuẩn (E.coli, Salmonella)
• Ký sinh trùng (Giardia)
• Ngộ độc thực phẩm
• Không dung nạp lactose', '• Đi ngoài phân lỏng nhiều lần
• Đau quặn bụng
• Buồn nôn, nôn
• Sốt (nếu nhiễm trùng)
• Mất nước: khát, môi khô', '• Trẻ em, người cao tuổi
• Người suy giảm miễn dịch
• Người đi du lịch vùng kém vệ sinh
• Người dùng kháng sinh', '• Rửa tay trước khi ăn
• Ăn chín uống sôi
• Bảo quản thực phẩm đúng cách
• Tiêm vaccine Rotavirus cho trẻ', '• Tiêu chảy kéo dài trên 2 ngày
• Sốt cao trên 39°C
• Phân có máu hoặc mủ
• Dấu hiệu mất nước nặng', '• Mất nước, mất điện giải
• Sốc giảm thể tích
• Suy thận cấp
• Tử vong (nếu không điều trị)', '• Bù nước và điện giải (ORS) là quan trọng nhất
• Không nhịn ăn hoàn toàn
• Kháng sinh chỉ dùng khi có chỉ định
• Probiotics có thể giúp rút ngắn thời gian', 'Vinmec, WHO, Bệnh viện Bạch Mai');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (7, 'Hội chứng ruột kích thích', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3AGiW9pnDEGE4_nta0xodNT2JQizefJi5iA&s', 'Hội chứng ruột kích thích (IBS) là rối loạn chức năng đường tiêu hóa, gây đau bụng và thay đổi thói quen đại tiện. Không có tổn thương thực thể.', '• Rối loạn nhu động ruột
• Tăng nhạy cảm nội tạng
• Stress, lo âu
• Thay đổi vi khuẩn đường ruột
• Thức ăn không dung nạp', '• Đau bụng, quặn bụng
• Đầy hơi, chướng bụng
• Tiêu chảy hoặc táo bón (hoặc xen kẽ)
• Triệu chứng giảm sau đại tiện', '• Nữ giới (nhiều hơn nam)
• Người dưới 50 tuổi
• Người hay stress, lo âu
• Người có tiền sử trầm cảm', '• Ăn uống điều độ, đủ chất xơ
• Quản lý stress hiệu quả
• Tập thể dục đều đặn
• Tránh thức ăn gây kích thích (FODMAP cao)', '• Đi ngoài ra máu
• Sụt cân không chủ ý
• Sốt kèm theo
• Triệu chứng khởi phát sau 50 tuổi', '• Ít biến chứng thực thể
• Ảnh hưởng chất lượng cuộc sống
• Lo âu, trầm cảm thứ phát', '• Không phải bệnh nguy hiểm
• Cần loại trừ bệnh lý thực thể
• Chế độ ăn Low-FODMAP có thể giúp
• Điều trị tâm lý nếu cần', 'Vinmec, MEDLATEC, Rome IV Criteria');
INSERT INTO "dim_benh" ("benh_sk", "ten_benh", "image_url", "mo_ta", "nguyen_nhan", "trieu_chung_chinh", "doi_tuong_nguy_co", "phong_ngua", "khi_nao_can_kham", "bien_chung", "luu_y", "nguon_tham_khao") VALUES (6, 'Gastroesophageal reflux (GERD)', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyJ9hC6sjgHtRsgRF6MUGoZjQ1C8CylYSf1A&s', 'GERD (Trào ngược dạ dày thực quản) là tình trạng acid dạ dày trào ngược lên thực quản, gây ợ nóng và các triệu chứng khó chịu khác.', '• Cơ thắt thực quản dưới yếu
• Thoát vị hoành
• Béo phì, mang thai
• Ăn khuya, nằm ngay sau ăn
• Thuốc lá, rượu bia, caffeine', '• Ợ nóng, nóng rát sau xương ức
• Ợ chua, trào ngược thức ăn
• Nuốt vướng, nuốt nghẹn
• Ho khan mạn tính về đêm
• Viêm họng tái phát', '• Người béo phì
• Phụ nữ mang thai
• Người hút thuốc lá
• Người ăn khuya thường xuyên', '• Không ăn quá no, chia nhỏ bữa ăn
• Không nằm ngay sau ăn (chờ 2-3 giờ)
• Kê cao đầu giường khi ngủ
• Giảm cân nếu thừa cân', '• Triệu chứng không giảm với thuốc
• Nuốt đau, nuốt nghẹn
• Sụt cân không rõ nguyên nhân
• Nôn ra máu', '• Viêm thực quản, loét thực quản
• Barrett thực quản
• Hẹp thực quản
• Ung thư thực quản (hiếm)', '• Thuốc ức chế bơm proton (PPI) hiệu quả
• Tránh thức ăn cay, chua, béo
• Không mặc quần áo bó sát bụng
• Nội soi nếu triệu chứng kéo dài', 'Vinmec, MEDLATEC, Gastroenterology Guidelines');

-- Tạo bảng dim_thaoduoc
DROP TABLE IF EXISTS "dim_thaoduoc" CASCADE;
CREATE TABLE "dim_thaoduoc" (
  "thaoduoc_sk" INTEGER,
  "thao_duoc" VARCHAR(255),
  "tong_hop_thao_duoc" TEXT,
  "cong_thuc_su_dung" TEXT,
  "lieu_luong_va_thoi_gian" TEXT,
  "khuyen_cao" TEXT,
  "canh_bao" TEXT,
  "chong_chi_dinh" TEXT,
  "nguon_tham_khao" VARCHAR(255),
  "image_url" VARCHAR(500)
);

-- Dữ liệu bảng dim_thaoduoc (48 dòng)
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (43, 'Gừng khô', 'Gừng khô (Can khương) + Chích thảo', 'Sắc uống (Bài Lý trung thang)', '4-8g/ngày.', 'Tính nóng hơn gừng tươi, chuyên trị hàn sâu trong bụng.', 'Hải Thượng Y Tông Tâm Lĩnh', 'Gây táo bón, khô họng, chảy máu.', 'Phụ nữ có thai, người ra máu, sốt cao mất nước.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwU3hMnxdBGW1Daay6FHX27x6MAawOZ4he0w&s');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (49, 'Cam thảo', 'Cam thảo + trà xanh + mật ong (chữa nhiệt miệng, loét)', 'Giã lá trà xanh, trộn mật ong, bôi vết loét; hoặc sắc cam thảo súc miệng', 'Bôi 2–3 lần/ngày, liên tục 5–7 ngày.', 'Không dùng mật ong cho trẻ dưới 1 tuổi.', 'Hải Thượng Y Tông Tâm Lĩnh – Quyển Ngoại Khoa', 'Tăng huyết áp, phù, hạ kali, loạn nhịp khi dùng kéo dài.', 'Tăng huyết áp, suy tim, bệnh thận, hạ kali huyết.', 'https://suckhoedoisong.qltns.mediacdn.vn/zoom/600_315/324455921873985536/2023/10/1/anh-duoc-tao-boi-tranmaihuongskds-luc-4711583143686-1696170703692902371478-0-0-388-620-crop-1696170978389870145599.png');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (3, 'Tỳ bà diệp', 'Tỳ bà diệp + bách bộ + ma hoàng (theo đơn đông y)', 'Sắc uống hoặc hãm trà tùy tình trạng', 'Liều lượng 10–20g thảo dược khô/ngày, sắc hoặc hãm tùy tình trạng.', 'Cần chà sạch lông tơ trên lá trước khi dùng để tránh gây ho/ngứa cổ.', 'Tài liệu Y học cổ truyền Việt Nam', 'Có thể gây kích ứng tiêu hóa nhẹ.', 'Dị ứng họ Hoa hồng (Rosaceae).', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRNbeOHyixYaNU7xcUddKUXGnp-qHnawA4lQ&s');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (13, 'Ngưu tất', 'Ngưu tất + đương quy + thục địa', 'Sắc uống hoặc hãm trà', 'Liều lượng 6–12g/ngày.', 'Hoạt huyết mạnh, kích thích tử cung.', 'Tài liệu Y học cổ truyền Việt Nam', 'Rong kinh, chảy máu cam nếu dùng sai.', 'Thai phụ (tuyệt đối không dùng).', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTinQi5Mry-1yIqsjwdJ6WRM3lHfLxu-YdQxQ&s');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (19, 'Đương quy', 'Đương quy + xuyên khung + bạch thược (Bát trân thang)', 'Sắc uống', 'Liều lượng 10–20g thảo dược khô/ngày.', 'Có tính nhuận tràng, người tiêu chảy nên thận trọng.', 'Tài liệu Y học cổ truyền Việt Nam', 'Gây tiêu chảy (do tính nhuận), sung huyết.', 'Đang xuất huyết, dùng thuốc chống đông, tiêu chảy lỏng.', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2023/4/26/anh-duoc-tao-boi-tranmaihuongskds-luc-4673600720554-16824964405621280209395.png');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (25, 'Tinh dầu tràm', 'Xông mũi hoặc bôi vết côn trùng cắn', 'Dùng ngoài (xông, bôi, pha nước tắm)', '2-3 giọt vào nước tắm hoặc xông.', 'Không được uống; tránh vùng mắt.', 'Nhà thuốc An Khang', 'Bỏng rát da, kích ứng niêm mạc nếu đậm đặc.', 'Trẻ sơ sinh (bôi trực tiếp), vết thương hở.', 'https://altawell.vn/wp-content/uploads/2025/06/nguon-doc-tinh-dau-tram-tra.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (26, 'Huyết giác', 'Huyết giác ngâm rượu (xoa bóp tan bầm)', 'Ngâm rượu dùng ngoài', 'Chỉ dùng xoa bóp vùng da kín, không bôi lên vết thương hở.', 'Nếu sắc uống phải theo chỉ định thầy thuốc.', 'Medlatec', 'Kích ứng da nếu rượu quá đặc.', 'Không uống (trừ chỉ định riêng), thai phụ.', 'https://medlatec.vn/media/56871/file/Huyet-giac-phan-bo-tai-hau-khap-cac-khu-vuc.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (27, 'Nha đam', 'Nha đam tươi (lấy gel) + mật ong', 'Bôi ngoài hoặc nấu chè (bỏ vỏ)', 'Bôi 2–3 lần/ngày cho bỏng nhẹ.', 'Phải gọt sạch vỏ xanh để tránh nhựa vàng gây ngứa/tiêu chảy.', 'Pharmacity', 'Nhựa vàng gây kích ứng da, tiêu chảy, co thắt bụng.', 'Thai phụ (đường uống), tiêu chảy, trĩ đang chảy máu.', 'https://cdn2.tuoitre.vn/thumb_w/1200/471584752817336320/2023/6/12/tac-dung-cua-nha-dam-nhung-luu-y-khi-su-dung-va-c-24-1686543169242105732092-7-0-389-730-crop-16865432019881955699157.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (28, 'Đinh hương', 'Nụ đinh hương tán bột hoặc ngâm rượu', 'Chấm vào chỗ răng đau hoặc súc miệng', 'Dùng lượng rất nhỏ (1-2 nụ) hoặc pha loãng.', 'Tinh dầu rất nóng, không nuốt.', 'Nhà thuốc An Khang', 'Bỏng niêm mạc miệng, nướu nếu dùng đậm đặc.', 'Trẻ nhỏ, thai kỳ, người nhiệt miệng nặng.', 'https://querungxanh.vn/wp-content/uploads/2021/12/dinh-huong-gia-vi-1-1.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (29, 'Ké đầu ngựa', 'Ké đầu ngựa + kim ngân hoa (trị mẩn ngứa)', 'Sắc uống', 'Dùng 10–15g/ngày, sao vàng kỹ cho hết lông.', 'Quả có độc tính nhẹ, phải sao cháy hết lông và gai.', 'Nam dược thần hiệu', 'Gây ngộ độc, nôn mửa nếu chưa chế biến kỹ.', 'Trẻ em, phụ nữ có thai, người thiếu máu.', 'https://static.tuoitre.vn/tto/i/s626/2017/04/08/hinh-1-1491643525.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (30, 'Sơn tra', 'Sơn tra + trần bì + mạch nha (tiêu thực)', 'Sắc uống hoặc hãm trà', '10-15g hãm nước uống sau ăn.', 'Chứa nhiều acid, không uống khi đói.', 'Nam Dược Thần Hiệu', 'Cồn cào ruột, đau dạ dày, mòn men răng.', 'Viêm loét dạ dày, đa toan dịch vị.', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2023/7/16/anh-duoc-tao-boi-tranmaihuongskds-luc-4693110516339-1689519916344659111319.png');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (31, 'Atiso', 'Bông atiso hầm hoặc cao atiso', 'Nấu canh hoặc pha nước uống', '10-20g khô hoặc 1 bông tươi/ngày.', 'Lạm dụng gây co thắt túi mật, chán ăn.', 'Vinmec', 'Đầy bụng, lạnh bụng, tiêu chảy.', 'Tắc mật, sỏi mật lớn, người tỳ vị hư hàn.', 'https://suckhoedoisong.qltns.mediacdn.vn/Images/thanhloan/2016/05/02/hoa-atiso.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (32, 'Hoàng kỳ', 'Hoàng kỳ + đảng sâm + bạch truật', 'Sắc uống', 'Liều lượng 10–20g/ngày.', 'Là thuốc bổ khí, dùng khi người mệt mỏi, không dùng khi đang nhiễm trùng cấp.', 'Vinmec', 'Tức ngực, đầy hơi nếu dùng sai thể bệnh.', 'Nhiễm trùng cấp tính, sốt cao, huyết áp quá cao.', 'https://www.vinmec.com/static/uploads/20230208_021033_755455_hoang_ky_co_tac_dun_max_1800x1800_jpg_fe5b39cb80.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (33, 'Linh chi', 'Linh chi thái lát + táo đỏ + cam thảo', 'Hãm trà hoặc sắc nước uống', '5-10g nấm khô/ngày.', 'Nên uống nhiều nước để thải độc.', 'Vinmec', 'Hạ huyết áp, chóng mặt, ngứa da (lúc đầu).', 'Huyết áp thấp, chuẩn bị phẫu thuật, ghép tạng.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgPTMdQ7-xEaubP0FxJ5xaD85p3ORrfOWtOg&s');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (34, 'Cam thảo bắc', 'Cam thảo + cát cánh (chữa ho)', 'Sắc uống hoặc ngậm', '4-12g/ngày. Không dùng kéo dài quá 2 tuần.', 'Giữ nước, gây phù và tăng huyết áp.', 'Nhà thuốc Long Châu', 'Phù nề, tăng huyết áp, hạ kali máu, yếu cơ.', 'Tăng huyết áp, suy tim, bệnh thận, hạ kali máu.', 'https://caygiongvinhphuc.com/wp-content/uploads/2020/06/cay-cam-thao-bac.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (35, 'Rau sam', 'Rau sam tươi giã nát + muối', 'Đắp ngoài mụn nhọt hoặc nấu canh', '50-100g tươi/ngày.', 'Tính hàn, phụ nữ có thai hạn chế ăn.', 'Vinmec', 'Tiêu chảy, kích thích co bóp tử cung.', 'Thai phụ, người hay lạnh bụng đi ngoài.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Portulaca_oleracea_MHNT.jpg/330px-Portulaca_oleracea_MHNT.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (36, 'Lá xoan', 'Lá xoan + sả + hương nhu', 'Nấu nước tắm ghẻ/ngứa (KHÔNG UỐNG)', 'Dùng 1 nắm lá nấu nước tắm 1 lần/ngày.', 'Lá xoan có độc tính thần kinh, tuyệt đối không để rơi vào miệng/mắt.', 'GS.TS Đỗ Tất Lợi', 'Ngộ độc thần kinh, nôn mửa, co giật nếu uống.', 'Đường uống (tuyệt đối), bôi lên vết thương hở rộng.', 'https://giongcaytrong.com/wp-content/uploads/2017/06/xoan-ta.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (38, 'Bồ kết', 'Bồ kết nướng + vỏ bưởi + hương nhu', 'Nấu nước gội đầu', '2–3 quả nướng thơm, bẻ nhỏ nấu nước.', 'Nước dây vào mắt gây bỏng rát nghiêm trọng.', 'Vinmec', 'Kích ứng niêm mạc mắt, mũi; uống gây ngộ độc.', 'Phụ nữ có thai (đường uống/xông), người ho ra máu.', 'https://assets.unileversolutions.com/v1/134203145.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (39, 'Hà thủ ô đỏ', 'Hà thủ ô chế đậu đen + vừng đen', 'Sắc uống hoặc tán bột hoàn', '10-20g đã chế biến kỹ/ngày.', 'Chưa chế biến gây độc gan và tiêu chảy nặng. Kiêng ăn hành, tỏi.', 'Vinmec', 'Tiêu chảy, nôn mửa, viêm gan cấp (dạng sống).', 'Người bị tiêu chảy, nhiều đờm, bệnh gan nặng.', 'https://suckhoedoisong.qltns.mediacdn.vn/2015/18-3-1428059063885.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (40, 'Tục đoạn', 'Tục đoạn + đỗ trọng + cốt toái bổ', 'Sắc uống hoặc ngâm rượu', '12g mỗi vị/ngày.', 'Dùng tốt cho gãy xương, đau lưng.', 'Nhà thuốc Long Châu', 'Kích ứng dạ dày nhẹ.', 'Người chứng thực nhiệt (sốt, viêm sưng nóng).', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2023/12/1/anh-duoc-tao-boi-tranmaihuongskds-luc-4726172916887-17014229568941343465040.png');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (41, 'Cốt toái bổ', 'Cốt toái bổ (sao) + trắc bách diệp', 'Sắc uống hoặc giã đắp', '10-15g sắc uống; dùng ngoài lượng vừa đủ.', 'Có tính hoạt huyết, thận trọng khi đang chảy máu.', 'Nhà thuốc Long Châu', 'Khô miệng, nóng trong.', 'Người âm hư, huyết hư không có ứ huyết.', 'https://www.yhct.vn/wp-content/uploads/2024/12/11.-Cot-Toai-Bo.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (42, 'Diệp hạ châu', 'Diệp hạ châu (chó đẻ) + nhân trần', 'Sắc uống', '20-40g cây khô/ngày.', 'Tính mát, không nên uống liên tục quá lâu gây lạnh gan (trừ khi đang trị bệnh).', 'Medlatec', 'Tụt huyết áp, tiêu chảy, mệt mỏi, giảm tinh trùng (dùng lâu).', 'Phụ nữ có thai, người huyết áp thấp, tỳ vị hư hàn.', 'https://suckhoedoisong.qltns.mediacdn.vn/Images/quangcao/2017/05/04/Hinh_1.png');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (45, 'Mạch nha', 'Mạch nha + sơn tra + thần khúc', 'Sắc uống hoặc ăn kẹo mạch nha', '10-15g/ngày.', 'Có thể gây mất sữa ở phụ nữ đang cho con bú (liều cao, sao cháy).', 'Vinmec', 'Đầy hơi, tăng đường huyết.', 'Phụ nữ đang cho con bú (muốn duy trì sữa), tiểu đường.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSu4D6x0ilY7D4DeNkFDGqGWFAsc2vLNZd6zQ&s');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (1, 'Gừng tươi', 'Gừng tươi + tía tô + kinh giới (uống ấm, xông nhẹ)', 'Sắc uống hoặc hãm trà tùy tình trạng', 'Dùng 10–15g/lần, sắc 1 ấm nhỏ, uống 2–3 lần/ngày khi cảm lạnh.', 'Người sốt cao, ra nhiều mồ hôi, xuất huyết không nên dùng.', 'Nam dược thần hiệu – Tuệ Tĩnh', 'Có thể gây nóng, ợ chua; tăng nguy cơ chảy máu khi dùng cùng thuốc chống đông.', 'Rối loạn đông máu, chuẩn bị phẫu thuật, viêm loét dạ dày tiến triển.', 'https://dienbientv.vn/dataimages/202011/original/images2954549_gung.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (2, 'Bạc hà', 'Cúc tần + bạc hà + tía tô (giảm sốt, thông mũi)', 'Sắc uống hoặc hãm trà tùy tình trạng', 'Dùng 10–15g/lần, sắc 1 ấm nhỏ, uống 2–3 lần/ngày khi cảm lạnh.', 'Tham khảo ý kiến thầy thuốc trước khi dùng, tránh lạm dụng kéo dài.', 'Nam dược thần hiệu – Tuệ Tĩnh', 'Có thể gây ợ nóng, kích ứng dạ dày; tinh dầu gây bỏng nếu dùng trực tiếp.', 'Trẻ sơ sinh, trẻ nhỏ (tinh dầu), người trào ngược nặng.', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2023/1/14/bac-ha1-16737181711471928929589.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (14, 'Dây gắm', 'Dây gắm + lá lốt + rễ cỏ xước (trị gút)', 'Sắc uống hằng ngày', 'Liều lượng 15–20g khô/ngày.', 'Kiên trì sử dụng 2-3 tuần để thấy hiệu quả.', 'Lương y Bùi Đắc Sáng', 'Tăng đào thải acid uric gây mệt mỏi nhẹ.', 'Người suy gan thận nặng cần chỉnh liều.', 'https://login.medlatec.vn//ImagePath/images/20230321/20230321_Tong-quan-ve-dac-diem-cua-cay-gam.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (17, 'Lạc tiên', 'Lạc tiên + lá vông + tâm sen (trị mất ngủ)', 'Sắc uống hoặc hãm trà', '20-40g cây khô sắc uống buổi chiều tối.', 'Không lạm dụng quá liều gây mệt mỏi.', 'Vinmec', 'Buồn ngủ ban ngày, mệt mỏi.', 'Người vận hành máy móc (khi uống ban ngày).', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/P_foetida_fruit.jpg/330px-P_foetida_fruit.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (21, 'Trạch tả', 'Trạch tả + phục linh + xa tiền tử', 'Sắc uống', 'Mỗi vị 6-12g; điều trị theo đợt.', 'Tránh dùng kéo dài gây hại thận khí.', 'Bệnh viện YHCT Trung ương', 'Lợi tiểu mạnh, mất điện giải, hoa mắt.', 'Thận hư hàn, tiểu nhiều không do thấp nhiệt.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn8lmU7EeJr88UWSsZ6wI-jd4UzXbnXr_Fog&s');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (23, 'Diếp cá', 'Diếp cá (ăn sống/xay) hoặc sắc với vòi voi (trị trĩ)', 'Ăn sống, xay nước hoặc đắp', 'Liều lượng 20–40g tươi/ngày.', 'Rửa sạch kỹ để tránh nhiễm ký sinh trùng khi ăn sống.', 'Tài liệu Y học cổ truyền Việt Nam', 'Lạnh bụng, tiêu chảy ở người yếu.', 'Người thể hàn, hay đi ngoài lỏng.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmYPrd0hO0E5gaRcVB7t3BznvDK_qQH1irGA&s');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (16, 'Cúc hoa', 'Cúc hoa + kỷ tử + thảo quyết minh (sáng mắt)', 'Hãm trà uống', '5–10g hãm với 200ml nước sôi.', 'Người tỳ vị hư hàn (lạnh bụng) nên thêm vài lát gừng.', 'Bản thảo cương mục', 'Dễ gây dị ứng, lạnh bụng.', 'Tiêu chảy, huyết áp thấp, dị ứng hoa cúc.', 'https://product.hstatic.net/1000186502/product/upload_4e92d508bf664be3a29e7cf3e66aecd0_1024x1024.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (4, 'Tân di hoa', 'Ké đầu ngựa + tân di + bạc hà (theo đơn đông y)', 'Sắc uống hoặc hãm trà tùy tình trạng', 'Liều lượng 10–20g thảo dược khô/ngày, sắc hoặc hãm tùy tình trạng.', 'Dùng dạng búp hoa khô, thường gói vào túi vải khi sắc.', 'Tài liệu Y học cổ truyền Việt Nam', 'Có thể gây dị ứng phấn hoa, nghẹt mũi nặng hơn nếu dị ứng.', 'Dị ứng phấn hoa, hen nặng.', 'https://suckhoedoisong.qltns.mediacdn.vn/Images/hahien/2017/09/10/tan-di-chua-dau-dau-viem-xoang-tac-ngat-mui1505052988.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (20, 'Kim tiền thảo', 'Kim tiền thảo + râu ngô + mã đề (trị sỏi)', 'Sắc nước uống thay trà', '20–40g kim tiền thảo khô mỗi ngày.', 'Uống nhiều nước để hỗ trợ đẩy sỏi.', 'Y học cổ truyền', 'Lợi tiểu quá mức gây mất nước, hạ huyết áp.', 'Suy thận nặng, tụt huyết áp, sỏi quá lớn gây tắc.', 'https://static.tuoitre.vn/tto/i/s626/2017/08/29/hinh-3-1503995254.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (10, 'Hoa hòe', 'Hoa hòe (sao vàng) + hạ khô thảo + cúc hoa', 'Hãm trà hoặc sắc uống', '10-15g hoa hòe sao vàng hãm nước uống.', 'Người huyết áp thấp không nên dùng nhiều.', 'Tài liệu Y học cổ truyền Việt Nam', 'Làm lạnh bụng, tiêu chảy, hạ huyết áp quá mức.', 'Huyết áp thấp, tỳ vị hư hàn.', 'https://cdn2.tuoitre.vn/thumb_w/1200/471584752817336320/2024/11/25/hoa-hoe-1732539865219889068744-0-0-397-757-crop-17325422394731115516851.png');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (46, 'Sắn dây', 'Bột sắn dây pha nước chín + chanh', 'Pha uống sống hoặc nấu chín', '12-20g bột/ngày.', 'Ướp hoa bưởi/nhài quá nhiều làm giảm tác dụng dược lý.', 'Vinmec', 'Lạnh bụng, tiêu chảy, nôn nao.', 'Người dương khí hư, lạnh bụng, đại tiện lỏng.', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2022/6/21/bot-san-day-la-gi1-1655797004000103865697.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (47, 'Quyết minh tử', 'Hạt muồng (sao đen) + hoa hòe', 'Hãm trà uống', '10-15g hạt đã sao.', 'Phải sao thơm hoặc sao đen để giảm tính tẩy xổ.', 'Vinmec', 'Tiêu chảy, đau bụng (nếu chưa sao).', 'Người bị tiêu chảy, huyết áp thấp.', 'https://suckhoedoisong.qltns.mediacdn.vn/zoom/600_315/Images/_OLD/2015/xiakucao2-1429777947034.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (48, 'Cát cánh', 'Cát cánh + Cam thảo (chữa ho, long đờm)', 'Sắc uống hoặc hãm', '10-20g sắc uống.', 'Có thể gây kích ứng họng, tăng ho lúc đầu.', 'Tài liệu Y học cổ truyền Việt Nam', 'Kích ứng dạ dày nhẹ.', 'Ho ra máu nhiều, loét dạ dày nặng.', 'https://upload.wikimedia.org/wikipedia/commons/d/d7/Platycodon_grandiflorum2.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (11, 'Giảo cổ lam', 'Giảo cổ lam + xạ đen + cà gai leo', 'Hãm trà uống ấm hằng ngày', '15g hãm trà, uống trong ngày.', 'Không uống vào buổi tối vì gây khó ngủ; người huyết áp thấp uống sau ăn.', 'Tạp chí Dược liệu VN', 'Hạ huyết áp, khô miệng, khát nước.', 'Phụ nữ có thai, người đang chảy máu, uống thuốc chống thải ghép.', 'https://i2.ex-cdn.com/nongthonmoi.danviet.vn/files/f1/2023/04/05/cach-dung-giao-co-lam-8_05042023220016.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (5, 'Nghệ vàng', 'Nghệ vàng + mật ong + lá khôi (giảm viêm, trung hòa acid)', 'Dùng dưới dạng bột hoặc pha mật ong uống buổi sáng', '1–2 thìa bột nghệ pha mật ong, uống 1 lần vào buổi sáng.', 'Không dùng liều cao cho người sỏi mật, phụ nữ có thai.', 'Dược điển Việt Nam', 'Kích ứng dạ dày – mật; làm sỏi mật di chuyển.', 'Tắc mật, sỏi mật lớn, loét dạ dày tiến triển.', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2021/9/20/nghe-vang-11-16321238202351748496060.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (9, 'Dây thìa canh', 'Dây thìa canh + giảo cổ lam (hỗ trợ tiểu đường)', 'Hãm trà uống ấm hằng ngày', '15g hãm trà, uống 2 lần/ngày sau bữa ăn.', 'Người huyết áp thấp hoặc đang dùng thuốc chống đông cần lưu ý.', 'Tạp chí Dược liệu VN', 'Hạ đường huyết mạnh, dễ tụt đường đột ngột.', 'Thai kỳ, cho con bú, đang dùng insulin liều cao.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgsiMh0Z3AeoNUcvrIbeGSwnDtn4eeiTibBQ&s');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (7, 'Mè đen', 'Mè đen + sắn dây + mật ong (nhuận tràng, sinh tân)', 'Nấu chè hoặc xay uống', 'Dùng 20-30g mè đen rang chín mỗi ngày.', 'Nếu đang tiêu chảy lỏng không nên dùng.', 'Tài liệu Y học cổ truyền Việt Nam', 'Gây tiêu chảy nếu dùng quá nhiều.', 'Tiêu chảy kéo dài.', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2022/3/24/photo-1648096679015-1648096680488588867013.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (22, 'Huyền sâm', 'Huyền sâm + sinh địa + mạch môn (tăng tân dịch)', 'Sắc uống', 'Mỗi vị 10-15g.', 'Vị thuốc rất lạnh, người tỳ vị yếu không dùng.', 'Nhà thuốc Long Châu', 'Lạnh bụng, tiêu chảy, chướng bụng.', 'Tỳ vị hư hàn, tiêu chảy mạn.', 'https://cdnv2.tgdd.vn/mwg-static/common/News/1576135/tac-dung-cua-huyen-sam-3.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (15, 'Ngải cứu', 'Ngải cứu + hương phụ + ích mẫu (điều kinh)', 'Sắc uống hoặc chườm đắp ngoài da', 'Liều lượng 8–12g khô/ngày, uống trước kỳ kinh.', 'Phụ nữ có thai 3 tháng đầu không nên uống.', 'Nam dược thần hiệu', 'Dùng nhiều gây buồn nôn, rối loạn thần kinh.', 'Thai kỳ 3 tháng đầu, người máu nóng.', 'https://suckhoedoisong.qltns.mediacdn.vn/Images/phamhiep/2019/10/14/22-1419908108752.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (8, 'Lá ổi', 'Búp ổi non + vỏ măng cụt + gạo lứt rang', 'Sắc lấy nước uống đặc', 'Liều lượng 10–20g thảo dược khô/ngày.', 'Chỉ dùng khi bị tiêu chảy, ngưng khi đã cầm.', 'Kinh nghiệm dân gian', 'Gây táo bón nếu dùng kéo dài.', 'Táo bón, tắc ruột.', 'https://suckhoedoisong.qltns.mediacdn.vn/Images/nguyenkhanh/2016/05/05/la_oi.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (24, 'Kim ngân hoa', 'Kim ngân hoa + ké đầu ngựa + liên kiều', 'Sắc uống "Tiêu độc thang"', 'Mỗi vị 6–12g; dùng 7–10 ngày khi có mụn nhọt.', 'Không dùng liều cao kéo dài.', 'Medlatec', 'Dị ứng, rối loạn tiêu hóa nhẹ.', 'Tỳ vị hư hàn, mụn nhọt đã vỡ loét, người thể hàn.', 'https://suckhoedoisong.qltns.mediacdn.vn/Images/trongnguyen/2021/04/25/cong-dung-cua-kim-ngan-hoa.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (12, 'Đỗ trọng', 'Đỗ trọng + ngưu tất + tục đoạn (đau lưng, mỏi gối)', 'Sắc uống hoặc ngâm rượu', 'Liều lượng 10–20g thảo dược khô/ngày.', 'Nên sao muối để tăng tác dụng vào thận.', 'Tài liệu Y học cổ truyền Việt Nam', 'Có thể tăng huyết áp nhẹ nếu chưa sao tẩm đúng cách.', 'Người âm hư hỏa vượng, huyết áp cao kịch phát.', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2021/8/5/do-trong-1628149289449309729882.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (6, 'Mộc hương', 'Mộc hương + trần bì + sa nhân (hành khí, giảm đau)', 'Sắc uống hoặc tán bột', 'Mỗi vị 6-12g khô/ngày, điều trị 7-14 ngày tuỳ triệu chứng.', 'Tránh dùng kéo dài cho người âm hư, huyết nhiệt.', 'Trung tâm y tế Bình Thạnh (YHCT)', 'Dễ gây đau bụng, buồn nôn nếu tỳ vị quá yếu.', 'Thai phụ dùng liều cao (do tính hoạt khí mạnh).', 'https://static-images.vnncdn.net/files/publish/2022/11/24/moc-huong-1189.jpg?width=0&s=8fM-t-AY5L2pXatmcj37Aw');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (18, 'Nhân sâm', 'Nhân sâm + táo đỏ + hạt sen (bồi bổ)', 'Hãm trà, ngâm mật ong hoặc sắc', 'Liều lượng 4-10g/ngày (củ khô).', 'Không dùng buổi tối gây mất ngủ; không dùng chung với củ cải, hải sản.', 'Tài liệu Y học cổ truyền Việt Nam', 'Tăng huyết áp, mất ngủ, chảy máu.', 'Tăng huyết áp cấp, sốt cao, đau bụng tiêu chảy.', 'https://cdn2.tuoitre.vn/thumb_w/1200/2017/1510026497002-34-57-355-630-crop-1510026506168.jpg');
INSERT INTO "dim_thaoduoc" ("thaoduoc_sk", "thao_duoc", "tong_hop_thao_duoc", "cong_thuc_su_dung", "lieu_luong_va_thoi_gian", "khuyen_cao", "canh_bao", "chong_chi_dinh", "nguon_tham_khao", "image_url") VALUES (37, 'Riềng tươi', 'Củ riềng già + gừng + củ gấu (hương phụ)', 'Sắc uống (trị đau bụng lạnh) hoặc ngâm rượu (xoa bóp)', '6-10g sắc uống; rượu xoa bóp dùng ngoài.', 'Tính rất nóng, không dùng cho người nhiệt.', 'Vinmec', 'Nóng rát dạ dày, khô miệng.', 'Người âm hư nội nhiệt, táo bón, sốt cao.', 'https://nongsandungha.com/wp-content/uploads/2021/06/cu-rieng-tuoi-min.jpg');

-- Tạo bảng dim_thuoctay
DROP TABLE IF EXISTS "dim_thuoctay" CASCADE;
CREATE TABLE "dim_thuoctay" (
  "thuoctay_sk" INTEGER,
  "thuoc_tay" VARCHAR(50),
  "hoat_chat" TEXT,
  "biet_duoc" TEXT,
  "cac_thanh_phan_trong_thuoc" TEXT,
  "canh_bao_va_chong_chi_dinh" TEXT,
  "image_url" VARCHAR(500)
);

-- Dữ liệu bảng dim_thuoctay (73 dòng)
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (11, 'Loperamide', 'Loperamide', 'Imodium', 'Loperamide', 'Không dùng nếu tiêu chảy do nhiễm trùng, sốt cao.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaqSUMraHMBvyBZgRcRnH-E5OxR9BFxr0grA&s');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (7, 'Famotidine', 'Famotidine', 'Pepcid', 'Famotidine', 'Thận trọng suy thận.', 'https://5.imimg.com/data5/GLADMIN/Default/2023/5/306626631/DD/OM/QZ/132158408/famotidine-tablets-20mg.jpeg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (10, 'Dicyclomine', 'Dicyclomine', 'Bentyl', 'Dicyclomine', 'Chống chỉ định ở glaucoma góc đóng, tắc ruột.', 'https://5.imimg.com/data5/SELLER/Default/2022/6/MO/PQ/EX/31086406/dicyclomine-hydrochloride-tablets.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (8, 'Esomeprazole', 'Esomeprazole', 'Nexium', 'Esomeprazole', 'Như PPI: dùng dài hạn thận trọng.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6YGkyni0w2NP8njq4EiqEbd4Bp-YD36_9Eg&s');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (13, 'Dextromethorphan', 'Dextromethorphan', 'Robitussin DM, Delsym, Romilar', 'Dextromethorphan (DM)', 'Không dùng cùng thuốc chống trầm cảm nhóm MAOI/SSRI (nguy cơ serotonin syndrome).', 'https://www.vinmec.com/static/uploads/20200425_180940_111844_dextromethorphan_max_1800x1800_jpg_00650ff0b7.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (16, 'Glipizide', 'Glipizide', 'Glucotrol', 'Glipizide', 'Nguy cơ hạ đường huyết; thận trọng người cao tuổi.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRWBOVy5gE9ojjatdKBeU_LrRS8t5A7y0xHb-Ha-e1Ll4_qoNznQ76m6vOO_zLoR36cg61ug&s=10');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (3, 'Diphenhydramine', 'Diphenhydramine', 'Benadryl, Allergan', 'Diphenhydramine', 'Tránh dùng khi glaucoma góc đóng, bí tiểu, lớn tuổi (gây buồn ngủ mạnh).', 'https://www.crescentpharma.com/wp-content/uploads/2016/01/Diphenhydramine-50mg-2.png');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (4, 'Guaifenesin', 'Guaifenesin', 'Mucinex', 'Guaifenesin', 'Thận trọng phụ nữ có thai; uống đủ nước.', 'https://www.vinmec.com/static/uploads/20220312_171056_775437_guaifenesin_a_max_1800x1800_jpg_f5ba20c0f8.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (17, 'Insulin', 'Insulin Human, Analogues', 'Humalog, Lantus, Novolog', 'Insulin Human, Analogues', 'Nguy cơ hạ đường huyết; cần tuân thủ liều.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsh8wTkSQhUaGEE7Sk44_gCRKM0pd_uTIJzw&s');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (18, 'Amlodipine', 'Lisinopril', 'Prinivil, Zestril', 'Lisinopril', 'Không dùng cho phụ nữ mang thai; thận trọng suy thận.', 'https://prod-cdn.pharmacity.io/blog/amlodipine-la-thuoc-gi-hinh-1.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAUYXZVMJMURHIYJSN%2F20241122%2Fap-southeast-1%2Fs3%2Faws4_request&X-Amz-Date=20241122T034157Z&X-Amz-SignedHeaders=host&X-Amz-Expires=600&X-Amz-Signature=38f35747a28d9308a130bce312e7608e7ee6a7fb68e05c29d04d761870becaad');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (21, 'Atorvastatin', 'Atorvastatin', 'Lipitor', 'Atorvastatin', 'Tránh dùng khi bệnh gan; thận trọng đau cơ.', 'https://cdn.upharma.vn/unsafe/3840x0/filters:quality(90)/san-pham/22641.png');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (24, 'Glucosamine/Chondroitin', 'Glucosamine,Chondroitin', 'Flexamin, Osteo Bi-Flex', 'Glucosamine,Chondroitin', 'Thận trọng dị ứng hải sản.', 'https://glucosamin.com.vn/storage/uploads/noidung/glucosamine-chondroitin-1500mg-220-vien-863.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (25, 'Methotrexate', 'Methotrexate', 'Trexall, Rheumatrex', 'Methotrexate', 'Chống chỉ định phụ nữ mang thai; độc gan; cần theo dõi máu.', 'https://trungtamthuoc.com/images/products/thuoc-methotrexate-25mg-mercury-pharma-2-s7304.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (27, 'Salmeterol/Fluticasone', 'Salmeterol/Fluticasone', 'Advair', 'Salmeterol/Fluticasone', 'Không dùng để điều trị cơn hen cấp; thận trọng nhiễm nấm miệng.', 'https://cdn.mimsprd.mims.com/drug-resources/PH/packshot/Seretide6001PPS0.JPG');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (28, 'Tiotropium', 'Tiotropium', 'Spiriva', 'Tiotropium', 'Tránh dùng nếu dị ứng atropine; thận trọng bệnh tăng nhãn áp.', 'https://baobaopharma.com/wp-content/uploads/2024/06/12Q-1.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (30, 'Acetaminophen', 'Acetaminophen', 'Tylenol', 'Acetaminophen', 'Không dùng nếu bệnh gan, nghiện rượu nặng; tránh dùng quá liều (>4g/ngày).', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxQLPoZrSNIGZnkPsQB-267QCH8g6w0LsW4A&s');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (31, 'Alprazolam', 'Alprazolam', 'Xanax', 'Alprazolam', 'Nguy cơ nghiện; gây buồn ngủ mạnh.', 'https://trungtamthuoc.com/images/products/alprazolam-viatris-05mg-d1171.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (32, 'Sertraline', 'Sertraline', 'Zoloft', 'Sertraline', 'Thận trọng nguy cơ serotonin syndrome.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfSC0KIrKgoUX-QVaBs15sMHnKsDzpv5MNbw&s');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (35, 'Mometasone', 'Mometasone Furoate', 'Nasonex', 'Mometasone Furoate', 'Thận trọng dùng kéo dài (viêm mũi teo, chảy máu mũi).', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkQFbsJ5kbtghmNeWRrjuS6oQS8AR0EhWR2Q&s');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (36, 'Ferrous Sulfate', 'Ferrous Sulfate', 'Ferrous Sulfate', 'Ferrous Sulfate', 'Táo bón; tránh dùng khi thừa sắt.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxySoYNu8IxqG7OTv1M9vU6uLooObsLmJkQg&s');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (38, 'Amoxicillin', 'Amoxicillin', 'Amoxil, Moxatag', 'Amoxicillin', 'Chống chỉ định nếu dị ứng penicillin.', 'https://cdn.upharma.vn/unsafe/3840x0/filters:quality(90)/san-pham/10021.png');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (39, 'Azithromycin', 'Azithromycin', 'Zithromax', 'Azithromycin', 'Thận trọng ở người kéo dài QT; dị ứng macrolide.', 'https://medecify.com/storage/2024/12/B-B-CD-A-C-E-DBC-3000x3086.jpeg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (40, 'Clotrimazole', 'Clotrimazole', 'Lotrimin AF, Mycelex', 'Clotrimazole', 'Nhạy cảm da.', 'https://www.vinmec.com/static/uploads/20230107_144221_396490_Clotrimazole_max_1800x1800_png_84bb4cc5cb.png');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (44, 'Aloe Vera', 'Aloe Barbadensis Leaf Juice', 'Various brands', 'Aloe Barbadensis Leaf Juice', 'Có thể gây kích ứng nhẹ.', 'https://cdn.britannica.com/73/177473-050-7B7C6918/aloe-vera-plant.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (45, 'Chlorhexidine', 'Chlorhexidine Gluconate', 'Peridex, PerioGard', 'Chlorhexidine Gluconate', 'Dị ứng; tránh nuốt.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTCZSYsy6AHQ-6XnXw67wyMG8cWFHo-MBUsQ&s');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (47, 'Hydrogen Peroxide', 'Hydrogen Peroxide', 'Oxy già, Peroxyl', 'Sát khuẩn oxy hóa', 'Không dùng kéo dài; kích ứng niêm mạc/mô hạt.', 'https://i5.walmartimages.com/seo/Equate-3-Hydrogen-Peroxide-Liquid-USP-Antiseptic-32-fl-oz_29990181-6f9e-42e6-98a3-5389c9be63d0_1.7d6fd92f63fca430eddc487138cb605e.jpeg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (48, 'Orlistat', 'Orlistat', 'Xenical, Alli', 'Orlistat', 'Tiêu chảy dầu; tránh thiếu vitamin tan trong dầu.', 'https://cdn.nhathuoclongchau.com.vn/v1/static/00005613_orlistat_120mg_7302_62a7_large_521161dd7c.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (50, 'Acyclovir', 'Acyclovir (topical/oral)', 'Zovirax', 'Acyclovir (topical/oral)', 'Thận trọng suy thận.', 'https://cdn.upharma.vn/unsafe/1200x0/san-pham/6623.png');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (53, 'Polyethylene Glycol', 'Polyethylene Glycol', 'Miralax, Glycolax', 'Polyethylene Glycol', 'Thận trọng suy tim, suy thận.', 'https://www.padagis.com/wp-content/uploads/2025/06/PEG3350.png');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (54, 'Bisacodyl', 'Bisacodyl', 'Dulcolax', 'Bisacodyl', 'Không dùng kéo dài (lệ thuộc thuốc).', 'https://www.vinmec.com/static/uploads/20210223_083439_673203_thuoc_bisacodyl_max_1800x1800_png_ee49e81c96.png');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (57, 'Dicloxacillin', 'Dicloxacillin', 'Dynapen', 'Dicloxacillin', 'Dị ứng penicillin.', 'https://cdn.mimsprd.mims.com/drug-resources/TH/packshot/Dixocillin6002PPS0.JPG');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (59, 'Alendronate', 'Alendronate', 'Fosamax', 'Alendronate', 'Kích ứng thực quản; uống lúc đói và ngồi 30 phút.', 'https://production-cdn.pharmacity.io/digital/828x828/plain/e-com/images/ecommerce/20250415102333-0-P02451_2.png?versionId=F43ejhgQ79w0SZhac.3JWMp3sAtdSWYO');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (60, 'Calcium', 'Calcium Carbonate', 'Caltrate', 'Calcium Carbonate', 'Không dùng khi tăng Ca máu.', 'https://product.hstatic.net/1000372707/product/calcium-corbiere_fa38899dab2d46489dab1451dd654702_grande.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (61, 'Vitamin D', 'Cholecalciferol', 'Citracal', 'Cholecalciferol', 'Không dùng khi tăng Ca máu.', 'https://m.media-amazon.com/images/I/514qIBrZ8IL._AC_UF1000,1000_QL80_.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (62, 'Carisoprodol', 'Carisoprodol', 'Soma, Mydeton', 'Giãn cơ trung ương', 'Gây nghiện, buồn ngủ; tránh lái xe.', 'https://www.vinmec.com/static/uploads/small_20220518_081552_080696_thuoc_biromonol_max_1800x1800_jpg_3d9662c066.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (64, 'Diclofenac', 'Diclofenac', 'Voltaren, Cataflam', 'NSAID', 'Nguy cơ tim mạch, loét dạ dày, suy thận.', 'https://www.vinmec.com/static/uploads/20220116_031308_228696_diclofenac_max_1800x1800_jpg_8632b9143a.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (65, 'Naproxen', 'Naproxen', 'Aleve', 'Naproxen', 'Như NSAIDs: loét dạ dày, suy thận, bệnh tim.', 'https://medlatec.vn/media/39095/content/naproxen.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (66, 'Peginterferon alfa', 'Peginterferon alfa', 'Pegasys, PegIntron', 'Interferon (Kháng virus)', 'Trầm cảm nặng, giảm bạch cầu/tiểu cầu.', 'https://nanogenpharma.com/data/upload/Pegnano.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (67, 'Tenofovir', 'Tenofovir', 'Viread, Vemlidy', 'Kháng virus (Nucleotide analog)', 'Độc thận, loãng xương (TDF); nhiễm toan lactic.', 'https://www.vinmec.com/static/uploads/20220617_125127_543982_thuoc_tenofovir_300_max_1800x1800_jpg_da78b35558.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (68, 'Entecavir', 'Entecavir', 'Baraclude', 'Kháng virus (Nucleoside analog)', 'Bùng phát viêm gan khi ngưng thuốc; nhiễm toan lactic.', 'https://www.vinmec.com/static/uploads/20220628_064616_888062_entecavir_0_5_mg_max_1800x1800_jpg_ef80a33373.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (69, 'Simethicone', 'Simethicone', 'Gas-X, Mylanta Gas', 'Simethicone', 'An toàn, ít cảnh báo.', 'https://production-cdn.pharmacity.io/digital/828x828/plain/e-com/images/ecommerce/20250715044429-0-P28579_1.jpg?versionId=_lBefSOHF5bJ4QRUi8.UEekqAYis_1rN');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (71, 'Cyclosporine', 'Cyclosporine', 'Restasis, Cequa', 'Cyclosporine', 'Kích ứng mắt; tăng nguy cơ nhiễm trùng mắt.', 'https://www.vinmec.com/static/uploads/20220519_084256_954251_cyclosporine_max_1800x1800_jpg_e2d1b22d2e.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (72, 'Chlorpheniramine', 'Chlorpheniramine', 'Chlor-Trimeton', 'Kháng H1 thế hệ 1', 'Gây buồn ngủ, khô miệng; tránh dùng cho trẻ sơ sinh.', 'https://suckhoe123.vn/uploads/suc-khoe/2021_05/20200216_154927_642571_chlorph999-thuoc-chon.max-800x800.png&w=800&h=800&checkress=558dc55d2b2558c24b74b84c8aa77ac7');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (73, 'Ambroxol', 'Ambroxol', 'Mucosolvan, Halixol', 'Mucolytic (Tiêu nhầy)', 'Loét dạ dày tá tràng tiến triển.', 'https://www.vinmec.com/static/uploads/20220709_235800_893335_Ambroxol_30mg_max_1800x1800_jpg_3b7a54c065.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (74, 'Acetylcysteine', 'Acetylcysteine', 'Acemuc, Exomuc', 'Mucolytic/Giải độc', 'Tiền sử hen phế quản (nguy cơ co thắt).', 'https://cdn.medigoapp.com/product/acetylcystein_1436b27d31.jpeg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (15, 'Metformin', 'Metformin', 'Glucophage, Fortamet', 'Metformin', 'Chống chỉ định suy thận nặng; ngưng khi chụp cản quang.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGqZrHlGZ6WnAiGhJeh-vd65928zOOIhbl3A&s');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (20, 'Hydrochlorothiazide', 'Hydrochlorothiazide', 'Microzide', 'Hydrochlorothiazide', 'Tránh khi suy thận nặng; nguy cơ giảm K+.', 'https://www.vinmec.com/static/uploads/20201217_075914_217866_Hinh_anh_thuoc_Hydr_max_1800x1800_jpg_c53699693d.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (1, 'Paracetamol', 'Paracetamol (Acetaminophen)', 'Panadol, Efferalgan, Tylenol, Hapacol, Decolgen', 'Paracetamol (Acetaminophen)', 'Không dùng nếu bệnh gan, nghiện rượu nặng; tránh dùng quá liều (>4g/ngày).', 'https://trungtamthuoc.com/images/products/paratramol-l4887.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (2, 'Ibuprofen', 'Ibuprofen', 'Advil, Motrin, Nurofen, Brufen', 'Ibuprofen', 'Tránh dùng nếu loét dạ dày–tá tràng, suy thận, đang chảy máu, dị ứng NSAIDs.', 'https://www.vinmec.com/static/uploads/medium_Hinh_anh_thuoc_chong_viem_ibuprofen_774d1dc8bf.png');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (6, 'Ranitidine', 'Ranitidine', 'Zantac (older formulation)', 'Ranitidine', 'Ngừng dùng ở nhiều quốc gia do tạp chất NDMA.', 'https://5.imimg.com/data5/SELLER/Default/2022/7/CD/MN/UA/147460468/ranitidine-150mg-.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (9, 'Lansoprazole', 'Lansoprazole', 'Prevacid', 'Lansoprazole', 'Như PPI: tránh dùng kéo dài không cần thiết.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-f2OhOZGm0GFeMhd3M3HNysiFxqpo-HMG7A&s');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (23, 'Celecoxib', 'Celecoxib', 'Celebrex', 'Celecoxib', 'Không dùng nếu dị ứng sulfonamide; thận trọng tim mạch.', 'https://tamanhhospital.vn/wp-content/uploads/2024/12/thuoc-chong-dau-giam-viem-celecoxib.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (26, 'Adalimumab', 'Adalimumab', 'Humira', 'Adalimumab', 'Tăng nguy cơ nhiễm trùng; sàng lọc lao trước điều trị.', 'https://cdn.youmed.vn/tin-tuc/wp-content/uploads/2020/06/humira-adalimumab1.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (34, 'Amoxicillin-Clavulanate', 'Amoxicillin-Clavulanate', 'Augmentin', 'Amoxicillin-Clavulanate', 'Tránh dùng khi dị ứng penicillin; thận trọng tiêu chảy do kháng sinh.', 'https://benhvienlevanthinh.vn/wp-content/uploads/2022/10/thuoc-augmentin-1g.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (37, 'Tamsulosin', 'Tamsulosin', 'Flomax', 'Tamsulosin', 'Gây tụt huyết áp tư thế; chóng mặt.', 'https://www.vinmec.com/static/uploads/medium_20210502_121720_234324_tamsulosin_thuoc_max_1800x1800_jpg_b649d1b326.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (41, 'Terbinafine', 'Terbinafine', 'Lamisil AT', 'Terbinafine', 'Thận trọng bệnh gan.', 'https://duocdienvietnam.com/wp-content/uploads/filemanager/data-images//2022/4/20/terbinafin-stella-cream-1.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (43, 'Silver Sulfadiazine', 'Silver Sulfadiazine', 'Silvadene', 'Silver Sulfadiazine', 'Không dùng ở trẻ sơ sinh (<2 tháng).', 'https://www.vinmec.com/static/uploads/20220429_064542_235511_sulfadiazine_silver_max_1800x1800_jpg_302f3fa4b5.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (49, 'Phentermine', 'Phentermine', 'Adipex-P', 'Phentermine', 'Không dùng bệnh tim, tăng huyết áp.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp3XRwD8CwQY-2PWi0XSkdb7WGBgBxREjBxg&s');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (52, 'Valacyclovir', 'Valacyclovir', 'Valtrex', 'Valacyclovir', 'Nguy cơ tổn thương thận nếu mất nước.', 'https://www.vinmec.com/static/uploads/20220709_021838_450643_Valacyclovir_max_1800x1800_jpg_bb59e90886.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (55, 'Hydrocortisone', 'Hydrocortisone', 'Preparation H Hydrocortisone', 'Hydrocortisone', 'Không dùng kéo dài; mỏng da.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgiUQoFCw5xnV05MRHEkfqXV21H5lQ1gLkQg&s');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (56, 'Cephalexin', 'Cephalexin', 'Keflex', 'Cephalexin', 'Tránh nếu dị ứng cephalosporin.', 'https://www.imexpharm.com/Data/Sites/1/Product/8716/Cephalexin-500mg.png');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (5, 'Omeprazole', 'Omeprazole', 'Prilosec', 'Omeprazole', 'Thận trọng dùng dài hạn (giảm Mg, gãy xương).', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0GFNPrf-IOww-hLRi3b3gy9mGIGV5RKZUfg&s');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (12, 'Rifaximin', 'Rifaximin', 'Xifaxan', 'Rifaximin', 'Không dùng nếu tiêu chảy có máu hoặc nghi nhiễm trùng nặng.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTvme9g20453AY4IZ4eBiJCBEymVuFNDh7OA&s');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (14, 'Albuterol', 'Albuterol', 'Ventolin, ProAir', 'Albuterol', 'Thận trọng ở người bệnh tim, loạn nhịp, tăng huyết áp.', 'https://www.koala.health/_next/image?url=https%3A%2F%2Fres.cloudinary.com%2Fkoala-health%2Fimage%2Fupload%2Fc_scale%2Ch_900%2Funvuigigbazb2gvyh9ox%3F_a%3DBACAEuBn&w=640&q=75');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (22, 'Rosuvastatin', 'Rosuvastatin', 'Crestor', 'Rosuvastatin', 'Chống chỉ định bệnh gan; tăng CK.', 'https://duocdienvietnam.com/wp-content/uploads/filemanager/data-images//2022/8/anh_thay/rosuvastatin_stella_20mg_1.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (29, 'Prednisone', 'Prednisone', 'Deltasone', 'Prednisone', 'Không dùng lâu dài; thận trọng tăng đường huyết, loãng xương, nhiễm trùng.', 'https://benhvienthucuc.vn/wp-content/uploads/2024/05/thuoc-prednisone.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (33, 'Escitalopram', 'Escitalopram', 'Lexapro', 'Escitalopram', 'Tiếp tục như SSRI.', 'https://www.vinmec.com/static/uploads/small_20210318_095840_726699_thuoc_escitalopram_max_1800x1800_jpg_0b1af96dd0.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (42, 'Miconazole', 'Miconazole (topical)', 'Desenex, Micatin', 'Miconazole (topical)', 'Tương tác warfarin.', 'https://www.vinmec.com/static/uploads/20220311_075153_478320_thuoc_miconazole_max_1800x1800_jpg_3930913b5c.jpg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (46, 'Fluoride Toothpaste', 'Sodium Fluoride', 'Crest, Colgate', 'Sodium Fluoride', 'Không nuốt nhiều.', 'https://i5.walmartimages.com/seo/Colgate-Cavity-Protection-Toothpaste-with-Fluoride-Minty-Great-Flavor-2-5-oz-Tube_3fd969aa-b443-4a5d-9bd9-39732bbf5d69.77b808d3dc7ef4e9247ea3b5577f5c86.jpeg');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (51, 'Docosanol', 'Docosanol', 'Abreva', 'Docosanol', 'Kích ứng tại chỗ nhẹ.', 'https://bizweb.dktcdn.net/100/407/286/products/3517f521-e6ba-4ea7-886c-ac2c8d2fd95d-a2bcaf9bacbf79f6613d5a55a756158a-jpeg.jpg?v=1681119812400');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (58, 'Bismuth Subsalicylate', 'Bismuth Subsalicylate', 'Pepto-Bismol', 'Bismuth Subsalicylate', 'Không dùng trẻ em (nguy cơ Reye), dị ứng aspirin.', 'https://www.vinmec.com/static/uploads/20200522_151521_140132_screenshot_15901604_max_1800x1800_png_1255440d3b.png');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (63, 'Orphenadrine', 'Orphenadrine', 'Norflex', 'Giãn cơ (Kháng cholinergic)', 'Khô miệng, bí tiểu, tăng nhãn áp.', 'https://sandoz-ca.cms.sandoz.com/sites/default/files/styles/large/public/2023-11/Sandoz-Orphenadrine-359.jpg?itok=7-bQbiTx');
INSERT INTO "dim_thuoctay" ("thuoctay_sk", "thuoc_tay", "hoat_chat", "biet_duoc", "cac_thanh_phan_trong_thuoc", "canh_bao_va_chong_chi_dinh", "image_url") VALUES (70, 'Artificial Tears', 'Carboxymethylcellulose, Glycerin', 'Systane, Refresh', 'Carboxymethylcellulose, Glycerin', 'Thường an toàn.', 'https://images-na.ssl-images-amazon.com/images/I/81MTj7-7yML.jpg');

-- Tạo bảng login_logs
DROP TABLE IF EXISTS "login_logs" CASCADE;
CREATE TABLE "login_logs" (
  "id" SERIAL,
  "user_id" INTEGER,
  "login_at" TIMESTAMP WITHOUT TIME ZONE,
  "logout_at" TIMESTAMP WITHOUT TIME ZONE,
  "ip_address" VARCHAR(100),
  "user_agent" TEXT
);

-- Dữ liệu bảng login_logs (16 dòng)
INSERT INTO "login_logs" ("id", "user_id", "login_at", "logout_at", "ip_address", "user_agent") VALUES (1, 1, '2025-12-27T15:42:44.077Z', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36');
INSERT INTO "login_logs" ("id", "user_id", "login_at", "logout_at", "ip_address", "user_agent") VALUES (2, 1, '2025-12-27T15:51:14.859Z', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36');
INSERT INTO "login_logs" ("id", "user_id", "login_at", "logout_at", "ip_address", "user_agent") VALUES (3, 1, '2025-12-27T19:44:38.544Z', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36');
INSERT INTO "login_logs" ("id", "user_id", "login_at", "logout_at", "ip_address", "user_agent") VALUES (4, 2, '2025-12-29T14:20:21.994Z', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36');
INSERT INTO "login_logs" ("id", "user_id", "login_at", "logout_at", "ip_address", "user_agent") VALUES (5, 1, '2025-12-29T14:46:57.692Z', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36');
INSERT INTO "login_logs" ("id", "user_id", "login_at", "logout_at", "ip_address", "user_agent") VALUES (6, 1, '2025-12-30T01:29:00.297Z', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36');
INSERT INTO "login_logs" ("id", "user_id", "login_at", "logout_at", "ip_address", "user_agent") VALUES (7, 1, '2025-12-30T08:37:32.904Z', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36');
INSERT INTO "login_logs" ("id", "user_id", "login_at", "logout_at", "ip_address", "user_agent") VALUES (8, 1, '2025-12-30T08:42:19.316Z', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36');
INSERT INTO "login_logs" ("id", "user_id", "login_at", "logout_at", "ip_address", "user_agent") VALUES (9, 1, '2025-12-30T08:46:51.185Z', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36');
INSERT INTO "login_logs" ("id", "user_id", "login_at", "logout_at", "ip_address", "user_agent") VALUES (10, 1, '2025-12-30T08:47:27.972Z', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36');
INSERT INTO "login_logs" ("id", "user_id", "login_at", "logout_at", "ip_address", "user_agent") VALUES (11, 1, '2025-12-30T08:51:03.538Z', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36');
INSERT INTO "login_logs" ("id", "user_id", "login_at", "logout_at", "ip_address", "user_agent") VALUES (12, 2, '2025-12-30T08:51:16.664Z', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36');
INSERT INTO "login_logs" ("id", "user_id", "login_at", "logout_at", "ip_address", "user_agent") VALUES (13, 1, '2025-12-30T13:42:21.325Z', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36');
INSERT INTO "login_logs" ("id", "user_id", "login_at", "logout_at", "ip_address", "user_agent") VALUES (14, 2, '2025-12-30T13:43:24.090Z', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36');
INSERT INTO "login_logs" ("id", "user_id", "login_at", "logout_at", "ip_address", "user_agent") VALUES (15, 2, '2025-12-30T13:49:36.241Z', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36');
INSERT INTO "login_logs" ("id", "user_id", "login_at", "logout_at", "ip_address", "user_agent") VALUES (16, 1, '2025-12-30T13:57:38.696Z', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36');

-- Tạo bảng map_nhombenh_benh
DROP TABLE IF EXISTS "map_nhombenh_benh" CASCADE;
CREATE TABLE "map_nhombenh_benh" (
  "nhombenh_sk" INTEGER,
  "benh_sk" INTEGER
);

-- Dữ liệu bảng map_nhombenh_benh (65 dòng)
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (1, 61);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (6, 51);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (8, 19);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (8, 20);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (8, 21);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (9, 22);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (1, 3);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (1, 1);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (1, 2);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (1, 4);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (3, 5);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (1, 65);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (1, 64);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (1, 63);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (1, 62);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (2, 60);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (11, 59);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (12, 58);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (4, 57);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (3, 56);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (3, 55);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (3, 54);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (12, 53);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (3, 52);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (6, 50);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (6, 49);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (6, 48);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (2, 47);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (2, 46);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (2, 45);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (3, 44);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (2, 43);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (2, 42);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (2, 41);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (2, 40);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (9, 39);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (8, 38);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (3, 37);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (4, 36);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (1, 35);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (10, 34);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (10, 33);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (10, 32);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (2, 31);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (2, 30);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (2, 29);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (2, 28);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (2, 27);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (2, 26);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (7, 25);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (7, 24);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (7, 23);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (8, 18);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (8, 17);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (6, 16);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (6, 15);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (6, 14);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (6, 13);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (4, 12);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (5, 11);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (4, 10);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (3, 9);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (4, 8);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (4, 7);
INSERT INTO "map_nhombenh_benh" ("nhombenh_sk", "benh_sk") VALUES (3, 6);

-- Tạo bảng nhombenh
DROP TABLE IF EXISTS "nhombenh" CASCADE;
CREATE TABLE "nhombenh" (
  "nhombenh_sk" INTEGER,
  "nhom_benh" VARCHAR(255)
);

-- Dữ liệu bảng nhombenh (12 dòng)
INSERT INTO "nhombenh" ("nhombenh_sk", "nhom_benh") VALUES (1, 'Tai – Mũi – Họng (TMH) & Hô hấp');
INSERT INTO "nhombenh" ("nhombenh_sk", "nhom_benh") VALUES (2, 'Da liễu');
INSERT INTO "nhombenh" ("nhombenh_sk", "nhom_benh") VALUES (3, 'Tiêu hoá – Đường ruột');
INSERT INTO "nhombenh" ("nhombenh_sk", "nhom_benh") VALUES (4, 'Nội tiết – Chuyển hoá');
INSERT INTO "nhombenh" ("nhombenh_sk", "nhom_benh") VALUES (5, 'Tim mạch');
INSERT INTO "nhombenh" ("nhombenh_sk", "nhom_benh") VALUES (6, 'Cơ xương khớp');
INSERT INTO "nhombenh" ("nhombenh_sk", "nhom_benh") VALUES (7, 'Thận – Tiết niệu – Nam khoa – Phụ khoa');
INSERT INTO "nhombenh" ("nhombenh_sk", "nhom_benh") VALUES (8, 'Tâm thần/ Thần kinh');
INSERT INTO "nhombenh" ("nhombenh_sk", "nhom_benh") VALUES (9, 'Máu – Miễn dịch');
INSERT INTO "nhombenh" ("nhombenh_sk", "nhom_benh") VALUES (10, 'Răng – Hàm – Mặt');
INSERT INTO "nhombenh" ("nhombenh_sk", "nhom_benh") VALUES (11, 'Mắt');
INSERT INTO "nhombenh" ("nhombenh_sk", "nhom_benh") VALUES (12, 'Khác');

-- Tạo bảng thaoduoc_cochetacdong
DROP TABLE IF EXISTS "thaoduoc_cochetacdong" CASCADE;
CREATE TABLE "thaoduoc_cochetacdong" (
  "benh_sk" INTEGER,
  "thaoduoc_sk" INTEGER,
  "dich_tac_dong" TEXT,
  "con_duong_tac_dong" TEXT,
  "hieu_luc_sinh_hoc" VARCHAR(255)
);

-- Dữ liệu bảng thaoduoc_cochetacdong (63 dòng)
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (1, 1, 'Tinh dầu (gingerol, shogaol) chống nôn, kháng viêm nhẹ, kích thích tiêu hóa', 'Ức chế COX-1/COX-2, điều hòa NF-κB; tác động TRPV1, ức chế 5-HT₃ → giảm đau, chống viêm, chống nôn.', 'Thành phần gingerol và zingerone có tác dụng chống viêm, giảm đau, kích thích tiêu hóa, giảm buồn nôn, kháng khuẩn nhẹ và tăng lưu thông máu');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (2, 2, 'Menthol gây giãn cơ trơn, giảm co thắt dạ dày-ruột, mát, chống nôn', 'Kích hoạt TRPM8; ức chế Ca²⁺-ATPase cơ trơn tiêu hóa; giảm viêm qua ức chế NF-κB.', 'giảm đau, kháng khuẩn, kháng viêm, làm mát, kích thích tiêu hóa, giảm co thắt dạ dày – ruột và thông mũi, giảm ho, giảm buồn nôn');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (3, 3, 'Flavonoid, triterpenoid giảm ho, long đờm, chống oxy hóa', 'Điều hòa MAPK/NF-κB, giảm TNF-α/IL-6; ức chế COX-2 (giảm ho, long đờm).', 'nhuận phế, giảm ho, long đờm, kháng viêm, chống oxy hóa và bảo vệ gan.');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (4, 4, 'Tinh dầu, lignan chống viêm, thông mũi', 'Đối kháng histamin H1; ức chế NF-κB/COX-2 → chống dị ứng, viêm mũi xoang.', 'kháng viêm, kháng khuẩn, giảm phù nề niêm mạc mũi, giúp thông xoang, giảm nghẹt mũi, đau đầu do viêm xoang – viêm mũi dị ứng');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (5, 5, 'Curcumin kháng viêm, chống oxy hóa, bảo vệ niêm mạc', 'Ức chế NF-κB, COX-2, iNOS; kích hoạt Nrf2–HO-1 → chống oxy hóa, bảo vệ gan – dạ dày.', 'chống viêm, chống oxy hóa, bảo vệ gan, hỗ trợ tiêu hóa và phòng ngừa ung thư');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (6, 5, 'Curcumin kháng viêm, chống oxy hóa, bảo vệ niêm mạc', 'Ức chế NF-κB, COX-2, iNOS; kích hoạt Nrf2–HO-1 → chống oxy hóa, bảo vệ gan – dạ dày.', 'chống viêm, chống oxy hóa, bảo vệ gan, hỗ trợ tiêu hóa và phòng ngừa ung thư');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (7, 6, 'niêm mạc dạ dày – ruột và hệ thần kinh ruột', 'tác động qua đường tiêu hóa', 'kích thích tiêu hóa, giảm đau bụng, kháng khuẩn và chống viêm');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (8, 7, 'Sesamin, lignan chống oxy hóa, hỗ trợ tiêu hóa', 'Hoạt hóa AMPK; tăng SOD/CAT; ức chế NF-κB → chống oxy hóa, điều hòa lipid.', 'bổ can thận, dưỡng huyết, chống oxy hóa và giảm cholesterol');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (9, 8, 'Tannin, flavonoid kháng khuẩn, cầm tiêu chảy', 'Ức chế α-glucosidase (giảm hấp thu glucose); kháng khuẩn qua ROS pathway.', 'kháng khuẩn, cầm tiêu chảy, chống viêm và hạ đường huyết');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (10, 9, 'Gymnemic acid giảm hấp thu glucose ruột, tăng cảm ứng insulin', 'Ức chế SGLT1 (vận chuyển Na⁺-glucose), tăng insulin; điều hòa PI3K–Akt.', 'ức chế hấp thu đường ở ruột, hạ đường huyết, hỗ trợ điều trị tiểu đường và giảm cảm giác thèm ngọt');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (11, 10, 'Rutin, quercetin bền thành mạch, giảm xơ mạch', 'Ức chế MAPK/NF-κB; tăng Nrf2 → bền thành mạch, chống viêm.', 'bền thành mạch, hạ huyết áp, chống viêm, chống oxy hóa và phòng ngừa xuất huyết mao mạch');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (12, 11, 'Saponin cải thiện lipid máu, tăng oxy hóa', 'Hoạt hóa AMPK, tăng PGC-1α → cải thiện chuyển hóa lipid–glucose', 'hạ mỡ máu, hạ đường huyết, chống oxy hóa và tăng cường miễn dịch');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (13, 12, 'Saponin, steroidal glycoside giảm viêm, hỗ trợ mô liên kết', 'Kích hoạt PI3K–Akt–eNOS → tăng NO; ức chế RAAS → hạ huyết áp, bảo vệ mạch.', 'bổ can thận, mạnh gân cốt, hạ huyết áp và bảo vệ tim mạch');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (14, 13, 'Saponin, hoạt chất giảm viêm, tăng tuần hoàn', 'Điều hòa TGF-β/Smad; ức chế NF-κB → bảo vệ khớp, xương.', 'hoạt huyết, mạnh gân cốt, hạ huyết áp, lợi tiểu và bổ can thận');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (15, 14, 'Tinh dầu, flavonoid giảm viêm, hỗ trợ đường hô hấp', 'Ức chế COX-2, giảm NO/ROS; điều hòa NF-κB → giảm viêm khớp.', 'Chống viêm, giảm đau khớp, hỗ trợ điều trị gout và phong thấp');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (16, 15, 'Flavonoid, cineole chống viêm, làm ấm, giảm co thắt', 'Ức chế COX/LOX; điều biến GABAergic → giảm đau, chống co thắt.', 'điều hòa kinh nguyệt, giảm đau, chống viêm, an thần nhẹ và kích thích tiêu hóa');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (17, 16, 'Flavonoid (apigenin) kháng viêm, chống dị ứng nhẹ', 'Kích hoạt Nrf2–ARE; ức chế MAPK/NF-κB → bảo vệ gan, thần kinh.', 'thanh nhiệt, giải độc, hạ huyết áp, bảo vệ gan và chống oxy hóa');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (18, 16, 'Flavonoid (apigenin) kháng viêm, chống dị ứng nhẹ', 'Kích hoạt Nrf2–ARE; ức chế MAPK/NF-κB → bảo vệ gan, thần kinh.', 'thanh nhiệt, giải độc, hạ huyết áp, bảo vệ gan và chống oxy hóa');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (19, 17, 'Alkaloid và flavonoid an thần nhẹ, giảm lo âu', 'Tăng hoạt tính GABA-A, ức chế MAO → an thần, giảm lo âu.', 'an thần, giảm lo âu, hỗ trợ ngủ ngon và chống co giật nhẹ');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (20, 18, 'Ginsenosides tăng miễn dịch, tăng năng lượng tế bào', 'Kích hoạt PI3K–Akt, AMPK, NO–eNOS; điều hòa NF-κB (miễn dịch, tim mạch).', 'tăng sức đề kháng, chống mệt mỏi, cải thiện trí nhớ, điều hòa huyết áp và tăng miễn dịch');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (21, 17, 'Alkaloid và flavonoid an thần nhẹ, giảm lo âu', 'Tăng hoạt tính GABA-A, ức chế MAO → an thần, giảm lo âu.', 'an thần, giảm lo âu, hỗ trợ ngủ ngon và chống co giật nhẹ');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (22, 19, 'Phytoestrogen, saponin hỗ trợ tuần hoàn, bổ huyết', 'Hoạt hóa ERK/MAPK; ức chế COX-2 → tạo huyết, chống viêm.', 'bổ huyết, hoạt huyết, điều hòa kinh nguyệt, chống viêm và chống oxy hóa');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (23, 20, 'Flavonoid, acid hữu cơ lợi tiểu nhẹ, giảm viêm', 'Ức chế kết tinh Ca²⁺/oxalat, tăng bài tiết → chống sỏi thận.', 'lợi tiểu, thanh nhiệt, bài sỏi thận – sỏi mật, chống viêm và bảo vệ gan');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (24, 21, 'Triterpenoid lợi tiểu, hạ huyết áp nhẹ', 'Điều hòa PPARγ; hoạt hóa AMPK → cải thiện rối loạn lipid.', 'lợi tiểu, thanh nhiệt, hạ lipid máu, bảo vệ gan và hỗ trợ điều hòa huyết áp');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (25, 19, 'Phytoestrogen, saponin hỗ trợ tuần hoàn, bổ huyết', 'Hoạt hóa ERK/MAPK; ức chế COX-2 → tạo huyết, chống viêm.', 'bổ huyết, hoạt huyết, điều hòa kinh nguyệt, chống viêm và chống oxy hóa');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (26, 22, 'Polysaccharide, steroid hỗ trợ niêm mạc, giảm viêm', 'Ức chế NF-κB/MAPK; tăng Nrf2 → chống oxy hóa, điều hòa miễn dịch.', 'Chống viêm, chống oxy hóa, bảo vệ gan, điều hào miễn dịch');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (27, 23, 'Flavonoid, tannin kháng khuẩn, kháng viêm, làm dịu da', 'Ức chế COX-2/IL-6/TNF-α; kích hoạt Nrf2–HO-1; điều biến TLR4 (kháng virus).', 'Kháng khuẩn, kháng virus, chống viêm, lợi tiểu, thanh nhiệt, chống oxy hóa');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (28, 24, 'Flavonoid, saponin kháng khuẩn, kháng viêm', 'Ức chế NF-κB/MAPK → kháng khuẩn, kháng virus, chống viêm.', 'Thanh nhiệt giải độc, kháng viêm, kháng khuẩn/bệnh lý nhiễm trùng, hỗ trợ điều trị mụn nhọt, viêm họng, sốt, viêm da, lỵ, dị ứng');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (29, 25, 'Cineole, alpha-terpineol kháng khuẩn, chống nấm nhẹ', 'Tác động kênh Ca²⁺ và thụ thể GABA; giãn cơ trơn hô hấp; kháng khuẩn.', 'kháng khuẩn, kháng nấm, kháng virus, chống viêm và giảm đau ngoài da');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (30, 26, 'Tanin, flavonoid kháng khuẩn, chống viêm', 'Ức chế COX/LOX; tăng VEGF → hỗ trợ tái tạo mô.', 'hoạt huyết tan ứ huyết, giảm sưng bầm, hỗ trợ làm lành vết thương và tăng lưu thông máu');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (31, 27, 'Polysaccharide (acemannan) làm dịu, kích thích tái tạo mô', 'Hoạt hóa AMPK/TGF-β; tăng tổng hợp collagen; ức chế NF-κB.', 'chống viêm, kháng khuẩn, kích thích tái tạo mô, dưỡng da, làm lành vết thương, hỗ trợ tiêu hóa và tăng cường miễn dịch');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (32, 28, 'Eugenol giảm đau tại chỗ, kháng khuẩn nhẹ', 'Ức chế COX-2/iNOS; kích hoạt Nrf2–HO-1 → kháng viêm, kháng khuẩn mạnh.', 'gây tê, giảm đau răng, kháng khuẩn, kháng nấm, chống oxy hóa và giảm viêm, thường dùng trong nha khoa và điều trị nhiễm khuẩn miệng');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (33, 28, 'Eugenol giảm đau tại chỗ, kháng khuẩn nhẹ', 'Ức chế COX-2/iNOS; kích hoạt Nrf2–HO-1 → kháng viêm, kháng khuẩn mạnh.', 'gây tê, giảm đau răng, kháng khuẩn, kháng nấm, chống oxy hóa và giảm viêm, thường dùng trong nha khoa và điều trị nhiễm khuẩn miệng');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (34, 2, 'Menthol gây giãn cơ trơn, giảm co thắt dạ dày-ruột, mát, chống nôn', 'Kích hoạt TRPM8; ức chế Ca²⁺-ATPase cơ trơn tiêu hóa; giảm viêm qua ức chế NF-κB.', 'giảm đau, kháng khuẩn, kháng viêm, làm mát, thông mũi họng, kích thích tiêu hóa và giảm buồn nôn');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (35, 29, 'Flavonoid và saponin hỗ trợ tiêu hóa, lợi mật', 'Ức chế NF-κB/MAPK → kháng viêm, chống dị ứng.', 'kháng viêm, kháng khuẩn, lợi tiểu, hỗ trợ điều trị phế thấp và bướu cổ');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (36, 30, 'Polyphenol tăng tiêu hóa, hỗ trợ lipid', 'Ức chế HMG-CoA reductase; tăng PPARα → hạ lipid máu.', 'hỗ trợ tiêu hóa, giảm mỡ máu, giãn mạch, ổn định huyết áp và tăng miễn dịch');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (37, 31, 'Cynarin, flavonoid lợi mật, chống co thắt mật/tiêu hóa', 'Kích hoạt Nrf2; ức chế HMG-CoA reductase → bảo vệ gan, chống oxy hóa.', 'giải độc gan, giảm cholesterol & mỡ máu, hỗ trợ tiêu hóa và huyết áp');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (38, 32, 'Polysaccharide, saponin tăng miễn dịch, lợi tiểu nhẹ', 'Kích hoạt PI3K–Akt, JAK–STAT; tăng NO–eNOS; điều hòa NF-κB.', 'bổ khí, kích thích miễn dịch, bảo vệ tế bào, tăng sức đề kháng và chống oxy hóa.');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (39, 33, 'Polysaccharide và triterpenoid tăng miễn dịch nhẹ', 'Kích hoạt Nrf2–HO-1, AMPK; điều hòa NF-κB → chống viêm, chống u.', 'tăng miễn dịch, chống viêm, bảo vệ gan/thận, ổn định huyết áp và mỡ máu');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (40, 34, 'Glycyrrhizin chống viêm, kháng virus nhẹ in vitro', 'Ức chế 11β-HSD2; điều hòa NF-κB; tăng Nrf2 → bảo vệ gan, dạ dày.', 'chống viêm, kháng khuẩn, bảo vệ gan – dạ dày, giải độc và điều hòa cơ thể nhưng có thể gây tăng huyết áp nếu dùng lâu dài.');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (41, 35, 'Omega-3, alpha-linolenic acid kháng viêm, tăng phục hồi mô', 'Hoạt hóa AMPK; giảm IL-6/TNF-α → chống viêm, hạ đường huyết.', 'Ức chế DNA polymerase HSV/VZV');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (42, 36, 'Limonoid, azadirachtin kháng khuẩn, nhuận tràng nhẹ', 'Ức chế JAK–STAT và NF-κB → kháng ký sinh trùng, kháng viêm.', 'kháng ký sinh trùng, giun sán, kháng viêm ngoài da, thanh độc (nhưng cây có độc, cần dùng thận trọng)');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (43, 37, 'Tinh dầu kích thích nhu động tiêu hóa mạnh', 'Ức chế COX-2/iNOS; kích hoạt Nrf2 → chống viêm, chống oxy hóa.', 'ôn trung, tán hàn, giảm đau, kích thích tiêu hóa, kháng viêm, chống oxy hóa và hỗ trợ phòng ung thư');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (44, 23, 'Flavonoid, tannin kháng khuẩn, kháng viêm, làm dịu da', 'Ức chế COX-2/IL-6/TNF-α; kích hoạt Nrf2–HO-1; điều biến TLR4 (kháng virus).', 'Kháng khuẩn, kháng virus, chống viêm, lợi tiểu, thanh nhiệt, chống oxy hóa');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (45, 24, 'Flavonoid, saponin kháng khuẩn, kháng viêm', 'Ức chế NF-κB/MAPK → kháng khuẩn, kháng virus, chống viêm.', 'Thanh nhiệt giải độc, kháng viêm, kháng khuẩn/bệnh lý nhiễm trùng, hỗ trợ điều trị mụn nhọt, viêm họng, sốt, viêm da, lỵ, dị ứng');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (46, 38, 'Saponin, glycoside hỗ trợ tiêu hóa, kháng khuẩn nhẹ', 'Ức chế COX/LOX; long đờm; điều hòa NF-κB (đường hô hấp).', 'Kháng khuẩn, kháng viêm, long đờm, kích thích mọc tóc, làm sạch da đầu, giảm ho và hỗ trợ hô hấp. Ngoài ra, bồ kết còn được dùng ngoài để sát khuẩn, giảm ngứa, trị gàu và trong Đông y giúp thông khiếu, tiêu đờm, trục đờm tắc mũi họng');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (47, 39, 'Anthraquinone/phenolic lợi tiêu hóa, bổ máu nhẹ', 'Điều hòa SIRT1/AMPK; tăng Nrf2 → chống lão hóa, bảo vệ gan.', 'bổ can-thận, dưỡng huyết, mạnh gân xương, bảo vệ gan và hỗ trợ tiêu hóa.');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (48, 40, '- TGF-β receptor / Smad2-3 complex', 'Kích hoạt TGF-β/Smad, BMP-2; ức chế NF-κB → tái tạo gân xương.', 'Tục đoạn có hiệu lực sinh học bổ can thận, mạnh gân cốt, giúp liền xương, chống viêm và bảo vệ sụn khớp, thường dùng trong điều trị đau lưng, gãy xương, thấp khớp');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (49, 41, 'Saponin, alkaloid giảm đau cơ, thư giãn cơ nhẹ', 'Kích hoạt BMP-2/Smad → tăng tổng hợp collagen xương.', 'kích thích tạo xương, ức chế hủy cốt bào, tăng hấp thụ canxi-phosphat và hỗ trợ liền xương, đồng thời có tác dụng hoạt huyết, giảm đau và kháng khuẩn');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (51, 13, 'Saponin, hoạt chất giảm viêm, tăng tuần hoàn', 'Điều hòa TGF-β/Smad; ức chế NF-κB → bảo vệ khớp, xương.', 'hoạt huyết, mạnh gân cốt, hạ huyết áp, lợi tiểu và bổ can thận');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (51, 43, '- COX-1 / COX-2', 'Ức chế COX-1/COX-2, điều hòa NF-κB; tác động TRPV1, ức chế 5-HT₃ → giảm đau, chống viêm, chống nôn.', 'chống viêm, chống oxy hóa, giảm đau, kích thích tiêu hóa, chống buồn nôn và hạ đường huyết, đồng thời hỗ trợ tim mạch và tăng cường miễn dịch');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (53, 1, 'Tinh dầu (gingerol, shogaol) chống nôn, kháng viêm nhẹ, kích thích tiêu hóa', 'Ức chế COX-1/COX-2, điều hòa NF-κB; tác động TRPV1, ức chế 5-HT₃ → giảm đau, chống viêm, chống nôn.', 'Thành phần gingerol và zingerone có tác dụng chống viêm, giảm đau, kích thích tiêu hóa, giảm buồn nôn, kháng khuẩn nhẹ và tăng lưu thông máu');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (55, 32, 'Polysaccharide, saponin tăng miễn dịch, lợi tiểu nhẹ', 'Kích hoạt PI3K–Akt, JAK–STAT; tăng NO–eNOS; điều hòa NF-κB.', 'bổ khí, kích thích miễn dịch, bảo vệ tế bào, tăng sức đề kháng và chống oxy hóa.');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (56, 45, 'Enzyme, malt làm dịu dạ dày, hỗ trợ tiêu hóa', 'Kích hoạt amylase pathway; hỗ trợ tiêu hóa tinh bột; điều hòa chuyển hóa lipid.', 'Kích thích tiêu hóa tinh bột, hạ cholesterol, điều hòa lipid máu, chống oxy hóa, chống viêm nhẹ');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (57, 30, 'Polyphenol tăng tiêu hóa, hỗ trợ lipid', 'Ức chế HMG-CoA reductase; tăng PPARα → hạ lipid máu.', 'hỗ trợ tiêu hóa, giảm mỡ máu, giãn mạch, ổn định huyết áp và tăng miễn dịch');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (58, 46, 'Isoflavone (puerarin) tăng tuần hoàn, lợi tiểu nhẹ', 'Ức chế PDE, tăng NO nội sinh → giãn mạch; ức chế α-glucosidase (hạ đường huyết).', 'Giãn mạch, hạ huyết áp, giảm đường huyết, bảo vệ thần kinh, giảm co thắt cơ trơn, chống say rượu');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (59, 47, 'Anthocyanin giảm viêm mắt, tăng tuần hoàn tại chỗ', 'Ức chế kênh Ca²⁺; hoạt hóa eNOS–NO; ức chế NF-κB; chống oxy hóa.', 'Hạ huyết áp, giãn mạch, chống oxy hóa mạnh, chống viêm, bảo vệ gan, nhuận tràng, điều hòa lipid máu');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (60, 27, 'Polysaccharide (acemannan) làm dịu, kích thích tái tạo mô', 'Hoạt hóa AMPK/TGF-β; tăng tổng hợp collagen; ức chế NF-κB.', 'chống viêm, kháng khuẩn, kích thích tái tạo mô, dưỡng da, làm lành vết thương, hỗ trợ tiêu hóa và tăng cường miễn dịch');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (61, 1, 'Tinh dầu (gingerol, shogaol) chống nôn, kháng viêm nhẹ, kích thích tiêu hóa', 'Ức chế COX-1/COX-2, điều hòa NF-κB; tác động TRPV1, ức chế 5-HT₃ → giảm đau, chống viêm, chống nôn.', 'Thành phần gingerol và zingerone có tác dụng chống viêm, giảm đau, kích thích tiêu hóa, giảm buồn nôn, kháng khuẩn nhẹ và tăng lưu thông máu');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (62, 2, 'Menthol gây giãn cơ trơn, giảm co thắt dạ dày-ruột, mát, chống nôn', 'Kích hoạt TRPM8; ức chế Ca²⁺-ATPase cơ trơn tiêu hóa; giảm viêm qua ức chế NF-κB.', 'giảm đau, kháng khuẩn, kháng viêm, làm mát, thông mũi họng, kích thích tiêu hóa và giảm buồn nôn');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (63, 3, 'Flavonoid, triterpenoid giảm ho, long đờm, chống oxy hóa', 'Điều hòa MAPK/NF-κB, giảm TNF-α/IL-6; ức chế COX-2 (giảm ho, long đờm).', 'nhuận phế, giảm ho, long đờm, kháng viêm, chống oxy hóa và bảo vệ gan.');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (64, 48, 'Alkaloid và saponin kích thích long đờm, tan đàm', 'Điều biến NF-κB mức vừa phải để tăng tiết nhầy, long đờm; chống viêm hô hấp.', 'long đờm, giãn phế quản, kháng khuẩn, chống viêm và tăng cường miễn dịch hô hấp.');
INSERT INTO "thaoduoc_cochetacdong" ("benh_sk", "thaoduoc_sk", "dich_tac_dong", "con_duong_tac_dong", "hieu_luc_sinh_hoc") VALUES (65, 49, 'Glycyrrhizin chống viêm, làm dịu niêm mạc', 'Ức chế 11β-HSD2; điều hòa NF-κB; tăng Nrf2 → bảo vệ gan, dạ dày.', 'chống viêm, giảm ho, bảo vệ gan – dạ dày, điều hòa miễn dịch và hỗ trợ giải độc, nhưng dùng lâu có thể gây tăng huyết áp do giữ muối nước.');

-- Tạo bảng thaoduoc_dacdiemnguongoc
DROP TABLE IF EXISTS "thaoduoc_dacdiemnguongoc" CASCADE;
CREATE TABLE "thaoduoc_dacdiemnguongoc" (
  "benh_sk" INTEGER,
  "nguon_goc" VARCHAR(255),
  "do_tinh_khiet" VARCHAR(255),
  "chi_phi" VARCHAR(255),
  "kha_nang_ung_dung_lam_sang" TEXT
);

-- Dữ liệu bảng thaoduoc_dacdiemnguongoc (65 dòng)
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (1, 'Thân rễ', 'Dạng thô', 'Giá rẻ', 'hỗ trợ tiêu hoá, giảm viêm');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (2, 'Lá', 'Chiết xuất chuẩn hóa', 'Giá rẻ', 'làm mát, giảm ho');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (3, 'Lá', 'Dạng thô', 'Giá vừa', 'giảm ho, bảo vệ phổi');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (4, 'Hoa', 'Chiết xuất chuẩn hóa', 'Giá rẻ', 'hỗ trợ cảm, giải độc');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (5, 'Thân rễ', 'Dạng thô', 'Giá rẻ', 'kích thích tiêu hoá, bảo vệ gan');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (6, 'Thân rễ', 'Chiết xuất chuẩn hóa', 'Giá rẻ', 'kháng viêm, hỗ trợ da');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (7, 'Rễ', 'Dạng thô', 'Giá vừa', 'giảm đau, hỗ trợ dạ dày');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (8, 'Hạt', 'Chiết xuất chuẩn hóa', 'Giá rẻ', 'tốt cho da và tóc');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (9, 'Lá', 'Dạng thô', 'Giá rẻ', 'trị tiêu chảy, kháng khuẩn');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (10, 'Lá', 'Chiết xuất chuẩn hóa', 'Giá vừa', 'hỗ trợ tiểu đường');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (11, 'Hoa', 'Dạng thô', 'Giá vừa', 'bảo vệ mạch máu, chống oxy hoá');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (12, 'Lá', 'Chiết xuất chuẩn hóa', 'Giá vừa', 'tăng đề kháng, giảm mỡ máu');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (13, 'Vỏ cây', 'Dạng thô', 'Giá vừa', 'hỗ trợ huyết áp');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (14, 'Rễ', 'Chiết xuất chuẩn hóa', 'Giá rẻ', 'bổ gân cốt, giảm đau khớp');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (15, 'Dây leo', 'Dạng thô', 'Giá vừa', 'giảm đau, trị gout');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (16, 'Lá', 'Chiết xuất chuẩn hóa', 'Giá rẻ', 'điều hoà kinh nguyệt, lưu thông máu');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (17, 'Hoa', 'Dạng thô', 'Giá rẻ', 'hạ sốt, tốt cho mắt');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (18, 'Hoa', 'Chiết xuất chuẩn hóa', 'Giá rẻ', 'làm trà thanh nhiệt');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (19, 'Lá', 'Dạng thô', 'Giá rẻ', 'an thần, giảm căng thẳng');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (20, 'Rễ', 'Chiết xuất chuẩn hóa', 'Giá cao', 'tăng sức, bổ khí huyết');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (21, 'Lá', 'Dạng thô', 'Giá rẻ', 'dễ ngủ, giảm lo âu');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (22, 'Rễ', 'Chiết xuất chuẩn hóa', 'Giá vừa', 'hoạt huyết, giảm đau');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (23, 'Cây cỏ', 'Dạng thô', 'Giá rẻ', 'lợi tiểu, tan sỏi');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (24, 'Thân rễ', 'Chiết xuất chuẩn hóa', 'Giá rẻ', 'mát gan, giải độc');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (25, 'Rễ', 'Dạng thô', 'Giá vừa', 'bổ huyết, điều hoà khí huyết');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (26, 'Rễ', 'Chiết xuất chuẩn hóa', 'Giá vừa', 'bảo vệ họng, tăng sức đề kháng');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (27, 'Lá', 'Dạng thô', 'Giá rẻ', 'kháng khuẩn, giảm viêm');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (28, 'Hoa', 'Chiết xuất chuẩn hóa', 'Giá vừa', 'thanh nhiệt, đẹp da');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (29, 'Tinh dầu', 'Dạng thô', 'Giá rẻ', 'trị ho, thông mũi');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (30, 'Nhựa', 'Chiết xuất chuẩn hóa', 'Giá vừa', 'bổ huyết, lành vết thương');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (31, 'Lá', 'Dạng thô', 'Giá rẻ', 'dưỡng ẩm, làm mát da');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (32, 'Nụ hoa', 'Chiết xuất chuẩn hóa', 'Giá vừa', 'sát khuẩn, giảm đau răng');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (33, 'Nụ hoa', 'Dạng thô', 'Giá vừa', 'sát khuẩn, làm thơm');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (34, 'Lá', 'Chiết xuất chuẩn hóa', 'Giá rẻ', 'thông mũi, sảng khoái');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (35, 'Quả', 'Dạng thô', 'Giá rẻ', 'giảm dị ứng, nghẹt mũi');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (36, 'Quả', 'Chiết xuất chuẩn hóa', 'Giá rẻ', 'kích thích tiêu hoá, giảm mỡ');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (37, 'Lá', 'Dạng thô', 'Giá vừa', 'hỗ trợ gan, tiêu hoá');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (38, 'Rễ', 'Chiết xuất chuẩn hóa', 'Giá vừa', 'tăng đề kháng, chống oxy hoá');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (39, 'Nấm', 'Dạng thô', 'Giá cao', 'tăng miễn dịch, hỗ trợ ung thư');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (40, 'Rễ', 'Chiết xuất chuẩn hóa', 'Giá rẻ', 'thanh nhiệt, giải độc');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (41, 'Cây cỏ', 'Dạng thô', 'Giá rẻ', 'kháng viêm, sát khuẩn');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (42, 'Lá', 'Chiết xuất chuẩn hóa', 'Giá rẻ', 'diệt côn trùng, kháng khuẩn');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (43, 'Thân rễ', 'Dạng thô', 'Giá rẻ', 'hỗ trợ tiêu hoá, giảm đau');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (44, 'Lá', 'Chiết xuất chuẩn hóa', 'Giá rẻ', 'giải độc, mát da');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (45, 'Hoa', 'Dạng thô', 'Giá rẻ', 'tăng miễn dịch, kháng virus');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (46, 'Quả', 'Chiết xuất chuẩn hóa', 'Giá rẻ', 'làm sạch tóc, trị gàu');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (47, 'Rễ', 'Dạng thô', 'Giá vừa', 'bổ gan, kéo dài tuổi thọ');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (48, 'Rễ', 'Chiết xuất chuẩn hóa', 'Giá vừa', 'mạnh gân cốt');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (49, 'Rễ', 'Dạng thô', 'Giá vừa', 'phục hồi xương');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (50, 'Thân rễ', 'Chiết xuất chuẩn hóa', 'Giá rẻ', 'kích thích tiêu hoá');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (51, 'Rễ', 'Dạng thô', 'Giá rẻ', 'hoạt huyết, giảm đau');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (52, 'Lá', 'Dạng thô', 'Giá rẻ', 'bảo vệ gan, giải độc');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (53, 'Thân rễ', 'Chiết xuất chuẩn hóa', 'Giá rẻ', 'tốt cho tiêu hoá, giảm đau');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (54, 'Thân rễ', 'Dạng thô', 'Giá rẻ', 'hỗ trợ tiêu hoá');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (55, 'Rễ', 'Chiết xuất chuẩn hóa', 'Giá vừa', 'tăng đề kháng');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (56, 'Hạt', 'Dạng thô', 'Giá rẻ', 'hỗ trợ tiêu hoá, giảm đầy bụng');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (57, 'Quả', 'Chiết xuất chuẩn hóa', 'Giá rẻ', 'giảm mỡ máu, tốt cho tim');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (58, 'Rễ', 'Chiết xuất chuẩn hóa', 'Giá rẻ', 'thanh nhiệt, giải khát');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (59, 'Hạt', 'Dạng thô', 'Giá rẻ', 'nhuận tràng, mát gan');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (60, 'Lá', 'Chiết xuất chuẩn hóa', 'Giá rẻ', 'dưỡng ẩm, làm mát da');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (61, 'Thân rễ', 'Dạng thô', 'Giá rẻ', 'hỗ trợ tiêu hoá, giảm viêm');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (62, 'Lá', 'Chiết xuất chuẩn hóa', 'Giá rẻ', 'làm mát, giảm ho');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (63, 'Lá', 'Dạng thô', 'Giá vừa', 'giảm ho, bảo vệ phổi');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (64, 'Rễ', 'Dạng thô', 'Giá vừa', 'Long đờm');
INSERT INTO "thaoduoc_dacdiemnguongoc" ("benh_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (65, 'Rễ', 'Dạng thô', 'Giá vừa', 'giảm viêm');

-- Tạo bảng thaoduoc_doctinh
DROP TABLE IF EXISTS "thaoduoc_doctinh" CASCADE;
CREATE TABLE "thaoduoc_doctinh" (
  "benh_sk" INTEGER,
  "doc_tinh_cap_tinh_ld50" VARCHAR(255),
  "doc_tinh_man_tinh" TEXT,
  "tuong_tac_thuoc_thao_duoc" TEXT
);

-- Dữ liệu bảng thaoduoc_doctinh (65 dòng)
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (1, 'Độc tính cấp thấp; liều cao kích ứng dạ dày.', 'Thường dung nạp tốt; ợ nóng/kích ứng.', 'Tăng nguy cơ chảy máu (warfarispirin/NSAID); có thể hạ đường.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (2, 'Tinh dầu đậm đặc độc ở trẻ nhỏ; trà an toàn khi dùng thường.', 'Nặng hơn GERD; kích ứng niêm mạc.', 'Ảnh hưởng hấp thu do giãn cơ thắt TQ; thận trọng với antacid/PPI khi trào ngược.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (3, 'Độc tính cấp thấp.', 'Hiếm rối loạn tiêu hóa.', 'Ít tương tác đáng kể.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (4, 'Có thể kích ứng/ dị ứng mũi.', 'Thiếu dữ liệu mạn; thai kỳ thận trọng.', 'Chưa rõ tương tác đáng kể.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (5, 'Curcumin độc tính cấp thấp.', 'Kích ứng dạ dày; hiếm tăng men gan.', 'Cộng hưởng chống đông/kháng tiểu cầu; tương tác P-gp/CYP nhẹ (tùy chiết xuất).');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (6, 'Curcumin độc tính cấp thấp.', 'Kích ứng dạ dày; hiếm tăng men gan.', 'Cộng hưởng chống đông/kháng tiểu cầu; tương tác P-gp/CYP nhẹ (tùy chiết xuất).');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (7, 'Độc tính cấp thấp; liều cao kích ứng tiêu hóa.', 'Tránh lạm dụng.', 'Dữ liệu hạn chế.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (8, 'Chưa có LD50 chuẩn hóa; độc tính cấp tùy loài/đường dùng/chiết xuất; dùng đúng liều truyền thống thường an toàn.', 'Dữ liệu hạn chế; thận trọng khi dùng kéo dài/ có bệnh gan–thận; tránh thai kỳ nếu thiếu dữ liệu.', 'Tham khảo bác sĩ khi đang dùng thuốc kê đơn; tránh phối hợp thuốc chống đông/hạ đường/hạ áp nếu không theo dõi.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (9, 'An toàn khi dùng trà/sắc liều thường.', 'Có thể táo bón nếu dùng nhiều.', 'Tanin giảm hấp thu một số thuốc/khoáng.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (10, 'Độc tính cấp thấp.', '10/19/2025', 'Tăng hạ đường khi phối hợp thuốc/insulin.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (11, 'Độc tính cấp thấp.', 'Theo dõi đông máu liều cao.', 'Cộng hưởng chống đông/kháng tiểu cầu.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (12, 'Độc tính cấp thấp.', 'An toàn tương đối; hạ đường/lipid nhẹ.', 'Cộng hưởng thuốc hạ đường/hạ lipid.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (13, 'Chưa có LD50 chuẩn hóa; độc tính cấp tùy loài/đường dùng/chiết xuất; dùng đúng liều truyền thống thường an toàn.', 'Dữ liệu hạn chế; thận trọng khi dùng kéo dài/ có bệnh gan–thận; tránh thai kỳ nếu thiếu dữ liệu.', 'Tham khảo bác sĩ khi đang dùng thuốc kê đơn; tránh phối hợp thuốc chống đông/hạ đường/hạ áp nếu không theo dõi.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (14, 'Chưa có LD50 chuẩn hóa; độc tính cấp tùy loài/đường dùng/chiết xuất; dùng đúng liều truyền thống thường an toàn.', 'Dữ liệu hạn chế; thận trọng khi dùng kéo dài/ có bệnh gan–thận; tránh thai kỳ nếu thiếu dữ liệu.', 'Tham khảo bác sĩ khi đang dùng thuốc kê đơn; tránh phối hợp thuốc chống đông/hạ đường/hạ áp nếu không theo dõi.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (15, 'Dữ liệu cấp hạn chế; dùng truyền thống.', 'Thiếu dữ liệu mạn; theo dõi gan–thận.', 'Thận trọng với thuốc độc gan.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (16, 'Tinh dầu thujone độc TK liều cao; dược liệu thường an toàn.', 'Tránh lạm dụng; thai kỳ thận trọng.', 'Có thể cảm ứng nhẹ CYP; thận trọng thuốc TK.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (17, 'Độc tính cấp thấp; dị ứng Asteraceae.', 'Hiếm quá mẫn.', 'Ít tương tác.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (18, 'Độc tính cấp thấp; dị ứng Asteraceae.', 'Hiếm quá mẫn.', 'Ít tương tác.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (19, 'Độc tính cấp thấp; an thần nhẹ.', 'Buồn ngủ; tránh lái xe.', 'Cộng hưởng benzodiazepine/thuốc ngủ/rượu.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (20, 'Độc tính cấp thấp.', 'Mất ngủ; theo dõi gan nếu liều cao.', 'Giảm tác dụng warfarin; hạ đường; kích thích với caffeine.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (21, 'Độc tính cấp thấp; an thần nhẹ.', 'Buồn ngủ; tránh lái xe.', 'Cộng hưởng benzodiazepine/thuốc ngủ/rượu.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (22, 'Chưa có LD50 chuẩn hóa; độc tính cấp tùy loài/đường dùng/chiết xuất; dùng đúng liều truyền thống thường an toàn.', 'Dữ liệu hạn chế; thận trọng khi dùng kéo dài/ có bệnh gan–thận; tránh thai kỳ nếu thiếu dữ liệu.', 'Tham khảo bác sĩ khi đang dùng thuốc kê đơn; tránh phối hợp thuốc chống đông/hạ đường/hạ áp nếu không theo dõi.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (23, 'Độc tính cấp thấp.', 'Lợi niệu—theo dõi điện giải.', 'Cộng hưởng lợi tiểu/hạ áp.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (24, 'Độc tính cấp thấp.', 'Lợi niệu—mất nước/điện giải nếu lạm dụng.', 'Cộng hưởng lợi tiểu.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (25, 'Chưa có LD50 chuẩn hóa; độc tính cấp tùy loài/đường dùng/chiết xuất; dùng đúng liều truyền thống thường an toàn.', 'Có thể tiêu chảy; thận trọng suy giáp.', 'Tham khảo bác sĩ khi đang dùng thuốc kê đơn; tránh phối hợp thuốc chống đông/hạ đường/hạ áp nếu không theo dõi.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (26, 'Độc tính cấp thấp.', 'Ảnh hưởng gan/thận ở liều rất cao (đv).', 'Tham khảo bác sĩ khi đang dùng thuốc kê đơn; tránh phối hợp thuốc chống đông/hạ đường/hạ áp nếu không theo dõi.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (27, 'Thiếu LD50 chuẩn; liều rất cao gây độc sinh sản (đv).', 'An toàn tương đối.', 'Thận trọng với thuốc lợi tiểu/độc thận .');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (28, 'Độc tính cấp thấp.', 'Kích ứng da/niêm mạc khi lặp lại.', 'Ít tương tác.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (29, 'Độc nếu uống; nguy cơ suy hô hấp ở trẻ nhỏ khi quá mức.', 'Thiếu dữ liệu; tránh thai kỳ.', 'Dùng ngoài—ít tương tác.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (30, 'Dữ liệu cấp hạn chế.', 'Dữ liệu hạn chế; thận trọng khi dùng kéo dài/ có bệnh gan–thận; tránh thai kỳ nếu thiếu dữ liệu.', 'Thận trọng thuốc độc gan.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (31, 'Chưa có LD50 chuẩn hóa; độc tính cấp tùy loài/đường dùng/chiết xuất; dùng đúng liều truyền thống thường an toàn.', 'Dữ liệu hạn chế; thận trọng khi dùng kéo dài/ có bệnh gan–thận; tránh thai kỳ nếu thiếu dữ liệu.', 'Tham khảo bác sĩ khi đang dùng thuốc kê đơn; tránh phối hợp thuốc chống đông/hạ đường/hạ áp nếu không theo dõi.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (32, 'Chưa có LD50 chuẩn hóa; độc tính cấp tùy loài/đường dùng/chiết xuất; dùng đúng liều truyền thống thường an toàn.', 'Dữ liệu hạn chế; thận trọng khi dùng kéo dài/ có bệnh gan–thận; tránh thai kỳ nếu thiếu dữ liệu.', 'Tham khảo bác sĩ khi đang dùng thuốc kê đơn; tránh phối hợp thuốc chống đông/hạ đường/hạ áp nếu không theo dõi.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (33, 'Chưa có LD50 chuẩn hóa; độc tính cấp tùy loài/đường dùng/chiết xuất; dùng đúng liều truyền thống thường an toàn.', 'Dữ liệu hạn chế; thận trọng khi dùng kéo dài/ có bệnh gan–thận; tránh thai kỳ nếu thiếu dữ liệu.', 'Tham khảo bác sĩ khi đang dùng thuốc kê đơn; tránh phối hợp thuốc chống đông/hạ đường/hạ áp nếu không theo dõi.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (34, 'Tinh dầu đậm đặc độc ở trẻ nhỏ; trà an toàn khi dùng thường.', 'Nặng hơn GERD; kích ứng niêm mạc.', 'Ảnh hưởng hấp thu do giãn cơ thắt TQ; thận trọng với antacid/PPI khi trào ngược.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (35, 'Chưa có LD50 chuẩn hóa; độc tính cấp tùy loài/đường dùng/chiết xuất; dùng đúng liều truyền thống thường an toàn.', 'Dữ liệu hạn chế; thận trọng khi dùng kéo dài/ có bệnh gan–thận; tránh thai kỳ nếu thiếu dữ liệu.', 'Tham khảo bác sĩ khi đang dùng thuốc kê đơn; tránh phối hợp thuốc chống đông/hạ đường/hạ áp nếu không theo dõi.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (36, 'Độc tính cấp thấp; tăng acid dạ dày.', 'Kích ứng dạ dày nếu nhiều.', 'Tăng hiệu ứng hạ lipid nhẹ (lý thuyết).');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (37, 'Độc tính cấp thấp; dị ứng họ Cúc.', 'Khó tiêu ở người sỏi mật.', 'Ảnh hưởng dòng mật; thận trọng thuốc thải qua mật.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (38, 'Chưa có LD50 chuẩn hóa; độc tính cấp tùy loài/đường dùng/chiết xuất; dùng đúng liều truyền thống thường an toàn.', 'Dữ liệu hạn chế; thận trọng khi dùng kéo dài/ có bệnh gan–thận; tránh thai kỳ nếu thiếu dữ liệu.', 'Tham khảo bác sĩ khi đang dùng thuốc kê đơn; tránh phối hợp thuốc chống đông/hạ đường/hạ áp nếu không theo dõi.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (39, 'Độc tính cấp thấp.', 'Khô miệng, ngứa; hiếm tăng chảy máu.', 'Cộng hưởng chống đông/kháng tiểu cầu.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (40, 'Độc tính cấp thấp ở liều ẩm thực.', 'Giả cường aldosteron (tăng HA, hạ K+) khi dùng nhiều/kéo dài.', 'Tăng độc tính digoxin (hạ K+); đối kháng lợi tiểu hạ K+; hiệp đồng corticoid.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (41, 'Độc tính cấp thấp.', 'Có thể tiêu chảy; thai kỳ sớm thận trọng.', 'Ít tương tác.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (42, 'Độc (Melia azedarach): độc TK/tiêu hóa.', 'Tổn thương gan–thận; **không dùng đường uống**.', 'Tránh mọi phối hợp; chỉ dùng ngoài theo chuyên môn.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (43, 'Độc tính cấp thấp; kích ứng dạ dày.', 'An toàn tương đối.', 'Ít tương tác.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (44, 'Thiếu LD50 chuẩn; liều rất cao gây độc sinh sản (đv).', 'Ảnh hưởng gan/thận ở liều rất cao (đv).', 'Thận trọng với thuốc lợi tiểu/độc thận (dữ liệu hạn chế).');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (45, 'Độc tính cấp thấp.', 'An toàn tương đối.', 'Ít tương tác.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (46, 'Bột/hạt kích ứng hô hấp khi hít.', 'Kích phát hen/viêm PQ khi phơi nhiễm kéo dài.', 'Dùng ngoài—ít tương tác; tránh uống.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (47, 'Chưa có LD50 chuẩn hóa; độc tính cấp tùy loài/đường dùng/chiết xuất; dùng đúng liều truyền thống thường an toàn.', 'Dữ liệu hạn chế; thận trọng khi dùng kéo dài/ có bệnh gan–thận; tránh thai kỳ nếu thiếu dữ liệu.', 'Tham khảo bác sĩ khi đang dùng thuốc kê đơn; tránh phối hợp thuốc chống đông/hạ đường/hạ áp nếu không theo dõi.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (48, 'Chưa có LD50 chuẩn hóa; độc tính cấp tùy loài/đường dùng/chiết xuất; dùng đúng liều truyền thống thường an toàn.', 'Dữ liệu hạn chế; thận trọng khi dùng kéo dài/ có bệnh gan–thận; tránh thai kỳ nếu thiếu dữ liệu.', 'Tham khảo bác sĩ khi đang dùng thuốc kê đơn; tránh phối hợp thuốc chống đông/hạ đường/hạ áp nếu không theo dõi.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (49, 'Độc tính cấp thấp.', 'Thiếu dữ liệu an toàn dài hạn.', 'Ít dữ liệu tương tác.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (50, 'Độc tính cấp thấp; liều cao kích ứng dạ dày.', 'Thường dung nạp tốt; ợ nóng/kích ứng.', 'Tăng nguy cơ chảy máu (warfarispirin/NSAID); có thể hạ đường.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (51, 'Chưa có LD50 chuẩn hóa; độc tính cấp tùy loài/đường dùng/chiết xuất; dùng đúng liều truyền thống thường an toàn.', 'Dữ liệu hạn chế; thận trọng khi dùng kéo dài/ có bệnh gan–thận; tránh thai kỳ nếu thiếu dữ liệu.', 'Tham khảo bác sĩ khi đang dùng thuốc kê đơn; tránh phối hợp thuốc chống đông/hạ đường/hạ áp nếu không theo dõi.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (52, 'Độc tính cấp thấp.', 'An toàn tương đối; theo dõi điện giải dài ngày.', 'Cộng hưởng hạ đường/hạ áp; thận trọng thuốc chuyển hóa qua gan.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (53, 'Độc tính cấp thấp; liều cao kích ứng dạ dày.', 'Thường dung nạp tốt; ợ nóng/kích ứng.', 'Tăng nguy cơ chảy máu (warfarispirin/NSAID); có thể hạ đường.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (54, 'Độc tính cấp thấp; liều cao kích ứng dạ dày.', 'Thường dung nạp tốt; ợ nóng/kích ứng.', 'Tăng nguy cơ chảy máu (warfarispirin/NSAID); có thể hạ đường.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (55, 'Chưa có LD50 chuẩn hóa; độc tính cấp tùy loài/đường dùng/chiết xuất; dùng đúng liều truyền thống thường an toàn.', 'Dữ liệu hạn chế; thận trọng khi dùng kéo dài/ có bệnh gan–thận; tránh thai kỳ nếu thiếu dữ liệu.', 'Tham khảo bác sĩ khi đang dùng thuốc kê đơn; tránh phối hợp thuốc chống đông/hạ đường/hạ áp nếu không theo dõi.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (56, 'Độc tính cấp thấp.', 'Thận trọng không dung nạp gluten.', 'Ít tương tác; có thể ảnh hưởng đường huyết.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (57, 'Độc tính cấp thấp; tăng acid dạ dày.', 'Kích ứng dạ dày; hiếm tăng men gan.', 'Tăng hiệu ứng hạ lipid nhẹ (lý thuyết).');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (58, 'Độc tính cấp thấp.', 'Có thể hạ đường nhẹ.', 'Cộng hưởng thuốc hạ đường (lý thuyết).');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (59, 'Chưa có LD50 chuẩn hóa; độc tính cấp tùy loài/đường dùng/chiết xuất; dùng đúng liều truyền thống thường an toàn.', 'Dùng kéo dài → lệ thuộc nhuận tràng, rối loạn điện giải.', 'Cộng hưởng nhuận tràng/ lợi tiểu/ digoxin (do hạ K+).');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (60, 'Chưa có LD50 chuẩn hóa; độc tính cấp tùy loài/đường dùng/chiết xuất; dùng đúng liều truyền thống thường an toàn.', 'Dữ liệu hạn chế; thận trọng khi dùng kéo dài/ có bệnh gan–thận; tránh thai kỳ nếu thiếu dữ liệu.', 'Tham khảo bác sĩ khi đang dùng thuốc kê đơn; tránh phối hợp thuốc chống đông/hạ đường/hạ áp nếu không theo dõi.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (61, 'Độc tính cấp thấp; liều cao kích ứng dạ dày.', 'Thường dung nạp tốt; ợ nóng/kích ứng.', 'Tăng nguy cơ chảy máu (warfarispirin/NSAID); có thể hạ đường.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (62, 'Tinh dầu đậm đặc độc ở trẻ nhỏ; trà an toàn khi dùng thường.', 'Nặng hơn GERD; kích ứng niêm mạc.', 'Ảnh hưởng hấp thu do giãn cơ thắt TQ; thận trọng với antacid/PPI khi trào ngược.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (63, 'Độc tính cấp thấp.', 'rối loạn tiêu hóa.', 'Ít tương tác đáng kể.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (64, 'Độc tính cấp thấp; kích ứng dạ dày nhẹ.', 'An toàn tương đối.', 'Ít tương tác.');
INSERT INTO "thaoduoc_doctinh" ("benh_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (65, 'Như cam thảo bắc.', 'Giả cường aldosteron khi dùng nhiều/kéo dài.', 'Tăng độc tính digoxin; đối kháng lợi tiểu hạ K+.');

-- Tạo bảng thaoduoc_thoigiantacdung
DROP TABLE IF EXISTS "thaoduoc_thoigiantacdung" CASCADE;
CREATE TABLE "thaoduoc_thoigiantacdung" (
  "benh_sk" INTEGER,
  "thaoduoc_sk" INTEGER,
  "thoi_gian_phat_huy_tac_dung" VARCHAR(255),
  "thoi_gian_het_tac_dung_phu" VARCHAR(255)
);

-- Dữ liệu bảng thaoduoc_thoigiantacdung (63 dòng)
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (1, 1, '30 phút – 2 giờ', '4–6 giờ');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (2, 2, '15 – 30 phút', '6–8 giờ');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (3, 3, '30 phút – vài giờ', '4–6 giờ');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (4, 4, '30 phút – 2 giờ', '4–6 giờ');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (5, 5, 'Tùy liều lượng, mục đích', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (6, 5, 'Tùy liều lượng, mục đích', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (7, 6, 'Tùy liều lượng, mục đích', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (8, 7, 'Tùy liều lượng, mục đích', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (9, 8, 'Tùy liều lượng, mục đích', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (10, 9, 'Tùy liều lượng, mục đích', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (11, 10, 'Sau vài ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (12, 11, 'Sau 1–2 tuần', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (13, 12, 'Sau vài ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (14, 13, 'Sau 3–5 ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (15, 14, 'Sau 5–7 ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (16, 15, NULL, NULL);
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (17, 16, 'Sau vài ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (18, 16, 'Sau vài ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (19, 17, 'Sau 3–7 ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (20, 18, 'Sau vài ngày đến 1 tuần', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (21, 17, 'Sau 3–7 ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (22, 19, 'Sau 3–5 ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (23, 20, 'Sau 3–7 ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (24, 21, 'Sau vài ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (25, 19, 'Sau 3–5 ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (26, 22, 'Sau 3–5 ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (27, 23, 'Sau 2–4 ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (28, 24, 'Sau 2–3 ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (29, 25, 'Gần như ngay', 'Vài giờ');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (30, 26, 'Sau 3–5 ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (31, 27, '1–3 ngày', '24–48 giờ');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (32, 28, 'Vài phút', 'Vài giờ');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (33, 28, 'Vài phút', 'Vài giờ');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (34, 2, '15 – 30 phút', '6–8 giờ');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (35, 29, 'Sau vài ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (36, 30, 'Sau 30 phút – vài giờ', '6–12 giờ');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (37, 31, 'Sau 1–2 ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (38, 32, 'Sau vài ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (39, 33, 'Sau 1–2 tuần', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (40, 34, '1–2 giờ', '6–12 giờ');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (41, 35, 'Sau 1–3 ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (42, 36, 'Ít dùng nội', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (43, 37, '30 phút – vài giờ', '6–12 giờ');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (44, 23, 'Sau 2–4 ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (45, 24, 'Sau 2–3 ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (46, 38, 'Sau vài giờ', '1 ngày');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (47, 39, 'Sau 1–2 tuần', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (48, 40, 'Sau 3–5 ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (49, 41, 'Sau 5–7 ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (51, 13, 'Sau 3–5 ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (51, 43, '15–30 phút', '4–6 giờ');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (53, 1, '30 phút – 2 giờ', '4–6 giờ');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (55, 32, 'Sau vài ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (56, 45, 'Sau vài giờ', '6–8 giờ');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (57, 30, 'Sau 30 phút – vài giờ', '6–12 giờ');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (58, 46, '1–2 giờ', '6–8 giờ');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (59, 47, 'Sau 1–3 ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (60, 27, '1–3 ngày', '24–48 giờ');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (61, 1, '30 phút – 2 giờ', '4–6 giờ');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (62, 2, '30 phút – 2 giờ', '4–6 giờ');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (63, 3, '30 phút – vài giờ', '4–6 giờ');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (64, 48, 'Sau vài ngày', 'Tùy liều lượng, mục đích');
INSERT INTO "thaoduoc_thoigiantacdung" ("benh_sk", "thaoduoc_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (65, 49, '1–2 giờ', '6–12 giờ');

-- Tạo bảng thuoctay_dacdiemnguongoc
DROP TABLE IF EXISTS "thuoctay_dacdiemnguongoc" CASCADE;
CREATE TABLE "thuoctay_dacdiemnguongoc" (
  "thuoctay_sk" INTEGER,
  "nguon_goc" VARCHAR(255),
  "do_tinh_khiet" VARCHAR(255),
  "chi_phi" VARCHAR(255),
  "kha_nang_ung_dung_lam_sang" TEXT
);

-- Dữ liệu bảng thuoctay_dacdiemnguongoc (73 dòng)
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (1, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp', 'dùng phổ biến để giảm đau/hạn chế triệu chứng');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (2, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp', 'dùng phổ biến để giảm đau/hạn chế triệu chứng');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (3, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp–trung bình', 'ứng dụng lâm sàng phổ biến');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (4, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp–trung bình', 'ứng dụng lâm sàng phổ biến');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (5, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp–trung bình', 'điều trị dạ dày, trào ngược');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (6, 'Tổng hợp', 'Tiêu chuẩn Dược điển', 'Thấp (Generic)', 'GERD, Loét dạ dày');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (7, 'Tổng hợp', 'Tiêu chuẩn Dược điển', 'Thấp (Generic)', 'GERD, Loét dạ dày');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (8, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp–trung bình', 'điều trị dạ dày, trào ngược');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (9, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá trung bình', '');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (10, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp–trung bình', 'ứng dụng lâm sàng phổ biến');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (11, 'Tổng hợp', 'Tiêu chuẩn Dược điển', 'Thấp', 'Trị tiêu chảy cấp');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (12, 'Bán tổng hợp', 'Tiêu chuẩn Dược điển', 'Cao', 'IBS-D, Tiêu chảy du lịch, Bệnh não gan');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (13, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP/BP)', 'Giá thấp–trung bình', 'ứng dụng lâm sàng phổ biến');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (14, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá trung bình', 'dùng trong bệnh hô hấp (hen/COPD)');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (15, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp–trung bình', 'điều trị mạn tính (tim mạch/đái tháo đường)');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (16, 'Tổng hợp', 'Tiêu chuẩn Dược điển', 'Thấp', 'Đái tháo đường type 2');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (17, 'Sinh học (Tái tổ hợp)', 'Tiêu chuẩn Dược điển (Sinh học)', 'Cao/Rất cao', 'Đái tháo đường (Type 1 & 2)');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (18, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp–trung bình', 'điều trị mạn tính (tim mạch/đái tháo đường)');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (20, 'Tổng hợp', 'Tiêu chuẩn Dược điển', 'Thấp', 'Tăng huyết áp, Phù');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (21, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp–trung bình', 'điều trị mạn tính (tim mạch/đái tháo đường)');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (22, 'Tổng hợp', 'Tiêu chuẩn Dược điển', 'Trung bình', 'Rối loạn mỡ máu');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (23, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá trung bình', 'NSAID chọn lọc COX-2');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (24, 'Tự nhiên', 'Tiêu chuẩn TPCN/Dược', 'Trung bình', 'Hỗ trợ viêm khớp');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (25, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá trung bình–cao', 'dùng trong bệnh lý nặng/miễn dịch');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (26, 'Sinh học (Tái tổ hợp)', 'Tiêu chuẩn Dược điển (Sinh học)', 'Rất cao', 'Bệnh tự miễn (Viêm khớp, Crohn''s)');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (27, 'Tổng hợp / phối hợp', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá trung bình', 'dùng trong bệnh hô hấp (hen/COPD)');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (28, 'Tổng hợp / phối hợp', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá trung bình', 'dùng trong bệnh hô hấp (hen/COPD)');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (29, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp', 'corticoid cho đợt cấp/viêm');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (30, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp–trung bình', 'ứng dụng lâm sàng phổ biến');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (31, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp', 'giải lo âu ngắn hạn (cần kiểm soát)');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (32, 'Tổng hợp', 'Tiêu chuẩn Dược điển', 'Thấp (Generic)', 'Trầm cảm, Rối loạn lo âu');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (33, 'Tổng hợp', 'Tiêu chuẩn Dược điển', 'Thấp (Generic)', 'Trầm cảm, Rối loạn lo âu');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (34, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp–trung bình', 'kháng sinh phổ biến');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (35, 'Tổng hợp / phối hợp', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp–trung bình', 'ứng dụng lâm sàng phổ biến');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (36, 'Hóa dược / Khoáng chất', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp–trung bình', 'ứng dụng lâm sàng phổ biến');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (37, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp–trung bình', 'ứng dụng lâm sàng phổ biến');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (38, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp–trung bình', 'kháng sinh phổ biến');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (39, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp–trung bình', 'kháng sinh phổ biến');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (40, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp–trung bình', 'dùng tại chỗ cho nhiễm khuẩn/virus');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (41, 'Tổng hợp', 'Tiêu chuẩn Dược điển', 'Trung bình', 'Nấm da, nấm móng');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (42, 'Tổng hợp hóa học / chống nhiễm khuẩn', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp–trung bình', 'dùng tại chỗ cho nhiễm khuẩn/virus');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (43, 'Hóa chất sát khuẩn/topical', 'Cấp dược phẩm/độ tinh khiết tiêu chuẩn', 'Giá trung bình', 'dùng bôi tại chỗ cho bỏng');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (44, 'Tự nhiên', 'Tiêu chuẩn TPCN/Mỹ phẩm', 'Thấp', 'Làm dịu da (bỏng), hỗ trợ tiêu hóa');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (45, 'Hóa chất sát khuẩn/topical', 'Cấp dược phẩm/độ tinh khiết tiêu chuẩn', 'Giá thấp', 'sát khuẩn/khử trùng tại chỗ');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (46, 'Tổng hợp', 'Tiêu chuẩn tiêu dùng', 'Rất thấp', 'Ngừa sâu răng');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (47, 'Hóa chất sát khuẩn', 'Cấp dược phẩm/độ tinh khiết tiêu chuẩn', 'Giá thấp', 'sát khuẩn/khử trùng tại chỗ');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (48, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá trung bình', 'hỗ trợ giảm cân (kèm theo thay đổi lối sống)');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (49, 'Tổng hợp', 'Tiêu chuẩn Dược điển', 'Trung bình', 'Điều trị béo phì (ngắn hạn)');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (50, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp–trung bình', 'dùng tại chỗ cho nhiễm khuẩn/virus');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (51, 'Tổng hợp', 'Tiêu chuẩn Dược điển', 'Trung bình', 'Trị mụn rộp môi (Herpes)');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (52, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá trung bình', 'thuốc kháng virus');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (53, 'Hóa dược / Khoáng chất', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp', 'dùng cho rối loạn tiêu hoá/nhuận tràng');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (54, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp', 'dùng cho rối loạn tiêu hoá/nhuận tràng');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (55, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp', 'corticoid cho đợt cấp/viêm');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (56, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp–trung bình', 'kháng sinh phổ biến');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (57, 'Bán tổng hợp', 'Tiêu chuẩn Dược điển', 'Thấp', 'Nhiễm khuẩn tụ cầu (Staph)');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (58, 'Hóa dược / Khoáng chất', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp', 'dùng cho rối loạn tiêu hoá/nhuận tràng');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (59, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp–trung bình', 'ứng dụng lâm sàng phổ biến');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (60, 'Tự nhiên (Khoáng chất)', 'Tiêu chuẩn Dược điển/TPCN', 'Thấp', 'Bổ sung, kháng acid');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (61, 'Tự nhiên/Tổng hợp', 'Tiêu chuẩn Dược điển/TPCN', 'Thấp', 'Bổ sung, còi xương');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (62, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp–trung bình', 'ứng dụng lâm sàng phổ biến');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (63, 'Tổng hợp', 'Tiêu chuẩn Dược điển', 'Trung bình', 'Co thắt cơ, đau cơ');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (64, 'Tổng hợp', 'Tiêu chuẩn Dược điển', 'Thấp', 'Giảm đau, kháng viêm');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (65, 'Tổng hợp', 'Tiêu chuẩn Dược điển', 'Thấp', 'Giảm đau, hạ sốt, kháng viêm');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (66, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá trung bình', 'thuốc kháng virus');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (67, 'Tổng hợp', 'Tiêu chuẩn Dược điển', 'Trung bình', 'Điều trị HIV, Viêm gan B');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (68, 'Tổng hợp', 'Tiêu chuẩn Dược điển', 'Trung bình/Cao', 'Điều trị Viêm gan B');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (69, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp–trung bình', 'điều trị mạn tính (tim mạch/đái tháo đường)');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (70, 'Sinh học tự nhiên được tinh chế', 'Cấp dược phẩm sinh học; tinh khiết cao', 'Giá cao', 'ức chế miễn dịch, dùng trong ghép tạng và bệnh tự miễn');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (71, 'Tự nhiên (Nấm)', 'Tiêu chuẩn Dược điển', 'Rất cao', 'Chống thải ghép, bệnh tự miễn');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (72, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá thấp', 'Dùng phổ biến để giảm dị ứng, ngứa, hắt hơi, sổ mũi');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (73, 'Tổng hợp hóa học', 'Cấp dược phẩm; độ tinh khiết cao (USP/EP)', 'Giá trung bình', 'Dùng để long đờm, giải độc gan, và chống oxy hóa');
INSERT INTO "thuoctay_dacdiemnguongoc" ("thuoctay_sk", "nguon_goc", "do_tinh_khiet", "chi_phi", "kha_nang_ung_dung_lam_sang") VALUES (74, 'Tổng hợp', 'Tiêu chuẩn Dược điển', 'Thấp', 'Giải độc Paracetamol, tiêu đờm');

-- Tạo bảng thuoctay_doctinh
DROP TABLE IF EXISTS "thuoctay_doctinh" CASCADE;
CREATE TABLE "thuoctay_doctinh" (
  "thuoctay_sk" INTEGER,
  "doc_tinh_cap_tinh_ld50" VARCHAR(255),
  "doc_tinh_man_tinh" TEXT,
  "tuong_tac_thuoc_thao_duoc" TEXT
);

-- Dữ liệu bảng thuoctay_doctinh (73 dòng)
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (1, 'Quá liều → độc gan cấp', 'Độc gan tích lũy khi dùng kéo dài/quá liều', 'Rượu/“cam thảo bắc”, “hà thủ ô đỏ” (nguy cơ gan); diệp hạ châu (lý thuyết ảnh hưởng men gan)');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (2, 'Kích ứng/loét dạ dày, suy thận cấp (mất nước)', 'Tăng nguy cơ tim mạch/loét/độc thận khi dùng dài', 'Gừng, đương quy, linh chi… ↑ chảy máu; “cam thảo bắc” (hạ K+) có thể ↑ độc tính tim mạch');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (3, 'An thần, kháng cholinergic cấp', 'Sa sút nhận thức nếu lạm dụng', 'Kết hợp lạc tiên ↑ an thần; rượu/thảo dược an thần khác (lạc tiên, linh chi)');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (4, 'Buồn nôn', 'Ít', 'Tương tác đáng kể: hiếm');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (5, 'Đau đầu, tiêu chảy', 'Thiếu Mg/B12, ↑ nhiễm trùng ruột', '↓ hấp thu sắt, canxi cacbonat, nấm men; antacid/thảo dược kiềm dạ dày ảnh hưởng hấp thu thuốc khác');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (6, 'Đau đầu, tiêu chảy', 'Thiếu Mg/B12, ↑ nhiễm trùng ruột', '↓ hấp thu sắt, canxi cacbonat, nấm men; antacid/thảo dược kiềm dạ dày ảnh hưởng hấp thu thuốc khác');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (7, 'Đau đầu, tiêu chảy', 'Thiếu Mg/B12, ↑ nhiễm trùng ruột', '↓ hấp thu sắt, canxi cacbonat, nấm men; antacid/thảo dược kiềm dạ dày ảnh hưởng hấp thu thuốc khác');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (8, 'Như PPI', 'Như PPI', 'Như PPI');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (9, 'Như PPI', 'Như PPI', 'Như PPI');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (10, 'Kháng cholinergic (khô miệng, bí tiểu)', 'Rối loạn nhận thức người già', 'Lạc tiên/linh chi ↑ an thần; tránh thảo dược kháng cholinergic (hiếm)');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (11, 'Táo bón, loạn nhịp nếu quá liều', 'Liệt ruột (lạm dụng)', 'Thảo dược gây tiêu chảy (nha đam latex, quyết minh tử) làm bạn tăng liều nguy hiểm');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (12, 'Ít tác dụng toàn thân', 'Rất ít', 'Hấp thu thấp → ít tương tác thảo dược');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (13, 'Lú lẫn, kích động; serotonin syndrome (phối hợp MAOI/SSRI)', 'Lạm dụng → tác dụng bất lợi lên hệ Thần Kinh', 'Nhân sâm (lý thuyết) ↑ serotonin; tránh phối hợp thảo dược an thần mạnh');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (14, 'Run tay, hồi hộp', 'Nhịp nhanh kéo dài ở người nhạy', 'Nhân sâm/cam thảo bắc có thể ↑ HA; “cam thảo bắc” hạ K+ ↑ loạn nhịp');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (15, 'Hạ đường, tiêu chảy', 'Hiếm nhiễm toan lactic (suy thận)', 'Dây thìa canh, giảo cổ lam, sắn dây ↑ hạ đường; diệp hạ châu có thể ảnh hưởng men gan');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (16, 'Hạ đường, tiêu chảy', 'Tăng cân, hạ đường tái diễn', '');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (17, 'Hạ đường, tiêu chảy', 'Tăng cân, hạ đường tái diễn', '');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (18, 'Phù ngoại biên, đỏ bừng', 'Lợi phù kéo dài', 'Cam thảo bắc (tăng HA) đối kháng hiệu quả; giảo cổ lam (nhẹ) ↓ HA thêm');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (20, 'Hạ Na/K, chóng mặt', 'Tăng acid uric/glucose', 'hạ K+ (mâu thuẫn nhưng dễ loạn điện giải); thận trọng thảo dược lợi niệu');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (21, 'Tăng men gan, đau cơ', 'Hiếm tiêu cơ vân', 'Hà thủ ô đỏ, cam thảo bắc (nguy cơ gan) ↑ độc gan');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (22, 'Như statin', 'Điều chỉnh liều suy thận', 'bưởi (không phải thảo dược VN phổ biến)');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (23, 'Ít loét cấp hơn NSAID thường', 'Nguy cơ tim mạch; thận', 'Như NSAID (chảy máu thấp hơn nhưng vẫn thận trọng với gừng/đương quy)');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (24, 'Buồn nôn', 'Tăng đường nhẹ (hiếm)', 'Warfarin (không phải thảo dược) có thể ↑ INR; thảo dược chống đông (gừng/đương quy) cần thận trọng');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (25, 'Ức tủy, buồn nôn', 'Độc gan, xơ gan; phổi', 'Hà thủ ô đỏ, cam thảo bắc ↑ độc gan; diệp hạ châu/“bảo gan” không thay thế theo dõi men gan');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (26, 'Phản vệ, nhiễm trùng cấp', 'Nhiễm trùng', 'Thảo dược kích miễn dịch (nhân sâm/hoàng kỳ) có thể làm sai lệch đáp ứng; tránh cây thuốc gây nhiễm trùng da');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (27, 'Tức ngực run tay; nấm miệng', 'Ức chế trục HPA (cao liều, kéo dài)', 'Súc miệng sau dùng; cam thảo bắc (corticoid-like) ↑ ADR chuyển hóa');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (28, 'Khô miệng, bí tiểu', 'Glaucoma góc hẹp nặng hơn (hiếm)', 'Ít tương tác thảo dược có ý nghĩa');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (29, 'Tăng đường, giữ muối nước, kích động', 'Loãng xương, loét, đục thủy tinh thể', 'Cam thảo bắc ↑ giữ muối nước/hạ K+; nhân sâm ↑ đường huyết; gừng/đương quy ↑ chảy máu khi phối hợp NSAID');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (30, 'Quá liều → độc gan cấp', 'Độc gan tích lũy khi dùng kéo dài/quá liều', 'Rượu/“cam thảo bắc”, “hà thủ ô đỏ” (nguy cơ gan); diệp hạ châu (lý thuyết ảnh hưởng men gan)');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (31, 'An thần, ức chế hô hấp (phối hợp rượu/opioid)', 'Lệ thuộc, cai thuốc', 'Lạc tiên, linh chi ↑ an thần; cam thảo bắc (hạ K+) có thể ↑ ADR tim mạch gián tiếp');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (32, 'Buồn nôn, kích thích; hội chứng serotonin (phối hợp sai)', 'Rối loạn tình dục, rối loạn giấc ngủ', 'Nhân sâm, St. John’s wort (không dùng) ↑ serotonin (lý thuyết); gừng ↑ chảy máu khi dùng cùng NSAID/SSRI');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (33, 'Như SSRI', 'Kéo dài QT (hiếm)', 'Như SSRI');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (34, 'Buồn nôn, tiêu chảy', 'Viêm gan ứ mật (hiếm)', 'Như amoxicillin; thảo dược độc gan (hà thủ ô) tránh phối hợp');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (35, 'Chảy máu mũi, kích ứng', 'Ức chế HPA hiếm', 'Cam thảo bắc (tác dụng giống corticoid) ↑ ADR chuyển hóa');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (36, 'Buồn nôn/táo bón', 'Quá tải sắt (hiếm)', 'Tanin (lá ổi, trà), PPI/H2RA/antacid ↓ hấp thu; vitamin C ↑ hấp thu');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (37, 'Hạ huyết áp tư thế, chóng mặt, ngất', 'Thường dung nạp tốt; chóng mặt', 'Thảo dược hạ áp/lợi niệu (giảo cổ lam, kim tiền thảo, trạch tả…) có thể tăng tụt HA; cam thảo bắc (tăng HA, hạ K⁺) có thể giảm hiệu quả hoặc làm rối loạn điện giải.');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (38, 'Dị ứng, tiêu chảy', 'Viêm đại tràng giả mạc (hiếm)', 'Tanin (lá ổi, trà) ↓ hấp thu; probiotics/thảo dược chứa men có thể giảm rối loạn ruột');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (39, 'Buồn nôn; QT dài (hiếm)', 'Ít', 'Ít tương tác thảo dược có ý nghĩa; tránh thảo dược kéo dài QT (hiếm)');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (40, 'Kích ứng', 'Ít', 'Tại chỗ—ít; đường ngậm có thể tương tác warfarin (hiếm)');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (41, 'Kích ứng', 'Ít', 'Bôi—ít; đường uống: ↑ men gan, tương tác CYP2D6');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (42, 'Kích ứng Ít', 'Đường uống/âm đạo có thể ↑ warfarin; bôi da ít', '');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (43, 'Dị ứng sulfa', 'Rất ít', 'Tại chỗ—ít tương tác');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (44, 'Dị ứng', 'Rất ít', 'ít tương tác');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (45, 'Kích ứng, phản vệ hiếm', 'Nhuộm răng', 'Tại chỗ—ít tương tác');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (46, 'Nuốt nhiều → buồn nôn', 'Fluorosis (trẻ, lạm dụng)', 'ít tương tác');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (47, 'Kích ứng/loét niêm mạc nếu lạm dụng', 'Mất cân bằng vi sinh', 'Tại chỗ—ít tương tác');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (48, 'Tiêu chảy dầu', 'Thiếu vitamin A/D/E/K', 'Thảo dược tan trong mỡ (tinh dầu) ↓ hấp thu; cần bổ sung vitamin xa liều');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (49, 'Kích thích, mất ngủ', 'Tăng HA, lệ thuộc', 'Nhân sâm/caffeine (không phải thảo dược bạn nêu) ↑ kích thích; thận trọng hoàng kỳ');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (50, 'Buồn nôn; kết tinh thận (IV/thiếu nước)', 'Thần kinh ảnh hưởng (liều cao/suy thận)', 'Thảo dược độc thận (lá xoan—không dùng) tăng nguy cơ; diếp cá (dữ liệu hạn chế)');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (51, 'Kích ứng da', 'Thần kinh ảnh hưởng (liều cao/suy thận)', 'Thảo dược độc thận (lá xoan—không dùng) tăng nguy cơ; diếp cá (dữ liệu hạn chế)');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (52, 'Buồn nôn; kết tinh thận (IV/thiếu nước)', 'Thần kinh ảnh hưởng (liều cao/suy thận)', 'Thảo dược độc thận (lá xoan—không dùng) tăng nguy cơ; diếp cá (dữ liệu hạn chế)');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (53, 'Đầy bụng', 'Rối loạn điện giải (lạm dụng)', 'Giảm hấp thu thuốc nếu uống gần nhau');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (54, 'Đau quặn bụng', 'Lệ thuộc nhuận tràng', 'Nha đam latex, quyết minh tử ↑ tác dụng, hạ K+');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (55, 'Kích ứng, teo da (lạm dụng)', 'Ức HPA hiếm', 'Cam thảo bắc (tác dụng giống corticoid) ↑ ADR khi dùng lâu');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (56, 'Dị ứng, tiêu chảy', 'Hiếm độc thận', 'Tanin (lá ổi, trà) ↓ hấp thu');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (57, 'Buồn nôn', 'Như beta-lactam', 'Tanin (lá ổi, trà) ↓ hấp thu');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (58, 'Đen lưỡi/phân', 'Nguy cơ chảy máu (salicylate)', 'Gừng/đương quy/linh chi ↑ chảy máu');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (59, 'Viêm/loét thực quản,Táo bón, sỏi (thừa)', 'Hoại tử xương hàm (hiếm) ,Tăng Ca máu (hiếm)', 'Canxi/antacid ↓ hấp thu; uống lúc đói với nước, PPI ↓ hấp thu CaCO₃; tách thời gian với sắt/kháng sinh');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (60, 'Táo bón, sỏi (thừa)', 'Tăng Ca máu (hiếm)', 'Canxi/antacid ↓ hấp thu; uống lúc đói với nước,PPI ↓ hấp thu CaCO₃; tách thời gian với sắt/kháng sinh');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (61, 'Táo bón, sỏi (thừa)', 'Tăng Ca máu (hiếm)', 'Canxi/antacid ↓ hấp thu; uống lúc đói với nước,PPI ↓ hấp thu CaCO₃; tách thời gian với sắt/kháng sinh');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (62, 'An thần, lẫn lộn', 'Lệ thuộc (chuyển thành meprobamate)', 'Lạc tiên/linh chi ↑ an thần');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (63, 'Kháng cholinergic, an thần', 'Rối loạn nhận thức', 'Lạc tiên/linh chi ↑ an thần');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (64, 'Như NSAID; nguy cơ tim mạch', 'Tăng men gan; thận', 'Như NSAID: thảo dược ↑ chảy máu (gừng/đương quy/linh chi)');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (65, 'Như NSAID', 'Loét/độc thận', 'Như NSAID: thảo dược ↑ chảy máu (gừng/đương quy/linh chi)');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (66, 'Hội chứng cúm', 'Trầm cảm, giảm bạch cầu/tiểu cầu', 'Thảo dược an thần (lạc tiên) cần thận trọng; gan/thận yếu tránh độc tính,Tránh thảo dược độc thận (lá xoan…); diệp hạ châu (theo dõi men gan)');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (67, 'Buồn nôn', 'Độc thận, mất xương (TDF>TAF)', 'Tránh thảo dược độc thận (lá xoan…); diệp hạ châu (theo dõi men gan)');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (68, 'Buồn nôn', 'Điều chỉnh liều suy thận', 'Tránh thảo dược độc thận (lá xoan…); diệp hạ châu (theo dõi men gan)');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (69, 'An toàn', 'An toàn', 'Tương tác không đáng kể');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (70, 'Kích ứng nhẹ', 'An toàn', 'Hầu như không tương tác thảo dược');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (71, 'Nóng rát mắt', 'Hấp thu toàn thân rất thấp', 'Hầu như không tương tác thảo dược');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (72, 'An thần, kháng cholinergic', 'Sa sút nhận thức nếu lạm dụng', 'Kết hợp lạc tiên ↑ an thần; rượu/thảo dược an thần khác (lạc tiên, linh chi)');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (73, 'Buồn nôn, khó chịu tiêu hóa', 'Nói chung an toàn khi dùng theo liều', 'Ít tương tác đáng kể');
INSERT INTO "thuoctay_doctinh" ("thuoctay_sk", "doc_tinh_cap_tinh_ld50", "doc_tinh_man_tinh", "tuong_tac_thuoc_thao_duoc") VALUES (74, 'Khí dung: co thắt phế quản, vị/mùi khó chịu, buồn nôn', 'Nói chung an toàn khi dùng theo liều', 'Tăng tác dụng giãn mạch của nitroglycerin → tụt HA, nhức đầu');

-- Tạo bảng thuoctay_thoigiantacdung
DROP TABLE IF EXISTS "thuoctay_thoigiantacdung" CASCADE;
CREATE TABLE "thuoctay_thoigiantacdung" (
  "benh_sk" INTEGER,
  "thuoctay_sk" INTEGER,
  "thoi_gian_phat_huy_tac_dung" VARCHAR(255),
  "thoi_gian_het_tac_dung_phu" VARCHAR(255)
);

-- Dữ liệu bảng thuoctay_thoigiantacdung (77 dòng)
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (1, 1, '~30 phút', '1–2 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (1, 30, '~30 phút', '1–2 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (2, 2, '30 – 60 phút', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (3, 14, '3–5 phút', '2–4 giờ');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (3, 27, '10–20 phút (salmeterol)', '1–2 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (4, 4, '~30 phút', '<1 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (4, 34, 'Cải thiện triệu chứng 24–72 giờ', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (5, 5, '~1 giờ; tối đa sau vài ngày dùng đều', 'Rất sớm');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (5, 7, '1 giờ', '1–2 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (6, 8, '~1 giờ; tối đa sau vài ngày dùng đều', '3–5 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (7, 10, '30–60 phút', '1 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (7, 12, 'Lâm sàng: vài ngày', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (8, 53, '24–72 giờ', '1 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (8, 54, '6–12 giờ', '1 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (9, 11, '1 giờ', '1–2 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (10, 15, 'Cải thiện trong vài ngày; tối đa 1–2 tuần', '1–2 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (10, 16, '30 phút', '1 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (10, 17, 'Tùy loại', '3–6 giờ với loại nhanh, 1 ngày với loại dài.');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (11, 18, '24–48 giờ', '2–5 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (12, 21, 'Vài ngày; tối đa 2–4 tuần', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (12, 22, 'Vài ngày; tối đa 2–4 tuần', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (13, 23, '~1 giờ', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (13, 24, '2–4 tuần', '1–2 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (14, 25, '4–6 tuần', 'Vài tuần; độc tính gan/tủy có thể kéo dài');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (14, 26, '2–12 tuần', 'Vài tuần');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (15, 29, '1–4 giờ', 'Vài ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (15, 65, '~1 giờ', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (16, 62, '30 phút', '1 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (16, 65, '~1 giờ', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (17, 2, '30 – 60 phút', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (18, 30, '~30 phút', '1–2 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (19, 31, '30–60 phút', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (19, 32, 'Cải thiện 1–2 tuần; tối đa 4–6 tuần', '1–2 tuần');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (20, 32, 'Cải thiện 1–2 tuần; tối đa 4–6 tuần', '1–2 tuần');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (20, 33, 'Cải thiện 1–2 tuần; tối đa 4–6 tuần', '1–2 tuần');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (21, 31, '30–60 phút', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (22, 36, 'Tăng Hb sau 2–4 tuần', 'Tạm thời, giảm khi quen với thuốc');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (23, 2, '30 – 60 phút', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (23, 37, '2–4 giờ; tối đa 3–5 ngày', 'Vài ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (24, 37, '2–4 giờ; tối đa 3–5 ngày', 'Vài ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (25, 2, '30 – 60 phút', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (25, 65, '~1 giờ', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (26, 25, '4–6 tuần', 'Vài tuần; độc tính gan/tủy có thể kéo dài');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (26, 26, '2–12 tuần', 'Vài tuần');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (27, 57, '24–72 giờ', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (28, 55, '1–2 giờ', '1–2 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (29, 40, 'Vài giờ–vài ngày', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (29, 41, 'Vài ngày–tuần', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (31, 43, 'Tại chỗ: gần như ngay', 'Vài giờ đến 1 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (31, 44, 'Phút–giờ', 'Vài giờ');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (32, 2, '30 – 60 phút', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (33, 45, 'Gần như ngay', 'Vài giờ');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (35, 35, '6–12 giờ; tối đa vài ngày', '1–2 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (35, 72, '1–2 giờ', '12–24 giờ');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (36, 48, '1–2 ngày', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (36, 49, '1–3 giờ', '1–2 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (38, 36, 'Tăng Hb sau 2–4 tuần', 'Tạm thời, giảm khi quen với thuốc');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (38, 61, 'Ngày–tuần', 'Vài ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (39, 61, 'Ngày–tuần', 'Vài ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (40, 50, '1–2 ngày cải thiện', '1–2 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (41, 52, '1–2 ngày cải thiện', '1–2 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (44, 55, '1–2 giờ', '1–2 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (45, 56, '24–72 giờ', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (45, 57, '24–72 giờ', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (48, 59, 'Vài tuần–tháng', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (48, 60, 'Hấp thu trong giờ; hiệu quả lâm sàng: dài hạn', 'Vài ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (48, 61, 'Ngày–tuần', 'Vài ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (50, 60, 'Hấp thu trong giờ; hiệu quả lâm sàng: dài hạn', 'Vài ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (51, 65, '~1 giờ', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (51, 67, 'Đáp ứng virus: tuần–tháng', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (51, 68, 'Đáp ứng virus: tuần–tháng', '1–3 ngày');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (53, 3, '15–60 phút', '12–24 giờ');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (56, 69, 'Gần như ngay', 'Rất sớm');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (59, 70, 'Ngay', 'Vài giờ');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (61, 72, '1–2 giờ', '12–24 giờ');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (63, 13, '15 – 30 phút', '6–12 giờ');
INSERT INTO "thuoctay_thoigiantacdung" ("benh_sk", "thuoctay_sk", "thoi_gian_phat_huy_tac_dung", "thoi_gian_het_tac_dung_phu") VALUES (64, 74, '30–60 phút', '<1 ngày');

-- Tạo bảng trieu_chung
DROP TABLE IF EXISTS "trieu_chung" CASCADE;
CREATE TABLE "trieu_chung" (
  "benh_sk" INTEGER,
  "trieu_chung" TEXT,
  "link_trieu_chung" TEXT
);

-- Dữ liệu bảng trieu_chung (65 dòng)
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (7, 'Đau bụng âm ỉ, đầy hơi, sình bụng, rối loạn đi tiêu (lúc táo, lúc tiêu chảy), giảm đau sau khi đi ngoài.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (19, 'Cảm giác bồn chồn, lo lắng quá mức, tim đập nhanh, khó tập trung, rối loạn giấc ngủ, có thể khó thở.', 'https://www.google.com/search?q=site:vinmec.com+roi+loan+lo+au');
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (20, 'Buồn bã dai dẳng, mất hứng thú, mệt mỏi, rối loạn ngủ, giảm tập trung, có thể suy nghĩ tiêu cực về bản thân.', 'https://www.google.com/search?q=site:vinmec.com+tram+cam');
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (21, 'Khó vào giấc, dễ tỉnh giữa đêm, ngủ không sâu, dậy sớm, ban ngày mệt mỏi, thiếu tập trung.', 'https://www.google.com/search?q=site:vinmec.com+mat+ngu');
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (22, 'Da xanh, mệt mỏi, chóng mặt, nhịp tim nhanh, khó thở khi gắng sức, móng tay giòn, rụng tóc.', 'https://www.google.com/search?q=site:vinmec.com+thieu++mau+thieu+sat');
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (6, 'Ợ nóng sau ăn, cảm giác nóng rát sau xương ức, ợ chua, nuốt vướng, ho hoặc khàn tiếng về đêm.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (51, 'Đau dọc theo gân khi vận động, ấn đau, có thể sưng nhẹ, cứng khớp buổi sáng.', 'https://www.google.com/search?q=site:vinmec.com+viem+gan+gan+co');
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (61, 'Ho kèm sổ mũi, nghẹt mũi, nước mũi trong, sợ lạnh, đau họng nhẹ, thường sau khi bị lạnh.', 'https://www.google.com/search?q=site:vinmec.com+ho+do+cam+lanh');
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (3, 'Các cơn khó thở, thở khò khè, nặng ngực, ho nhiều về đêm hoặc sáng sớm, hay tái phát.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (1, 'Nghẹt mũi, hắt hơi, sổ mũi, đau họng, ho nhẹ, có thể sốt nhẹ, mệt mỏi.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (2, 'Khởi phát đột ngột với sốt cao, đau mỏi cơ, đau đầu, ho khan, viêm họng, nghẹt mũi, mệt nhiều.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (4, 'Nghẹt mũi, chảy dịch mũi đặc, đau nặng vùng mặt/ trán/ má, giảm ngửi, ho về đêm.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (5, 'Đau âm ỉ hoặc bỏng rát vùng thượng vị, đầy hơi, ợ nóng, buồn nôn, khó tiêu sau ăn.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (65, 'Ho liên tục, không đờm, cảm giác rát, khô họng, nói nhiều hoặc nuốt cũng kích thích ho.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (64, 'Ho khạc ra đờm trắng, vàng hoặc xanh, cảm giác vướng ở ngực/họng, có thể kèm khó thở, sốt nếu nhiễm trùng.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (63, 'Ho không đờm, dai dẳng trên 3 tuần, tăng khi nói nhiều, hít không khí lạnh, có thể kèm rát họng.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (62, 'Ho khan hoặc ho ít đờm vàng, họng rát, miệng khô, có thể sốt, cảm giác nóng trong người.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (60, 'Giống bỏng nắng: da đỏ, nóng rát tại vùng tiếp xúc ánh nắng mạnh, có thể phồng rộp.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (59, 'Cảm giác cộm, rát, khô, như có dị vật trong mắt, nhìn mờ, chói sáng.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (58, 'Đỏ da, đau rát vùng da phơi nắng, có thể phồng rộp nhẹ, kèm mệt, nhức đầu nếu nắng nhiều.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (57, 'Thường không triệu chứng; lâu dài tăng nguy cơ đau ngực, nhồi máu cơ tim, đột quỵ.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (56, 'Cảm giác đầy bụng, khó tiêu, ợ hơi, ợ chua, tức vùng thượng vị sau ăn.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (55, 'Ăn kém, nhanh no, giảm hứng thú với thức ăn, có thể sụt cân, mệt mỏi.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (54, 'Cảm giác nôn nao ở vùng thượng vị, tăng dần rồi nôn; có thể kèm chóng mặt, đau bụng, mệt.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (53, 'Chóng mặt, buồn nôn, nôn, vã mồ hôi, nhợt nhạt khi đi tàu xe, máy bay, tàu biển.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (52, 'Mệt mỏi, chán ăn, buồn nôn, vàng da/vàng mắt, nước tiểu sẫm màu, đau tức hạ sườn phải.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (50, 'Co cơ đột ngột, đau nhói, cứng cơ trong vài giây đến vài phút, thường ở bắp chân, bàn chân.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (49, 'Đau giảm dần, vận động cải thiện, trên X-quang thấy can xương hình thành và đặc lại.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (48, 'Ít triệu chứng cho đến khi gãy xương; có thể đau lưng, giảm chiều cao, còng lưng.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (47, 'Rụng tóc lan tỏa hoặc thành mảng, tóc mảnh yếu, có thể kèm ngứa, bong vảy da đầu.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (46, 'Vảy trắng bong trên da đầu, ngứa, da đầu khô hoặc nhờn.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (45, 'Vùng da đỏ, sưng, nóng, đau, ranh giới không rõ, có thể sốt, ớn lạnh.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (44, 'Chảy máu tươi khi đi ngoài, sa búi trĩ, đau rát hậu môn, ngứa, khó chịu khi ngồi lâu.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (43, 'Tổn thương dạng mảng tròn, bờ đỏ rõ, trung tâm nhạt màu hơn, ngứa nhiều.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (42, 'Ngứa dữ dội, nhất là ban đêm; mụn nước, đường hầm nhỏ ở kẽ ngón tay, cổ tay, thắt lưng…', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (41, 'Đau rát, bỏng buốt theo dải da một bên cơ thể, sau đó xuất hiện mụn nước thành cụm; có thể đau kéo dài.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (40, 'Mụn nước nhỏ đau rát quanh môi, sau đó vỡ đóng vảy, hay tái phát khi mệt, stress.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (39, 'Dễ nhiễm trùng tái đi tái lại (viêm họng, viêm phổi...), mệt mỏi; hay liên quan suy giảm miễn dịch.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (38, 'Mệt kéo dài >6 tháng, không đỡ dù nghỉ ngơi, kèm giảm tập trung, đau cơ, rối loạn giấc ngủ.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (37, 'Thường không triệu chứng; đôi khi nặng tức hạ sườn phải, mệt mỏi, men gan tăng.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (36, 'Tăng cân nhiều, BMI cao, mệt khi gắng sức, khó thở, đau khớp gối/khớp háng, dễ ngáy ngủ.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (35, 'Hắt hơi từng tràng, sổ mũi nước trong, ngứa mũi/mắt, nghẹt mũi, thường liên quan phấn hoa, bụi, thời tiết.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (34, 'Hơi thở có mùi khó chịu kéo dài, thường do bệnh răng miệng, viêm lợi, trào ngược, khô miệng.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (33, 'Lợi đỏ, sưng, dễ chảy máu khi chải răng, có thể hôi miệng, đau khi ăn nhai.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (32, 'Đau nhói hoặc âm ỉ tại răng, đau tăng khi nhai hoặc ăn nóng/lạnh, có thể kèm sưng nướu, hôi miệng.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (31, 'Đỏ da, đau rát, có thể phồng rộp nông; thường do nước nóng, hơi nóng, nắng, vật nóng.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (30, 'Giai đoạn lành có giảm đau dần, bờ vết thương khép lại, da non mọc lên; chậm lành nếu nhiễm trùng hoặc bệnh lý nền.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (29, 'Vùng da ngứa, bong vảy, có mảng đỏ giới hạn rõ, thường dạng vòng hay có bờ viền.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (28, 'Đỏ da, ngứa, nổi mẩn hoặc mụn nước, da khô tróc vảy, có thể chảy dịch khi gãi.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (27, 'Mụn đầu trắng, đầu đen, mụn viêm đỏ, mụn mủ ở mặt, ngực, lưng; có thể để lại sẹo, thâm.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (26, 'Mảng da đỏ giới hạn rõ, phủ vảy trắng bạc, ngứa hoặc rát, hay gặp ở khuỷu, gối, da đầu.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (25, 'Đau âm ỉ hoặc quặn vùng hạ vị trong vài ngày quanh kỳ kinh, có thể kèm buồn nôn, đau lưng.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (24, 'Tiểu khó, tia yếu, tiểu nhiều lần, đặc biệt là tiểu đêm, cảm giác tiểu không hết.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (23, 'Đau quặn thắt vùng hông lưng lan xuống bẹn, tiểu buốt, tiểu máu, buồn nôn, có thể sốt.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (18, 'Đau đầu hai bên, cảm giác bó siết như đội vòng, thường kèm căng cơ cổ, stress, mất ngủ.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (17, 'Đau đầu một bên, kiểu nh pulsating, tăng khi gắng sức; có thể kèm buồn nôn, sợ ánh sáng, sợ tiếng ồn.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (16, 'Đau âm ỉ hoặc nhói vùng lưng/cơ, đau tăng khi vận động, giảm khi nghỉ, có thể căng cứng cơ.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (15, 'Cơn đau khớp đột ngột, dữ dội (thường ở ngón chân cái), khớp đỏ nóng, sưng to, có thể sốt.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (14, 'Sưng đau nhiều khớp nhỏ hai bên đối xứng, cứng khớp buổi sáng kéo dài, mệt mỏi, có thể biến dạng khớp.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (13, 'Đau khớp tăng khi vận động, cứng khớp buổi sáng ngắn (<30 phút), lạo xạo khớp, hạn chế vận động.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (12, 'Thường âm thầm; có thể đau ngực, xanthoma (u vàng ở da), tê bì hoặc dấu hiệu bệnh tim mạch.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (11, 'Thường không triệu chứng; đôi khi đau đầu, chóng mặt, mặt đỏ, hồi hộp, khó thở, đo huyết áp cao nhiều lần.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (10, 'Khát nhiều, tiểu nhiều, ăn nhiều nhưng sụt hoặc tăng cân bất thường, mệt mỏi, mờ mắt, vết thương lâu lành.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (9, 'Đi ngoài phân lỏng hoặc tóe nước nhiều lần trong ngày, có thể kèm đau quặn bụng, buồn nôn, mất nước.', NULL);
INSERT INTO "trieu_chung" ("benh_sk", "trieu_chung", "link_trieu_chung") VALUES (8, 'Đi tiêu ít (<3 lần/tuần), phân rắn, phải rặn nhiều, có thể đau bụng hoặc đầy chướng.', NULL);

-- Tạo bảng users
DROP TABLE IF EXISTS "users" CASCADE;
CREATE TABLE "users" (
  "id" SERIAL,
  "username" VARCHAR(255),
  "email" VARCHAR(255),
  "phone_number" VARCHAR(50),
  "password_hash" VARCHAR(255),
  "age" INTEGER,
  "gender" VARCHAR(20),
  "height" NUMERIC,
  "weight" NUMERIC,
  "location" VARCHAR(255),
  "common_diseases" TEXT,
  "allergies" TEXT,
  "created_at" TIMESTAMP WITHOUT TIME ZONE,
  "last_login_at" TIMESTAMP WITHOUT TIME ZONE,
  "role" VARCHAR(20)
);

-- Dữ liệu bảng users (353 dòng)
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (20, 'doduclong26', 'doduclong26@outlook.com', '0941473689', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 44, 'Nữ', '157.00', '50.00', 'Vĩnh Long', 'Cao huyết áp, Đau dạ dày, Trào ngược dạ dày', NULL, '2025-08-06T08:36:43.346Z', '2025-12-15T08:55:44.421Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (15, 'danghuongnga99', 'danghuongnga99@outlook.com', '0934985759', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 28, 'Nam', '161.00', '57.00', 'TP. Đà Nẵng', 'Viêm loét dạ dày, Cảm cúm thường xuyên', NULL, '2025-05-13T14:01:14.473Z', '2025-12-08T08:55:44.416Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (3, 'admin', 'admin@example.com', NULL, '$2b$10$C1GqOpGNi5PNJMaXACzXBuVO9IWhNfoldFlO/PPQRqwqJarX1Tn12', 30, 'Nam', NULL, NULL, 'Hà Nội', NULL, NULL, '2025-12-30T08:34:41.544Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (2, 'hieudo', 'hieudo@gmail.com', '09176289391', '$2b$10$8Ow2q/6NcqhtMPfTZvaYs.HU3Xq1xKsKJ4qCTY/6TA7T6o/GTHixe', 21, 'Nam', '170.00', '89.00', 'Thanh Hóa', 'đau đầu', 'kháng sinh', '2025-12-29T14:20:09.778Z', '2025-12-30T13:49:36.240Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (1, 'namanh', 'anhttn.22ba13032@usth.edu.vn', '0986579174', '$2b$10$PTHYBrFVZ.MNvDyPKj5h5Oa.gvf7CpFKo3/Z8JnFU/IpfLA4FGcR6', 21, 'male', '172.00', '67.00', 'TP. Hà Nội', 'đau đầu', 'kháng sinh', '2025-12-27T15:42:31.757Z', '2025-12-30T13:57:38.693Z', 'admin');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (4, 'lyngochoa83', 'lyngochoa83@yahoo.com', '0944573818', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 19, 'Nữ', '151.00', '55.00', 'TP. Cần Thơ', NULL, 'Dị ứng sulfa', '2025-06-13T18:12:49.933Z', '2025-12-15T08:55:44.222Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (5, 'doxuannga19', 'doxuannga19@outlook.com', '0898589731', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 53, 'Nam', '176.00', '86.00', 'Tuyên Quang', NULL, NULL, '2025-02-28T20:07:59.781Z', '2025-12-03T08:55:44.403Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (6, 'voanhhieu78', 'voanhhieu78@yahoo.com', '0965113292', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 54, 'Nam', '167.00', '61.00', 'Ninh Bình', 'Mụn trứng cá, Cảm cúm thường xuyên', NULL, '2025-09-12T00:01:29.179Z', '2025-12-06T08:55:44.405Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (7, 'huynhxuanson11', 'huynhxuanson11@gmail.com', '0907181193', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 42, 'Khác', '164.00', '60.00', 'Lâm Đồng', 'Mụn trứng cá, Táo bón mãn tính', NULL, '2025-03-04T05:09:31.746Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (8, 'lexuanhai22', 'lexuanhai22@gmail.com', '0989581542', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 62, 'Nữ', '169.00', '72.00', 'Ninh Bình', 'Đau đầu migraine, Viêm khớp', 'Dị ứng penicillin', '2025-06-11T11:42:19.678Z', '2025-12-12T08:55:44.407Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (9, 'leminhha11', 'leminhha11@yahoo.com', '0885905036', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 57, 'Nam', '164.00', '74.00', 'Cao Bằng', 'Trào ngược dạ dày', NULL, '2025-02-08T19:20:45.383Z', '2025-12-22T08:55:44.409Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (10, 'dangbaovy49', 'dangbaovy49@yahoo.com', '0943668749', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 34, 'Nam', '167.00', '62.00', 'Tây Ninh', NULL, 'Dị ứng phấn hoa, Dị ứng aspirin', '2025-01-31T03:33:35.353Z', '2025-12-21T08:55:44.410Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (11, 'dangthumai78', 'dangthumai78@outlook.com', '0865741683', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 48, 'Nữ', '162.00', '65.00', 'Lâm Đồng', 'Mất ngủ', NULL, '2025-04-08T04:56:15.208Z', '2025-12-06T08:55:44.411Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (12, 'phamquangbinh42', 'phamquangbinh42@yahoo.com', '0981495558', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 48, 'Khác', '156.00', '64.00', 'Bắc Ninh', NULL, NULL, '2025-11-09T08:24:26.593Z', '2025-12-23T08:55:44.412Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (13, 'trantuanbinh97', 'trantuanbinh97@hotmail.com', '0995880924', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 27, 'Nam', '178.00', '70.00', 'Quảng Ninh', NULL, NULL, '2025-12-23T20:05:05.062Z', '2025-12-15T08:55:44.413Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (14, 'ngoducan87', 'ngoducan87@outlook.com', '0946399838', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 19, 'Nam', '172.00', '58.00', 'Điện Biên', NULL, 'Dị ứng latex', '2025-01-31T19:15:36.461Z', '2025-12-09T08:55:44.415Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (16, 'dangminhmai64', 'dangminhmai64@yahoo.com', '0981021759', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 19, 'Nam', '182.00', '76.00', 'Lạng Sơn', NULL, NULL, '2025-05-24T03:31:39.106Z', '2025-12-23T08:55:44.417Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (17, 'nguyenthanhcuong71', 'nguyenthanhcuong71@email.com', '0915043473', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 37, 'Khác', '155.00', '63.00', 'TP. Hải Phòng', 'Thiếu máu', NULL, '2025-10-10T21:04:48.631Z', '2025-11-30T08:55:44.418Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (18, 'dangkimhanh49', 'dangkimhanh49@yahoo.com', '0966746981', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 43, 'Khác', '162.00', '60.00', 'TP. Đà Nẵng', 'Mụn trứng cá', NULL, '2025-08-17T21:09:23.623Z', '2025-12-29T08:55:44.419Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (19, 'lexuannga22', 'lexuannga22@yahoo.com', '0869760215', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 73, 'Nam', '181.00', '80.00', 'Vĩnh Long', 'Hen suyễn, Thoái hóa cột sống', NULL, '2025-11-21T06:13:09.975Z', '2025-11-30T08:55:44.420Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (21, 'buihaivinh28', 'buihaivinh28@email.com', '0861021681', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 37, 'Nam', '183.00', '61.00', 'Hưng Yên', 'Viêm mũi dị ứng', NULL, '2025-12-20T06:50:27.377Z', '2025-12-14T08:55:44.422Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (23, 'tranhaigiang26', 'tranhaigiang26@yahoo.com', '0899305016', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 28, 'Khác', '152.00', '47.00', 'An Giang', NULL, NULL, '2025-01-31T20:24:15.782Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (26, 'hongocbinh50', 'hongocbinh50@gmail.com', '0999799460', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 67, 'Khác', '162.00', '52.00', 'Phú Thọ', 'Rối loạn tiêu hóa, Thiếu máu, Viêm họng', 'Dị ứng phấn hoa', '2025-06-24T04:54:56.229Z', '2025-12-25T08:55:44.429Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (27, 'phanthison26', 'phanthison26@yahoo.com', '0967124346', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 75, 'Nữ', '170.00', '73.00', 'Thanh Hóa', NULL, NULL, '2025-12-24T08:01:43.319Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (28, 'dothinga43', 'dothinga43@yahoo.com', '0939722535', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 27, 'Nữ', '161.00', '68.00', 'Ninh Bình', NULL, NULL, '2025-12-28T18:40:32.631Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (29, 'tranngocbinh36', 'tranngocbinh36@gmail.com', '0905461309', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 25, 'Khác', '164.00', '69.00', 'Hưng Yên', 'Rối loạn tiêu hóa, Tiểu đường type 2, Trào ngược dạ dày', 'Dị ứng hải sản', '2025-02-14T09:14:02.301Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (30, 'dobaomai91', 'dobaomai91@outlook.com', '0869387022', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 25, 'Khác', '164.00', '54.00', 'Cà Mau', NULL, 'Dị ứng phấn hoa', '2025-09-16T19:39:06.957Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (31, 'vovanphong15', 'vovanphong15@gmail.com', '0919225213', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 37, 'Nam', '164.00', '74.00', 'Thanh Hóa', 'Đau đầu migraine, Gout', NULL, '2025-01-21T05:52:14.433Z', '2025-12-02T08:55:44.434Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (33, 'tranducthao51', 'tranducthao51@gmail.com', '0977751160', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 37, 'Nữ', '154.00', '58.00', 'Quảng Trị', 'Hen suyễn, Viêm xoang', 'Dị ứng sulfa', '2025-11-07T12:32:42.839Z', '2025-12-18T08:55:44.435Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (34, 'vuvangiang36', 'vuvangiang36@email.com', '0979873917', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 47, 'Khác', '150.00', '60.00', 'Cao Bằng', NULL, 'Dị ứng aspirin', '2025-08-21T18:34:45.015Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (35, 'phamxuanhung99', 'phamxuanhung99@outlook.com', '0864233174', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 67, 'Nam', '164.00', '54.00', 'TP. Huế', NULL, NULL, '2025-06-16T01:40:35.348Z', '2025-12-19T08:55:44.438Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (36, 'huynhthigiang69', 'huynhthigiang69@gmail.com', '0986281025', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 73, 'Nam', '165.00', '75.00', 'Phú Thọ', 'Bệnh tim mạch', NULL, '2025-05-29T03:27:33.704Z', '2025-12-28T08:55:44.438Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (37, 'hoductu81', 'hoductu81@email.com', '0861312241', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 20, 'Nữ', '167.00', '56.00', 'Bắc Ninh', NULL, NULL, '2025-04-28T09:56:12.344Z', '2025-12-03T08:55:44.439Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (38, 'hovangiang25', 'hovangiang25@yahoo.com', '0987292984', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 34, 'Nam', '172.00', '75.00', 'Lạng Sơn', NULL, 'Dị ứng phấn hoa, Dị ứng đậu phộng', '2025-08-07T17:15:21.686Z', '2025-11-30T08:55:44.440Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (39, 'dophuongcuong50', 'dophuongcuong50@yahoo.com', '0994748469', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 28, 'Nam', '179.00', '81.00', 'Cao Bằng', 'Béo phì, Mất ngủ, Đau lưng mãn tính', 'Dị ứng penicillin, Dị ứng phấn hoa', '2025-04-14T12:40:13.213Z', '2025-12-01T08:55:44.441Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (40, 'duongducngoc43', 'duongducngoc43@hotmail.com', '0944753289', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 37, 'Nữ', '153.00', '54.00', 'Đắk Lắk', 'Rụng tóc, Gout, Viêm phế quản', 'Dị ứng đậu phộng', '2025-02-11T13:38:39.592Z', '2025-12-18T08:55:44.442Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (41, 'duongminhcuong94', 'duongminhcuong94@hotmail.com', '0966822250', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 58, 'Khác', '153.00', '57.00', 'TP. Huế', NULL, NULL, '2025-03-13T01:04:03.284Z', '2025-12-06T08:55:44.443Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (43, 'phanhuongtu71', 'phanhuongtu71@email.com', '0903629045', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 54, 'Nam', '173.00', '54.00', 'Hưng Yên', 'Cholesterol cao, Thoái hóa cột sống, Rối loạn tiêu hóa', 'Dị ứng aspirin, Dị ứng sulfa', '2025-08-19T11:23:25.000Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (44, 'dangthimai94', 'dangthimai94@yahoo.com', '0986153676', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 22, 'Nữ', '170.00', '79.00', 'Khánh Hoà', NULL, 'Dị ứng penicillin, Dị ứng hải sản', '2025-02-22T10:11:58.561Z', '2025-12-02T08:55:44.446Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (46, 'phamngocphong56', 'phamngocphong56@outlook.com', '0962403670', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 41, 'Khác', '167.00', '51.00', 'Lai Châu', NULL, NULL, '2025-06-10T19:48:03.316Z', '2025-12-08T08:55:44.448Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (48, 'vuthanhquan97', 'vuthanhquan97@hotmail.com', '0973700141', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 49, 'Nữ', '162.00', '56.00', 'Đắk Lắk', NULL, NULL, '2025-05-18T19:21:19.691Z', '2025-12-04T08:55:44.451Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (49, 'tranngochung58', 'tranngochung58@hotmail.com', '0961114180', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 61, 'Nữ', '159.00', '62.00', 'Lai Châu', 'Viêm xoang, Gout', 'Dị ứng hải sản, Dị ứng bụi nhà', '2025-06-08T15:45:37.548Z', '2025-12-14T08:55:44.451Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (50, 'duongthuhuong96', 'duongthuhuong96@hotmail.com', '0917813517', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 75, 'Nam', '168.00', '77.00', 'TP. Đà Nẵng', NULL, NULL, '2025-12-08T22:31:36.936Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (51, 'danghaianh74', 'danghaianh74@yahoo.com', '0973793336', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 39, 'Nam', '168.00', '67.00', 'Vĩnh Long', 'Rụng tóc', 'Dị ứng bụi nhà', '2025-09-28T01:33:36.917Z', '2025-12-30T08:55:44.454Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (52, 'buianhhanh63', 'buianhhanh63@email.com', '0885113765', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 41, 'Nam', '160.00', '69.00', 'Gia Lai', 'Viêm phế quản, Trào ngược dạ dày, Suy nhược cơ thể', NULL, '2024-12-31T20:32:45.505Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (54, 'dangthuthao67', 'dangthuthao67@hotmail.com', '0862190975', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 67, 'Nam', '162.00', '58.00', 'Đắk Lắk', 'Viêm loét dạ dày', NULL, '2025-08-24T06:43:31.292Z', '2025-12-24T08:55:44.457Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (32, 'tranphuonglong34', 'tranphuonglong34@yahoo.com', '0936253490', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 18, 'Nam', '157.00', '66.00', 'Cà Mau', NULL, NULL, '2025-04-08T21:27:43.777Z', '2025-12-23T08:55:44.435Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (45, 'ngoquangchi54', 'ngoquangchi54@yahoo.com', '0882542492', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 66, 'Nam', '151.00', '54.00', 'An Giang', 'Béo phì, Viêm xoang, Cholesterol cao', NULL, '2025-01-11T00:55:49.535Z', '2025-12-17T08:55:44.447Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (25, 'hoanghuongmai51', 'hoanghuongmai51@yahoo.com', '0913994284', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 16, 'Nam', '156.00', '52.00', 'TP. Huế', 'Táo bón mãn tính, Thoái hóa cột sống, Cao huyết áp', NULL, '2025-02-25T16:04:37.051Z', '2025-12-19T08:55:44.428Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (53, 'vubaothao37', 'vubaothao37@email.com', '0916488588', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 58, 'Nam', '163.00', '66.00', 'Phú Thọ', 'Mụn trứng cá', 'Dị ứng sữa bò, Dị ứng bụi nhà', '2025-04-24T18:52:04.179Z', '2025-12-07T08:55:44.456Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (42, 'phamvanbinh56', 'phamvanbinh56@gmail.com', '0917386872', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 73, 'Nam', '160.00', '46.00', 'Thái Nguyên', NULL, NULL, '2025-06-03T01:56:03.333Z', '2025-12-19T08:55:44.444Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (22, 'phanquangbinh30', 'phanquangbinh30@yahoo.com', '0882589961', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 40, 'Nam', '162.00', '57.00', 'TP. Huế', 'Đau đầu migraine, Gout', 'Dị ứng penicillin, Dị ứng latex', '2025-12-20T02:24:15.575Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (47, 'lequanghuong70', 'lequanghuong70@outlook.com', '0988249378', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 57, 'Nam', '164.00', '51.00', 'Lạng Sơn', NULL, 'Dị ứng bụi nhà, Dị ứng penicillin', '2025-12-23T02:38:06.010Z', '2025-12-06T08:55:44.449Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (57, 'phammaikhoa39', 'phammaikhoa39@gmail.com', '0869117552', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 33, 'Nữ', '150.00', '54.00', 'Bắc Ninh', NULL, NULL, '2025-05-21T10:17:27.968Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (58, 'hoangthuhuong36', 'hoangthuhuong36@outlook.com', '0948650858', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 32, 'Nam', '172.00', '64.00', 'Điện Biên', NULL, NULL, '2025-03-10T21:33:09.941Z', '2025-12-13T08:55:44.462Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (59, 'nguyenminhdung41', 'nguyenminhdung41@gmail.com', '0984215380', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 39, 'Nữ', '167.00', '55.00', 'TP. Hải Phòng', 'Gout, Cholesterol cao, Viêm da cơ địa', NULL, '2025-04-19T10:33:03.723Z', '2025-12-16T08:55:44.463Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (62, 'trankiman65', 'trankiman65@gmail.com', '0995068872', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 39, 'Nam', '172.00', '71.00', 'Lâm Đồng', NULL, 'Dị ứng sulfa, Dị ứng penicillin', '2025-02-18T11:58:36.265Z', '2025-12-08T08:55:44.466Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (63, 'hoangthanhtrang79', 'hoangthanhtrang79@email.com', '0903236182', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 59, 'Nữ', '159.00', '58.00', 'Lào Cai', NULL, 'Dị ứng hải sản, Dị ứng đậu phộng', '2025-06-30T10:56:50.194Z', '2025-12-10T08:55:44.467Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (64, 'phanbaothanh97', 'phanbaothanh97@outlook.com', '0947510289', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 67, 'Nữ', '170.00', '77.00', 'Thái Nguyên', 'Viêm gan B, Hen suyễn', NULL, '2024-12-31T06:08:37.602Z', '2025-12-02T08:55:44.469Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (65, 'phanxuanson46', 'phanxuanson46@gmail.com', '0914573239', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 22, 'Nam', '176.00', '75.00', 'Sơn La', 'Đau đầu migraine, Mụn trứng cá, Viêm gan B', NULL, '2025-03-28T23:08:34.731Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (66, 'duongxuanlong39', 'duongxuanlong39@outlook.com', '0863776543', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 52, 'Nữ', '155.00', '63.00', 'TP. Hải Phòng', 'Tiểu đường type 2, Viêm gan B', NULL, '2025-03-22T01:29:11.772Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (67, 'lyhuonganh45', 'lyhuonganh45@email.com', '0975724450', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 53, 'Nam', '165.00', '55.00', 'Đắk Lắk', 'Cao huyết áp, Hen suyễn, Viêm loét dạ dày', NULL, '2025-06-08T04:00:54.267Z', '2025-12-13T08:55:44.471Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (69, 'hominhlinh78', 'hominhlinh78@outlook.com', '0987742783', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 19, 'Nam', '173.00', '81.00', 'Hưng Yên', NULL, NULL, '2025-07-21T02:24:04.987Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (70, 'dovanquan61', 'dovanquan61@outlook.com', '0894369338', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 72, 'Nam', '176.00', '59.00', 'Quảng Ninh', 'Béo phì', NULL, '2025-04-28T05:18:41.363Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (72, 'hoanhhoa65', 'hoanhhoa65@hotmail.com', '0863878275', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 61, 'Khác', '167.00', '61.00', 'Quảng Trị', 'Đau đầu migraine, Viêm họng, Rối loạn tiêu hóa', NULL, '2025-12-08T20:35:54.728Z', '2025-12-06T08:55:44.477Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (74, 'buihaicuong34', 'buihaicuong34@email.com', '0907009126', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 37, 'Nam', '171.00', '65.00', 'Quảng Trị', NULL, NULL, '2025-10-08T23:54:23.041Z', '2025-12-01T08:55:44.479Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (75, 'phamductuan38', 'phamductuan38@outlook.com', '0861210913', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 71, 'Nam', '172.00', '54.00', 'Ninh Bình', 'Suy nhược cơ thể, Cao huyết áp, Đau lưng mãn tính', 'Dị ứng hải sản', '2025-06-04T23:52:21.826Z', '2025-12-22T08:55:44.480Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (76, 'hoangbaophong43', 'hoangbaophong43@hotmail.com', '0987139593', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 36, 'Nữ', '159.00', '60.00', 'Điện Biên', 'Thiếu máu', NULL, '2025-03-06T05:46:44.741Z', '2025-12-06T08:55:44.481Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (77, 'ngophuonglan47', 'ngophuonglan47@gmail.com', '0901081952', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 64, 'Nam', '184.00', '93.00', 'Điện Biên', 'Viêm xoang', NULL, '2025-07-05T12:00:54.909Z', '2025-12-30T08:55:44.481Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (78, 'voxuanhoa92', 'voxuanhoa92@outlook.com', '0987225874', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 42, 'Nữ', '168.00', '72.00', 'Tây Ninh', 'Cholesterol cao, Gout', NULL, '2025-02-14T11:25:51.270Z', '2025-12-23T08:55:44.482Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (79, 'vohaigiang71', 'vohaigiang71@yahoo.com', '0995973648', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 56, 'Nam', '165.00', '75.00', 'Lạng Sơn', NULL, NULL, '2025-08-21T03:43:50.261Z', '2025-12-20T08:55:44.484Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (80, 'danghoanggiang30', 'danghoanggiang30@email.com', '0914563534', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 26, 'Nữ', '170.00', '71.00', 'TP. Đà Nẵng', NULL, 'Dị ứng penicillin', '2025-01-16T20:06:09.571Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (81, 'tranphuongthuy65', 'tranphuongthuy65@gmail.com', '0997714607', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 27, 'Nữ', '162.00', '57.00', 'Quảng Trị', NULL, NULL, '2025-10-24T13:20:59.775Z', '2025-12-05T08:55:44.485Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (82, 'phanhoanganh39', 'phanhoanganh39@gmail.com', '0867515217', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 47, 'Nam', '175.00', '60.00', 'Quảng Trị', 'Viêm gan B', 'Dị ứng hải sản', '2025-11-23T12:30:15.458Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (85, 'phanxuanhoa12', 'phanxuanhoa12@hotmail.com', '0999186230', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 25, 'Khác', '167.00', '53.00', 'Đồng Nai', NULL, 'Dị ứng sulfa, Dị ứng latex', '2025-06-17T02:20:22.550Z', '2025-12-10T08:55:44.489Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (86, 'vuphuongquan58', 'vuphuongquan58@outlook.com', '0905825804', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 36, 'Nữ', '162.00', '67.00', 'An Giang', 'Cao huyết áp', 'Dị ứng phấn hoa', '2025-09-11T10:19:38.656Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (87, 'huynhbaobinh91', 'huynhbaobinh91@gmail.com', '0916581448', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 68, 'Nam', '185.00', '66.00', 'Gia Lai', 'Cholesterol cao, Đau khớp gối', NULL, '2025-01-17T23:03:17.518Z', '2025-12-08T08:55:44.491Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (88, 'hohaichi58', 'hohaichi58@yahoo.com', '0908183452', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 53, 'Nam', '177.00', '87.00', 'TP. Cần Thơ', 'Gout, Viêm phế quản, Mất ngủ', 'Dị ứng sulfa', '2025-11-01T10:36:58.958Z', '2025-12-03T08:55:44.492Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (71, 'phanducthanh77', 'phanducthanh77@email.com', '0983079090', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 24, 'Nam', '169.00', '66.00', 'TP. Hải Phòng', NULL, NULL, '2025-10-08T09:36:10.388Z', '2025-12-19T08:55:44.475Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (68, 'huynhmaivy64', 'huynhmaivy64@outlook.com', '0981093070', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 70, 'Nam', '162.00', '73.00', 'Cà Mau', NULL, NULL, '2025-07-26T03:30:12.178Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (60, 'phamhuongphong21', 'phamhuongphong21@outlook.com', '0917074065', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 46, 'Nữ', '159.00', '66.00', 'Điện Biên', NULL, 'Dị ứng bụi nhà, Dị ứng phấn hoa', '2025-06-01T02:46:14.129Z', '2025-12-13T08:55:44.464Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (61, 'lengocphong20', 'lengocphong20@gmail.com', '0973963241', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 25, 'Nữ', '167.00', '77.00', 'Quảng Ninh', 'Viêm khớp, Đau khớp gối', 'Dị ứng penicillin, Dị ứng trứng', '2025-12-10T22:58:44.460Z', '2025-12-12T08:55:44.465Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (84, 'huynhanhcuong31', 'huynhanhcuong31@email.com', '0977130191', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 71, 'Nữ', '159.00', '53.00', 'Ninh Bình', 'Cholesterol cao, Viêm mũi dị ứng, Mất ngủ', NULL, '2025-11-27T07:04:00.532Z', '2025-12-04T08:55:44.488Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (56, 'lemaithao48', 'lemaithao48@email.com', '0903808158', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 22, 'Nữ', '160.00', '52.00', 'TP. Đà Nẵng', 'Trào ngược dạ dày, Thoái hóa cột sống', NULL, '2025-10-02T06:42:19.355Z', '2025-12-24T08:55:44.459Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (73, 'lemailong10', 'lemailong10@outlook.com', '0885257831', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 47, 'Nữ', '170.00', '53.00', 'Hưng Yên', 'Tiểu đường type 2, Cao huyết áp, Cảm cúm thường xuyên', 'Dị ứng latex', '2025-01-27T08:12:34.971Z', '2025-12-24T08:55:44.478Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (89, 'danganhthanh21', 'danganhthanh21@yahoo.com', '0986196324', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 16, 'Nữ', '159.00', '65.00', 'Đồng Tháp', NULL, 'Dị ứng phấn hoa', '2025-09-18T01:13:40.816Z', '2025-12-16T08:55:44.493Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (90, 'huynhthuanh82', 'huynhthuanh82@outlook.com', '0941207112', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 13, 'Nam', '153.00', '48.00', 'Lai Châu', 'Rụng tóc, Cholesterol cao', NULL, '2025-08-02T22:39:06.357Z', '2025-12-19T08:55:44.495Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (91, 'lythanhtrung57', 'lythanhtrung57@outlook.com', '0893167917', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 37, 'Nam', '177.00', '60.00', 'Lâm Đồng', 'Viêm phế quản', 'Dị ứng latex, Dị ứng penicillin', '2025-07-02T16:56:47.754Z', '2025-12-01T08:55:44.496Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (94, 'phamanhngoc47', 'phamanhngoc47@gmail.com', '0975462374', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 43, 'Nam', '174.00', '66.00', 'Phú Thọ', 'Stress, Cholesterol cao', NULL, '2025-08-12T04:57:30.262Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (95, 'phamanhyen98', 'phamanhyen98@outlook.com', '0935161663', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 73, 'Nữ', '165.00', '53.00', 'Khánh Hoà', NULL, NULL, '2025-05-10T06:18:59.838Z', '2025-12-06T08:55:44.500Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (96, 'hoangquanghuong84', 'hoangquanghuong84@hotmail.com', '0937792095', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 50, 'Nữ', '157.00', '67.00', 'Sơn La', 'Đau dạ dày, Táo bón mãn tính', NULL, '2025-01-25T07:17:32.581Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (97, 'hohaidung34', 'hohaidung34@yahoo.com', '0999369228', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 27, 'Nam', '168.00', '58.00', 'Vĩnh Long', 'Rụng tóc, Gout', NULL, '2025-12-10T15:09:24.381Z', '2025-12-27T08:55:44.502Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (98, 'phanquanghai80', 'phanquanghai80@email.com', '0861108873', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 64, 'Nữ', '151.00', '56.00', 'Vĩnh Long', NULL, NULL, '2025-04-02T20:52:23.194Z', '2025-12-30T08:55:44.503Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (100, 'dangtuanha48', 'dangtuanha48@gmail.com', '0992543557', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 66, 'Nữ', '170.00', '62.00', 'Đắk Lắk', NULL, 'Dị ứng latex, Dị ứng hải sản', '2025-07-13T07:27:13.173Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (102, 'buiducdung75', 'buiducdung75@outlook.com', '0972107232', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 38, 'Nữ', '167.00', '78.00', 'TP. Đà Nẵng', 'Đau lưng mãn tính', NULL, '2025-07-31T15:29:10.805Z', '2025-12-23T08:55:44.507Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (103, 'levantuan59', 'levantuan59@email.com', '0998012209', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 18, 'Khác', '153.00', '63.00', 'Lào Cai', NULL, NULL, '2025-02-16T06:03:17.708Z', '2025-12-25T08:55:44.508Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (105, 'hongocanh66', 'hongocanh66@yahoo.com', '0981252406', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 22, 'Nam', '179.00', '86.00', 'Lạng Sơn', NULL, NULL, '2025-07-15T12:42:21.697Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (106, 'buituanchi21', 'buituanchi21@gmail.com', '0933773435', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 26, 'Nam', '166.00', '68.00', 'Lai Châu', NULL, 'Dị ứng sữa bò, Dị ứng sulfa', '2025-03-21T21:29:14.947Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (108, 'dolong96', 'dolong96@email.com', '0961202873', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 15, 'Nữ', '146.00', '40.00', 'Hưng Yên', NULL, NULL, '2025-07-04T14:31:14.826Z', '2025-12-02T08:55:44.513Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (109, 'phamducngoc74', 'phamducngoc74@gmail.com', '0961342208', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 28, 'Nam', '169.00', '66.00', 'Cao Bằng', 'Rụng tóc, Tiểu đường type 2', NULL, '2025-01-22T10:46:01.553Z', '2025-12-06T08:55:44.514Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (110, 'doanhgiang30', 'doanhgiang30@outlook.com', '0973591380', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 64, 'Nam', '183.00', '88.00', 'Hưng Yên', 'Viêm xoang, Béo phì', 'Dị ứng bụi nhà', '2025-09-27T23:48:21.241Z', '2025-12-18T08:55:44.515Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (111, 'vohoanganh75', 'vohoanganh75@email.com', '0988963182', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 25, 'Nữ', '157.00', '45.00', 'Cà Mau', 'Suy nhược cơ thể', NULL, '2025-06-05T06:42:48.824Z', '2025-12-16T08:55:44.516Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (112, 'nguyenhoanggiang49', 'nguyenhoanggiang49@outlook.com', '0972543846', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 52, 'Nam', '161.00', '55.00', 'Phú Thọ', 'Bệnh tim mạch', 'Dị ứng penicillin', '2025-08-24T01:03:11.554Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (113, 'ngolanvy56', 'ngolanvy56@email.com', '0889568230', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 25, 'Nam', '169.00', '64.00', 'Cao Bằng', NULL, NULL, '2025-04-27T03:26:08.363Z', '2025-12-22T08:55:44.519Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (114, 'hoangthanhmai40', 'hoangthanhmai40@hotmail.com', '0964716086', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 67, 'Nữ', '152.00', '46.00', 'Khánh Hoà', NULL, 'Dị ứng penicillin', '2025-03-17T00:11:51.159Z', '2025-12-02T08:55:44.520Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (116, 'vuduckhoa69', 'vuduckhoa69@email.com', '0941551422', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 67, 'Nam', '163.00', '67.00', 'Quảng Trị', 'Mụn trứng cá', NULL, '2025-10-22T10:20:53.225Z', '2025-12-21T08:55:44.522Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (118, 'tranminhvy87', 'tranminhvy87@gmail.com', '0944075039', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 75, 'Nam', '183.00', '86.00', 'Vĩnh Long', 'Rối loạn tiêu hóa, Viêm loét dạ dày', NULL, '2025-08-03T18:09:37.582Z', '2025-12-25T08:55:44.523Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (119, 'lengoc21', 'lengoc21@hotmail.com', '0938335839', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 23, 'Nữ', '163.00', '56.00', 'Đồng Tháp', NULL, 'Dị ứng aspirin', '2025-02-19T02:19:56.910Z', '2025-12-10T08:55:44.524Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (120, 'phanmaichi82', 'phanmaichi82@outlook.com', '0916830671', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 63, 'Khác', '163.00', '65.00', 'TP. Đà Nẵng', 'Cảm cúm thường xuyên', NULL, '2025-02-11T12:28:43.442Z', '2025-12-16T08:55:44.526Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (122, 'dangmaiyen68', 'dangmaiyen68@hotmail.com', '0898346687', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 46, 'Nữ', '167.00', '51.00', 'Cao Bằng', 'Táo bón mãn tính', NULL, '2025-10-06T12:25:25.421Z', '2025-12-24T08:55:44.527Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (123, 'ngominhhuong59', 'ngominhhuong59@email.com', '0981852648', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 24, 'Nam', '184.00', '65.00', 'Lai Châu', NULL, 'Dị ứng aspirin, Dị ứng sulfa', '2025-04-30T17:55:36.107Z', '2025-12-13T08:55:44.528Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (115, 'buiminhhanh96', 'buiminhhanh96@outlook.com', '0969409147', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 28, 'Nam', '152.00', '57.00', 'Đồng Nai', NULL, NULL, '2025-11-19T18:58:28.018Z', '2025-12-19T08:55:44.521Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (99, 'duongthanhtrung37', 'duongthanhtrung37@yahoo.com', '0913528447', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 35, 'Nữ', '154.00', '54.00', 'Phú Thọ', 'Thiếu máu, Bệnh tim mạch', NULL, '2025-05-24T22:22:36.876Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (121, 'dangvanhanh54', 'dangvanhanh54@hotmail.com', '0903459938', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 32, 'Nữ', '162.00', '55.00', 'Lâm Đồng', 'Tiểu đường type 2', 'Dị ứng phấn hoa, Dị ứng hải sản', '2025-06-28T19:30:46.603Z', '2025-12-23T08:55:44.527Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (93, 'hoangbaolong99', 'hoangbaolong99@outlook.com', '0971896648', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 58, 'Nam', '166.00', '74.00', 'Đắk Lắk', NULL, NULL, '2025-12-02T04:34:13.657Z', '2025-12-01T08:55:44.498Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (92, 'huynhvandung14', 'huynhvandung14@hotmail.com', '0919074045', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 62, 'Nữ', '159.00', '47.00', 'TP. Hồ Chí Minh', NULL, NULL, '2025-12-21T20:28:14.656Z', '2025-12-05T08:55:44.497Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (104, 'lylanphuong55', 'lylanphuong55@yahoo.com', '0931919724', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 72, 'Nam', '165.00', '56.00', 'Lâm Đồng', 'Viêm gan B, Cảm cúm thường xuyên, Viêm khớp', NULL, '2025-10-16T11:11:36.066Z', '2025-12-24T08:55:44.509Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (117, 'dobaohung57', 'dobaohung57@gmail.com', '0992849047', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 67, 'Nữ', '153.00', '60.00', 'Hưng Yên', NULL, NULL, '2025-08-23T15:40:58.088Z', '2025-12-06T08:55:44.522Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (101, 'ngothanhhung10', 'ngothanhhung10@outlook.com', '0962016162', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 19, 'Nam', '162.00', '52.00', 'Ninh Bình', NULL, NULL, '2025-05-11T19:25:53.466Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (124, 'ngovancuong70', 'ngovancuong70@outlook.com', '0866018219', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 13, 'Nữ', '165.00', '60.00', 'TP. Huế', 'Béo phì, Trào ngược dạ dày, Rụng tóc', 'Dị ứng hải sản', '2025-04-08T22:47:45.289Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (125, 'lyngocphong57', 'lyngocphong57@email.com', '0938399140', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 46, 'Nam', '161.00', '72.00', 'Ninh Bình', NULL, NULL, '2025-03-03T12:14:25.106Z', '2025-12-23T08:55:44.530Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (126, 'hothihuong28', 'hothihuong28@outlook.com', '0896751724', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 45, 'Nữ', '162.00', '54.00', 'TP. Hải Phòng', NULL, NULL, '2025-02-15T03:37:01.413Z', '2025-12-04T08:55:44.531Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (130, 'buithanhha64', 'buithanhha64@hotmail.com', '0897450904', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 48, 'Nam', '180.00', '86.00', 'Điện Biên', 'Đau dạ dày, Rối loạn tiêu hóa, Viêm phế quản', NULL, '2025-05-21T21:43:28.583Z', '2025-12-26T08:55:44.535Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (133, 'vukimphong38', 'vukimphong38@outlook.com', '0913793018', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 17, 'Nữ', '155.00', '66.00', 'Vĩnh Long', NULL, NULL, '2025-11-23T17:15:31.760Z', '2025-12-05T08:55:44.538Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (134, 'nguyenductu95', 'nguyenductu95@yahoo.com', '0862338030', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 71, 'Nữ', '156.00', '58.00', 'Hưng Yên', 'Viêm loét dạ dày, Tiểu đường type 2', NULL, '2025-06-14T20:35:06.108Z', '2025-12-20T08:55:44.539Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (135, 'hongoclinh70', 'hongoclinh70@email.com', '0863216166', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 63, 'Nữ', '161.00', '71.00', 'Tuyên Quang', NULL, NULL, '2025-12-13T02:09:17.289Z', '2025-12-15T08:55:44.540Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (137, 'huynhminhdung60', 'huynhminhdung60@yahoo.com', '0893446042', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 50, 'Nữ', '170.00', '67.00', 'Lạng Sơn', NULL, NULL, '2025-08-01T07:08:04.277Z', '2025-12-14T08:55:44.542Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (139, 'nguyenducthao58', 'nguyenducthao58@gmail.com', '0891709614', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 25, 'Nữ', '150.00', '57.00', 'Sơn La', 'Suy nhược cơ thể, Thoái hóa cột sống', NULL, '2025-03-14T13:10:31.914Z', '2025-12-18T08:55:44.544Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (140, 'hokimlong18', 'hokimlong18@gmail.com', '0903906328', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 65, 'Nữ', '169.00', '71.00', 'Đồng Nai', NULL, NULL, '2025-06-10T08:24:13.757Z', '2025-12-26T08:55:44.545Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (141, 'hoangminhlong36', 'hoangminhlong36@email.com', '0888146647', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 20, 'Nữ', '169.00', '67.00', 'TP. Hồ Chí Minh', 'Tiểu đường type 2', NULL, '2025-01-09T09:20:04.606Z', '2025-12-06T08:55:44.546Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (142, 'dohuongtuan99', 'dohuongtuan99@hotmail.com', '0912853695', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 44, 'Nữ', '152.00', '64.00', 'Đồng Tháp', 'Rụng tóc', NULL, '2025-02-06T14:21:46.297Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (143, 'dangkiman42', 'dangkiman42@yahoo.com', '0981282464', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 68, 'Nữ', '157.00', '49.00', 'Phú Thọ', 'Viêm da cơ địa, Trào ngược dạ dày', NULL, '2025-11-16T08:54:43.429Z', '2025-12-21T08:55:44.548Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (144, 'vohailan50', 'vohailan50@hotmail.com', '0888902012', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 51, 'Khác', '150.00', '56.00', 'Tây Ninh', NULL, 'Dị ứng bụi nhà', '2025-09-19T16:51:34.185Z', '2025-12-02T08:55:44.549Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (145, 'buixuanngoc29', 'buixuanngoc29@gmail.com', '0899117736', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 65, 'Nam', '166.00', '77.00', 'Đồng Nai', 'Đau dạ dày', NULL, '2025-07-06T10:41:41.370Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (146, 'phamvankhoa63', 'phamvankhoa63@hotmail.com', '0998033009', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 23, 'Nam', '181.00', '67.00', 'TP. Hồ Chí Minh', 'Đau đầu migraine, Mất ngủ, Viêm khớp', NULL, '2025-09-16T10:38:45.354Z', '2025-12-29T08:55:44.551Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (147, 'nguyenkimhanh10', 'nguyenkimhanh10@gmail.com', '0939812398', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 41, 'Khác', '151.00', '54.00', 'Hưng Yên', 'Đau lưng mãn tính, Rụng tóc, Cảm cúm thường xuyên', NULL, '2025-08-31T14:59:32.438Z', '2025-12-10T08:55:44.552Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (148, 'tranhoanglong66', 'tranhoanglong66@outlook.com', '0947988509', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 35, 'Khác', '150.00', '43.00', 'Lai Châu', 'Đau dạ dày, Táo bón mãn tính', NULL, '2025-08-31T06:23:09.931Z', '2025-12-25T08:55:44.553Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (149, 'doducdung85', 'doducdung85@hotmail.com', '0948463873', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 41, 'Khác', '162.00', '55.00', 'TP. Hồ Chí Minh', 'Đau khớp gối, Viêm da cơ địa, Suy nhược cơ thể', NULL, '2025-04-10T03:19:53.917Z', '2025-12-22T08:55:44.554Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (150, 'phamducgiang87', 'phamducgiang87@gmail.com', '0904434332', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 57, 'Nam', '168.00', '70.00', 'Thanh Hóa', NULL, NULL, '2025-02-27T10:07:23.266Z', '2025-12-08T08:55:44.555Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (154, 'nguyenbaoson54', 'nguyenbaoson54@yahoo.com', '0933409688', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 39, 'Nam', '175.00', '63.00', 'Thanh Hóa', 'Stress, Thoái hóa cột sống', NULL, '2025-11-27T18:36:30.686Z', '2025-12-24T08:55:44.560Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (155, 'phamthihung64', 'phamthihung64@hotmail.com', '0899366098', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 55, 'Nam', '182.00', '74.00', 'TP. Huế', NULL, NULL, '2025-02-05T05:30:44.533Z', '2025-12-11T08:55:44.561Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (156, 'dangminhminh31', 'dangminhminh31@email.com', '0998660152', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 20, 'Nam', '173.00', '78.00', 'Sơn La', NULL, NULL, '2025-09-20T11:32:33.550Z', '2025-12-03T08:55:44.562Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (157, 'phammaison40', 'phammaison40@yahoo.com', '0912888000', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 58, 'Nữ', '153.00', '60.00', 'Thái Nguyên', 'Viêm loét dạ dày, Viêm gan B', NULL, '2025-09-03T13:06:46.979Z', '2025-12-04T08:55:44.563Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (158, 'hoducnga77', 'hoducnga77@outlook.com', '0912336266', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 46, 'Nam', '163.00', '64.00', 'Bắc Ninh', NULL, 'Dị ứng aspirin, Dị ứng hải sản', '2025-12-23T05:38:39.408Z', '2025-12-18T08:55:44.564Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (128, 'huynhtuanlinh40', 'huynhtuanlinh40@outlook.com', '0948006296', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 60, 'Nữ', '170.00', '68.00', 'Lai Châu', NULL, NULL, '2025-03-01T18:26:58.809Z', '2025-12-25T08:55:44.533Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (136, 'duongngoclong34', 'duongngoclong34@outlook.com', '0966986060', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 67, 'Nữ', '159.00', '60.00', 'TP. Hà Nội', NULL, NULL, '2025-03-19T17:25:45.651Z', '2025-12-13T08:55:44.541Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (152, 'duongthanhngoc26', 'duongthanhngoc26@gmail.com', '0945467545', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 67, 'Nữ', '152.00', '46.00', 'TP. Huế', 'Táo bón mãn tính', NULL, '2025-02-11T20:56:24.446Z', '2025-12-03T08:55:44.557Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (127, 'phamvanthuy92', 'phamvanthuy92@hotmail.com', '0938432027', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 16, 'Nữ', '161.00', '65.00', 'Hà Tĩnh', NULL, NULL, '2025-01-14T02:59:47.050Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (131, 'hoangduchung45', 'hoangduchung45@yahoo.com', '0889030440', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 30, 'Nữ', '160.00', '67.00', 'Quảng Trị', NULL, NULL, '2025-05-07T06:41:24.874Z', '2025-12-16T08:55:44.536Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (132, 'nguyenthihanh11', 'nguyenthihanh11@gmail.com', '0977682858', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 28, 'Nữ', '153.00', '64.00', 'Quảng Ninh', NULL, NULL, '2025-12-18T09:14:46.216Z', '2025-12-05T08:55:44.537Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (151, 'lexuankhoa18', 'lexuankhoa18@gmail.com', '0947000073', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 19, 'Nữ', '165.00', '75.00', 'Quảng Ngãi', NULL, 'Dị ứng phấn hoa', '2025-07-21T06:49:56.697Z', '2025-12-15T08:55:44.556Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (129, 'duongquangphong42', 'duongquangphong42@outlook.com', '0919130817', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 60, 'Nữ', '155.00', '60.00', 'TP. Hải Phòng', 'Gout', 'Dị ứng đậu phộng', '2025-02-27T10:36:34.754Z', '2025-12-09T08:55:44.534Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (159, 'dangthanhlan20', 'dangthanhlan20@hotmail.com', '0967875418', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 44, 'Nam', '185.00', '64.00', 'TP. Hồ Chí Minh', 'Bệnh tim mạch, Stress, Đau khớp gối', NULL, '2025-08-13T16:17:32.453Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (160, 'dangphuongkhoa50', 'dangphuongkhoa50@hotmail.com', '0972125172', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 45, 'Nam', '176.00', '58.00', 'Đồng Nai', NULL, 'Dị ứng bụi nhà', '2025-10-16T03:36:19.164Z', '2025-12-02T08:55:44.567Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (161, 'vuvanhieu57', 'vuvanhieu57@yahoo.com', '0893961084', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 53, 'Khác', '160.00', '50.00', 'Nghệ An', 'Cholesterol cao, Gout', NULL, '2025-06-10T16:45:28.126Z', '2025-12-04T08:55:44.568Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (163, 'lethanhhuong52', 'lethanhhuong52@hotmail.com', '0964942896', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 40, 'Nữ', '168.00', '72.00', 'Quảng Ninh', 'Hen suyễn', NULL, '2025-08-22T11:19:01.367Z', '2025-12-20T08:55:44.570Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (164, 'phambaokhoa55', 'phambaokhoa55@email.com', '0969782283', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 13, 'Nữ', '151.00', '61.00', 'Điện Biên', 'Viêm họng', 'Dị ứng sulfa, Dị ứng penicillin', '2025-06-18T09:46:51.630Z', '2025-12-01T08:55:44.571Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (165, 'tranxuanhieu23', 'tranxuanhieu23@outlook.com', '0944590163', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 65, 'Nữ', '162.00', '55.00', 'Đồng Tháp', NULL, NULL, '2025-11-01T13:35:47.680Z', '2025-12-14T08:55:44.572Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (167, 'vulanlong39', 'vulanlong39@email.com', '0869480669', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 63, 'Nữ', '151.00', '59.00', 'Nghệ An', NULL, NULL, '2025-06-05T23:03:54.522Z', '2025-12-11T08:55:44.573Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (168, 'dangthao31', 'dangthao31@outlook.com', '0988648948', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 53, 'Nam', '177.00', '82.00', 'TP. Cần Thơ', 'Rụng tóc, Trào ngược dạ dày, Viêm họng', NULL, '2025-12-21T18:16:38.735Z', '2025-12-01T08:55:44.575Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (170, 'nguyenvannhung82', 'nguyenvannhung82@outlook.com', '0903419815', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 32, 'Nam', '169.00', '67.00', 'Vĩnh Long', NULL, NULL, '2025-05-28T17:45:08.427Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (171, 'buiquangthanh96', 'buiquangthanh96@outlook.com', '0915364665', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 35, 'Nam', '167.00', '70.00', 'Điện Biên', 'Viêm da cơ địa, Bệnh tim mạch', 'Dị ứng hải sản', '2025-12-08T20:49:45.280Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (173, 'dokimquan51', 'dokimquan51@yahoo.com', '0936912058', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 50, 'Nam', '172.00', '56.00', 'Lạng Sơn', NULL, 'Dị ứng trứng', '2025-08-28T00:33:59.363Z', '2025-12-02T08:55:44.581Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (174, 'buianhthao48', 'buianhthao48@yahoo.com', '0883486424', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 52, 'Nữ', '157.00', '69.00', 'Cao Bằng', 'Mất ngủ, Đau khớp gối, Trào ngược dạ dày', NULL, '2025-10-13T22:30:10.907Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (175, 'buiphuongbinh69', 'buiphuongbinh69@gmail.com', '0914004978', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 35, 'Nữ', '168.00', '56.00', 'Vĩnh Long', 'Viêm phế quản', NULL, '2025-01-28T11:20:16.924Z', '2025-12-30T08:55:44.583Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (176, 'dobaonhung26', 'dobaonhung26@hotmail.com', '0992853269', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 60, 'Nam', '169.00', '53.00', 'TP. Cần Thơ', NULL, NULL, '2025-12-17T02:17:39.595Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (177, 'vuphuonghieu51', 'vuphuonghieu51@gmail.com', '0947839337', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 43, 'Nam', '184.00', '74.00', 'Vĩnh Long', NULL, NULL, '2025-05-14T18:39:16.817Z', '2025-12-06T08:55:44.585Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (178, 'huynhvanhieu83', 'huynhvanhieu83@email.com', '0995366269', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 48, 'Nam', '168.00', '73.00', 'Phú Thọ', 'Thiếu máu, Táo bón mãn tính', NULL, '2025-02-12T20:36:19.605Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (179, 'trananhdung72', 'trananhdung72@yahoo.com', '0891051131', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 75, 'Nữ', '156.00', '50.00', 'Thanh Hóa', 'Trào ngược dạ dày, Cao huyết áp, Cholesterol cao', 'Dị ứng hải sản', '2025-07-21T11:16:56.428Z', '2025-12-30T08:55:44.587Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (180, 'vomaihanh24', 'vomaihanh24@email.com', '0886255913', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 44, 'Nữ', '153.00', '51.00', 'Quảng Ngãi', 'Viêm gan B, Mụn trứng cá', 'Dị ứng phấn hoa, Dị ứng latex', '2025-12-26T13:27:46.621Z', '2025-12-18T08:55:44.588Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (181, 'nguyenminhgiang12', 'nguyenminhgiang12@yahoo.com', '0919030627', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 23, 'Nam', '172.00', '67.00', 'Quảng Trị', NULL, 'Dị ứng sữa bò', '2025-03-20T21:14:22.006Z', '2025-12-12T08:55:44.589Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (182, 'huynhkimhung27', 'huynhkimhung27@outlook.com', '0973082885', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 75, 'Nam', '168.00', '52.00', 'Lai Châu', 'Đau đầu migraine, Viêm họng, Suy nhược cơ thể', 'Dị ứng trứng', '2025-04-24T08:07:41.960Z', '2025-12-04T08:55:44.590Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (184, 'phantuanthao28', 'phantuanthao28@gmail.com', '0892366721', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 37, 'Nữ', '157.00', '66.00', 'TP. Hồ Chí Minh', NULL, NULL, '2025-06-18T09:42:26.563Z', '2025-12-27T08:55:44.592Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (185, 'tranthanhcuong17', 'tranthanhcuong17@outlook.com', '0996311280', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 57, 'Nữ', '168.00', '62.00', 'TP. Đà Nẵng', NULL, 'Dị ứng penicillin, Dị ứng bụi nhà', '2025-10-11T05:40:12.785Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (186, 'dangngocanh72', 'dangngocanh72@gmail.com', '0985069815', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 51, 'Nam', '185.00', '78.00', 'Phú Thọ', 'Stress', NULL, '2025-01-23T05:31:10.641Z', '2025-12-12T08:55:44.595Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (187, 'levanhung69', 'levanhung69@gmail.com', '0985341270', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 49, 'Nữ', '156.00', '49.00', 'TP. Đà Nẵng', NULL, 'Dị ứng penicillin', '2025-02-27T12:23:17.492Z', '2025-12-02T08:55:44.596Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (188, 'nguyenhuonghanh19', 'nguyenhuonghanh19@email.com', '0996104032', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 62, 'Nam', '175.00', '80.00', 'Tây Ninh', 'Viêm khớp, Cao huyết áp', 'Dị ứng trứng, Dị ứng phấn hoa', '2025-01-31T08:25:07.030Z', '2025-12-27T08:55:44.597Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (190, 'tranngocquan47', 'tranngocquan47@outlook.com', '0961071136', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 16, 'Nam', '175.00', '58.00', 'TP. Huế', 'Mất ngủ', NULL, '2025-11-23T18:28:11.115Z', '2025-12-17T08:55:44.600Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (191, 'nguyenminhkhoa84', 'nguyenminhkhoa84@hotmail.com', '0902841497', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 58, 'Nam', '173.00', '80.00', 'Khánh Hoà', NULL, 'Dị ứng đậu phộng', '2025-01-03T21:47:30.955Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (192, 'hoanghaihuong68', 'hoanghaihuong68@outlook.com', '0973940596', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 60, 'Nam', '180.00', '77.00', 'Nghệ An', 'Suy nhược cơ thể', NULL, '2025-10-12T06:20:32.278Z', '2025-12-29T08:55:44.602Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (166, 'nguyenminhlong88', 'nguyenminhlong88@outlook.com', '0968757373', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 16, 'Nam', '165.00', '59.00', 'Hà Tĩnh', NULL, NULL, '2025-08-27T00:12:03.237Z', '2025-12-04T08:55:44.572Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (162, 'ngothumai88', 'ngothumai88@email.com', '0948227174', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 19, 'Nữ', '167.00', '60.00', 'Ninh Bình', 'Béo phì', 'Dị ứng penicillin', '2025-02-13T12:06:30.050Z', '2025-12-26T08:55:44.569Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (169, 'ngothanhngoc30', 'ngothanhngoc30@gmail.com', '0986730750', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 17, 'Nữ', '164.00', '55.00', 'Tuyên Quang', NULL, NULL, '2025-08-17T16:26:06.461Z', '2025-12-09T08:55:44.576Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (183, 'nguyenthanhthuy39', 'nguyenthanhthuy39@outlook.com', '0862929688', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 46, 'Nam', '155.00', '49.00', 'Ninh Bình', 'Viêm mũi dị ứng', NULL, '2025-09-21T01:37:40.558Z', '2025-12-06T08:55:44.591Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (189, 'hothanhnam19', 'hothanhnam19@yahoo.com', '0963844746', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 66, 'Nữ', '155.00', '53.00', 'Lào Cai', NULL, NULL, '2025-12-02T08:20:47.722Z', '2025-12-01T08:55:44.599Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (193, 'vothanhdung72', 'vothanhdung72@email.com', '0967788690', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 51, 'Nữ', '167.00', '71.00', 'Hưng Yên', 'Đau đầu migraine, Tiểu đường type 2, Suy nhược cơ thể', 'Dị ứng latex', '2025-08-07T20:31:28.757Z', '2025-12-15T08:55:44.603Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (194, 'vokimhuong81', 'vokimhuong81@hotmail.com', '0989766808', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 57, 'Nữ', '151.00', '59.00', 'Vĩnh Long', 'Tiểu đường type 2, Đau khớp gối, Viêm loét dạ dày', NULL, '2025-06-26T03:50:42.641Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (195, 'hoson31', 'hoson31@email.com', '0966918194', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 39, 'Nam', '178.00', '73.00', 'Lạng Sơn', 'Hen suyễn, Cholesterol cao', NULL, '2025-07-28T16:43:02.047Z', '2025-12-28T08:55:44.605Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (197, 'lelanbinh22', 'lelanbinh22@hotmail.com', '0961110500', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 28, 'Nữ', '152.00', '51.00', 'Ninh Bình', NULL, NULL, '2025-09-10T10:11:21.429Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (199, 'dangkimvy82', 'dangkimvy82@yahoo.com', '0919582566', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 41, 'Nữ', '156.00', '65.00', 'Phú Thọ', NULL, 'Dị ứng sulfa', '2025-09-18T04:14:08.088Z', '2025-12-12T08:55:44.611Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (202, 'huynhducdung91', 'huynhducdung91@email.com', '0898119272', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 32, 'Nam', '179.00', '86.00', 'Sơn La', 'Viêm xoang, Rụng tóc', NULL, '2025-07-06T06:50:41.290Z', '2025-12-15T08:55:44.614Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (204, 'duongminhtuan15', 'duongminhtuan15@gmail.com', '0903579861', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 30, 'Nữ', '166.00', '63.00', 'Lào Cai', NULL, NULL, '2025-03-26T02:23:04.000Z', '2025-11-30T08:55:44.619Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (205, 'hotuanhoa67', 'hotuanhoa67@gmail.com', '0994690789', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 45, 'Nam', '161.00', '64.00', 'Vĩnh Long', 'Viêm xoang', NULL, '2025-07-20T09:55:05.426Z', '2025-12-23T08:55:44.620Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (207, 'vomaimai34', 'vomaimai34@hotmail.com', '0998828834', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 46, 'Nam', '173.00', '72.00', 'Đắk Lắk', 'Đau khớp gối', 'Dị ứng penicillin', '2025-01-25T15:10:31.644Z', '2025-12-29T08:55:44.622Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (208, 'lyngoc90', 'lyngoc90@email.com', '0987721930', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 71, 'Nữ', '153.00', '63.00', 'Đồng Tháp', 'Suy nhược cơ thể', 'Dị ứng phấn hoa, Dị ứng penicillin', '2025-11-22T07:57:17.207Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (210, 'dongocphong25', 'dongocphong25@gmail.com', '0867756882', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 20, 'Nữ', '167.00', '58.00', 'Ninh Bình', 'Viêm họng, Đau khớp gối', NULL, '2025-03-28T19:41:36.006Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (211, 'vuthuthuy19', 'vuthuthuy19@email.com', '0973787217', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 26, 'Nữ', '165.00', '56.00', 'An Giang', 'Stress, Mụn trứng cá', 'Dị ứng sữa bò', '2025-09-05T18:50:52.624Z', '2025-12-10T08:55:44.627Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (212, 'duongthuyen88', 'duongthuyen88@yahoo.com', '0881947741', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 22, 'Nữ', '154.00', '64.00', 'TP. Huế', NULL, 'Dị ứng bụi nhà, Dị ứng trứng', '2025-10-25T20:02:37.378Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (213, 'phamquanganh63', 'phamquanganh63@yahoo.com', '0913392680', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 73, 'Nữ', '157.00', '62.00', 'Phú Thọ', 'Đau lưng mãn tính', NULL, '2025-01-16T16:45:02.547Z', '2025-12-27T08:55:44.629Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (215, 'ngothuha51', 'ngothuha51@outlook.com', '0972225880', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 33, 'Nam', '163.00', '56.00', 'Lâm Đồng', 'Trào ngược dạ dày, Viêm họng', NULL, '2025-08-23T14:40:19.447Z', '2025-12-21T08:55:44.631Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (218, 'buiminhnhung46', 'buiminhnhung46@gmail.com', '0943613491', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 36, 'Nam', '183.00', '86.00', 'Cà Mau', 'Gout, Táo bón mãn tính', NULL, '2025-01-11T23:00:53.594Z', '2025-12-30T08:55:44.634Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (219, 'holanhieu56', 'holanhieu56@yahoo.com', '0971402959', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 65, 'Nam', '162.00', '50.00', 'Nghệ An', 'Viêm xoang, Thiếu máu, Bệnh tim mạch', NULL, '2025-07-25T00:26:47.037Z', '2025-12-19T08:55:44.634Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (220, 'huynhthugiang30', 'huynhthugiang30@gmail.com', '0911526342', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 65, 'Nam', '164.00', '59.00', 'Thái Nguyên', 'Viêm da cơ địa, Viêm khớp, Stress', 'Dị ứng đậu phộng, Dị ứng sữa bò', '2025-08-21T20:06:34.214Z', '2025-12-12T08:55:44.635Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (221, 'ngoquangtrung76', 'ngoquangtrung76@outlook.com', '0999054858', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 36, 'Nữ', '163.00', '61.00', 'Gia Lai', 'Táo bón mãn tính, Đau đầu migraine', NULL, '2025-02-07T01:00:13.745Z', '2025-12-01T08:55:44.636Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (222, 'nguyenvanlinh66', 'nguyenvanlinh66@outlook.com', '0981620514', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 60, 'Nam', '185.00', '88.00', 'Quảng Ngãi', NULL, 'Dị ứng aspirin', '2025-09-28T14:13:48.679Z', '2025-12-27T08:55:44.637Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (223, 'vuhuongphong88', 'vuhuongphong88@email.com', '0983431004', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 27, 'Nam', '175.00', '73.00', 'TP. Hà Nội', NULL, NULL, '2025-04-21T16:59:01.936Z', '2025-12-14T08:55:44.638Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (224, 'trantuanphuong77', 'trantuanphuong77@gmail.com', '0869992941', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 33, 'Nữ', '164.00', '58.00', 'Ninh Bình', NULL, NULL, '2025-04-09T08:49:38.073Z', '2025-12-04T08:55:44.639Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (225, 'phanquanghoa92', 'phanquanghoa92@hotmail.com', '0989331466', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 69, 'Nam', '167.00', '55.00', 'Quảng Ninh', 'Táo bón mãn tính, Trào ngược dạ dày', NULL, '2025-01-28T07:16:29.287Z', '2025-12-10T08:55:44.640Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (196, 'duongmaiquan70', 'duongmaiquan70@hotmail.com', '0911051403', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 65, 'Nữ', '156.00', '50.00', 'Đồng Tháp', 'Viêm phế quản, Rối loạn tiêu hóa', NULL, '2025-05-07T15:41:21.408Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (201, 'phanvanlan10', 'phanvanlan10@yahoo.com', '0982087520', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 68, 'Nam', '160.00', '64.00', 'Đồng Nai', 'Tiểu đường type 2, Cholesterol cao', NULL, '2025-05-03T20:00:11.562Z', '2025-12-28T08:55:44.613Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (198, 'doxuanlinh62', 'doxuanlinh62@outlook.com', '0907510048', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 33, 'Nữ', '161.00', '67.00', 'Thanh Hóa', NULL, NULL, '2025-09-18T19:32:46.032Z', '2025-12-10T08:55:44.609Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (214, 'hoangkimson24', 'hoangkimson24@yahoo.com', '0911906400', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 13, 'Nam', '149.00', '49.00', 'TP. Huế', 'Cảm cúm thường xuyên', NULL, '2025-11-03T01:28:13.762Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (209, 'ngominhvinh76', 'ngominhvinh76@email.com', '0986756346', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 59, 'Nam', '165.00', '53.00', 'Quảng Ninh', 'Đau đầu migraine', NULL, '2025-09-05T05:25:48.499Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (216, 'danghuonghuong32', 'danghuonghuong32@outlook.com', '0995419719', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 16, 'Nam', '163.00', '54.00', 'TP. Huế', 'Hen suyễn, Đau lưng mãn tính, Viêm gan B', NULL, '2025-10-14T17:23:58.450Z', '2025-12-21T08:55:44.632Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (226, 'huynhkiman87', 'huynhkiman87@email.com', '0988790235', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 26, 'Nữ', '151.00', '48.00', 'Ninh Bình', 'Viêm da cơ địa, Viêm họng', NULL, '2025-09-08T05:56:31.333Z', '2025-12-19T08:55:44.642Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (206, 'nguyenxuanthanh56', 'nguyenxuanthanh56@outlook.com', '0914633488', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 65, 'Nữ', '153.00', '44.00', 'Cà Mau', NULL, NULL, '2025-08-05T02:41:57.350Z', '2025-12-10T08:55:44.621Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (203, 'lyngocphuong79', 'lyngocphuong79@gmail.com', '0864519582', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 27, 'Nam', '156.00', '60.00', 'Cà Mau', NULL, 'Dị ứng sulfa', '2025-01-21T20:56:22.318Z', '2025-12-11T08:55:44.616Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (227, 'hoangthituan98', 'hoangthituan98@hotmail.com', '0913823846', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 25, 'Nam', '183.00', '82.00', 'Hưng Yên', NULL, NULL, '2025-05-28T11:39:25.498Z', '2025-12-27T08:55:44.643Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (228, 'lethanhthanh61', 'lethanhthanh61@email.com', '0906978921', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 61, 'Nữ', '162.00', '53.00', 'Cao Bằng', 'Đau khớp gối, Tiểu đường type 2, Rụng tóc', NULL, '2025-05-02T21:09:59.370Z', '2025-12-22T08:55:44.644Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (230, 'hothucuong32', 'hothucuong32@email.com', '0893476196', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 37, 'Nam', '166.00', '50.00', 'Vĩnh Long', NULL, NULL, '2025-06-02T13:17:32.261Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (231, 'hoangthanhlong68', 'hoangthanhlong68@gmail.com', '0995564277', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 37, 'Khác', '157.00', '53.00', 'Đồng Nai', NULL, NULL, '2025-06-25T15:52:59.039Z', '2025-12-14T08:55:44.648Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (232, 'doanh72', 'doanh72@gmail.com', '0991482654', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 39, 'Nam', '177.00', '61.00', 'Cà Mau', 'Bệnh tim mạch, Đau khớp gối', 'Dị ứng trứng, Dị ứng phấn hoa', '2025-10-09T02:29:39.381Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (233, 'buihainhung75', 'buihainhung75@outlook.com', '0896369848', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 41, 'Nữ', '150.00', '63.00', 'Quảng Ninh', 'Thiếu máu', NULL, '2025-09-21T21:26:02.463Z', '2025-12-16T08:55:44.650Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (234, 'dothanhyen40', 'dothanhyen40@email.com', '0972493263', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 18, 'Nam', '183.00', '66.00', 'Cà Mau', NULL, NULL, '2025-07-26T02:33:21.527Z', '2025-12-02T08:55:44.650Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (235, 'lephuonganh13', 'lephuonganh13@email.com', '0968408060', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 43, 'Nam', '176.00', '82.00', 'Đồng Nai', 'Viêm phế quản, Rụng tóc, Rối loạn tiêu hóa', NULL, '2025-07-30T08:50:34.414Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (236, 'tranxuanphuong44', 'tranxuanphuong44@gmail.com', '0891238815', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 29, 'Nam', '166.00', '51.00', 'TP. Cần Thơ', NULL, 'Dị ứng latex', '2025-09-15T12:27:16.209Z', '2025-11-30T08:55:44.652Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (238, 'lyhaitu71', 'lyhaitu71@yahoo.com', '0967274369', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 45, 'Nữ', '157.00', '64.00', 'Lạng Sơn', NULL, 'Dị ứng phấn hoa, Dị ứng sữa bò', '2025-02-07T01:54:40.932Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (239, 'nguyenthithuy37', 'nguyenthithuy37@hotmail.com', '0949775787', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 27, 'Nữ', '170.00', '59.00', 'Đồng Nai', 'Rối loạn tiêu hóa', NULL, '2025-06-26T13:41:53.406Z', '2025-12-05T08:55:44.655Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (240, 'ngomainga11', 'ngomainga11@yahoo.com', '0915069395', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 58, 'Nữ', '152.00', '53.00', 'Đồng Nai', NULL, NULL, '2025-11-13T20:22:54.938Z', '2025-12-13T08:55:44.657Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (241, 'phanvanthuy93', 'phanvanthuy93@hotmail.com', '0863935174', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 74, 'Nữ', '169.00', '68.00', 'Quảng Ninh', 'Đau khớp gối', NULL, '2025-01-01T22:21:16.135Z', '2025-12-04T08:55:44.658Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (242, 'vuducbinh45', 'vuducbinh45@yahoo.com', '0863899353', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 48, 'Nam', '171.00', '63.00', 'Đắk Lắk', NULL, NULL, '2025-05-03T16:05:04.562Z', '2025-12-08T08:55:44.659Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (243, 'nguyenbaoha92', 'nguyenbaoha92@outlook.com', '0917632151', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 14, 'Khác', '152.00', '44.00', 'TP. Đà Nẵng', 'Bệnh tim mạch', NULL, '2025-07-21T15:27:10.954Z', '2025-12-13T08:55:44.660Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (244, 'huynhkimngoc63', 'huynhkimngoc63@outlook.com', '0978894058', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 67, 'Nam', '174.00', '76.00', 'Khánh Hoà', NULL, NULL, '2025-11-20T05:32:26.025Z', '2025-12-29T08:55:44.661Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (247, 'dangkimhieu92', 'dangkimhieu92@email.com', '0898136523', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 34, 'Nam', '177.00', '87.00', 'Nghệ An', NULL, NULL, '2025-07-08T01:49:38.168Z', '2025-12-12T08:55:44.664Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (248, 'lehailinh67', 'lehailinh67@hotmail.com', '0994194151', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 34, 'Nữ', '165.00', '50.00', 'Thái Nguyên', NULL, NULL, '2025-04-04T20:35:48.538Z', '2025-12-09T08:55:44.665Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (250, 'ngohuongyen10', 'ngohuongyen10@yahoo.com', '0933688994', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 62, 'Nam', '164.00', '72.00', 'Lào Cai', NULL, NULL, '2025-03-25T12:15:38.820Z', '2025-12-24T08:55:44.668Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (252, 'vuvanlan10', 'vuvanlan10@gmail.com', '0987652649', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 37, 'Nam', '178.00', '79.00', 'Tuyên Quang', 'Gout, Cao huyết áp, Tiểu đường type 2', 'Dị ứng sulfa', '2025-06-02T15:54:12.126Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (253, 'huynhbaolong55', 'huynhbaolong55@hotmail.com', '0962747590', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 25, 'Nữ', '150.00', '49.00', 'Vĩnh Long', 'Hen suyễn, Rối loạn tiêu hóa, Cao huyết áp', NULL, '2025-04-11T16:42:45.014Z', '2025-12-15T08:55:44.671Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (255, 'levanphuong81', 'levanphuong81@outlook.com', '0945768337', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 25, 'Khác', '159.00', '67.00', 'Quảng Ninh', 'Viêm loét dạ dày', NULL, '2025-05-08T19:40:42.999Z', '2025-12-29T08:55:44.674Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (256, 'duonglangiang98', 'duonglangiang98@hotmail.com', '0893945430', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 60, 'Nữ', '162.00', '67.00', 'Thái Nguyên', 'Gout, Rối loạn tiêu hóa', 'Dị ứng penicillin', '2025-10-11T00:55:39.504Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (257, 'hothanhbinh41', 'hothanhbinh41@hotmail.com', '0983117684', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 13, 'Nữ', '151.00', '52.00', 'Tuyên Quang', NULL, NULL, '2025-07-31T15:14:56.323Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (258, 'phanminhthuy28', 'phanminhthuy28@outlook.com', '0997658310', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 60, 'Nam', '173.00', '62.00', 'Gia Lai', NULL, NULL, '2025-05-19T01:50:52.921Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (259, 'hoquangnhung51', 'hoquangnhung51@email.com', '0962912176', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 46, 'Nữ', '158.00', '59.00', 'Thái Nguyên', 'Trào ngược dạ dày, Tiểu đường type 2, Suy nhược cơ thể', 'Dị ứng aspirin, Dị ứng bụi nhà', '2025-06-24T19:35:44.321Z', '2025-12-29T08:55:44.679Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (261, 'phamminhanh88', 'phamminhanh88@gmail.com', '0996303536', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 43, 'Nam', '168.00', '74.00', 'An Giang', 'Viêm khớp, Viêm gan B', NULL, '2025-05-28T10:15:48.177Z', '2025-11-30T08:55:44.681Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (237, 'huynhduclinh56', 'huynhduclinh56@outlook.com', '0899369849', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 20, 'Nữ', '151.00', '44.00', 'Khánh Hoà', NULL, NULL, '2025-12-29T13:11:12.187Z', '2025-12-08T08:55:44.653Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (246, 'duonghaitrang18', 'duonghaitrang18@email.com', '0964959723', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 64, 'Nam', '166.00', '53.00', 'Nghệ An', NULL, NULL, '2025-06-21T22:01:04.134Z', '2025-11-30T08:55:44.663Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (229, 'builananh79', 'builananh79@gmail.com', '0987112499', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 42, 'Nam', '151.00', '57.00', 'TP. Hải Phòng', NULL, NULL, '2025-07-19T18:00:26.065Z', '2025-11-30T08:55:44.646Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (251, 'buiquangminh36', 'buiquangminh36@email.com', '0965187779', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 30, 'Nam', '166.00', '58.00', 'Cà Mau', 'Viêm loét dạ dày, Rối loạn tiêu hóa', 'Dị ứng latex, Dị ứng hải sản', '2025-05-29T01:55:51.041Z', '2025-12-12T08:55:44.669Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (245, 'phamthihanh76', 'phamthihanh76@outlook.com', '0897044371', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 59, 'Nam', '152.00', '45.00', 'TP. Đà Nẵng', NULL, NULL, '2025-03-06T10:26:54.397Z', '2025-12-21T08:55:44.662Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (249, 'vuthivinh12', 'vuthivinh12@gmail.com', '0984583192', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 64, 'Nam', '152.00', '64.00', 'Tây Ninh', NULL, NULL, '2025-05-14T15:11:43.461Z', '2025-12-13T08:55:44.667Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (254, 'huynhbaovy96', 'huynhbaovy96@yahoo.com', '0947465985', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 18, 'Nữ', '159.00', '50.00', 'Lạng Sơn', 'Đau khớp gối, Cao huyết áp', NULL, '2025-07-07T13:51:38.103Z', '2025-12-05T08:55:44.672Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (263, 'vothituan41', 'vothituan41@gmail.com', '0863132040', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 54, 'Nữ', '163.00', '65.00', 'Đắk Lắk', NULL, 'Dị ứng bụi nhà, Dị ứng phấn hoa', '2025-08-12T09:01:37.914Z', '2025-11-30T08:55:44.683Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (264, 'huynhducchi56', 'huynhducchi56@gmail.com', '0892987803', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 33, 'Nữ', '160.00', '68.00', 'TP. Hồ Chí Minh', NULL, 'Dị ứng đậu phộng', '2025-03-19T20:51:12.621Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (265, 'leducnam26', 'leducnam26@outlook.com', '0935986489', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 35, 'Khác', '157.00', '49.00', 'Thái Nguyên', 'Rối loạn tiêu hóa, Đau lưng mãn tính, Viêm da cơ địa', NULL, '2025-05-10T11:49:49.100Z', '2025-12-03T08:55:44.685Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (266, 'phamthanhminh11', 'phamthanhminh11@yahoo.com', '0938813943', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 62, 'Nam', '161.00', '71.00', 'Sơn La', 'Cao huyết áp, Tiểu đường type 2', 'Dị ứng bụi nhà, Dị ứng phấn hoa', '2025-03-12T15:35:14.230Z', '2025-12-30T08:55:44.686Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (267, 'hohuonghung14', 'hohuonghung14@gmail.com', '0885955235', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 40, 'Nữ', '151.00', '49.00', 'Cao Bằng', 'Bệnh tim mạch, Viêm khớp', NULL, '2025-11-23T01:19:18.382Z', '2025-12-06T08:55:44.687Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (268, 'nguyenducdung85', 'nguyenducdung85@outlook.com', '0935064465', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 68, 'Nữ', '158.00', '45.00', 'Cao Bằng', NULL, NULL, '2025-05-21T08:35:15.745Z', '2025-12-04T08:55:44.688Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (269, 'nguyenphuonglinh38', 'nguyenphuonglinh38@email.com', '0896040884', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 42, 'Nữ', '150.00', '49.00', 'Lai Châu', 'Viêm loét dạ dày, Cholesterol cao', 'Dị ứng bụi nhà, Dị ứng penicillin', '2025-08-31T09:31:24.739Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (271, 'duongxuanvy72', 'duongxuanvy72@email.com', '0961725514', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 74, 'Nam', '162.00', '60.00', 'Điện Biên', 'Bệnh tim mạch, Suy nhược cơ thể', NULL, '2025-10-31T17:55:57.120Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (272, 'hominhha32', 'hominhha32@email.com', '0904497060', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 68, 'Nam', '173.00', '60.00', 'TP. Huế', NULL, NULL, '2025-04-16T12:16:24.583Z', '2025-12-08T08:55:44.692Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (274, 'ngotuanhoa21', 'ngotuanhoa21@email.com', '0898592794', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 16, 'Khác', '150.00', '44.00', 'Sơn La', 'Táo bón mãn tính, Béo phì', NULL, '2025-08-05T22:19:21.279Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (275, 'vuxuanngoc53', 'vuxuanngoc53@outlook.com', '0915138014', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 43, 'Nữ', '166.00', '72.00', 'Gia Lai', 'Viêm xoang', NULL, '2025-07-05T22:51:54.502Z', '2025-12-01T08:55:44.695Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (276, 'duonglan44', 'duonglan44@hotmail.com', '0966456687', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 65, 'Nữ', '155.00', '45.00', 'Đồng Tháp', 'Cảm cúm thường xuyên', NULL, '2025-05-17T18:35:15.632Z', '2025-12-01T08:55:44.696Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (277, 'hotuanhai93', 'hotuanhai93@hotmail.com', '0885669379', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 36, 'Nam', '178.00', '70.00', 'Cao Bằng', 'Viêm xoang', 'Dị ứng sulfa', '2025-02-10T02:49:12.564Z', '2025-12-26T08:55:44.697Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (278, 'hoangthanhson63', 'hoangthanhson63@yahoo.com', '0911101332', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 26, 'Nữ', '165.00', '65.00', 'Vĩnh Long', NULL, NULL, '2025-11-11T02:44:57.681Z', '2025-12-24T08:55:44.698Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (279, 'hoangtuanhanh12', 'hoangtuanhanh12@email.com', '0884174039', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 57, 'Khác', '163.00', '56.00', 'TP. Hồ Chí Minh', NULL, NULL, '2025-04-20T20:40:11.749Z', '2025-12-23T08:55:44.699Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (280, 'dolantrang37', 'dolantrang37@gmail.com', '0948353157', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 30, 'Nam', '167.00', '60.00', 'Đồng Nai', 'Táo bón mãn tính, Viêm xoang', NULL, '2025-03-20T18:57:25.855Z', '2025-12-21T08:55:44.700Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (281, 'ngotuanlan63', 'ngotuanlan63@email.com', '0966044504', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 65, 'Nam', '178.00', '61.00', 'Đồng Tháp', 'Suy nhược cơ thể', 'Dị ứng đậu phộng, Dị ứng trứng', '2025-04-20T12:34:58.702Z', '2025-12-20T08:55:44.701Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (282, 'phanminhan41', 'phanminhan41@yahoo.com', '0971079480', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 70, 'Nữ', '170.00', '68.00', 'Ninh Bình', 'Đau dạ dày, Viêm họng, Rụng tóc', NULL, '2025-08-02T22:34:14.552Z', '2025-12-20T08:55:44.702Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (283, 'tranmaiphuong27', 'tranmaiphuong27@email.com', '0882470336', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 19, 'Nam', '173.00', '56.00', 'TP. Hải Phòng', 'Viêm họng, Táo bón mãn tính, Mất ngủ', NULL, '2025-10-16T16:16:30.422Z', '2025-12-05T08:55:44.703Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (284, 'lyanhthanh16', 'lyanhthanh16@gmail.com', '0892281042', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 39, 'Nữ', '167.00', '76.00', 'Phú Thọ', 'Mất ngủ, Cảm cúm thường xuyên', NULL, '2025-06-08T02:47:34.549Z', '2025-12-27T08:55:44.704Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (285, 'buiminhgiang33', 'buiminhgiang33@email.com', '0939340118', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 38, 'Nam', '164.00', '66.00', 'TP. Hà Nội', NULL, NULL, '2025-01-31T07:56:37.537Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (286, 'huynhducquan60', 'huynhducquan60@email.com', '0914795725', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 43, 'Nam', '162.00', '58.00', 'Nghệ An', 'Stress, Tiểu đường type 2, Đau đầu migraine', NULL, '2025-09-27T12:32:07.411Z', '2025-12-22T08:55:44.706Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (287, 'phamthinhung76', 'phamthinhung76@gmail.com', '0978575578', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 16, 'Nữ', '156.00', '56.00', 'Ninh Bình', 'Hen suyễn', NULL, '2025-08-26T12:39:23.498Z', '2025-12-13T08:55:44.708Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (288, 'vuanhnga77', 'vuanhnga77@hotmail.com', '0897120027', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 53, 'Khác', '169.00', '80.00', 'Thanh Hóa', NULL, NULL, '2025-06-25T11:42:03.684Z', '2025-12-12T08:55:44.709Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (289, 'vophuongminh35', 'vophuongminh35@hotmail.com', '0944363801', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 26, 'Nam', '172.00', '56.00', 'Lạng Sơn', NULL, NULL, '2025-11-19T12:14:32.828Z', '2025-12-04T08:55:44.710Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (290, 'tranduccuong17', 'tranduccuong17@email.com', '0975688579', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 58, 'Nam', '184.00', '94.00', 'Lạng Sơn', NULL, 'Dị ứng trứng', '2025-06-21T18:00:20.849Z', '2025-12-02T08:55:44.711Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (291, 'ngovananh38', 'ngovananh38@hotmail.com', '0978330453', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 60, 'Nữ', '166.00', '69.00', 'Thái Nguyên', 'Đau lưng mãn tính', 'Dị ứng trứng', '2025-03-28T22:34:34.130Z', '2025-12-20T08:55:44.712Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (292, 'nguyenxuanthanh73', 'nguyenxuanthanh73@gmail.com', '0973988141', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 68, 'Nữ', '165.00', '75.00', 'Thanh Hóa', 'Viêm loét dạ dày, Cholesterol cao, Viêm gan B', NULL, '2025-11-06T14:15:25.348Z', '2025-12-07T08:55:44.713Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (293, 'vuxuannhung98', 'vuxuannhung98@yahoo.com', '0987192567', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 34, 'Nam', '175.00', '55.00', 'TP. Hồ Chí Minh', 'Stress, Mụn trứng cá, Thiếu máu', NULL, '2025-10-07T12:37:04.704Z', '2025-12-04T08:55:44.714Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (294, 'buivannhung80', 'buivannhung80@outlook.com', '0939670643', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 49, 'Khác', '157.00', '63.00', 'Tây Ninh', NULL, 'Dị ứng trứng', '2025-12-01T17:32:42.123Z', '2025-12-07T08:55:44.715Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (295, 'nguyentuantrang72', 'nguyentuantrang72@yahoo.com', '0867275439', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 52, 'Khác', '167.00', '74.00', 'Lai Châu', 'Rối loạn tiêu hóa, Béo phì', NULL, '2025-07-06T20:20:59.435Z', '2025-12-24T08:55:44.717Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (262, 'buiphuongnga98', 'buiphuongnga98@yahoo.com', '0897173743', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 28, 'Nam', '170.00', '72.00', 'Gia Lai', NULL, NULL, '2025-09-08T09:33:54.237Z', '2025-12-10T08:55:44.682Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (273, 'lyngocngoc96', 'lyngocngoc96@yahoo.com', '0897953936', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 36, 'Nữ', '163.00', '53.00', 'Tuyên Quang', NULL, NULL, '2025-08-23T13:56:05.435Z', '2025-12-06T08:55:44.694Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (297, 'vuxuanthao17', 'vuxuanthao17@yahoo.com', '0863206551', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 33, 'Nam', '171.00', '56.00', 'Lào Cai', NULL, NULL, '2025-10-11T19:45:55.529Z', '2025-12-29T08:55:44.719Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (298, 'dokimthanh61', 'dokimthanh61@hotmail.com', '0988076923', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 54, 'Nam', '161.00', '62.00', 'Gia Lai', 'Cảm cúm thường xuyên, Tiểu đường type 2', 'Dị ứng aspirin', '2025-10-15T13:55:41.755Z', '2025-12-08T08:55:44.720Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (301, 'lyquanggiang59', 'lyquanggiang59@email.com', '0902172803', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 36, 'Nam', '175.00', '57.00', 'TP. Hải Phòng', 'Viêm phế quản, Gout, Viêm loét dạ dày', NULL, '2025-04-26T23:26:07.634Z', '2025-12-11T08:55:44.724Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (302, 'danganhchi31', 'danganhchi31@yahoo.com', '0942960248', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 55, 'Nam', '162.00', '69.00', 'Đắk Lắk', 'Viêm mũi dị ứng', NULL, '2025-06-06T06:46:30.181Z', '2025-12-11T08:55:44.726Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (304, 'ngobaongoc41', 'ngobaongoc41@hotmail.com', '0947233860', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 29, 'Nữ', '151.00', '59.00', 'Thái Nguyên', NULL, 'Dị ứng hải sản', '2025-03-26T22:00:28.894Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (305, 'buingocnhung58', 'buingocnhung58@yahoo.com', '0966162493', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 41, 'Nam', '167.00', '72.00', 'TP. Cần Thơ', 'Táo bón mãn tính, Viêm phế quản, Viêm họng', NULL, '2025-08-15T14:16:38.860Z', '2025-12-16T08:55:44.729Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (307, 'vothuvy38', 'vothuvy38@gmail.com', '0896639047', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 15, 'Nam', '170.00', '63.00', 'Gia Lai', NULL, 'Dị ứng phấn hoa, Dị ứng trứng', '2025-08-03T10:47:57.726Z', '2025-12-07T08:55:44.731Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (308, 'huynhanhthao81', 'huynhanhthao81@gmail.com', '0913018772', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 25, 'Nam', '169.00', '76.00', 'Vĩnh Long', 'Viêm gan B, Béo phì, Gout', NULL, '2025-12-13T17:26:13.115Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (309, 'nguyenkimthanh86', 'nguyenkimthanh86@hotmail.com', '0899588232', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 72, 'Nữ', '159.00', '54.00', 'TP. Hà Nội', 'Suy nhược cơ thể, Viêm khớp', NULL, '2025-04-28T03:29:52.556Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (310, 'phamlanphong15', 'phamlanphong15@yahoo.com', '0889532390', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 14, 'Nữ', '146.00', '41.00', 'Tuyên Quang', NULL, NULL, '2025-11-07T09:22:06.377Z', '2025-12-14T08:55:44.734Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (311, 'buihuongvy61', 'buihuongvy61@outlook.com', '0931383518', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 62, 'Nam', '163.00', '55.00', 'Điện Biên', 'Viêm gan B', NULL, '2025-07-29T12:54:11.766Z', '2025-12-13T08:55:44.735Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (312, 'phamlantrung14', 'phamlantrung14@email.com', '0971763039', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 61, 'Nam', '162.00', '67.00', 'TP. Huế', 'Viêm xoang, Đau khớp gối, Bệnh tim mạch', NULL, '2025-05-28T01:08:36.486Z', '2025-12-02T08:55:44.735Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (314, 'nguyenvannga12', 'nguyenvannga12@gmail.com', '0935895070', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 64, 'Khác', '154.00', '62.00', 'Đắk Lắk', 'Viêm mũi dị ứng, Rối loạn tiêu hóa, Đau khớp gối', NULL, '2025-10-28T05:25:05.478Z', '2025-12-24T08:55:44.737Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (315, 'hoanghoanganh49', 'hoanghoanganh49@hotmail.com', '0935945336', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 18, 'Khác', '155.00', '52.00', 'Lai Châu', 'Viêm họng', 'Dị ứng penicillin, Dị ứng bụi nhà', '2025-07-05T06:28:03.555Z', '2025-12-22T08:55:44.738Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (316, 'nguyenducdung35', 'nguyenducdung35@outlook.com', '0967818544', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 64, 'Nữ', '167.00', '52.00', 'Lạng Sơn', 'Đau khớp gối, Thiếu máu, Viêm loét dạ dày', NULL, '2024-12-30T21:34:30.199Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (317, 'volanthao33', 'volanthao33@hotmail.com', '0893088597', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 50, 'Nữ', '169.00', '72.00', 'Đồng Tháp', NULL, NULL, '2025-04-01T19:04:08.169Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (320, 'ngoanhminh17', 'ngoanhminh17@hotmail.com', '0962488906', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 25, 'Nữ', '162.00', '57.00', 'Vĩnh Long', NULL, 'Dị ứng bụi nhà', '2025-01-21T16:45:18.584Z', '2025-12-17T08:55:44.744Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (321, 'lyphuongvy40', 'lyphuongvy40@yahoo.com', '0996245360', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 44, 'Khác', '166.00', '55.00', 'Thanh Hóa', NULL, NULL, '2025-08-15T00:31:11.895Z', '2025-11-30T08:55:44.745Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (322, 'hokimthanh75', 'hokimthanh75@yahoo.com', '0995989788', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 72, 'Khác', '164.00', '51.00', 'Gia Lai', 'Viêm loét dạ dày, Hen suyễn, Viêm khớp', NULL, '2025-11-14T02:20:39.443Z', '2025-12-20T08:55:44.747Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (323, 'hominhnga73', 'hominhnga73@hotmail.com', '0911079876', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 20, 'Nữ', '162.00', '52.00', 'Thái Nguyên', 'Táo bón mãn tính', NULL, '2025-11-11T04:17:42.241Z', '2025-12-16T08:55:44.748Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (325, 'hothugiang78', 'hothugiang78@yahoo.com', '0988574096', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 58, 'Nam', '182.00', '62.00', 'Lâm Đồng', NULL, NULL, '2025-07-08T04:11:41.741Z', '2025-12-27T08:55:44.750Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (326, 'holannhung40', 'holannhung40@yahoo.com', '0897466534', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 23, 'Nữ', '159.00', '57.00', 'TP. Hồ Chí Minh', 'Rối loạn tiêu hóa, Thiếu máu, Bệnh tim mạch', 'Dị ứng aspirin', '2025-08-23T22:11:18.346Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (327, 'vuvanha95', 'vuvanha95@outlook.com', '0899295918', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 72, 'Nam', '184.00', '93.00', 'An Giang', NULL, NULL, '2025-12-18T22:43:55.223Z', '2025-12-19T08:55:44.752Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (328, 'vuquangphong26', 'vuquangphong26@hotmail.com', '0983953927', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 69, 'Nam', '175.00', '81.00', 'Thanh Hóa', NULL, NULL, '2025-05-19T06:33:05.056Z', '2025-12-05T08:55:44.753Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (329, 'tranxuancuong78', 'tranxuancuong78@hotmail.com', '0964344019', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 59, 'Nam', '166.00', '58.00', 'Sơn La', 'Béo phì', 'Dị ứng trứng', '2025-12-24T20:44:07.156Z', '2025-12-24T08:55:44.753Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (303, 'phamminhhieu91', 'phamminhhieu91@outlook.com', '0907761853', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 27, 'Nam', '160.00', '47.00', 'Quảng Ngãi', NULL, NULL, '2025-03-09T11:29:13.924Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (313, 'nguyenphuonghoa59', 'nguyenphuonghoa59@hotmail.com', '0991086696', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 22, 'Nữ', '150.00', '50.00', 'Quảng Ninh', 'Hen suyễn, Đau dạ dày', NULL, '2025-02-23T23:55:19.924Z', '2025-12-18T08:55:44.736Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (324, 'hoxuanvinh26', 'hoxuanvinh26@hotmail.com', '0936837119', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 40, 'Nữ', '166.00', '66.00', 'TP. Cần Thơ', NULL, 'Dị ứng latex', '2025-03-14T16:18:32.790Z', '2025-12-30T08:55:44.749Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (318, 'lyphuonghanh77', 'lyphuonghanh77@email.com', '0985400555', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 13, 'Nữ', '150.00', '48.00', 'TP. Huế', NULL, NULL, '2025-12-17T06:21:37.471Z', '2025-12-28T08:55:44.741Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (306, 'ngoquangchi40', 'ngoquangchi40@outlook.com', '0887611630', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 68, 'Nam', '154.00', '55.00', 'Đồng Tháp', 'Táo bón mãn tính, Mụn trứng cá, Viêm khớp', 'Dị ứng sữa bò, Dị ứng đậu phộng', '2025-08-21T12:37:27.838Z', '2025-12-20T08:55:44.730Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (296, 'ngokimtu76', 'ngokimtu76@email.com', '0865815172', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 21, 'Nam', '163.00', '68.00', 'Quảng Ngãi', 'Béo phì', NULL, '2025-07-14T10:28:15.144Z', '2025-12-11T08:55:44.718Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (299, 'phamhai77', 'phamhai77@gmail.com', '0941079555', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 25, 'Nữ', '164.00', '65.00', 'Tây Ninh', NULL, NULL, '2025-06-05T06:46:25.091Z', '2025-12-25T08:55:44.721Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (319, 'vuhailan98', 'vuhailan98@outlook.com', '0979241807', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 71, 'Nam', '157.00', '60.00', 'Đồng Tháp', 'Cảm cúm thường xuyên, Viêm loét dạ dày, Đau dạ dày', NULL, '2025-09-05T00:48:44.534Z', '2025-12-17T08:55:44.743Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (331, 'lythao53', 'lythao53@hotmail.com', '0981729325', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 29, 'Nam', '185.00', '74.00', 'An Giang', 'Rụng tóc, Viêm phế quản', NULL, '2025-09-11T04:22:32.522Z', '2025-12-15T08:55:44.755Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (332, 'phamtuanan10', 'phamtuanan10@gmail.com', '0883046945', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 48, 'Khác', '150.00', '47.00', 'Lâm Đồng', NULL, 'Dị ứng penicillin', '2025-01-17T07:29:40.552Z', '2025-12-25T08:55:44.756Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (333, 'phamvananh34', 'phamvananh34@yahoo.com', '0884137355', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 27, 'Khác', '151.00', '45.00', 'Phú Thọ', 'Đau khớp gối, Đau dạ dày', NULL, '2025-06-10T14:47:53.256Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (337, 'lyducvy26', 'lyducvy26@yahoo.com', '0909656170', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 37, 'Nữ', '161.00', '52.00', 'Đồng Tháp', 'Béo phì, Viêm phế quản, Đau đầu migraine', NULL, '2025-01-02T02:38:21.878Z', '2025-12-23T08:55:44.761Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (338, 'volantrang29', 'volantrang29@yahoo.com', '0974430339', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 15, 'Nữ', '157.00', '45.00', 'Quảng Trị', 'Đau khớp gối, Mụn trứng cá, Viêm gan B', NULL, '2025-02-08T17:55:03.995Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (339, 'lekhoa82', 'lekhoa82@gmail.com', '0905631123', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 30, 'Nữ', '163.00', '70.00', 'Lâm Đồng', NULL, NULL, '2025-11-28T18:53:46.622Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (340, 'duongquanglinh41', 'duongquanglinh41@gmail.com', '0932030787', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 13, 'Nam', '152.00', '62.00', 'TP. Hà Nội', 'Suy nhược cơ thể', 'Dị ứng phấn hoa, Dị ứng latex', '2025-09-01T09:02:40.121Z', '2025-12-11T08:55:44.764Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (341, 'huynhlangiang79', 'huynhlangiang79@yahoo.com', '0931248946', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 34, 'Nữ', '163.00', '58.00', 'Quảng Ninh', NULL, 'Dị ứng trứng, Dị ứng bụi nhà', '2025-12-25T13:47:15.144Z', '2025-12-15T08:55:44.765Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (342, 'hoangvy19', 'hoangvy19@gmail.com', '0908905187', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 61, 'Nữ', '156.00', '64.00', 'TP. Huế', NULL, NULL, '2025-11-15T18:12:10.104Z', '2025-12-11T08:55:44.766Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (344, 'vuanhvy94', 'vuanhvy94@yahoo.com', '0882281156', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 75, 'Nam', '165.00', '51.00', 'Quảng Ninh', NULL, NULL, '2025-09-18T04:19:58.416Z', '2025-12-07T08:55:44.768Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (345, 'tranminhthuy32', 'tranminhthuy32@outlook.com', '0916742316', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 59, 'Nam', '174.00', '71.00', 'Đắk Lắk', NULL, 'Dị ứng hải sản', '2025-07-13T15:51:05.102Z', '2025-12-23T08:55:44.769Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (347, 'ngoxuanthao58', 'ngoxuanthao58@yahoo.com', '0913959640', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 17, 'Nam', '156.00', '54.00', 'Lai Châu', NULL, NULL, '2025-05-10T15:51:57.056Z', '2025-12-09T08:55:44.770Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (348, 'buithidung18', 'buithidung18@email.com', '0916798374', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 35, 'Nam', '162.00', '70.00', 'Lào Cai', 'Đau khớp gối, Thiếu máu, Viêm phế quản', 'Dị ứng hải sản', '2025-08-05T02:47:16.694Z', '2025-12-17T08:55:44.771Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (349, 'lymaithao43', 'lymaithao43@outlook.com', '0965034188', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 38, 'Nữ', '168.00', '75.00', 'TP. Đà Nẵng', 'Tiểu đường type 2', NULL, '2025-04-15T08:43:53.282Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (350, 'dominhvy41', 'dominhvy41@hotmail.com', '0996177646', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 59, 'Nữ', '159.00', '46.00', 'Lào Cai', NULL, NULL, '2025-07-12T23:34:08.183Z', '2025-12-30T08:55:44.773Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (351, 'vuhuonghai76', 'vuhuonghai76@email.com', '0946243712', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 69, 'Nam', '173.00', '76.00', 'Hà Tĩnh', 'Hen suyễn, Đau khớp gối, Mụn trứng cá', NULL, '2025-09-11T19:28:38.440Z', '2025-12-15T08:55:44.774Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (352, 'duongmaiha34', 'duongmaiha34@hotmail.com', '0978786585', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 24, 'Nam', '171.00', '65.00', 'TP. Hồ Chí Minh', 'Viêm xoang, Viêm loét dạ dày', 'Dị ứng trứng', '2025-05-25T07:40:34.359Z', '2025-12-15T08:55:44.775Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (353, 'dominhvy92', 'dominhvy92@email.com', '0868119841', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 44, 'Nữ', '165.00', '61.00', 'Vĩnh Long', NULL, NULL, '2025-03-16T07:59:17.248Z', '2025-12-21T08:55:44.776Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (270, 'nguyenxuannhung12', 'nguyenxuannhung12@outlook.com', '0919359008', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 72, 'Nam', '164.00', '54.00', 'Gia Lai', 'Cholesterol cao, Gout', NULL, '2025-08-03T13:51:41.701Z', '2025-12-18T08:55:44.691Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (335, 'votuantuan38', 'votuantuan38@gmail.com', '0894746466', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 50, 'Nữ', '165.00', '73.00', 'Quảng Trị', NULL, NULL, '2025-01-22T15:53:39.882Z', '2025-12-01T08:55:44.759Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (346, 'lyvannhung85', 'lyvannhung85@email.com', '0894627169', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 65, 'Nam', '169.00', '67.00', 'Hà Tĩnh', NULL, 'Dị ứng aspirin', '2025-06-02T06:16:46.479Z', '2025-12-26T08:55:44.770Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (83, 'ngongocbinh19', 'ngongocbinh19@gmail.com', '0891154520', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 26, 'Nữ', '153.00', '51.00', 'Bắc Ninh', 'Mụn trứng cá, Đau dạ dày', NULL, '2025-02-23T10:22:55.907Z', '2025-12-10T08:55:44.487Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (217, 'hohaihung45', 'hohaihung45@gmail.com', '0916848230', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 24, 'Nam', '167.00', '57.00', 'Quảng Trị', 'Viêm phế quản', NULL, '2025-12-22T01:54:07.638Z', '2025-12-10T08:55:44.633Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (300, 'duongxuanquan11', 'duongxuanquan11@outlook.com', '0949591326', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 54, 'Nữ', '154.00', '55.00', 'Tuyên Quang', NULL, NULL, '2025-02-20T03:25:35.883Z', '2025-12-23T08:55:44.723Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (107, 'ngoson40', 'ngoson40@yahoo.com', '0861318070', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 32, 'Nam', '166.00', '67.00', 'Phú Thọ', 'Cholesterol cao, Bệnh tim mạch', 'Dị ứng penicillin', '2025-09-20T11:21:10.994Z', '2025-12-30T08:55:44.512Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (153, 'phamthutrung45', 'phamthutrung45@gmail.com', '0912476086', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 15, 'Nữ', '161.00', '59.00', 'Cà Mau', 'Đau đầu migraine', NULL, '2025-10-19T02:30:11.813Z', '2025-12-02T08:55:44.558Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (260, 'nguyenmaikhoa11', 'nguyenmaikhoa11@yahoo.com', '0971481352', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 27, 'Nam', '158.00', '49.00', 'TP. Hà Nội', 'Cholesterol cao, Viêm loét dạ dày', NULL, '2025-07-29T08:44:55.974Z', '2025-12-28T08:55:44.680Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (172, 'hoangtuanvinh39', 'hoangtuanvinh39@outlook.com', '0976620639', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 48, 'Nữ', '151.00', '51.00', 'Lai Châu', 'Tiểu đường type 2, Cholesterol cao, Viêm loét dạ dày', NULL, '2025-05-25T17:12:43.116Z', '2025-12-05T08:55:44.579Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (24, 'phanminhha15', 'phanminhha15@yahoo.com', '0977458369', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 32, 'Nam', '165.00', '68.00', 'TP. Huế', NULL, NULL, '2025-05-04T08:01:57.063Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (330, 'huynhthuvinh90', 'huynhthuvinh90@email.com', '0982042403', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 58, 'Nam', '169.00', '64.00', 'Hưng Yên', 'Viêm khớp', 'Dị ứng phấn hoa', '2025-06-01T09:43:02.723Z', '2025-11-30T08:55:44.754Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (336, 'ngoanhha32', 'ngoanhha32@email.com', '0964437385', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 36, 'Nam', '164.00', '75.00', 'Lào Cai', NULL, NULL, '2025-09-11T10:53:15.937Z', '2025-12-11T08:55:44.760Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (334, 'vothubinh83', 'vothubinh83@gmail.com', '0984367875', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 48, 'Nữ', '153.00', '63.00', 'Bắc Ninh', NULL, NULL, '2025-03-13T13:11:34.748Z', '2025-12-06T08:55:44.758Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (343, 'hoangminhquan91', 'hoangminhquan91@gmail.com', '0908939103', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 42, 'Nữ', '164.00', '63.00', 'Nghệ An', 'Viêm gan B', NULL, '2025-05-12T02:52:46.436Z', '2025-12-03T08:55:44.767Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (138, 'vuthuy53', 'vuthuy53@email.com', '0916035002', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 54, 'Nam', '150.00', '48.00', 'Tuyên Quang', 'Mụn trứng cá, Thoái hóa cột sống', NULL, '2025-03-28T21:34:38.792Z', '2025-12-16T08:55:44.543Z', 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (55, 'voducbinh84', 'voducbinh84@yahoo.com', '0974998097', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 61, 'Nữ', '170.00', '73.00', 'Sơn La', 'Đau lưng mãn tính, Cao huyết áp, Bệnh tim mạch', NULL, '2025-04-16T01:08:09.183Z', NULL, 'user');
INSERT INTO "users" ("id", "username", "email", "phone_number", "password_hash", "age", "gender", "height", "weight", "location", "common_diseases", "allergies", "created_at", "last_login_at", "role") VALUES (200, 'vuanhminh71', 'vuanhminh71@hotmail.com', '0992868760', '$2b$10$8HTNDiUbZ36PKu.Yvjic9Obv1lxUOvOMuGKdiAr5GkY0EEos5.usG', 36, 'Nữ', '155.00', '53.00', 'Đắk Lắk', 'Trào ngược dạ dày, Bệnh tim mạch', 'Dị ứng bụi nhà', '2025-11-24T12:55:29.827Z', '2025-12-29T08:55:44.612Z', 'user');


-- =====================================================
-- RESET SEQUENCES (để auto-increment hoạt động đúng)
-- =====================================================
SELECT setval('login_logs_id_seq', COALESCE((SELECT MAX("id") FROM "login_logs"), 1));
SELECT setval('users_id_seq', COALESCE((SELECT MAX("id") FROM "users"), 1));
