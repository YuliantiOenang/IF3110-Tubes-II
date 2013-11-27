<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>REGISTER</title>
<meta name="description" content="INGSMUSIC">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="css/app.css" media="screen" rel="stylesheet" type="text/css">
<link href="css/layout.css" media="screen" rel="stylesheet"
	type="text/css">
<link href="css/top.css" media="screen" rel="stylesheet" type="text/css">
<link href="css/reset.css" media="screen" rel="stylesheet"
	type="text/css">
<link href="css/style.css" media="screen" rel="stylesheet"
	type="text/css">

<script type="text/javascript" src="javascript/validation.js"></script>

<style type="text/css">
.imagebox-margin {
	margin-right: 0px;
}
</style>
</head>
<body>
	<div id="header">
            <div id="hArea">
                <div class="maxwidth clearfix">
                    <a class="logo" href="http://localhost:8080/pursepolis/index.jsp">
                        <img src="asset/images/ig/headerlogo.gif">
                    </a>
                    <div class="catch">
						<img alt="Catch" src="asset/images/ig/headertagline.gif">
					</div>
                    <div class="topNav">
                        <a href="" target="_blank">Support</a> |
                        <a href="register.jsp">Register</a> |
                        <a href="" target="_blank">Login</a>
                    </div>
                </div>
            </div>
            <div id="gNav" class="" style="width: auto;">
                <div class="maxwidth clearfix">
                    <ul class="navs clearfix" style="margin:0">
                        <li>
                            <a href="product/music.jsp" class="" style="opacity: 1;">
                                <span class="ic">Music</span>
                            </a>
						</li>
                        <li onmouseover="nhpup.popup('View a listing of all Nendoroids.')">
                            <a href="" class="">
                                <span class="ic">Movies</span>
                            </a>
						</li>
                        <li onmouseover="nhpup.popup('View a listing of all figma figures.')">
                            <a href="" class="">
                                <span class="ic">TV Series</span>
                            </a>
						</li>
                        <li onmouseover="nhpup.popup('View a listing of all other figures.')">
                            <a href="" class="">
                                <span class="ic">Anime</span>
                            </a>
						</li>
                        <li onmouseover="nhpup.popup('View a listing of various goods.')">
                            <a href="" class="" style="opacity: 1;">
                                <span class="ic">Games</span>
                            </a>
						</li>
                        <li class="oth" onmouseover="nhpup.popup('View a listing of all news posts.')">
                            <a href="" class="">
                                <span class="ic">Latest News</span>
                            </a> 
						</li>
                        <li class="oth" onmouseover="nhpup.popup('Check which products will release soon.')">
                            <a href="" style="opacity: 1;">
                                <span class="ic">Release Info</span>
                            </a>
                    </ul>
                </div>
            </div>
        </div>
	<div class="clearall container" id="registerform">
		<h2>Register Now</h2>
		<form action="#" method="post">
			<fieldset>
				<p>
					<label>Full name <abbr title="Required">*</abbr></label> <input
						value="" id="fullname" required="required" aria-required="true"
						pattern="^[a-zA-Z]+ [a-zA-Z]+$"
						title="Your full name (first and last name)" type="text"
						spellcheck="false" size="20" />
				</p>
				<p>
					<label>Email <abbr title="Required">*</abbr></label> <input
						name="email" id="email" value="" required="required"
						aria-required="true"
						pattern="^(([-\w\d]+)(\.[-\w\d]+)*@([-\w\d]+)(\.[-\w\d]+)*(\.([a-zA-Z]{2,5}|[\d]{1,3})){1,2})$"
						title="Your email address" type="email" spellcheck="false"
						size="20" />
				</p>
				<p>
					<label>Username <abbr title="Required">*</abbr></label> <input
						value="" id="username" onchange="checkUsername()"
						required="required" aria-required="true"
						pattern="^[a-zA-Z0-9_]{5,}$" title="Your username" type="text"
						spellcheck="false" size="20" />
				</p>
				<p>
					<label>Password <abbr title="Required">*</abbr></label> <input
						value="" id="password" onchange="checkPassword()"
						required="required" aria-required="true"
						pattern="^[- \w\d\u00c0-\u024f]{8,}$" title="Your password"
						type="password" spellcheck="false" size="20" />
				</p>
				<p>
					<label>Confirm password <abbr title="Required">*</abbr></label> <input
						value="" id="confirmpassword" onchange="checkConfirmPassword()"
						required="required" aria-required="true"
						pattern="^[- \w\d\u00c0-\u024f]{8,}$"
						title="Your password (same as above)" type="password"
						spellcheck="false" size="20" />
				</p>
				<p>
					<label>Date of birth <abbr title="Required">*</abbr></label> <input
						value="" id="dob" onchange="checkDOB()" required="required"
						aria-required="true"
						pattern="^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$"
						title="Your date of birth" type="date" spellcheck="false"
						size="20" />
				</p>

				<output id="list"></output>
				<input type="file" id="files" name="files[]" onchange="CheckFiles()" />
			</fieldset>
			<fieldset>
				<button id="register" type="submit"
					onclick="alert('Successfully registered!')">Register</button>
			</fieldset>
		</form>
	</div>
</body>
</html>