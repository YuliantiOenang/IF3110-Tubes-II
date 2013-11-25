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
);

INSERT INTO register(alt_id, username, password, nama_lengkap, email, alamat, provinsi, kota_kabupaten, kode_pos, nomor_handphone, register_since) 
VALUES ( sha1(microtime() + mt_rand()), "root", "rootpwd", "ojan", "ojan@mail.com", "rumah", "jabar", "badung", "41331", "081237283", NOW());

INSERT INTO register(alt_id, username, password, nama_lengkap, email, alamat, provinsi, kota_kabupaten, kode_pos, nomor_handphone, register_since) 
VALUES ( sha1(microtime() + mt_rand()), "root1", "rootpwd1", "ojan1", "ojan1@mail.com", "rumah1", "jateng", "badung", "41331", "081221442", NOW());

INSERT INTO register(alt_id, username, password, nama_lengkap, email, alamat, provinsi, kota_kabupaten, kode_pos, nomor_handphone, register_since) 
VALUES ( sha1(microtime() + mt_rand()), "root2", "rootpwd2", "ojan2", "ojan2@mail.com", "rumah2", "jatim", "badung", "41331", "0812373412", NOW());

CREATE TABLE IF NOT EXISTS credit_card(
	id 					INT(5)			NOT NULL	AUTO_INCREMENT,
	alt_id				VARCHAR(255)	NOT NULL,
	card_number			INT 			NOT NULL,
	card_name			VARCHAR(255)	NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(alt_id) REFERENCES register(alt_id),
	UNIQUE(alt_id)
);

INSERT INTO credit_card(alt_id, card_number, card_name) VALUES ("235423", 123456, "ojan1");
INSERT INTO credit_card(alt_id, card_number, card_name) VALUES ("fgad83lsi", 654321, "ojan");
INSERT INTO credit_card(alt_id, card_number, card_name) VALUES ("432t42ogfd", 987654, "ojan2");

CREATE TABLE IF NOT EXISTS barang(
	id 					INT(5)			NOT NULL	AUTO_INCREMENT,
	category_id			INT 			NOT NULL,
	nama_barang			VARCHAR(255)	NOT NULL,
	harga_barang		INT 			NOT NULL,
	jumlah_barang		INT 			NOT NULL,
	gambar_barang		VARCHAR(255)	NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(category_id) REFERENCES kategori(id)
);

INSERT INTO barang(category_id,nama_barang,harga_barang,jumlah_barang,gambar_barang) VALUES (1,"Mamipoko",23500,340,"disana");
INSERT INTO barang(category_id,nama_barang,harga_barang,jumlah_barang,gambar_barang) VALUES (2,"fanta",15500,2000,"sono");
INSERT INTO barang(category_id,nama_barang,harga_barang,jumlah_barang,gambar_barang) VALUES (3,"crepes",3500,123,"sini");
INSERT INTO barang(category_id,nama_barang,harga_barang,jumlah_barang,gambar_barang) VALUES (1,"Paseo",7400,342,"sana");
INSERT INTO barang(category_id,nama_barang,harga_barang,jumlah_barang,gambar_barang) VALUES (1,"Tisue",4300,632,"ana");

CREATE TABLE IF NOT EXISTS kategori(
	id 					INT(5)			NOT NULL	AUTO_INCREMENT,
	category_name		VARCHAR(255)	NOT NULL,
	PRIMARY KEY(id)
);

INSERT INTO kategori(category_name) VALUES ("Popok, tisue, dll");
INSERT INTO kategori(category_name) VALUES ("Minuman");
INSERT INTO kategori(category_name) VALUES ("Makanan");

CREATE TABLE IF NOT EXISTS orders(
	id 					INT(4)			NOT NULL	AUTO_INCREMENT,
	alt_id				VARCHAR(40)		NOT NULL,
	id_barang			INT(5)			NOT NULL,
	nama_barang			VARCHAR(255)	NOT NULL,
	jumlah_barang		INT 			NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(alt_id) REFERENCES register(alt_id),
	FOREIGN KEY(id_barang) REFERENCES barang(id)
);

INSERT INTO orders(alt_id, id_barang, nama_barang, jumlah_barang) VALUES ("235423", 2, "fanta", 5);