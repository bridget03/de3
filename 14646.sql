create database QLBanHang
use QLBanHang
go

create table CONGTY(
	MaCT nchar(10) primary key,
	TenCT nvarchar(20) not null,
	TrangThai nvarchar(20),
	ThanhPho nvarchar(20)
)
create table SANPHAM(
	MaSP nchar(10) primary key,
	TenSP nvarchar(20) not null,
	MauSac nvarchar(10),
	SoLuong int,
	GiaBan money
)
create table CUNGUNG(
	MaCT nchar(10) foreign key references CONGTY(MaCT),
	MaSP nchar(10) foreign key references SANPHAM(MaSP),
	constraint pk_CU primary key (MaCT,MaSP),
	SoLuongCungUng int
)

insert into CONGTY values
('CT01','Cong ty A',N'tốt',N'Hà Nội'),
('CT02','Cong ty B',N'khá',N'Đà Nẵng'),
('CT03','Cong ty C',N'trung bình',N'Bắc Ninh')

insert into SANPHAM values
('SP01',N'Màn hình máy tính',N'đen',100,1250000),
('SP02',N'Bàn phím máy tính',N'trắng',200,450000),
('SP03',N'Chuột',N'đen',100,130000)

insert into CUNGUNG values
('CT01','SP02',20),
('CT01','SP03',20),
('CT02','SP01',10),
('CT03','SP01',5),
('CT03','SP02',5)


