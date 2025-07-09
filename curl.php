<?php 
function verifyDocumentsViaCurl($requestNumber, $currentDate) {
    $url = 'http://localhost/sysworkflow/en/neoclassic/181912854686cfae2b73552085664643/DocumentsManagement.php';
    $data = [
        'requestNumber' => $requestNumber,
        'currentDate' => $currentDate,
    ];

    $ch = curl_init($url);

    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        'Content-Type: application/json'
    ]);
    curl_setopt($ch, CURLOPT_TIMEOUT, 10);  // زمان تایم‌اوت

    $response = curl_exec($ch);
    $error = curl_error($ch);
    $info = curl_getinfo($ch);

    curl_close($ch);

    if ($response === false) {
        return [
            "success" => false,
            "error" => $error,
            //"info" => $info,
            "raw_response" => "kl"
        ];
    }
    if (empty($response)) {
    return [
        "success" => false,
        "error" => "Empty response received from server",
        "raw_response" => $response,
        //"info" => $info,
    ];
}

    $decoded = json_decode($response, true);
    if ($decoded === null && json_last_error() !== JSON_ERROR_NONE) {
        return [
            "success" => false,
            "error" => 'Invalid JSON response: ' . json_last_error_msg(),
            "raw_response" => $response,
            //"info" => $info,
        ];
    }

    // اگر می‌خواهی علاوه بر پاسخ دکود شده، رشته‌ی خام response را هم بازگردانی:
    return [
        "success" => true,
        "data" => $decoded,
        "raw_response" => $response,
        //"info" => $info,
    ];
}
