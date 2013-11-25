<?PHP
  // check that all POST variables have been set
  $method = $_POST['method'];
  $username = $_POST['value'];
  $fullname = $_POST['value1'];
  $email = $_POST['value2'];
  $password = $_POST['value3'];
  $password1 = $_POST['value4'];
  $target = $_POST['target'];
  
  $con = mysqli_connect("localhost","root","","whatshop");
  
  // Check connection
  if (mysqli_connect_errno())
  {
	echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

  $username_used = mysqli_query($con,"SELECT username FROM register");
  $email_used = mysqli_query($con,"SELECT email FROM register");
  
  $passed = false;
  $retval = '';

  switch($method)
  {
  
    case 'checkUsername':
	  if (!ctype_alnum($username)){
		$retval = 'Username hanya boleh terdiri dari alphanumerik';
		$passed = false;
	  }
	  if (strlen($username) < 5) {
		$retval = 'Username harus terdiri dari minimal 5 karakter';
		$passed = false;
	  } else {
	    $bol = false;
		while ($row = mysqli_fetch_array($username_used)){
			if (strcmp($row['username'],$username) == 0) {
				$bol = true;
				break;
			}
		}
		if ($bol == true) {
			$retval = 'Username telah dipakai';
			$passed = false;
		}
		else {
			$retval = 'Username OK';
			$passed = true;
		}
	  }
      break;
	  
	case 'checkFullName':
	  if (!preg_match("/(.+)( )(.+)/", $fullname))
	  { 
		$retval = 'Nama lengkap harus terdiri dari minimal dua kata';
		$passed = false;
	  } else {
		  $retval = 'Nama Lengkap OK';
		  $passed = true;
	  }
      break;
	  
    case 'checkEmail':
	  if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
		$retval = 'Format email salah';
		$passed = false;
	  } else {
		$bol = false;
		while ($row = mysqli_fetch_array($email_used)){
			if (strcmp($row['email'],$email) == 0) {
				$bol = true;
				break;
			}
		}
		if ($bol == true) {
			$retval = 'Email telah dipakai';
			$passed = false;
		}
		else {
			$retval = 'Email OK';
			$passed = true;
		}
	  }
      break;
	  
	case 'checkPassword':
	  $retval = 'Password OK';
	  $passed = true;
	  if (strlen($password) < 8) {
		$retval = 'Password harus terdiri dari minimal 8 karakter';
		$passed = false;
	  }
	  else if ((strcmp($password,$username) == 0) || (strcmp($password,$email) == 0)) {
		$retval = 'Password tidak boleh sama dengan username atau email';
		$passed = false;
	  }
	  else {
	    $retval = 'Password OK';
		$passed = true;
	  }
      break;
	  
	case 'checkPasswordConfirm':
	  if (strcmp($password,$password1) == 0) {
		$retval = 'Konfirmasi password OK';
		$passed = true;
	  }
	  else {
		$retval = 'Password tidak sama';
		$passed = true;
	  }
      break;
    default: exit;
  }
  
  mysqli_close($con);
  
  include "class.xmlresponse.php";
  $xml = new xmlResponse();
  $xml->start();

  // set the response text
  $xml->command('setcontent',
    array('target' => "rsp_$target", 'content' => htmlentities($retval))
  );

  if($passed) {
    // set the message colour to green and the checkbox to checked

    $xml->command('setstyle',
      array('target' => "rsp_$target", 'property' => 'color', 'value' => 'green')
    );

  } else {
    // set the message colour to red, the checkbox to unchecked and focus back on the field

    $xml->command('setstyle',
      array('target' => "rsp_$target", 'property' => 'color', 'value' => 'red')
    );
    $xml->command('focus', array('target' => $target));

  }
  if (ctype_alnum($username) && (strlen($username) >= 5) && (preg_match("/(.+)( )(.+)/", $fullname)) && (strlen($password) >= 8) && (strcmp($password,$username) != 0) && (strcmp($password,$email) != 0) && (strcmp($password,$password1) == 0)) {
	  $xml->command('setcontent',
		array('target' => "signupbutton", 'content' => '<input type="submit" value="Sign up" />')
	  );
  }
  else {
	
  }
  
  
  $xml->end();
?>