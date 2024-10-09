<?php
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['role'] != 'admin') {
    header('Location: login.php');
    exit();
}
?>
<!DOCTYPE html>
<html>
head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h1>Welcome to the Admin Dashboard</h1>
        <p>Manage the platform and user accounts here.</p>
    </div>
</body>
</html>
