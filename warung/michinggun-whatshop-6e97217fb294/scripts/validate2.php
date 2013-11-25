<?PHP
	// check that all POST variables have been set
	$username = $_POST['username'];
	$password = $_POST['password'];
	$target = $_POST['target'];

	$con = mysqli_connect("localhost","root","","whatshop");

	// Check connection
	if (mysqli_connect_errno())
	{
		echo "Failed to connect to MySQL: " . mysqli_connect_error();
	}

	$data = mysqli_query($con,"SELECT username,password FROM register");
	
	
	$bol = false;
	while ($row = mysqli_fetch_array($data)){
		if (strcmp($row['username'],$username) == 0) {
			if (strcmp($row['password'],$password) {
				$bol = true;
			}
			break;
		}
	}
	mysqli_close($con);
	
	if ( $bol == true ){
		
	}

	

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