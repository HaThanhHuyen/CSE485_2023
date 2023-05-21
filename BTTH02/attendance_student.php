<?php
session_start();

// Kiểm tra nếu Sinh viên chưa đăng nhập, chuyển hướng về trang đăng nhập
if (!isset($_SESSION['student_id'])) {
    header("Location: login_student.php");
}

// Xử lý điểm danh
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $status = $_POST['status'];

    // Lưu trạng thái điểm danh vào cơ sở dữ liệu (có thể sử dụng cơ sở dữ liệu để lưu trữ)
    // CODE XỬ LÝ LƯU CSDL Ở ĐÂY
    $success = true;
    if ($success) {
        $message = "Điểm danh thành công";
    } else {
        $error = "Điểm danh không thành công";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Điểm danh</title>
    <style>
        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group select {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .form-group .submit-btn {
            width: auto;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-group .error {
            color: red;
        }

        .form-group .success {
            color: green;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Điểm danh</h2>
        <?php if (isset($message)) : ?>
            <p class="success"><?php echo $message; ?></p>
        <?php endif; ?>
        <?php if (isset($error)) : ?>
            <p class="error"><?php echo $error; ?></p>
        <?php endif; ?>
        <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
            <div class="form-group">
                <label for="status">Trạng thái:</label>
                <select id="status" name="status" required>
                    <option value="">Chọn trạng thái</option>
                    <option value="Có mặt">Có mặt</option>
                    <option value="Vắng mặt">Vắng </option>
                    <option value="Đi muộn">Muộn</option>
                </select>
            </div>
            <div class="form-group">
                <input type="submit" value="Điểm danh" class="submit-btn">
            </div>
        </form>
        <a href="index_student.php">Quay lại</a>
        <a href="logout_student.php">Đăng xuất</a>
    </div>
</body>
</html>
