<?php
header('Content-Type: application/json');
include "dbconn.php";

if (isset($_POST['checkEmailIfUsed'])) {
    $email = $_POST['checkEmailIfUsed'];

    $stmt = $db->prepare("SELECT id FROM enrolltbl WHERE email = ?");
    $stmt->execute([$email]);
    $result = $stmt->fetch(PDO::FETCH_ASSOC);

    echo json_encode([
        'result' => $result
    ]);
}
