create database if not exists erdsangmhqh;
use erdsangmhqh;

create table phieu_xuat(
sopx int primary key,
ngay_xuat date
);

create table vat_tu(
mavtu int primary key,
tenvtu varchar(55)
);

create table phieu_nhap(
so_phieu_nhap int primary key,
ngay_nhap date
);
create table so_dien_thoai(
so_dien_thoai varchar(55) primary key
);
create table nhacc(
so_dien_thoai varchar(55),
mancc int primary key,
ten_ncc varchar(55),
dia_chi varchar(225),
foreign key (so_dien_thoai) references so_dien_thoai(so_dien_thoai)
);

create table don_dh(
mancc int,
so_don_hang int primary key,
ngay_dh date,
foreign key(mancc) references nhacc(mancc)
);

create table chi_tiet_phieu_xuat(
sopx int,
mavtu int,
sl_xuat int,
don_gia_xuat varchar(55),
primary key(sopx, mavtu),
foreign key (sopx)references phieu_xuat(sopx),
foreign key(mavtu)references vat_tu(mavtu)
);

create table chi_tiet_phieu_nhap(
so_phieu_nhap int,
mavtu int,
sl_nhap int,
don_gia_nhap varchar(55),
primary key(so_phieu_nhap, mavtu),
foreign key (so_phieu_nhap)references phieu_nhap(so_phieu_nhap),
foreign key(mavtu)references vat_tu(mavtu)
);

create table chi_tiet_don_dat_hang(
so_don_hang int,
mavtu int,
primary key(so_don_hang, mavtu),
foreign key (so_don_hang)references don_dh(so_don_hang),
foreign key(mavtu)references vat_tu(mavtu)
);