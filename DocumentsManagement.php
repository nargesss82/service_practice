<?php 



//die(var_dump(50));


require_once 'functions.php';
require_once 'curl.php';
header("Content-Type: application/json");
function completeDocuments($inputData): array
{
// مرحله 1: اعتبارسنجی داده‌ها
if (empty($inputData['request_number'])) {
    return [
        'result' => false,
        'message' => 'شماره درخواست الزامی است.',
        'status' => ['statusCode' => 400]
    ];
}

if (empty($inputData['date'])) {
    return [
        'result' => false,
        'message' => 'تاریخ الزامی است.',
        'status' => ['statusCode' => 400]
    ];
}

$requestNumber = $inputData['request_number'];
$currentDate = $inputData['date'];

// مرحله 2: بررسی وجود درخواست
if (!checkRequestExists($requestNumber)) {
    return [
        'result' => false,
        'message' => 'شماره درخواست معتبر نیست.',
        'status' => ['statusCode' => 404]
    ];
}


$userId = getCurrentAuthUserId(); 
if (!$userId) {
    return [
        'result' => false,
        'message' => 'کاربر شناسایی نشد.',
        'status' => ['statusCode' => 401]
    ];
}


$response = verifyDocumentsViaCurl($requestNumber,$currentDate);
//die(var_dump($response));
if (is_array($response) && isset($response['success']) && $response['success'] === true) {
   // مرحله 3: بروزرسانی دیتابیس
$query_object = [
    "row_column_set" => [
        "documents_acquired_date" => $currentDate,
        "dat_organization_register_date" => $currentDate,
        "dat_user_confirm_documents" => $currentDate,
        "lastStepName" => "documents-acquired",
        "updated_at" => $currentDate,
        "user_id" => $userId,
        "status_id" => 5,         
        "sys_status_id" => 10     
    ],
    "where_set" => ["request_number" => $requestNumber],
];

$update_result = handleUpdateQuery(["tbl_requests" => $query_object]);

if (!($update_result['tbl_requests'] ?? false)) {
    return [
        'result' => false,
        'message' => 'خطا در ذخیره در دیتابیس.',
        'status' => ['statusCode' => 500]
    ];
}


$status_id = 5;       
$sys_status_id = 10;  

storeRequestStatusChangesLog($requestNumber, $status_id, $userId);
storeRequestStatusChangesLog($requestNumber, $sys_status_id, $userId);

// مرحله 4: ارسال پاسخ موفق
return [
    'result' => [
        'data' => [
            'code' => 100,
            'message' => 'درخواست با موفقیت بروزرسانی شد',
            'data' => [
                'dat_organization_register_date' => $currentDate,
                'dat_user_confirm_documents' => $currentDate,
                'lastStepName' => 'documents-acquired'
            ]
        ],
        'status' => ['statusCode' => 200]
    ],
    'status' => ['statusCode' => 200, 'message' => 'OK']
];
    
}else{
    return [
        'result' => false,
        'message' => 'مشکل در ارتباط با درگاه',
        'status' => ['statusCode' => 444]
    ];

}






}

function approveDocuments($inputData): array
{
// مرحله 1: اعتبارسنجی داده‌ها
if (empty($inputData['request_number'])) {
    return [
        'result' => false,
        'message' => 'شماره درخواست الزامی است.',
        'status' => ['statusCode' => 400]
    ];
}

if (empty($inputData['date'])) {
    return [
        'result' => false,
        'message' => 'تاریخ الزامی است.',
        'status' => ['statusCode' => 400]
    ];
}

$requestNumber = $inputData['request_number'];
$currentDate = $inputData['date'];

// مرحله 2: بررسی وجود درخواست
if (!checkRequestExists($requestNumber)) {
    return [
        'result' => false,
        'message' => 'شماره درخواست معتبر نیست.',
        'status' => ['statusCode' => 404]
    ];
}


$userId = getCurrentAuthUserId();
if (!$userId) {
    return [
        'result' => false,
        'message' => 'کاربر شناسایی نشد.',
        'status' => ['statusCode' => 401]
    ];
}



$response = verifyDocumentsViaCurl($requestNumber,$currentDate);
if (is_array($response) && isset($response['success']) && $response['success'] === true){
    // مرحله 3: بروزرسانی دیتابیس
$query_object = [
    "row_column_set" => [
        "dat_organization_register_date" => $currentDate,
        "lastStepName" => "documents-approved",
        "updated_at" => $currentDate,
        "user_id" => $userId,
        "status_id" => 6,         
        "sys_status_id" => 11     
    ],
    "where_set" => ["request_number" => $requestNumber],
];

$update_result = handleUpdateQuery(["tbl_requests" => $query_object]);

if (!($update_result['tbl_requests'] ?? false)) {
    return [
        'result' => false,
        'message' => 'خطا در ذخیره در دیتابیس.',
        'status' => ['statusCode' => 500]
    ];
}


$status_id = 6;       
$sys_status_id = 11;  

storeRequestStatusChangesLog($requestNumber, $status_id, $userId);
storeRequestStatusChangesLog($requestNumber, $sys_status_id, $userId);

// مرحله 4: بازگشت پاسخ موفق
return [
    'result' => [
        'data' => [
            'code' => 100,
            'message' => 'درخواست با موفقیت بروزرسانی شد',
            'data' => [
                'dat_organization_register_date' => $currentDate,
                'lastStepName' => 'documents-approved'
            ]
        ],
        'status' => ['statusCode' => 200]
    ],
    'status' => ['statusCode' => 200, 'message' => 'OK']
];
}else{
    return [
        'result' => false,
        'message' => 'مشکل در ارتباط با درگاه',
        'status' => ['statusCode' => 444]
    ];

}

}

function storeRequestStatusChangesLog($requestNumber, $statusId, $userId)
{
$logData = [
    "row_column_set" => [
        "request_number" => $requestNumber,
        "status_id" => $statusId,
        "changed_at" => nowtime(), 
        "user_id" => $userId
    ]
];

return handleInsertQuery(["tbl_request_logs" => $logData]);
}







/*
5: مدارک توسط سیستم تخصصی دریافت شد
10: مدارک منتظر اقدام کاربر در درگاه ملی


6: تایید در تخصصی،
11: ارسال به درگاه ملی
*/