<?php
session_start();

// Kiểm tra nếu Sinh viên chưa đăng nhập, chuyển hướng về trang đăng nhập
if (!isset($_SESSION['student_id'])) {
    header("Location: login_student.php");
}

// Kết nối tới cơ sở dữ liệu và thực hiện truy vấn
$conn = new mysqli('localhost', 'linh', '', 'btth2');
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

//$studentId = $_SESSION['student_id']; // ID sinh viên

// Truy vấn dữ liệu điểm danh của sinh viên
$query = "SELECT `sinhvien`.`ID_SinhVien`, `sinhvien`.`TenSinhVien`, `diemdanh`.`NgayHoc`, `diemdanh`.`TrangThaiDiemDanh`, `lophocphan`.`TenLopHocPhan`, `monhoc`.`TenMonHoc`
FROM `sinhvien` 
	LEFT JOIN `diemdanh` ON `diemdanh`.`ID_SinhVien` = `sinhvien`.`ID_SinhVien` 
	LEFT JOIN `lophocphan` ON `diemdanh`.`ID_LopHocPhan` = `lophocphan`.`ID_LopHocPhan` 
	LEFT JOIN `monhoc` ON `lophocphan`.`ID_MonHoc` = `monhoc`.`ID_MonHoc`;";
$result = $conn->query($query);
$attendanceData = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $attendanceData[] = $row;
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Xem điểm danh</title>
    <style>
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .container h2 {
            margin-top: 0;
        }

        .container table {
            width: 100%;
            border-collapse: collapse;
        }

        .container table th,
        .container table td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        .container table th {
            background-color: #f2f2f2;
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
        <h2>Xem điểm danh</h2>
        <?php if (!empty($attendanceData)) : ?>
            <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Họ tên sinh viên</th>
                    <th>Ngày</th>
                    <th>Trạng thái điểm danh</th>
                    <th>Lớp học phần</th>
                    <th>Môn học</th>
                </tr>
            </thead>
                <?php foreach ($attendanceData as $attendance) : ?>
                    <tr>
                        <td><?php echo $attendance['ID_SinhVien']; ?></td>
                        <td><?php echo $attendance['TenSinhVien']; ?></td>
                        <td><?php echo $attendance['NgayHoc']; ?></td>
                        <td><?php echo $attendance['TrangThaiDiemDanh']; ?></td>
                        <td><?php echo $attendance['TenLopHocPhan']; ?></td>
                        <td><?php echo $attendance['TenMonHoc']; ?></td>
                    </tr>
                <?php endforeach; ?>
            </table>
        <?php else : ?>
            <p>Không có dữ liệu điểm danh</p>
        <?php endif; ?>
        <a href="index_student.php">Quay lại</a>
        <a href="logout_student.php">Đăng xuất</a>
    </div>
</body>
</html>
