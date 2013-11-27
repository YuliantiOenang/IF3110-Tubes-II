		<h2 id='footer_txt'><b>www.jayset.com Oficial Website</b></br>Cause jay & set is something.</h2>
		<a href='https://twitter.com/dave_rex'><img title='@calvinsalvy' src='${pageContext.request.contextPath}/img/site/twitter.png' id='footer_img'/></a>
	</div>

	<div id='login_cont'>
		<div id='login_box'>
			<h1>LOGIN</h1>
			<a class='exit' onclick='hideLogin()'>x</a>
			<div id="loading"></div>
			<form action="login" method="post">
				<label>Username</label><input type='text' id="username" name="username"></input><br/>
				<label>Password</label><input type='password' id="password" name="password"></input><br/>
				<!--   <button type="submit" onclick="login(); return false;" class="btn right">Login</button> -->
				<button type="submit" class="btn right"></button>
			</form>
		</div>
	</div>
	
	
	<!-- FOR SEARCH BAR -->
	<div id = 'search-popup' class='search-popup <?php if ((isset($search_show))&&($search_show)) echo "left-hide";?>' onclick='opensearch()'></div>
	<div id = 'search-popup-content' class='search-popup-content <?php if ((isset($search_show))&&($search_show)) echo "left-show";?>'>
		<form action="<?php echo $this->makeUrl('barang/search') ?>" method="get">
			<?php 
				$q = (isset($_GET['q'])?$_GET['q']:"");
				$kat = (isset($_GET['kat'])?$_GET['kat']:""); 
				$h1 = (isset($_GET['h1'])?$_GET['h1']:""); 
				$h2 = (isset($_GET['h2'])?$_GET['h2']:""); 
			?>
			<h4>Search</h4>
			<p onclick='closesearch()'>x</p>
			<input type="text" name="q" value="<?php echo $q ?>" placeholder="Nama Barang">
			<select name="kat" value="<?php echo $kat ?>" required>
				<option value="0">All Categories</option>
				<?php foreach ($_listkategori_ as $key => $value): ?>
					<option value="<?php echo $value->id ?>"><?php echo $value->nama_kategori ?></option>
				<?php endforeach ?>
			</select>
			<input type="number" name="h1" value="<?php echo $h1 ?>" placeholder="Harga Bawah">
			<input type="number" name="h2" value="<?php echo $h2 ?>" placeholder="Harga Atas">
			<button type="submit" class="btn">Search</button>
		</form>
	</div>