 classDiagram
direction BT
class dim_benh {
   varchar(255) ten_benh
   integer benh_sk
}
class dim_thaoduoc {
   varchar(255) thao_duoc
   text tong_hop_thao_duoc
   text cong_thuc_su_dung
   text lieu_luong_va_thoi_gian
   text khuyen_cao
   text canh_bao
   text chong_chi_dinh
   text nguon_tham_khao
   integer thaoduoc_sk
}
class dim_thuoctay {
   varchar(50) thuoc_tay
   text hoat_chat
   text biet_duoc
   text cac_thanh_phan_trong_thuoc
   text canh_bao_va_chong_chi_dinh
   integer thuoctay_sk
}
class map_benh_thaoduoc_survey {
   varchar(255) tac_gia
   text tieu_de
   text nguon
   integer benh_sk
   integer thaoduoc_sk
}
class map_benh_thuoctay_survey {
   varchar(255) tac_gia
   text tieu_de
   text nguon
   integer benh_sk
   integer thuoctay_sk
}
class map_nhombenh_benh {
   integer nhombenh_sk
   integer benh_sk
}
class nhombenh {
   varchar(255) nhom_benh
   integer nhombenh_sk
}
class thaoduoc_cochetacdong {
   text dich_tac_dong
   text con_duong_tac_dong
   varchar(255) hieu_luc_sinh_hoc
   integer benh_sk
   integer thaoduoc_sk
}
class thaoduoc_dacdiemhoahoc {
   varchar(255) cong_thuc_phan_tu
   numeric(10,4) khoi_luong_phan_tu
   text cau_truc_hoa_hoc
   varchar(255) loai_hop_chat
   integer benh_sk
}
class thaoduoc_dacdiemnguongoc {
   varchar(255) nguon_goc
   varchar(255) do_tinh_khiet
   varchar(255) chi_phi
   text kha_nang_ung_dung_lam_sang
   integer benh_sk
}
class thaoduoc_doctinh {
   varchar(255) doc_tinh_cap_tinh_ld50
   text doc_tinh_man_tinh
   text tuong_tac_thuoc_thao_duoc
   integer benh_sk
}
class thaoduoc_duocdonghoc {
   text hap_thu
   text phan_bo
   text chuyen_hoa
   text thai_tru
   integer benh_sk
}
class thaoduoc_duocluchoc {
   text tac_dung_chinh
   varchar(255) lieu_hieu_qua
   varchar(500) tinh_chon_loc
   integer benh_sk
   integer thaoduoc_sk
}
class thaoduoc_thoigiantacdung {
   varchar(255) thoi_gian_phat_huy_tac_dung
   varchar(255) thoi_gian_het_tac_dung_phu
   integer benh_sk
   integer thaoduoc_sk
}
class thaoduoc_tinhchatlyhoa {
   numeric(10,4) do_tan
   numeric(10,4) do_ben_hoa_hoc
   varchar(255) pka_trangthaiionhoa
   numeric(10,4) lipophilicity_logp
   integer benh_sk
}
class thuoctay_cochetacdung {
   varchar(500) dich_tac_dong
   text con_duong_tac_dong
   varchar(500) hieu_luc_sinh_hoc
   integer benh_sk
   integer thuoctay_sk
}
class thuoctay_dacdiemhoahoc {
   varchar(255) cong_thuc_phan_tu
   varchar(50) khoi_luong_phan_tu
   text cau_truc_hoa_hoc
   varchar(255) loai_hop_chat
   integer thuoctay_sk
}
class thuoctay_dacdiemnguongoc {
   varchar(255) nguon_goc
   varchar(255) do_tinh_khiet
   varchar(255) chi_phi
   text kha_nang_ung_dung_lam_sang
   integer thuoctay_sk
}
class thuoctay_doctinh {
   varchar(255) doc_tinh_cap_tinh_ld50
   text doc_tinh_man_tinh
   text tuong_tac_thuoc_thao_duoc
   integer thuoctay_sk
}
class thuoctay_duocdonghoc {
   text hap_thu
   text phan_bo
   text chuyen_hoa
   text thai_tru
   integer thuoctay_sk
}
class thuoctay_duocluchoc {
   text tac_dung_chinh
   varchar(255) lieu_hieu_qua
   varchar(500) tinh_chon_loc
   integer benh_sk
   integer thuoctay_sk
}
class thuoctay_thoigiantacdung {
   varchar(255) thoi_gian_phat_huy_tac_dung
   varchar(255) thoi_gian_het_tac_dung_phu
   integer benh_sk
   integer thuoctay_sk
}
class thuoctay_tinhchatlyhoa {
   varchar(255) do_tan
   varchar(255) do_ben_hoa_hoc
   varchar(255) pka_trangthaiionhoa
   varchar(255) lipophilicity_logp
   integer thuoctay_sk
}
class trieu_chung {
   text link_trieu_chung
   integer benh_sk
   text trieu_chung
}

map_benh_thaoduoc_survey  -->  dim_benh : benh_sk
map_benh_thaoduoc_survey  -->  dim_thaoduoc : thaoduoc_sk
map_benh_thuoctay_survey  -->  dim_benh : benh_sk
map_benh_thuoctay_survey  -->  dim_thuoctay : thuoctay_sk
map_nhombenh_benh  -->  dim_benh : benh_sk
map_nhombenh_benh  -->  nhombenh : nhombenh_sk
thaoduoc_cochetacdong  -->  dim_benh : benh_sk
thaoduoc_cochetacdong  -->  dim_thaoduoc : thaoduoc_sk
thaoduoc_dacdiemhoahoc  -->  dim_benh : benh_sk
thaoduoc_dacdiemnguongoc  -->  dim_benh : benh_sk
thaoduoc_doctinh  -->  dim_benh : benh_sk
thaoduoc_duocdonghoc  -->  dim_benh : benh_sk
thaoduoc_duocluchoc  -->  dim_benh : benh_sk
thaoduoc_duocluchoc  -->  dim_thaoduoc : thaoduoc_sk
thaoduoc_thoigiantacdung  -->  dim_benh : benh_sk
thaoduoc_thoigiantacdung  -->  dim_thaoduoc : thaoduoc_sk
thaoduoc_tinhchatlyhoa  -->  dim_benh : benh_sk
thuoctay_cochetacdung  -->  dim_benh : benh_sk
thuoctay_cochetacdung  -->  dim_thuoctay : thuoctay_sk
thuoctay_dacdiemhoahoc  -->  dim_thuoctay : thuoctay_sk
thuoctay_dacdiemnguongoc  -->  dim_thuoctay : thuoctay_sk
thuoctay_doctinh  -->  dim_thuoctay : thuoctay_sk
thuoctay_duocdonghoc  -->  dim_thuoctay : thuoctay_sk
thuoctay_duocluchoc  -->  dim_benh : benh_sk
thuoctay_duocluchoc  -->  dim_thuoctay : thuoctay_sk
thuoctay_thoigiantacdung  -->  dim_benh : benh_sk
thuoctay_thoigiantacdung  -->  dim_thuoctay : thuoctay_sk
thuoctay_tinhchatlyhoa  -->  dim_thuoctay : thuoctay_sk
trieu_chung  -->  dim_benh : benh_sk
