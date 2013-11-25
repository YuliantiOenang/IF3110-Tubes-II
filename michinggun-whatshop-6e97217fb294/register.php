

<?php
$dbhost = 'localhost:3036';
$dbuser = 'root';
$dbpass = 'rootpassword';
$conn = mysql_connect($dbhost, $dbuser, $dbpass);
if(! $conn )
{
  die('Could not connect: ' . mysql_error());
}
echo 'Connected successfully';
$sql = <<<EOF 
	CREATE TABLE IF NOT EXISTS register (
	id					INT(4)			NOT NULL	AUTO_INCREMENT,
	alt_id				VARCHAR(40)		NOT NULL,
	username			VARCHAR(100)	NOT NULL,
	password			VARCHAR(255)	NOT NULL,
	nama_lengkap		VARCHAR(255)	NOT NULL,
	email 				VARCHAR(255)	NOT NULL,
	alamat				VARCHAR(255)	NOT NULL,
	provinsi			VARCHAR(255)	NOT NULL,
	kota_kabupaten		VARCHAR(255)	NOT NULL,
	kode_pos			VARCHAR(5) 		NOT NULL,
	nomor_handphone		VARCHAR(20)		NOT NULL,
	register_since		DATETIME		NOT NULL,
	PRIMARY KEY (id),
	UNIQUE(alt_id)
)
EOF;

mysql_select_db('whatshop');
$retval = mysql_query( $sql, $conn );
if(! $retval )
{
  die('Could not create table: ' . mysql_error());
}
echo "Table register created successfully\n";
mysql_close($conn);
?>