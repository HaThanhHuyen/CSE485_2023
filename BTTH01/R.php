<?php
require_once 'Student.php';
require_once 'StudentDAO.php';

// Xử lý thao tác tạo sinh viên mới
if (isset($_POST['create'])) {
  $name = $_POST['name'];
  $dob = $_POST['dob'];
  $email = $_POST['email'];
  $phone = $_POST['phone'];

  $student = new Student($name, $dob, $email, $phone);
  $dao = new StudentDAO();
  $dao->create($student);
}

// Xử lý thao tác cập nhật thông tin sinh viên
if (isset($_POST['update'])) {
  $id = $_POST['id'];
  $name = $_POST['name'];
  $dob = $_POST['dob'];
  $email = $_POST['email'];
  $phone = $_POST['phone'];

  $student = new Student($name, $dob, $email, $phone, $id);
  $dao = new StudentDAO();
  $dao->update($student);
}

// Xử lý thao tác xóa sinh viên
if (isset($_POST['delete'])) {
  $id = $_POST['id'];
  $dao = new StudentDAO();
  $dao->delete($id);
}

// Hiển thị danh sách sinh viên
//$dao = new StudentDAO();
//$students = $dao->getAll();
?>

<!DOCTYPE html>
<html>
<head>
  <title>Quản lý sinh viên</title>
</head>
<body>
  <h1>Quản lý sinh viên</h1>

  <!-- Form thêm sinh viên -->
  <h2>Thêm sinh viên mới</h2>
  <form method="post">
    <label>Tên:</label>
    <input type="text" name="name" required>
    <br>
    <label>Ngày sinh:</label>
    <input type="date" name="dob" required>
    <br>
    <label>Email:</label>
    <input type="email" name="email" required>
    <br>
    <label>Số điện thoại:</label>
    <input type="tel" name="phone" required>
    <br>
    <input type="submit" name="create" value="Thêm">
  </form>

  <!-- Bảng hiển thị danh sách sinh viên -->
  <h2>Danh sách sinh viên</h2>
  <table>
    <thead>
      <tr>
        <th>ID</th>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Email</th>
        <th>Số điện thoại</th>
        <th>Thao tác</th>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($students as $student): ?>
        <tr>
          <td><?php echo $student->getId(); ?></td>
          <td><?php echo $student->getName(); ?></td>
          <td><?php echo $student->getDob(); ?></td>
          <td><?php echo $student->getEmail(); ?></td>
          <td><?php echo $student->getPhone(); ?></td>
          <td>
        <!-- Form cập nhật sinh viên -->
        <form method="post">
          <input type="hidden" name="id" value="<?php echo $student->getId(); ?>">
          <input type="hidden" name="name" value="<?php echo $student->getName(); ?>">
          <input type="hidden" name="dob" value="<?php echo $student->getDob(); ?>">
          <input type="hidden" name="email" value="<?php echo $student->getEmail(); ?>">
          <input type="hidden" name="phone" value="<?php echo $student->getPhone(); ?>">
          <input type="submit" name="update" value="Sửa">
        </form>

        <!-- Form xóa sinh viên -->
        <form method="post">
          <input type="hidden" name="id" value="<?php echo $student->getId(); ?>">
          <input type="submit" name="delete" value="Xóa">
        </form>
      </td>
    </tr>
  <?php endforeach; ?>
</tbody>
</table>
</body>
</html>
