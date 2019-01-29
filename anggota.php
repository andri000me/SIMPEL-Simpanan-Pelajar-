<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS');
header('Content-Type: application/json; charset=UTF-8');
$mysqli = mysqli_connect('localhost', 'root', '', 'bankmini');
// $post = json_decode(file_get_contents('php://input'),true);
    $no_rekening    = $_GET['xno_rekening'];
    $pasword        = $_GET['xpasword'];
    $kode_pin       = $_GET['xkode_pin'];
    $query = mysqli_query($mysqli,"SELECT * FROM tblanggota WHERE pasword = '$pasword' and no_rekening = '$no_rekening' and kode_pin = '$kode_pin'");
    $jml = mysqli_num_rows($query);
    if($jml>0){
        $data = mysqli_fetch_array($query);
        $data_anggota = array(
            'id_anggota'    => $data['id_anggota'], 
            'no_rekening'   => $data['no_rekening'], 
            'pasword'       => $data['pasword'], 
            'nama'          => $data['nama'], 
            'alamat'        => $data['alamat'], 
            'tgl_lahir'     => $data['tgl_lahir'], 
            'tmp_lahir'     => $data['tmp_lahir'], 
            'pekerjaan'     => $data['pekerjaan'], 
            'j_kel'         => $data['j_kel'], 
            'jurusan'       => $data['jurusan'], 
            'no_hp'         => $data['no_hp'], 
            'kode_pin'      => $data['kode_pin']
        );
        echo json_encode($data_anggota);
    } else {
        $data_anggota = "Tidak ada";
        echo json_encode($data_anggota);
    }