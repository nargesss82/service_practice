<?php 
require_once 'config.php';
function getCurrentAuthUserId()
{
    // مثال با session
    if (!empty($_SESSION['user_id'])) {
        return $_SESSION['user_id'];
    }

    // مثال با header token
    $token = $_SERVER['HTTP_AUTH_TOKEN'] ?? null;
    if ($token) {
        return getUserIdFromToken($token);
    }

    return false;
}

function getUserIdFromToken($token)
{
    global $pdo;

    $stmt = $pdo->prepare("SELECT user_id FROM tbl_users WHERE auth_token = ?");
    $stmt->execute([$token]);
    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    return $row ? $row['user_id'] : false;
}

function checkRequestExists($requestNumber)
{
    global $pdo;

    $stmt = $pdo->prepare("SELECT COUNT(*) FROM tbl_requests WHERE request_number = ?");
    $stmt->execute([$requestNumber]);
    $count = $stmt->fetchColumn();

    return $count > 0;
}

function handleInsertQuery($data)
{
    global $pdo;

    $results = [];

    foreach ($data as $table => $queryData) {
        $columns = array_keys($queryData['row_column_set']);
        $values = array_values($queryData['row_column_set']);

        $columnList = "`" . implode("`, `", $columns) . "`";
        $placeholders = implode(", ", array_fill(0, count($values), "?"));

        $sql = "INSERT INTO `$table` ($columnList) VALUES ($placeholders)";

        try {
            $stmt = $pdo->prepare($sql);
            $stmt->execute($values);
            $results[$table] = $stmt->rowCount();
        } catch (PDOException $e) {
            $results[$table] = false;
            error_log("DB Insert Error: " . $e->getMessage());
        }
    }

    return $results;
}

function handleUpdateQuery($data)
{
    global $pdo;

    $results = [];

    foreach ($data as $table => $queryData) {
        $setParts = [];
        $params = [];
        foreach ($queryData['row_column_set'] as $col => $val) {
            $setParts[] = "$col = ?";
            $params[] = $val;
        }

        $whereParts = [];
        foreach ($queryData['where_set'] as $col => $val) {
            $whereParts[] = "$col = ?";
            $params[] = $val;
        }

        $setQuery = "UPDATE `$table` SET " . implode(', ', $setParts);
        $whereQuery = " WHERE " . implode(' AND ', $whereParts);

        $sql = $setQuery . $whereQuery;

        try {
            $stmt = $pdo->prepare($sql);
            $stmt->execute($params);
            $results[$table] = $stmt->rowCount();
        } catch (PDOException $e) {
            $results[$table] = false;
            error_log("DB Update Error: " . $e->getMessage());
        }
    }

    return $results;
}

function nowtime()
{
    return date('Y-m-d H:i:s');
}

