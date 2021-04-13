<?php

use Slim\App;
use Slim\Http\Request;
use Slim\Http\Response;
use Slim\Http\UploadedFile;

return function (App $app) {
$container = $app->getContainer();

//----------------------------------------SILK-------------------------------------------

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
    $rekammds = $request->getParsedBody();
    $sql = "UPDATE rekammds SET  keluhan=:keluhan, id_dokter=:id_dokter, diagnosa=:diagnosa, 
    id_unit=:id_unit, tgl_periksa=:tgl_periksa, id_resep=:id_resep
    WHERE no_rm=:no_rm";
    $stmt = $this->db->prepare($sql);

    $data = [
        ":no_rm" => $id,
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

};
