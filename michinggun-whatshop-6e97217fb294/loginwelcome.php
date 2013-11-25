<?php
	$username = $_POST['username'];
	$password = $_POST['password'];
	
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
			if (strcmp($row['password'],$password) == 0) {
				$bol = true;
			}
			break;
		}
	}
	mysqli_close($con);
	if ( $bol == true ){
		header ("Location: index.html"); /* Redirect browser */
		exit();
	}
	else {
		header ("Location: frontgate.html"); /* Redirect browser */
		exit();
	}
	
?>

<!DOCTYPE html>
    <head>
        <meta charset="UTF-8" />
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
        <title> Welcome to Whatshop! </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
    </head>
    <body>
        <div class="container">
            <header>
                <h1><span>Get Ready!</span></h1>
            </header>
            <section>				
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <div id="wrapper">
                        <div id="welcome message">
							<p>
								Congratulation, user
								<?php 
									echo $username;
								?>
								has been logged in.
							</p>
                        </div>

                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>