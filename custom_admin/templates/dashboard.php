<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

$role = $_SESSION['role'];

if ($role == 'student') {
    include('student_dashboard.php');
} elseif ($role == 'teacher') {
    include('teacher_dashboard.php');
} elseif ($role == 'hod') {
    include('hod_dashboard.php');
} else {
    echo "Invalid role.";
}
?>
