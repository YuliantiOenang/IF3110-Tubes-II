<?php
$con=mysqli_connect("localhost","root","", "ruserba");

// Check connection
if (mysqli_connect_errno($con))
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

$query = "INSERT INTO `ruserba`.`pelanggan` (`name`, `email`, `username`, `password`, `nohp`, `address`, `province`, `town`, `postalcode`, `ccnumber`) VALUES ('".$_POST['nl']."','".$_POST['ema']."','".$_POST['un']."','".$_POST['pass']."','".$_POST['nh']."','".$_POST['al']."','".$_POST['prov']."','".$_POST['kab']."','".$_POST['kp']."',NULL)";  

echo $query; 

mysqli_query($con, $query);
?>