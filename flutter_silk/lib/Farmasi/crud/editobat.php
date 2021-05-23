<?php
include 'conn.php';

$kode_obat = $_POST['kode_obat'];
$nama_obat = $_POST['nama_obat'];
$jenis_obat = $_POST['jenis_obat'];
$satuan = $_POST['satuan'];
$stok = $_POST['stok'];
$harga = $_POST['harga'];

$connect->query("UPDATE obat SET nama_obat='".$nama_obat."', jenis_obat='".$jenis_obat."', satuan='".$stok."', nama_obat='".$stok."', harga='".$harga."', stok='".$stok."' WHERE kode_obat=".$kode_obat);
?>