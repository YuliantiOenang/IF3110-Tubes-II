<div id="header">
	<div id="headerlogin">
		<div id="headernotloggedin">
			<p><a href="javascript:;" id="headerloginbutton">Login</a></p>
			<p>Pengunjung baru? <a href="register.php">Register</a></p>
		</div>
		<div id="headerloggedin">
			<p>Welcome <span id="headerusername"></span>!<a href="javascript:;" id="headerlogoutbutton">Logout</a></p>
		</div>
	</div>
	<div id="headerlogo">
		<a href="index.php"><img src="images/logo.gif" alt="Ruserba logo" /></a>
	</div>
	<div>
		<div id="headershoppingbag">
			<a href="bag.php"><img src="images/bag.jpg" alt="Shopping bag icon" /></a>
		</div>
		<div class="headertabs">
			<div class="headertab">
				<input type="radio" id="headertab-1" name="headertab-group-1" checked="checked" />
				<label for="headertab-1">Kategori</label>
				<div class="headertabcontent">
					<!--
						<?php
						databaseConnect();
						$catarr = getCategory();
						foreach($catarr as $cat)	{
							echo '<a href="category.php?category_id=' . $cat['id_kategori'] . '">';
							echo $cat['nama_kategori'] . '</a>';
						}
					?>
					-->
				</div> 
			</div>

			<div class="headertab">
				<input type="radio" id="headertab-2" name="headertab-group-1" />
				<label for="headertab-2">Pencarian</label>
				<div class="headertabcontent">
					<form action="search.php" method="GET">
						<label for="headersearchname">Nama barang</label><input type="text" id="headersearchname" name="product_name" />
						<label for="headersearchcategory">Kategori</label>
						<select id="headersearchcategory" name="category_id">
							<option value="0">== Pilih kategori ==</option>
							<!--
							<?php
								foreach($catarr as $cat)	{
									echo '<option value="'. $cat['id_kategori'] . '">' . $cat['nama_kategori'] . '</option>';
								}
							?>
							-->
						</select>
						<label for="headersearchprice">Harga</label><input type="text" id="headersearchprice" name="price" />
						<select name="price_comparison">
							<option value="0">== Pilih jenis komparasi ==</option>
							<option value="1">Lebih kecil</option>
							<option value="2">Lebih kecil atau sama dengan</option>
							<option value="3">Lebih besar</option>
							<option value="4">Lebih besar atau sama dengan</option>
						</select>
						<input type="submit" value="Cari!" />
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
