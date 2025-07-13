

# 📦 Document Management API for Specialized Authorities
<div dir="rtl">

سامانه‌ای برای **تکمیل** و **تأیید مدارک** درخواست‌ها توسط دستگاه‌های تخصصی مانند وزارت نیرو و ساتبا.

---

## 🧭 فهرست مطالب

- [پیش‌نیازها](#پیش‌نیازها)
- [ساختار پروژه](#ساختار-پروژه)
- [نصب و راه‌اندازی](#نصب-و-راه‌اندازی)
- [توضیح APIها](#توضیح-apiها)
  - [تکمیل مدارک](#1-تکمیل-مدارک-completedocuments)
  - [تأیید مدارک](#2-تأیید-مدارک-approvedocuments)
- [فایل تست](#فایل-تست)
- [نکات فنی](#نکات-فنی)


---

## 🛠 پیش‌نیازها

- process maker 3.3.10


---

## 📁 ساختار پروژه


├── config.php ← تنظیمات اتصال به دیتابیس

├── functions.php ← توابع دیتابیس و احراز هویت

├── curl.php ← ارتباط با درگاه از طریق CURL

├── DocumentsManagement.php ← هسته API تکمیل و تایید مدارک

├── test-documents.php ← اسکریپت تست API


---

## ⚙ نصب و راه‌اندازی

1. پایگاه داده `wf_workflow` را بسازید.
2. جداول زیر را ایجاد کنید:
   - `tbl_users` شامل ستون‌های `user_id`, `username`
   - `tbl_requests` شامل `request_number`, `status_id`,`licences_id` ...
   - `tbl_request_logs` برای لاگ وضعیت‌ها
3. اطلاعات فایل `config.php` را بر اساس تنظیمات سیستم خود تغییر دهید.

---

## 📡 توضیح APIها

### 1. تکمیل مدارک (`completeDocuments`)

#### 🛠 عملیات:

- ✅ بررسی وجود درخواست
- 👤 شناسایی کاربر
- 🔗 ارسال داده به درگاه (از طریق CURL)
- 🗂 بروزرسانی جدول `tbl_requests`
- 📝 ثبت لاگ وضعیت جدید در `tbl_request_logs`

#### 📥 ورودی نمونه:
<div dir="ltr">

```json
{
  "request_number": "4444444444",
  "date": "2025-07-09 15:00:00"
}
```
</div>

#### 📥 خروجی موفق:
<div dir="ltr">

```json
{
  "result": {
    "data": {
      "code": 100,
      "message": "درخواست با موفقیت بروزرسانی شد",
      "data": {
        "dat_organization_register_date": "2025-07-09 15:00:00",
        "dat_user_confirm_documents": "2025-07-09 15:00:00",
        "lastStepName": "documents-acquired"
      }
    },
    "status": {
      "statusCode": 200,
      "message": "OK"
    }
  }
}
```
</div>

---

### 2. تأیید مدارک (`approveDocuments`)

#### 🛠 عملیات:

- ✅ بررسی وجود درخواست  
- 👤 شناسایی کاربر  
- 🔗 ارسال داده به درگاه (از طریق CURL)  
- 🗂 بروزرسانی جدول `tbl_requests`  
- 📝 ثبت لاگ وضعیت جدید در `tbl_request_logs`

#### 🎯 تفاوت با `completeDocuments`:

- مقدار `status_id = 6`  
- مقدار `sys_status_id = 11`  
- مقدار نهایی `lastStepName = "documents-approved"`
<div dir="rtl">

#### 📥 ورودی نمونه:
</div>
<div dir="ltr">

```json
{
  "request_number": "4444444444",
  "date": "2025-07-09 15:00:00"
}
```
</div>
<div dir="rtl">

#### 📥 خروجی موفق:

</div>
<div dir="ltr">

```json
{
  "result": {
    "data": {
      "code": 100,
      "message": "درخواست با موفقیت بروزرسانی شد",
      "data": {
        "dat_organization_register_date": "2025-07-09 15:00:00",
        "dat_user_confirm_documents": "2025-07-09 15:00:00",
        "lastStepName": "documents-approved"
      }
    },
    "status": {
      "statusCode": 200,
      "message": "OK"
    }
  }
}
```
</div>

<div dir="rtl">

---

## 🧪 فایل تست
برای تست دستی API‌ها می‌توانید از فایل test-documents.php استفاده کنید:
</div>
<div dir="ltr">

```php
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
```
</div>
<div dir="rtl">

## 💡 نکات فنی
- 🔌 ارتباط با درگاه از طریق JSON و CURL (متد POST)

- 🛠 استفاده از توابع داینامیک برای Insert و Update (در functions.php)

- 🧾 لاگ‌گیری با storeRequestStatusChangesLog

- 🔐 احراز هویت از طریق Session یا هدر Auth Token




</div>


