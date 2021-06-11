<?php
include 'conn.php';
$no_rm = $_POST['no_rm'];
$connect->query("DELETE FROM pasien WHERE no_rm= ".$no_rm);

?>