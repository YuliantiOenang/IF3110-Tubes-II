<?php
	$alt_id = sha1(microtime() + mt_rand());
	$username = $_POST['usernamesignup'];
	$fullname = $_POST['fullnamesignup'];
	$email = $_POST['emailsignup'];
	$password = $_POST['passwordsignup'];
	
	$handphone = $_POST['handphone'];
	$address = $_POST['alamat'];
	$kecamatan = $_POST['kecamatan'];
	$provinsi = $_POST['provinsi'];
	$kodepos = $_POST['kodepos'];
	
	$con=mysql_connect("localhost","root","");
	if (! $con)
	{
		echo "Failed to connect to MySQL: " . mysql_error();
	}
	$sql = "INSERT INTO register
	(alt_id, username, password, nama_lengkap,email,alamat,provinsi,kota_kabupaten,kode_pos,nomor_handphone,register_since)
	VALUES ('$alt_id','$username', '$password','$fullname','$email','$address','$provinsi','$kecamatan','$kodepos','$handphone',NOW())";
	mysql_select_db('whatshop');
	$retval = mysql_query( $sql, $con );
	mysql_close($con);
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
								has been created. 
							</p>
                        </div>

                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>