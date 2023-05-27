use QLBanHang
go

--Cau1b
select * from CONGTY
select * from SANPHAM
select * from CUNGUNG

--Cau2
create function fn_Cau2(@tenct nvarchar(20))
returns table
	as
	return
	(
		select TenSP,MauSac,SoLuong,GiaBan 
		from SANPHAM inner join CUNGUNG on SANPHAM.MaSP = CUNGUNG.MaSP
					 inner join CONGTY on CONGTY.MaCT = CUNGUNG.MaCT
		where TenCT = @tenct
	)

select * from fn_Cau2('Cong ty A')

--Cau3
drop procedure proc_addCU
create procedure proc_addCU (@mact nchar(10),@tensp nvarchar(20), @slcu int)
as
begin
	if(not exists (select * from CUNGUNG inner join SANPHAM on SANPHAM.MaSP = CUNGUNG.MaSP
					where TenSP = @tensp))
		print N'Sản phẩm không tồn tại'
	else
		begin
			if(not exists (select * from CONGTY where MaCT = @mact))
				print N'Không tồn tại công ty này. vui lòng nhập lại'
			else
				begin
					declare @masp nchar(10)
					set @masp = (select MaSP from SANPHAM where TenSP = @tensp)
					insert into CUNGUNG values (@mact, @masp, @slcu)
				end
		end
end

select * from CONGTY
select * from SANPHAM
select * from CUNGUNG
exec proc_addCU 'CT03',N'Chuột',12




