<?php
require_once 'Student.php';

$students = array();

// Đọc dữ liệu từ file
$data = file('DS.txt');

// Lặp qua từng dòng trong file
foreach ($data as $line) {
  // Chuyển đổi dữ liệu thành một đối tượng sinh viên và lưu vào mảng
  $fields = explode(',', trim($line));
  $name = $fields[0];
  $dob = $fields[1];
  $email = $fields[2];
  $phone = $fields[3];
  $student = new Student($name, $dob, $email, $phone);
  array_push($students, $student);
}

// Hiển thị danh sách sinh viên
foreach ($students as $student) {
  echo $student->getName() . ' - ' . $student->getDob() . ' - ' . $student->getEmail() . ' - ' . $student->getPhone() . '<br>';
}
