<?php
require_once 'config.php';     
require_once 'functions.php';  
require_once 'DocumentsManagement.php';         
//session_start();

// فرضی: user_id را دستی تنظیم کردیم برای تست
$_SESSION['user_id'] = 1;




$requestNumber = '4444444444';
$date          = date('Y-m-d H:i:s');

// ورودی تستی
$input = [
    'request_number' => $requestNumber,
    'date' => $date
];

// اجرای توابع
$result1 = completeDocuments($input);
//$result2 = approveDocuments($input);

print_r($result1);
//print_r($result2);

