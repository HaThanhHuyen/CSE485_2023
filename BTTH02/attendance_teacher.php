<?php
session_start();

// Kiểm tra nếu người dùng chưa đăng nhập, chuyển hướng về trang đăng nhập
if (!isset($_SESSION['username'])) {
    header("Location: login_teacher.php");
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

        .container table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .container table th,
        .container table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ccc;
        }

        .container table th {
            background-color: #f2f2f2;
        }

        .container .back-link {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Quản lý điểm danh</h2>
        <p>Xin chào, <?php echo $_SESSION['username']; ?>!</p>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Họ tên sinh viên</th>
                    <th>Ngày</th>
                    <th>Trạng thái</th>
                    <th>Môn học</th>
                </tr>
            </thead>
            <tbody>
                <!-- Lấy dữ liệu điểm danh từ cơ sở dữ liệu và hiển thị -->
                <?php
                // Kết nối tới cơ sở dữ liệu và thực hiện truy vấn
                $conn = new mysqli('localhost', 'linh', '', 'btth02');
                if ($conn->connect_error) {
                    die("Kết nối thất bại: " . $conn->connect_error);
                }

                //$studentId = $_SESSION['StudentID']; // ID sinh viên

                // Truy vấn dữ liệu điểm danh của sinh viên
                $query = "SELECT `students`.`ID`, `students`.`FullName`, `attendances`.`Date`, `attendances`.`AttendanceStatus`, `courses`.`Title`
                FROM `students` 
                    LEFT JOIN `attendances` ON `attendances`.`StudentID` = `students`.`ID`
                    , `courses`;";
                $result = $conn->query($query);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr>";
                        echo "<td>" . $row['ID'] . "</td>";
                        echo "<td>" . $row['FullName'] . "</td>";
                        echo "<td>" . $row['Date'] . "</td>";
                        echo "<td>" . $row['AttendanceStatus'] . "</td>";
                        echo "<td>" . $row['Title'] . "</td>";
                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='2'>Không có thông tin điểm danh.</td></tr>";
                }

                $conn->close();
                ?>
            </tbody>
        </table>
        <a href="index_teacher.php" class="back-link">Quay lại</a>
        <a href="logout.php" class="back-link">Đăng xuất</a>
    </div>
</body>
</html>
