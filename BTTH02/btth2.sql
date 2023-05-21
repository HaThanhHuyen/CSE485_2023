-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 20, 2023 lúc 04:01 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `btth2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bomon`
--

CREATE TABLE `bomon` (
  `ID_BoMon` int(11) NOT NULL,
  `ID_Khoa` int(11) DEFAULT NULL,
  `TenBoMon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bomon`
--

INSERT INTO `bomon` (`ID_BoMon`, `ID_Khoa`, `TenBoMon`) VALUES
(1, 1, 'Bo Mon He Thong Thong Tin'),
(2, 1, 'Bo Mon Ky Thuat Phan Mem'),
(3, 2, 'Bo Mon Tieng Anh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diemdanh`
--

CREATE TABLE `diemdanh` (
  `ID_DiemDanh` int(11) NOT NULL,
  `ID_SinhVien` int(11) DEFAULT NULL,
  `ID_LopHocPhan` int(11) DEFAULT NULL,
  `NgayHoc` date DEFAULT NULL,
  `TrangThaiDiemDanh` varchar(255) DEFAULT NULL,
  `GhiChu` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `diemdanh`
--

INSERT INTO `diemdanh` (`ID_DiemDanh`, `ID_SinhVien`, `ID_LopHocPhan`, `NgayHoc`, `TrangThaiDiemDanh`, `GhiChu`) VALUES
(1, 1, 1, '2023-05-19', 'Co mat', ''),
(2, 2, 1, '2023-05-19', 'Muon', 'Tăc duong nen di muon 15p'),
(3, 3, 2, '2023-05-19', 'Vang', 'Khong co ly do xin nghi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giangvien`
--

CREATE TABLE `giangvien` (
  `ID_GiangVien` int(11) NOT NULL,
  `TenGiangVien` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `giangvien`
--

INSERT INTO `giangvien` (`ID_GiangVien`, `TenGiangVien`) VALUES
(1, 'Nguyen Ngoc Quynh Chau'),
(2, 'Kieu Tuan Dung'),
(3, 'Ly Thi Oanh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoa`
--

CREATE TABLE `khoa` (
  `ID_Khoa` int(11) NOT NULL,
  `TenKhoa` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khoa`
--

INSERT INTO `khoa` (`ID_Khoa`, `TenKhoa`) VALUES
(1, 'Khoa Cong Nghe Thong Tin'),
(2, 'Khoa Ky Thuat Tai Nguyen Nuoc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lop`
--

CREATE TABLE `lop` (
  `ID_Lop` int(11) NOT NULL,
  `TenLop` varchar(255) DEFAULT NULL,
  `ID_Khoa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `lop`
--

INSERT INTO `lop` (`ID_Lop`, `TenLop`, `ID_Khoa`) VALUES
(1, 'Lop 62TH3', 1),
(2, 'Lop 62HT', 1),
(3, 'Lop 62N', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lophocphan`
--

CREATE TABLE `lophocphan` (
  `ID_LopHocPhan` int(11) NOT NULL,
  `TenLopHocPhan` varchar(255) DEFAULT NULL,
  `ID_MonHoc` int(11) DEFAULT NULL,
  `ID_GiangVien` int(11) DEFAULT NULL,
  `NamHoc` int(11) DEFAULT NULL,
  `HocKy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `lophocphan`
--

INSERT INTO `lophocphan` (`ID_LopHocPhan`, `TenLopHocPhan`, `ID_MonHoc`, `ID_GiangVien`, `NamHoc`, `HocKy`) VALUES
(1, 'Lop Hoc Phan 62TH3.1', 1, 1, 2023, 1),
(2, 'Lop Hoc Phan 62HT', 2, 2, 2023, 1),
(3, 'Lop Hoc Phan 62N', 3, 3, 2023, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lophocphangiangvien`
--

CREATE TABLE `lophocphangiangvien` (
  `ID_LopHocPhan` int(11) NOT NULL,
  `ID_GiangVien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `lophocphangiangvien`
--

INSERT INTO `lophocphangiangvien` (`ID_LopHocPhan`, `ID_GiangVien`) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `monhoc`
--

CREATE TABLE `monhoc` (
  `ID_MonHoc` int(11) NOT NULL,
  `ID_BoMon` int(11) DEFAULT NULL,
  `TenMonHoc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `monhoc`
--

INSERT INTO `monhoc` (`ID_MonHoc`, `ID_BoMon`, `TenMonHoc`) VALUES
(1, 1, 'Mon Co so du lieu'),
(2, 2, 'Mon Cong nghe Web'),
(3, 3, 'Mon Dai so tuyen tinh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sinhvien`
--

CREATE TABLE `sinhvien` (
  `ID_SinhVien` int(11) NOT NULL,
  `TenSinhVien` varchar(255) DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `ID_Lop` int(11) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `SoDT` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sinhvien`
--

INSERT INTO `sinhvien` (`ID_SinhVien`, `TenSinhVien`, `NgaySinh`, `ID_Lop`, `Email`, `SoDT`) VALUES
(1, 'Nguyen Khanh Linh', '2002-05-06', 1, 'nkl@example.com', '1234567890'),
(2, 'Ngo Thi Hong Nhung', '2002-04-19', 1, 'nthn@example.com', '2345678901'),
(3, 'Dao Viet Bach', '2000-03-03', 2, 'dvb@example.com', '3456789012');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bomon`
--
ALTER TABLE `bomon`
  ADD PRIMARY KEY (`ID_BoMon`),
  ADD KEY `ID_Khoa` (`ID_Khoa`);

--
-- Chỉ mục cho bảng `diemdanh`
--
ALTER TABLE `diemdanh`
  ADD PRIMARY KEY (`ID_DiemDanh`),
  ADD KEY `ID_SinhVien` (`ID_SinhVien`),
  ADD KEY `ID_LopHocPhan` (`ID_LopHocPhan`);

--
-- Chỉ mục cho bảng `giangvien`
--
ALTER TABLE `giangvien`
  ADD PRIMARY KEY (`ID_GiangVien`);

--
-- Chỉ mục cho bảng `khoa`
--
ALTER TABLE `khoa`
  ADD PRIMARY KEY (`ID_Khoa`);

--
-- Chỉ mục cho bảng `lop`
--
ALTER TABLE `lop`
  ADD PRIMARY KEY (`ID_Lop`),
  ADD KEY `ID_Khoa` (`ID_Khoa`);

--
-- Chỉ mục cho bảng `lophocphan`
--
ALTER TABLE `lophocphan`
  ADD PRIMARY KEY (`ID_LopHocPhan`),
  ADD KEY `ID_MonHoc` (`ID_MonHoc`),
  ADD KEY `ID_GiangVien` (`ID_GiangVien`);

--
-- Chỉ mục cho bảng `lophocphangiangvien`
--
ALTER TABLE `lophocphangiangvien`
  ADD PRIMARY KEY (`ID_LopHocPhan`,`ID_GiangVien`),
  ADD KEY `ID_GiangVien` (`ID_GiangVien`);

--
-- Chỉ mục cho bảng `monhoc`
--
ALTER TABLE `monhoc`
  ADD PRIMARY KEY (`ID_MonHoc`),
  ADD KEY `ID_BoMon` (`ID_BoMon`);

--
-- Chỉ mục cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD PRIMARY KEY (`ID_SinhVien`),
  ADD KEY `ID_Lop` (`ID_Lop`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bomon`
--
ALTER TABLE `bomon`
  ADD CONSTRAINT `bomon_ibfk_1` FOREIGN KEY (`ID_Khoa`) REFERENCES `khoa` (`ID_Khoa`);

--
-- Các ràng buộc cho bảng `diemdanh`
--
ALTER TABLE `diemdanh`
  ADD CONSTRAINT `diemdanh_ibfk_1` FOREIGN KEY (`ID_SinhVien`) REFERENCES `sinhvien` (`ID_SinhVien`),
  ADD CONSTRAINT `diemdanh_ibfk_2` FOREIGN KEY (`ID_LopHocPhan`) REFERENCES `lophocphan` (`ID_LopHocPhan`);

--
-- Các ràng buộc cho bảng `lop`
--
ALTER TABLE `lop`
  ADD CONSTRAINT `lop_ibfk_1` FOREIGN KEY (`ID_Khoa`) REFERENCES `khoa` (`ID_Khoa`);

--
-- Các ràng buộc cho bảng `lophocphan`
--
ALTER TABLE `lophocphan`
  ADD CONSTRAINT `lophocphan_ibfk_1` FOREIGN KEY (`ID_MonHoc`) REFERENCES `monhoc` (`ID_MonHoc`),
  ADD CONSTRAINT `lophocphan_ibfk_2` FOREIGN KEY (`ID_GiangVien`) REFERENCES `giangvien` (`ID_GiangVien`);

--
-- Các ràng buộc cho bảng `lophocphangiangvien`
--
ALTER TABLE `lophocphangiangvien`
  ADD CONSTRAINT `lophocphangiangvien_ibfk_1` FOREIGN KEY (`ID_LopHocPhan`) REFERENCES `lophocphan` (`ID_LopHocPhan`),
  ADD CONSTRAINT `lophocphangiangvien_ibfk_2` FOREIGN KEY (`ID_GiangVien`) REFERENCES `giangvien` (`ID_GiangVien`);

--
-- Các ràng buộc cho bảng `monhoc`
--
ALTER TABLE `monhoc`
  ADD CONSTRAINT `monhoc_ibfk_1` FOREIGN KEY (`ID_BoMon`) REFERENCES `bomon` (`ID_BoMon`);

--
-- Các ràng buộc cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD CONSTRAINT `sinhvien_ibfk_1` FOREIGN KEY (`ID_Lop`) REFERENCES `lop` (`ID_Lop`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
