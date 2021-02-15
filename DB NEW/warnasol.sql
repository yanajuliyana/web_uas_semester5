-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Feb 2021 pada 14.11
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `warnasol`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id_cart` varchar(20) NOT NULL,
  `tanggal` datetime NOT NULL,
  `kode` varchar(11) NOT NULL,
  `nama` varchar(11) NOT NULL,
  `size` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `harga` varchar(10) NOT NULL,
  `qty` varchar(10) NOT NULL,
  `jumlah` varchar(10) NOT NULL,
  `session` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `kd_cus` varchar(20) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` text NOT NULL,
  `gambar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`kd_cus`, `nama`, `alamat`, `no_telp`, `username`, `password`, `gambar`) VALUES
('20201225022415', 'rian', 'puri indah', '08988337388', 'rian', '4116e0e25dcad2dd4b202b3eaf2b4f1ae6497e25', ''),
('20210112184447', 'Yana Juliana', 'Batu nunggal', '08954435532129', 'yana', '4362115e510e8be0d13d23220987e188c1a9faad', ''),
('20210119184927', 'Rudi suwardi', 'Jln. Anggrek No. 53, Situ, Kec. Sumedang Utara, Ka', '085221546788', 'rudi', '1f53d03209ef868737b2f546e002198b2b4875ac', '../admin/gambar_customer/smith.jpg'),
('20210209155909', 'Cepi Priatna', 'Jalan raya Rancaekek KM. 24.5 ', '0898745585655', 'cepi', '6b7a4986343caf44afe7ee4cbe30dbd5e6b7db31', '../admin/gambar_customer/crew.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `id_kon` int(6) NOT NULL,
  `nopo` varchar(20) NOT NULL,
  `kd_cus` varchar(20) NOT NULL,
  `bayar_via` varchar(30) NOT NULL,
  `tanggal` datetime NOT NULL,
  `jumlah` int(10) NOT NULL,
  `bukti_transfer` varchar(50) NOT NULL,
  `status` enum('Bayar','Belum') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `konfirmasi`
--

INSERT INTO `konfirmasi` (`id_kon`, `nopo`, `kd_cus`, `bayar_via`, `tanggal`, `jumlah`, `bukti_transfer`, `status`) VALUES
(37, '20210209155909', '20210209155909', 'Cash On Delivery (COD)', '2021-02-09 16:38:05', 30000, '0', 'Bayar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `po`
--

CREATE TABLE `po` (
  `nopo` varchar(20) NOT NULL,
  `tanggalkirim` date NOT NULL,
  `status` enum('Proses','Selesai','Terkirim','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `po`
--

INSERT INTO `po` (`nopo`, `tanggalkirim`, `status`) VALUES
('20210209155909', '2021-02-10', 'Terkirim');

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_terima`
--

CREATE TABLE `po_terima` (
  `id` int(10) NOT NULL,
  `nopo` varchar(20) NOT NULL,
  `kd_cus` varchar(20) NOT NULL,
  `kode` int(4) NOT NULL,
  `tanggal` datetime NOT NULL,
  `qty` int(8) NOT NULL,
  `total` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `po_terima`
--

INSERT INTO `po_terima` (`id`, `nopo`, `kd_cus`, `kode`, `tanggal`, `qty`, `total`) VALUES
(79, '20210209155909', '20210209155909', 57, '2021-02-09 16:37:44', 1, 6000),
(80, '20210209155909', '20210209155909', 60, '2021-02-09 16:37:48', 1, 12000),
(81, '20210209155909', '20210209155909', 59, '2021-02-09 16:37:51', 1, 12000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `kode` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jenis` varchar(10) NOT NULL,
  `harga` int(10) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `stok` int(3) NOT NULL,
  `gambar` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`kode`, `nama`, `jenis`, `harga`, `keterangan`, `stok`, `gambar`) VALUES
(18, 'Pepes Ikan Patin', 'Makanan', 12000, 'Ikan Patin pepes bumbu', 100, 'gambar_produk/images(2).jpg'),
(21, 'Sayur lodeh', 'Makanan', 6000, 'Sayur lodeh kuah santan', 100, 'gambar_produk/images(6).jpg'),
(22, 'Ayam Kremes ', 'Makanan', 12000, 'Ayam Kremes Bumbu sambal gledek', 100, 'gambar_produk/images(7).jpg'),
(23, 'Sayur Asam', 'Makanan', 6000, 'Sayur Asam Khas Sunda', 100, 'gambar_produk/images(8).jpg'),
(25, 'Sop Sapi', 'Makanan', 18000, 'Sop Sapi daging dan tangkar plus sambal hijau gledek', 100, 'gambar_produk/images(10).jpg'),
(26, 'Sayur Bayam', 'Makanan', 6000, 'Sayur bayam dengan jagung', 100, 'gambar_produk/images(11).jpg'),
(28, 'Pepes Jamur', 'Makanan', 10000, 'pepes jamur bumbu cabai dan bawang merah', 100, 'gambar_produk/images(13).jpg'),
(29, 'Ikan Mas Bakar', 'Makanan', 15000, 'Ikan Mas bakar bumbu kecap lada hitam', 100, 'gambar_produk/images(14).jpg'),
(30, 'Mujair Goreng', 'Makanan', 12000, 'Ikan Mujair goreng bumbu rempah', 100, 'gambar_produk/images(15).jpg'),
(31, 'Lalapan', 'Makanan', 5000, 'Lalapan plus sambel dadakan', 100, 'gambar_produk/images(16).jpg'),
(32, 'Oseng Kangkung', 'Makanan', 6000, 'Oseng kangkung bumbu teriyaki', 100, 'gambar_produk/images(17).jpg'),
(34, 'Komplit 1', 'Makanan', 18000, 'Nasi, Ayam Bakar, lalapan, sambal korek', 100, 'gambar_produk/images(19).jpg'),
(35, 'Sambal Hejo', 'Makanan', 6000, 'Sambal goreng hejo gledek', 100, 'gambar_produk/images(20).jpg'),
(36, 'Sambal Goang', 'Makanan', 6000, 'Sambal Goang Cabe Jablay', 100, 'gambar_produk/images(21).jpg'),
(42, 'Kentang sambel', 'Makanan', 8000, 'Kentang sambel goreng petai', 100, 'gambar_produk/images(27).jpg'),
(43, 'Terong Sambal', 'Makanan', 8000, 'Terong sambal goreng petai', 100, 'gambar_produk/images(28).jpg'),
(44, 'Oseng Jamur Tahu', 'Makanan', 10000, 'Oseng Jamur Tahu', 100, 'gambar_produk/images(29).jpg'),
(45, 'Goreng Ikan Mas', 'Makanan', 11000, 'Goreng Ikan Mas', 100, 'gambar_produk/images(30).jpg'),
(46, 'Ati Ampela', 'Makanan', 10000, 'Ati Ampela bumbu kari pedas', 100, 'gambar_produk/images(31).jpg'),
(47, 'Bala - Bala', 'Makanan', 2000, 'Bala - Bala', 100, 'gambar_produk/images(32).jpg'),
(48, 'Bakwan Jagung', 'Makanan', 2000, 'Bakwan Jagung', 100, 'gambar_produk/images(33).jpg'),
(49, 'Tempe Goreng', 'Makanan', 1000, 'Tempe Goreng', 100, 'gambar_produk/images(34).jpg'),
(50, 'Semur Jengkol', 'Makanan', 10000, 'Semur Jengkol Bumbu Lada', 100, 'gambar_produk/images(35).jpg'),
(51, 'Ikan Kembung', 'Makanan', 10000, 'Ikan Kembung Sambel kecap pedas', 100, 'gambar_produk/images(36).jpg'),
(52, 'Ikan Bandeng', 'Makanan', 10000, 'Ikan Bandeng Goreng', 100, 'gambar_produk/images(37).jpg'),
(54, 'Pepes Ikan Mas', 'Makanan', 15000, 'Pepes Ikan Mas Pedas', 99, 'gambar_produk/images(39).jpg'),
(56, 'Sop Ayam Rempah', 'Makanan', 12000, 'Sop Ayam Rempah', 99, 'gambar_produk/images(41).jpg'),
(57, 'Nasi Putih', 'Makanan', 6000, 'Nasi Putih Bakul', 92, 'gambar_produk/images(42).jpg'),
(59, 'Pepes Ayam ', 'Makanan', 12000, 'Pepes Ayam bumbu kuyit, cabai, bawang', 90, 'gambar_produk/images.jpg'),
(60, 'Oseng Mercon', 'Makanan', 12000, 'Pedas bangetttt', -5, 'gambar_produk/Resep-Oseng-Mercon.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tmp_po_terima`
--

CREATE TABLE `tmp_po_terima` (
  `id` int(10) NOT NULL,
  `nopo` varchar(10) NOT NULL,
  `kd_cus` varchar(10) NOT NULL,
  `kode` int(4) NOT NULL,
  `tanggal` date NOT NULL,
  `qty` int(8) NOT NULL,
  `total` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `gambar` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `fullname`, `gambar`) VALUES
(2, 'Wandi', '62ee6a0679f6800a0843074244cf434e8182596e', 'Wandi Wardiman', 'gambar_admin/wandih.jpg'),
(3, 'jaka', '2ec22095503fe843326e7c19dd2ab98716b63e4d', 'Raden Jaka Rizki F', 'gambar_admin/wandih.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_cart`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`kd_cus`);

--
-- Indeks untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`id_kon`);

--
-- Indeks untuk tabel `po`
--
ALTER TABLE `po`
  ADD PRIMARY KEY (`nopo`);

--
-- Indeks untuk tabel `po_terima`
--
ALTER TABLE `po_terima`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`kode`);

--
-- Indeks untuk tabel `tmp_po_terima`
--
ALTER TABLE `tmp_po_terima`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  MODIFY `id_kon` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `po_terima`
--
ALTER TABLE `po_terima`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `kode` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT untuk tabel `tmp_po_terima`
--
ALTER TABLE `tmp_po_terima`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
