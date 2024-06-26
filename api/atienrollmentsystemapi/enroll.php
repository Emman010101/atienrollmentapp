<?php
//header('Content-Type: application/json');
header('Content-Type: multipart/form-data');
include "dbconn.php";

if (isset($_POST['gradeLevelToEnroll'])) {
    $gradeLevelToEnroll = $_POST['gradeLevelToEnroll'];
    $withLrn = $_POST['withLrn'];
    $balikAral = $_POST['balikAral'];
    $psaBirthCertNo = $_POST['psaBirthCertNo'];
    $lrn = $_POST['lrn'];
    $lastName = $_POST['lastName'];
    $firstName = $_POST['firstName'];
    $middleName = $_POST['middleName'];
    $extensionName = $_POST['extensionName'];
    $birthDate = $_POST['birthDate'];
    $pRegion = $_POST['pRegion'];
    $pProvince = $_POST['pProvince'];
    $pMunicipality = $_POST['pMunicipality'];
    $gender = $_POST['gender'];
    $age = $_POST['age'];
    $motherTongue = $_POST['motherTongue'];
    $indigenousPeople = $_POST['indigenousPeople'];
    $fourPsBeneficiary = $_POST['fourPsBeneficiary'];
    $cRegion = $_POST['cRegion'];
    $cProvince = $_POST['cProvince'];
    $cMunicipality = $_POST['cMunicipality'];
    $cBarangay = $_POST['cBarangay'];
    $cZipCode = $_POST['cZipCode'];
    $cStreetName = $_POST['cStreetName'];
    $cHouseNoStreet = $_POST['cHouseNoStreet'];
    $sameWithCurrentAddress = $_POST['sameWithCurrentAddress'];
    $perRegion = $_POST['perRegion'];
    $perProvince = $_POST['perProvince'];
    $perMunicipality = $_POST['perMunicipality'];
    $perBarangay = $_POST['perBarangay'];
    $perZipCode = $_POST['perZipCode'];
    $perStreetName = $_POST['perStreetName'];
    $perHouseNoStreet = $_POST['perHouseNoStreet'];
    $fatherLastName = $_POST['fatherLastName'];
    $fatherFirstName = $_POST['fatherFirstName'];
    $fatherMiddleName = $_POST['fatherMiddleName'];
    $fatherContactNum = $_POST['fatherContactNum'];
    $motherLastName = $_POST['motherLastName'];
    $motherFirstName = $_POST['motherFirstName'];
    $motherMiddleName = $_POST['motherMiddleName'];
    $motherContactNum = $_POST['motherContactNum'];
    $lastGradeLevelCompleted = $_POST['lastGradeLevelCompleted'];
    $lastSchoolYearCompleted = $_POST['lastSchoolYearCompleted'];
    $lastSchoolAttended = $_POST['lastSchoolAttended'];
    $lastSchoolID = $_POST['lastSchoolID'];
    $semester = $_POST['semester'];
    $track = $_POST['track'];
    $strand = $_POST['strand'];
    $email = $_POST['email'];
    $schoolYear = $_POST['schoolYear'];
    $file = $_POST['file'];


    $stmt = $db->prepare("INSERT INTO enrolltbl (
    gradeLevelToEnroll, withLrn, balikAral, psaBirthCertNo, lrn,
    lastName, firstName, middleName, extensionName, birthDate,
    pRegion, pProvince, pMunicipality, gender, age,
    motherTongue, indigenousPeople, fourPsBeneficiary, cRegion, cProvince,
    cMunicipality, cBarangay, cZipCode, cStreetName, cHouseNoStreet,
    sameWithCurrentAddress, perRegion, perProvince, perMunicipality, perBarangay,
    perZipCode, perStreetName, perHouseNoStreet, fatherLastName, fatherFirstName,
    fatherMiddleName, fatherContactNum, motherLastName, motherFirstName, motherMiddleName,
    motherContactNum, lastGradeLevelCompleted, lastSchoolYearCompleted, lastSchoolAttended, lastSchoolID,
    semester, track, strand, email, schoolYear
) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $result = $stmt->execute([
        $gradeLevelToEnroll, $withLrn, $balikAral, $psaBirthCertNo, $lrn,
        $lastName, $firstName, $middleName, $extensionName, $birthDate,
        $pRegion, $pProvince, $pMunicipality, $gender, $age,
        $motherTongue, $indigenousPeople, $fourPsBeneficiary, $cRegion, $cProvince,
        $cMunicipality, $cBarangay, $cZipCode, $cStreetName, $cHouseNoStreet,
        $sameWithCurrentAddress, $perRegion, $perProvince, $perMunicipality, $perBarangay,
        $perZipCode, $perStreetName, $perHouseNoStreet, $fatherLastName, $fatherFirstName,
        $fatherMiddleName, $fatherContactNum, $motherLastName, $motherFirstName, $motherMiddleName,
        $motherContactNum, $lastGradeLevelCompleted, $lastSchoolYearCompleted, $lastSchoolAttended, $lastSchoolID,
        $semester, $track, $strand, $email, $schoolYear
    ]);

    $target_dir = "uploads/";
    $target_file = $target_dir . basename($_FILES["file"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    // Check if image file is a actual image or fake image
    if (isset($_POST["file"])) {
        $check = getimagesize($_FILES["file"]["tmp_name"]);
        if ($check !== false) {
            echo "File is an image - " . $check["mime"] . ".";
            $uploadOk = 1;
        } else {
            echo "File is not an image.";
            $uploadOk = 0;
        }
    }

    // Check if file already exists
    if (file_exists($target_file)) {
        echo "Sorry, file already exists.";
        $uploadOk = 0;
    }

    // Check file size
    if ($_FILES["fileToUpload"]["size"] > 500000) {
        echo "Sorry, your file is too large.";
        $uploadOk = 0;
    }

    // Allow certain file formats
    if (
        $imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
        && $imageFileType != "gif"
    ) {
        echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
    }

    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        echo "Sorry, your file was not uploaded.";
        // if everything is ok, try to upload file
    } else {
        if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file)) {
            echo "The file " . htmlspecialchars(basename($_FILES["file"]["name"])) . " has been uploaded.";
        } else {
            echo "Sorry, there was an error uploading your file.";
        }
    }

    echo json_encode([
        'success' => $result
    ]);
} else {
    echo "Error";
}
