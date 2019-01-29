<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS');
header("Content-Type: application/json; charset=UTF-8");
header('Access-Control-Allow-Headers: Content-Type, Authorisation, X-Requested-with' );

include 'config.php';


if(isset($_GET["no_rekening"]) && isset($_GET["kode_pin"]) && isset($_GET["pasword"]))
{
    $no_rekening = $_GET["no_rekening"];
    $kode_pin = $_GET["kode_pin"];
    $pasword = $_GET["pasword"];

    $stmt = $conn->query("SELECT * FROM tblanggota WHERE pasword = '$pasword' and no_rekening = '$no_rekening' and kode_pin = '$kode_pin'");

    $hasil="";
    while($tabel = $stmt->fetch_array()){
        if ($hasil!="") {
            $hasil .=",";
        }
        $hasil .= '{"no_rekening":"'.$tabel['no_rekening'].'",';
        $hasil .= '"nama":"'.$tabel['nama'].'"}';
    }
    $hasil = '['.$hasil.']';
    $conn->close();

    echo($hasil);
} else {
    echo "tidak ada data";
}

?>