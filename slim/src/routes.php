<?php

use Slim\App;
use Slim\Http\Request;
use Slim\Http\Response;
use Slim\Http\UploadedFile;

return function (App $app) {
$container = $app->getContainer();

//----------------------------------------SILK-------------------------------------------
//pasien
//CREATE
$app->post("/pasien/", function (Request $request, Response $response){

    $pasien = $request->getParsedBody();

    $sql = "INSERT INTO pasien (nik,nama_lengkap,tgl_lahir,jns_kelamin,
            alamat,kelurahan,kabupaten,provinsi,warga_negara,status_nikah,no_telp,tgl_daftar) 
            VALUE (:nik,:nama_lengkap,:tgl_lahir,:jns_kelamin,
            :alamat,:kelurahan,:kabupaten,:provinsi,:warga_negara,:status_nikah,:no_telp,:tgl_daftar)";
    $stmt = $this->db->prepare($sql);

    $data = [
        ":nik" => $pasien["nik"],
        ":nama_lengkap" => $pasien["nama_lengkap"],
        ":tgl_lahir" => $pasien["tgl_lahir"],
        ":jns_kelamin" => $pasien["jns_kelamin"],
        ":alamat" => $pasien["alamat"],
        ":kelurahan" => $pasien["kelurahan"],
        ":kabupaten" => $pasien["kabupaten"],
        ":provinsi" => $pasien["provinsi"],
        ":warga_negara" => $pasien["warga_negara"],
        ":status_nikah" => $pasien["status_nikah"],
        ":no_telp" => $pasien["no_telp"],
        ":tgl_daftar" => date("Y-m-d"),
    ];

    if($stmt->execute($data))
        return $response->withJson(["status" => "success", "data" => "1", "no_rm" => $this->db->lastInsertId()], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

//READ
$app->get("/pasien/", function (Request $request, Response $response){
    $sql = "SELECT * FROM pasien";
    $stmt = $this->db->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll();
    return $response->withJson(["status" => "success", "data" => $result], 200);
});

// READ by id
$app->get("/pasien/{id}", function (Request $request, Response $response, $args){
    $pasien_id = $args["id"];
    $sql = "SELECT * FROM pasien where nik=:nik";
    $stmt = $this->db->prepare($sql);
    $data = [
        ":nik" => $pasien_id
    ];
    $stmt->execute($data);
    $result = $stmt->fetchAll();
    return $response->withJson($result, 200);
});

//UPDATE
$app->put("/pasien/{id}", function (Request $request, Response $response, $args){
    $pasien_id = $args["id"];
    $pasien = $request->getParsedBody();
    $sql = "UPDATE pasien SET nik=:nik, nama_lengkap=:nama_lengkap, tgl_lahir=:tgl_lahir, jns_kelamin=:jns_kelamin, alamat=:alamat,
            kelurahan=:kelurahan, kabupaten=:kabupaten, provinsi=:provinsi, warga_negara=:warga_negara,
            status_nikah=:status_nikah, tgl_daftar=:tgl_daftar, no_telp=:no_telp WHERE no_rm=:no_rm";
    $stmt = $this->db->prepare($sql);
    
    $data = [
        ":no_rm" => $pasien_id,
        ":nik" => $pasien["nik"],
        ":nama_lengkap" => $pasien["nama_lengkap"],
        ":tgl_lahir" => $pasien["tgl_lahir"],
        ":jns_kelamin" => $pasien["jns_kelamin"],
        ":alamat" => $pasien["alamat"],
        ":kelurahan" => $pasien["kelurahan"],
        ":kabupaten" => $pasien["kabupaten"],
        ":provinsi" => $pasien["provinsi"],
        ":warga_negara" => $pasien["warga_negara"],
        ":status_nikah" => $pasien["status_nikah"],
        ":no_telp" => $pasien["no_telp"],
        ":tgl_daftar" => date("Y-m-d"),
    ];

    if($stmt->execute($data))
        return $response->withJson(["status" => "success", "data" => "1"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

//DELETE
$app->delete("/pasien/{id}", function (Request $request, Response $response, $args){
    $id = $args["id"];
    $sql = "DELETE FROM pasien WHERE no_rm=:no_rm";
    $stmt = $this->db->prepare($sql);
    
    $data = [
        ":no_rm" => $id
    ];

    if($stmt->execute($data))
        return $response->withJson(["status" => "success", "data" => "1"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});


// PETUGAS
// GET
$app->get("/petugas/", function (Request $request, Response $response){
    $sql = "SELECT * FROM petugas";
    $stmt = $this->db->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll();
    return $response->withJson($result, 200);
});

// GET by id
$app->get("/petugas/{id}", function (Request $request, Response $response, $args){
    $id = $args["id"];
    $sql = "SELECT * FROM petugas where nik=:nik";
    $stmt = $this->db->prepare($sql);
    $data = [
        ":nik" => $id
    ];
    $stmt->execute($data);
    $result = $stmt->fetchAll();
    return $response->withJson($result, 200);
});

// POST
$app->post("/petugas/", function (Request $request, Response $response){

    $petugas = $request->getParsedBody();

    $sql = "INSERT INTO petugas (nik, nama, tgl_lahir, jenis_kelamin, alamat, no_telp) 
            VALUE (:nik, :nama, :tgl_lahir, :jenis_kelamin, :alamat, :no_telp)";
    $stmt = $this->db->prepare($sql);

    $data = [
        ":nik" => $petugas["nik"],
        ":nama" => $petugas["nama"],
        ":tgl_lahir" => date("Y-m-d"),
        ":jenis_kelamin" => $petugas["jenis_kelamin"],
        ":alamat" => $petugas["alamat"],
        ":no_telp" => $petugas["no_telp"]
    ];

    if($stmt->execute($data))
        return $response->withJson(["petugas created succesfully"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

// DELETE
$app->delete("/petugas/{id}", function (Request $request, Response $response, $args){
    $id = $args["id"];
    $sql = "DELETE FROM petugas WHERE nik=:nik";
    $stmt = $this->db->prepare($sql);
    
    $data = [
        ":nik" => $id
    ];

    if($stmt->execute($data))
        return $response->withJson(["petugas deleted successfully"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

// PUT
$app->put("/petugas/{id}", function (Request $request, Response $response, $args){
    $nik = $args["id"];
    $petugas = $request->getParsedBody();
    $sql = "UPDATE petugas SET nama=:nama, tgl_lahir=:tgl_lahir, jenis_kelamin=:jenis_kelamin, alamat=:alamat, no_telp=:no_telp WHERE petugas.nik=:nik";
    $stmt = $this->db->prepare($sql);
    
    $data = [
        ":nik" => $nik,
        ":nama" => $petugas["nama"],
        ":tgl_lahir" => $petugas["tgl_lahir"],
        ":jenis_kelamin" => $petugas["jenis_kelamin"],
        ":alamat" => $petugas["alamat"],
        ":no_telp" => $petugas["no_telp"],
    ];

    if($stmt->execute($data))
        return $response->withJson(["petugas updated succesfully"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

//------------------------------UNIT---------------------------------
$app->get("/unit/", function (Request $request, Response $response){
    $sql = "SELECT * FROM unit";
    $stmt = $this->db->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll();
    return $response->withJson($result, 200);
});

// GET by id
$app->get("/unit/{id}", function (Request $request, Response $response, $args){
    $id = $args["id"];
    $sql = "SELECT * FROM unit where id_unit=:id_unit";
    $stmt = $this->db->prepare($sql);
    $data = [
        ":id_unit" => $id
    ];
    $stmt->execute($data);
    $result = $stmt->fetchAll();
    return $response->withJson($result, 200);
});

// POST
$app->post("/unit/", function (Request $request, Response $response){

    $unit = $request->getParsedBody();

    $sql = "INSERT INTO unit (id_unit, nama_unit) 
            VALUE (:id_unit, :nama_unit)";
    $stmt = $this->db->prepare($sql);

    $data = [
        ":id_unit" => $unit["id_unit"],
        ":nama_unit" => $unit["nama_unit"],
    ];

    if($stmt->execute($data))
        return $response->withJson(["unit created succesfully"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

// DELETE
$app->delete("/unit/{id}", function (Request $request, Response $response, $args){
    $id = $args["id"];
    $sql = "DELETE FROM unit WHERE id_unit=:id_unit";
    $stmt = $this->db->prepare($sql);
    
    $data = [
        ":id_unit" => $id
    ];

    if($stmt->execute($data))
        return $response->withJson(["unit deleted successfully"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

//PUT
$app->put("/unit/{id}", function (Request $request, Response $response, $args){
    $id = $args["id"];
    $unit = $request->getParsedBody();
    $sql = "UPDATE unit SET nama_unit=:nama_unit WHERE unit.id_unit=:id_unit";
    $stmt = $this->db->prepare($sql);
    
    $data = [
        ":id_unit" => $id,
        ":nama_unit" => $unit["nama_unit"],
    ];

    if($stmt->execute($data))
        return $response->withJson(["unit updated succesfully"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

$app->post("/rekammds/", function (Request $request, Response $response){

    $rekammds = $request->getParsedBody();

    $sql = "INSERT INTO rekammds (no_rm,keluhan,id_dokter,diagnosa,id_unit,tgl_periksa,id_resep)
            VALUE (:no_rm,:keluhan,:id_dokter,:diagnosa,:id_unit,:tgl_periksa,:id_resep)";
    $stmt = $this->db->prepare($sql);

    $data = [
        ":no_rm" => $rekammds["no_rm"],
        ":keluhan" => $rekammds["keluhan"],
        ":id_dokter" => $rekammds["id_dokter"],
        ":diagnosa" => $rekammds["diagnosa"],
        ":id_unit" => $rekammds["id_unit"],
        ":tgl_periksa" => date("Y-m-d"),
        ":id_resep" => $rekammds["id_resep"],

    ];

    if($stmt->execute($data))
        return $response->withJson(["status" => "success", "data" => "1", "id_transaksi_rm" => $this->db->lastInsertId()], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});



//-----------------------------------------END SILK---------------------------------------------

$app->get('/[{name}]', function (Request $request, Response $response, array $args) use ($container) {
    // Sample log message
    $container->get('logger')->info("Slim-Skeleton '/' route");

    // Render index view
    return $container->get('renderer')->render($response, 'index.phtml', $args);
});

$app->get('/about/', function (Request $request, Response $response, array $args) {
    // kirim pesan ke log
    $this->logger->info("ada orang yang mengakses '/about/'");

    // tampilkan pesan
    echo "ini adalah halaman about!";
    
});

$app->get("/rekammds/", function (Request $request, Response $response){
    $sql = "SELECT * FROM rekammds";
    $stmt = $this->db->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll();
    return $response->withJson(["status" => "success", "data" => $result], 200);
});

$app->get("/rekammds/{id}", function (Request $request, Response $response, $args){
    $id = $args["id"];
    $sql = "SELECT * FROM rekammds WHERE no_rm=:no_rm";
    $stmt = $this->db->prepare($sql);
    $stmt->execute([":no_rm" => $no_rm]);
    $result = $stmt->fetch();
    return $response->withJson(["status" => "success", "data" => $result], 200);
});

$app->get("rekammds/search/", function (Request $request, Response $response, $args){
    $keyword = $request->getQueryParam("keyword");
    $sql = "SELECT * FROM rekammds WHERE name LIKE '%$keyword%'";
    $stmt = $this->db->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll();
    return $response->withJson(["status" => "success", "data" => $result], 200);
});


$app->put("/rekammds/{id}", function (Request $request, Response $response, $args){
    $id = $args["id"];
    $no_rm = $args["id"];
    $rekammds = $request->getParsedBody();
    $sql = "UPDATE rekammds SET keluhan=:keluhan, id_dokter=:id_dokter, diagnosa=:diagnosa, 
    id_unit=:id_unit, tgl_periksa=:tgl_periksa, id_resep=:id_resep
    WHERE no_rm=:no_rm";
    $stmt = $this->db->prepare($sql);

    $data = [
        ":no_rm" => $id,
        ":no_rm" => $no_rm,
        ":keluhan" => $rekammds["keluhan"],
        ":id_dokter" => $rekammds["id_dokter"],
        ":diagnosa" => $rekammds["diagnosa"],
        ":id_unit" => $rekammds["id_unit"],
        ":tgl_periksa" => date("Y-m-d"),
        ":id_resep" => $rekammds["id_resep"]
    ];

    if($stmt->execute($data))
        return $response->withJson(["rekammds updated succesfully"], 200);

    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});
$app->delete("/rekammds/{id}", function (Request $request, Response $response, $args){
    $id = $args["id"];
    $sql = "DELETE FROM rekammds WHERE no_rm=:no_rm";
    $stmt = $this->db->prepare($sql);
    
    $data = [
        ":no_rm" => $id
    ];

    if($stmt->execute($data))
        return $response->withJson(["status" => "success", "data" => "1"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

//-----------------------------------------------obat dan resep----------------------------------------
//Obat Create
$app->post("/obat/", function (Request $request, Response $response){

    $obat = $request->getParsedBody();

    $sql = "INSERT INTO obat (kode_obat,nama_obat,jenis_obat,satuan,stok,harga) 
            VALUE (:kode_obat,:nama_obat,:jenis_obat,:satuan,:stok,:harga)";
    $stmt = $this->db->prepare($sql);

    $data = [
        ":kode_obat" => $obat["kode_obat"],
        ":nama_obat" => $obat["nama_obat"],
        ":jenis_obat" => $obat["jenis_obat"],
        ":satuan" => $obat["satuan"],
        ":stok" => $obat["stok"],
        ":harga" => $obat["harga"],
    ]; 

    if($stmt->execute($data))
        return $response->withJson(["status" => "success", "data" => "1"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});


//Obat Read
$app->get("/obat/", function (Request $request, Response $response){
    $sql = "SELECT * FROM obat";
    $stmt = $this->db->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll();
    return $response->withJson(["status" => "success", "data" => $result], 200);
});

//Obat Update
$app->put("/obat/update/{id}", function (Request $request, Response $response, $args){
    $obat_id;
    $obat = $args["id"];
    $obat = $request->getParsedBody();
    $sql = "UPDATE obat SET kode_obat=:kode_obat, nama_obat=:nama_obat, jenis_obat=:jenis_obat, satuan=:satuan, stok=:stok,
            harga=:harga WHERE kode_obat=:kode_obat";
    $stmt = $this->db->prepare($sql);
    
    $data = [
        ":kode_obat" => $obat_id,
        ":nama_obat" => $obat["nama_obat"],
        ":jenis_obat" => $obat["jenis_obat"],
        ":satuan" => $obat["satuan"],
        ":stok" => $obat["stok"],
        ":harga" => $obat["harga"],
    ];

    if($stmt->execute($data))
        return $response->withJson(["status" => "success", "data" => "1"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

//Obat Delete
$app->delete("/obat/delete/{id}", function (Request $request, Response $response, $args){
    $id = $args["id"];
    $sql = "DELETE FROM obat WHERE kode_obat=:kode_obat";
    $stmt = $this->db->prepare($sql);
    
    $data = [
        ":kode_obat" => $id
    ];

    if($stmt->execute($data))
        return $response->withJson(["status" => "success", "data" => "1"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

//Resep Create
$app->post("/resep/", function (Request $request, Response $response){

    $resep = $request->getParsedBody();

    $sql = "INSERT INTO resep (id_dokter,no_rm,tgl_transaksi,total_harga) 
            VALUE (:id_dokter,:no_rm,:tgl_transaksi,:total_harga)";
    $stmt = $this->db->prepare($sql);

    $data = [
        ":id_dokter" => $resep["id_dokter"],
        ":no_rm" => $resep["no_rm"],
        ":tgl_transaksi" => date("Y-m-d"),
        ":total_harga" => $resep["total_harga"],
    ]; 

    if($stmt->execute($data))
        return $response->withJson(["status" => "success", "data" => "1"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

//Resep Read
$app->get("/resep/", function (Request $request, Response $response){
    $sql = "SELECT * FROM resep";
    $stmt = $this->db->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll();
    return $response->withJson(["status" => "success", "data" => $result], 200);
});

//Resep Update
$app->put("/resep/update/{id}", function (Request $request, Response $response, $args){
    $resep_id;
    $resep = $args["id"];
    $resep = $request->getParsedBody();
    $sql = "UPDATE resep SET id_resep=:id_resep, id_dokter=:id_dokter, no_rm=:no_rm, tgl_transaksi=:tgl_transaksi, total_harga=:total_harga
            WHERE id_resep=:id_resep";
    $stmt = $this->db->prepare($sql);
    
    $data = [
        ":id_resep" => $resep_id,
        ":id_dokter" => $resep["id_dokter"],
        ":no_rm" => $resep["no_rm"],
        ":tgl_transaksi" => date("Y-m-d"),
        ":total_harga" => $resep["total_harga"],
    ];

    if($stmt->execute($data))
        return $response->withJson(["status" => "success", "data" => "1"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

//Resep Delete
$app->delete("/resep/delete/{id}", function (Request $request, Response $response, $args){
    $id = $args["id"];
    $sql = "DELETE FROM resep WHERE id_resep=:id_resep";
    $stmt = $this->db->prepare($sql);
    
    $data = [
        ":id_resep" => $id
    ];

    if($stmt->execute($data))
        return $response->withJson(["status" => "success", "data" => "1"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

//Create Detil Resep
$app->post("/detil_resep/", function (Request $request, Response $response){

    $detil_resep = $request->getParsedBody();

    $sql = "INSERT INTO detil_resep (id_resep,kode_obat,harga,jumlah_beli) 
            VALUE (:id_resep,:kode_obat,:harga,:jumlah_beli)";
    $stmt = $this->db->prepare($sql);

    $data = [
        ":id_resep" => $detil_resep["id_resep"],
        ":kode_obat" => $detil_resep["kode_obat"],
        ":harga" => $detil_resep["harga"],
        ":jumlah_beli" => $detil_resep["jumlah_beli"],
    ]; 

    if($stmt->execute($data))
        return $response->withJson(["status" => "success", "data" => "1"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

//Read Detil Resep
$app->get("/detil_resep/", function (Request $request, Response $response){
    $sql = "SELECT * FROM detil_resep";
    $stmt = $this->db->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll();
    return $response->withJson(["status" => "success", "data" => $result], 200);
});

//Update Detil Resep
$app->put("/detil_resep/update/{id}", function (Request $request, Response $response, $args){
    $detil_resep_id;
    $detil_resep = $args["id"];
    $detil_resep = $request->getParsedBody();
    $sql = "UPDATE resep SET id_detil_resep=:id_detil_resep, id_resep=:id_resep, kode_obat=:kode_obat, harga=:harga,jumlah_beli=:jumlah_beli
            WHERE id_detil_resep=:id_detil_resep";
    $stmt = $this->db->prepare($sql);
    
    $data = [
        ":id_detil_resep" => $detil_resep_id,
        ":id_resep" => $detil_resep["id_resep"],
        ":kode_obat" => $detil_resep["kode_obat"],
        ":harga" => $detil_resep["harga"],
        ":jumlah_beli" => $detil_resep["jumlah_beli"],
    ];

    if($stmt->execute($data))
        return $response->withJson(["status" => "success", "data" => "1"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

//Delete Detil Resep

$app->delete("/detil_resep/delete/{id}", function (Request $request, Response $response, $args){
    $id = $args["id"];
    $sql = "DELETE FROM detil_resep WHERE id_detil_resep=:id_detil_resep";
    $stmt = $this->db->prepare($sql);
    
    $data = [
        ":id_detil_resep" => $id
    ];

    if($stmt->execute($data))
        return $response->withJson(["status" => "success", "data" => "1"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

//
$app->put("/obat/{id}", function (Request $request, Response $response, $args){
    $kode_obat = $args["id"];
    $obat = $request->getParsedBody();
    $sql = "UPDATE obat SET kode_obat=:kode_obat, nama_obat=:nama_obat, jenis_obat=:jenis_obat, 
            satuan=:satuan, stok=:stok, harga=:harga 
            WHERE kode_obat=:kode_obat";
    $stmt = $this->db->prepare($sql);
    
    $data = [
        ":kode_obat" => $obat["kode_obat"],
        ":nama_obat" => $obat["nama_obat"],
        ":jenis_obat" => $obat["jenis_obat"],
        ":satuan" => $obat["satuan"],
        ":stok" => $obat["stok"],
        ":harga" => $obat["harga"],
    ];

    if($stmt->execute($data))
        return $response->withJson(["status" => "success", "data" => "1"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});


$app->put("/resep/{id}", function (Request $request, Response $response, $args){
    $id_resep = $args["id"];
    $resep = $request->getParsedBody();
    $sql = "UPDATE resep SET kode_obat=:kode_obat, nama_obat=:nama_obat, jenis_obat=:jenis_obat, 
            satuan=:satuan, stok=:stok, harga=:harga 
            WHERE kode_obat=:kode_obat";
    $stmt = $this->db->prepare($sql);
    
    $data = [
        ":kode_obat" => $obat["kode_obat"],
        ":nama_obat" => $obat["nama_obat"],
        ":jenis_obat" => $obat["jenis_obat"],
        ":satuan" => $obat["satuan"],
        ":stok" => $obat["stok"],
        ":harga" => $obat["harga"],
    ];

    if($stmt->execute($data))
        return $response->withJson(["status" => "success", "data" => "1"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

};