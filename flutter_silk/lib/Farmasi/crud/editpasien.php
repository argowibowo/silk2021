<?php
include 'conn.php';

$no_rm = $_POST["no_rm"];
$nik = $_POST["nik"];
$nama_lengkap = $_POST['nama_lengkap'];
$tgl_lahir = $_POST['tgl_lahir'];
$jns_kelamin = $_POST['jns_kelamin'];
$alamat = $_POST['alamat'];
$kelurahan = $_POST['kelurahan'];
$kabupaten = $_POST['kabupaten'];
$provinsi = $_POST['provinsi'];
$warga_negara = $_POST['warga_negara'];
$status_nikah = $_POST['status_nikah'];
$no_telp = $_POST['no_telp'];


$connect->query("UPDATE pasien SET nik='".$nik."', nama_lengkap='".$nama_lengkap."',
 tgl_lahir='".$tgl_lahir."', jns_kelamin='".$jns_kelamin."', alamat='".$alamat."', kelurahan='".$kelurahan."', kabupaten='".$kabupaten."',
 provinsi='".$provinsi."', warga_negara='".$warga_negara."', status_nikah='".$status_nikah."', no_telp='".$no_telp."', tgl_daftar='".$tgl_daftar."' WHERE no_rm=". $no_rm);
?>