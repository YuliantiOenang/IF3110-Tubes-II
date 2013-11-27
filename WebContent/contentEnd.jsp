</div>
			<div class='head'>
			<a href='${pageContext.request.contextPath}/index/home'><div class='logo'></div></a>
			<div class='status'>
				<!-- <?php if ($this->userLogged()): ?>
					<p class="left"> welcome, <a href='<?php echo $this->makeUrl('profile/index') ?>/'><?php echo $this->userLogged() ?></a>! (<a href='<?php echo $this->makeUrl('index/logout') ?>'>Logout</a>)
					</p>
					<p class="right">
						<a href="<?php echo $this->makeUrl('/cart/index') ?>">Shopping Cart</a> <img src='<?php echo $this->getBaseUrl() ?>/img/site/cart_white.png' style='margin-right:5px;'/>
					</p>
				<?php else: ?>
					<p>You are not login. (<a href='#' onclick='showLogin()'>Login</a> or <a href='<?php echo $this->getBaseUrl() ?>/index/register'>Register now</a>)</p>
				<?php endif ?> -->
				<p class="left"> welcome, <a href='${pageContext.request.contextPath}profile/index'>Budi</a>! (<a href='${pageContext.request.contextPath}index/logout'>Logout</a>)
					</p>
					<p class="right">
						<a href="cart/index">Shopping Cart</a> <img src='${pageContext.request.contextPath}/img/site/cart_white.png'/>
					</p>
			</div>
			<div class='menu'>
				<a href='index/shop'>
				</a>
<!--  
				<?php
				if ($_listkategori_ === null) $_listkategori_ = array();
				function writeMenu($data = null, $baseurl,$div) {
					echo "	<a href='".$baseurl."/kategori/";
					if ($data!=null) echo "view/".$data->id;
					echo "'><div class='permenu per".$div."'>
							<div class='menuborder'></div>
							<div class='menutxt'><h1 id='txtmenu1' class='menu'>";
					if ($data!=null) echo $data->nama_kategori;
					else echo "others";
					echo "</h1></div>
							<div class='menuborder'></div>
						</div>
					</a>";
				}
				$minKategori = (min(array(count($_listkategori_),5)));
				foreach ($_listkategori_ as $key => $value) {
					if ($key<4) {
						writeMenu($value,$this->getBaseUrl(),$minKategori);
					}
					else {
						if ($key==4) {
							if (count($_listkategori_)==5) {
								writeMenu($value,$this->getBaseUrl(),$minKategori);
							}
							else {
								writeMenu(null,$this->getBaseUrl(),$minKategori);
							}
						}
					}
				}
				?>-->
				<a href='${pageContext.request.contextPath}/kategori/view/1'>
					<div class='permenu per4'>
							<div class='menuborder'></div>
							<div class='menutxt'><h1 id='txtmenu1' class='menu'>
								kategori 1
							</h1></div>
							<div class='menuborder'></div>
					</div>
				</a>
				<a href='${pageContext.request.contextPath}/kategori/view/2'>
					<div class='permenu per4'>
							<div class='menuborder'></div>
							<div class='menutxt'><h1 id='txtmenu1' class='menu'>
								kategori 2
							</h1></div>
							<div class='menuborder'></div>
					</div>
				</a>
				<a href='${pageContext.request.contextPath}/kategori/view/3'>
					<div class='permenu per4'>
							<div class='menuborder'></div>
							<div class='menutxt'><h1 id='txtmenu1' class='menu'>
								kategori 3
							</h1></div>
							<div class='menuborder'></div>
					</div>
				</a>
				<a href='${pageContext.request.contextPath}/kategori/view/4'>
					<div class='permenu per4'>
							<div class='menuborder'></div>
							<div class='menutxt'><h1 id='txtmenu1' class='menu'>
								kategori 4
							</h1></div>
							<div class='menuborder'></div>
					</div>
				</a>
			</div>
		</div>
		<h2 id='footer_txt'><b>www.calvinsalvy.com Oficial Website</b></br>Karena rasa adalah segalanya.</h2>
		<a href='https://twitter.com/darksta5'><img title='@calvinsalvy' src='${pageContext.request.contextPath}/img/site/twitter.png' id='footer_img'/></a>
	</div>
<!-- if (isset($effect)&&$effect) {?> -->
<%
if (request.getAttribute("effect")!=null) {
	out.print("</div>");
}
%>
<!-- <?php if (isset($effect)&&$effect) echo "</div>" ?>-->
</div>
	<div id='login_cont'>
		<div id='login_box'>
			<h1>LOGIN</h1>
			<a class='exit' onclick='hideLogin()'>x</a>
			<div id="loading"></div>
			<form>
				<label>Username</label><input type='text' id="login_username" name="Login[username]"></input><br/>
				<label>Password</label><input type='password' id="login_password" name="Login[password]"></input><br/>
				<button type='submit' onclick="login(); return false;" class='btn right'>Login</button>
			</form>
		</div>
		<script src="${pageContext.request.contextPath}/js/login.js"></script>
	</div>
	<script type="text/javascript">
		function _opensearchbox(margin) {
			if (margin<=0) {
				document.getElementById('search-popup-content').style.marginLeft = margin.toString()+"px";
				setTimeout(function(){
					_opensearchbox(margin+2);
				}, 5);
			}
		}
		function _closesearchbox(margin) {
			if (margin>=-200) {
				document.getElementById('search-popup-content').style.marginLeft = margin.toString()+"px";
				setTimeout(function(){
					_closesearchbox(margin-2);
				}, 5);
			}
			else {
				setTimeout(function(){
					_showicon(-75);
				}, 100);
			}
		}
		function _hideicon(margin) {
			if (margin>=-70) {
				document.getElementById('search-popup').style.marginLeft = margin.toString()+"px";
				setTimeout(function(){
					_hideicon(margin-2);
				}, 5);
			}
			else {
				setTimeout(function(){
					_opensearchbox(-200);
				}, 100);
			}
		}
		function _showicon(margin) {
			if (margin<=0) {
				document.getElementById('search-popup').style.marginLeft = margin.toString()+"px";
				setTimeout(function(){
					_showicon(margin+2);
				}, 5);
			}
		}
		function opensearch() {
			_hideicon(0);
		}
		function closesearch() {
			_closesearchbox(0);
		}
	</script>
	<!--<div id = 'search-popup' class='search-popup <?php if ((isset($search_show))&&($search_show)) echo "left-hide";?>' onclick='opensearch()'></div>-->
	<div id = 'search-popup' class='search-popup' onclick='opensearch()'></div>
	<!-- <div id = 'search-popup-content' class='search-popup-content <?php if ((isset($search_show))&&($search_show)) echo "left-show";?>'> -->
	<div id = 'search-popup-content' class='search-popup-content'>
		<form action="${pageContext.request.contextPath}/barang/search" method="get">
		<!--
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
		-->
			<h4>Search</h4>
			<p onclick='closesearch()'>x</p>
			<input type="text" name="q" value="" placeholder="Nama Barang">
			<select name="kat" value="" required>
				<option value="0">All Categories</option>
				<option value="1">Kategori 1</option>
				<option value="2">Kategori 2</option>
				<option value="3">Kategori 3</option>
			</select>
			<input type="number" name="h1" value="" placeholder="Harga Bawah">
			<input type="number" name="h2" value="" placeholder="Harga Atas">
			<button type="submit" class="btn">Search</button>
		</form>
	</div>
</body>
</html>