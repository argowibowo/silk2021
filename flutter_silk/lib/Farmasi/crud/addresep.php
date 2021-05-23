<?php

include 'conn.php';

$id_dokter = $_POST['id_dokter'];
$no_rm = $_POST['no_rm'];
$tgl_transaksi = $_POST['tgl_transaksi'];
$total_harga = $_POST['total_harga'];

$connect->query("INSERT INTO resep (id_dokter,no_rm,tgl_transaksi,total_harga) VALUES ('".$id_dokter."','".$no_rm."','".$tgl_transaksi."','".$total_harga."') ")

?>