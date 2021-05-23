<?php
include 'conn.php';

$id_resep = $_POST["id_resep"];
$id_dokter = $_POST['id_dokter'];
$no_rm = $_POST['no_rm'];
$tgl_transaksi = $_POST['tgl_transaksi'];
$total_harga = $_POST['total_harga'];

$connect->query("UPDATE resep SET id_dokter='".$id_dokter."', no_rm='".$no_rm."', tgl_transaksi='".$tgl_transaksi."', total_harga='".$total_harga."' WHERE id_resep=".$id_resep);
?>