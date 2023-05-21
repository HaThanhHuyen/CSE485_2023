<?php
session_start();

// Kiểm tra nếu Sinh viên chưa đăng nhập, chuyển hướng về trang đăng nhập
if (!isset($_SESSION['student_id'])) {
    header("Location: login_student.php");
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Quản lý điểm danh</title>
    <style>
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .container h2 {
            margin-top: 0;
        }

        .container p {
            margin-bottom: 20px;
        }

        .container a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Quản lý điểm danh</h2>
        <p>Xin chào, Sinh viên <?php echo $_SESSION['student_id']; ?>! Bạn đã đăng nhập thành công.</p>
        <a href="attendance_student.php">Điểm danh</a>
        <a href="view.php">Xem điểm danh</a>
        <a href="logout_student.php">Đăng xuất</a>
    </div>
</body>
</html>
