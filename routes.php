<?php

use Slim\App;
use Slim\Http\Request;
use Slim\Http\Response;
use Slim\Http\UploadedFile;

return function (App $app) {
$container = $app->getContainer();

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
    $id = $args["id"];
    $petugas = $request->getParsedBody();
    $sql = "UPDATE petugas SET nama=:nama, tgl_lahir=:tgl_lahir, jenis_kelamin=:jenis_kelamin, alamat=:alamat, no_telp=:no_telp WHERE nik=:nik";
    $stmt = $this->db->prepare($sql);
    
    $data = [
        ":nik" => $id,
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

};


