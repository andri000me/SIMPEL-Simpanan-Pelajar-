<?php

$mysqli = new mysqli('localhost', 'root', '', 'bankmini');

$no_rekening = 123456;
$kode_pin = 123456;
$pasword = 123456;

$query = $mysqli->query("SELECT * FROM tblanggota WHERE no_rekening='$no_rekening' AND kode_pin ='$kode_pin' AND pasword='$pasword' ");
    
$jml = mysqli_num_rows($query);
if($jml>0) {
    $result = 'success';
    echo json_encode($result);
}
