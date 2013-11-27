<html lang="en">
<head>
    <meta charset="utf-8">
    <title>48SURD</title>
    <meta name="description" content="INGSMUSIC">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script type="text/javascript" src="validation.js"></script>
	
	<link href="css/style.css" rel="stylesheet" type="text/css" >
    <link href="css/app.css" media="screen" rel="stylesheet" type="text/css">
    <link href="css/layout.css" media="screen" rel="stylesheet" type="text/css">
    <link href="css/top.css" media="screen" rel="stylesheet" type="text/css">
    <link href="css/reset.css" media="screen" rel="stylesheet" type="text/css">

    <style type="text/css">
        .imagebox-margin{margin-right:0px;}
    </style>
</head>

<body>
    <div class="wrapper">
        <div id="header">
            <div id="hArea">
                <div class="maxwidth clearfix">
                    <a class="logo" href="/en">
                        <img src="asset/images/ig/48SURD_175.png">
                    </a>
                    <div class="catch">
						<img alt="Catch" src="asset/images/ig/Catchprase.png">
					</div>
                    <div class="topNav">
                        <a href="" target="registration.jsp">Register</a> |
                        <a href="" target="_blank">Login</a>
                    </div>
                </div>
            </div>
            <div id="gNav" class="" style="width: auto;">
                <div class="maxwidth clearfix">
                    <ul class="navs clearfix" style="margin:0">
                        <li onmouseover="nhpup.popup('View a listing of all scale figures.')">
                            <a href="/en/products/category/scale/announced/2013" class="" style="opacity: 1;">
                                <span class="ic">Music</span>
                            </a>
						</li>
                        <li onmouseover="nhpup.popup('View a listing of all Nendoroids.')">
                            <a href="/en/products/category/nendoroid_series/announced/2013" class="">
                                <span class="ic">Movies</span>
                            </a>
						</li>
                        <li onmouseover="nhpup.popup('View a listing of all figma figures.')">
                            <a href="/en/products/category/figma/announced/2013" class="">
                                <span class="ic">TV Series</span>
                            </a>
						</li>
                        <li onmouseover="nhpup.popup('View a listing of all other figures.')">
                            <a href="/en/products/category/otherfigures/announced/2013" class="">
                                <span class="ic">Anime</span>
                            </a>
						</li>
                        <li onmouseover="nhpup.popup('View a listing of various goods.')">
                            <a href="/en/products/category/goodsother/announced/2013" class="" style="opacity: 1;">
                                <span class="ic">Games</span>
                            </a>
						</li>
                        <li class="oth" onmouseover="nhpup.popup('View a listing of all news posts.')">
                            <a href="/en/posts/category/information/date/2013" class="">
                                <span class="ic">Latest News</span>
                            </a> 
						</li>
                        <li class="oth" onmouseover="nhpup.popup('Check which products will release soon.')">
                            <a href="/en/releaseinfo" style="opacity: 1;">
                                <span class="ic">Release Info</span>
                            </a>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container content products-content products-search-content">
	<div id="pageTtl">
		<div class="maxwidth"><div class="ttlArea"><div class="ttlInner">
          <h1>Registration</h1>
			<div class="pnav"><a href="#">TOP</a> &gt; Registration Form</div>
		</div></div></div>
	</div>
<div class="clearall container" id="registerform">
            <form action="#" method="post">
                <fieldset>

                    <p>
                        <label>Email <abbr title="Required">*</abbr></label>
                        <input name="email" id="email" value=""
                               required="required" aria-required="true"
                               pattern="^(([-\w\d]+)(\.[-\w\d]+)*@([-\w\d]+)(\.[-\w\d]+)*(\.([a-zA-Z]{2,5}|[\d]{1,3})){1,2})$"
                               title="Your email address"
                               type="email" spellcheck="false" size="20" />
                    </p>
                    <p>
                        <label>Username <abbr title="Required">*</abbr></label>
                        <input value="" id="username" onchange="checkUsername()"
                               required="required" aria-required="true"
                               pattern="^[a-zA-Z0-9_]{5,}$"
                               title="Your username"
                               type="text" spellcheck="false" size="20" />
                    </p>
                    <p>
                        <label>Password <abbr title="Required">*</abbr></label>
                        <input value="" id="password" onchange="checkPassword()"
                               required="required" aria-required="true"
                               pattern="^[- \w\d\u00c0-\u024f]{8,}$"
                               title="Your password"
                               type="password" spellcheck="false" size="20" />
                    </p>
                    
                    <p>
                        <label>Confirm password <abbr title="Required">*</abbr></label>
                        <input value=""  id="confirmpassword" onchange="checkConfirmPassword()"
                               required="required" aria-required="true"
                               pattern="^[- \w\d\u00c0-\u024f]{8,}$"
                               title="Your password (same as above)"
                               type="password" spellcheck="false" size="20" />
                    </p>
                    
                    <p>
                        <label>Full name <abbr title="Required">*</abbr></label>
                        <input class = "registertextbox" value="" id="fullname"
                               required="required" aria-required="true"
                               pattern="^[a-zA-Z]+ [a-zA-Z]+$"
                               title="Your full name (first and last name)"
                               type="text" spellcheck="false" size="20" />
                    </p>
                    <output id="list"></output>
                </fieldset>
                <fieldset>
                    <button id="register" type="submit" onclick="alert('Successfully registered!')">Register</button>
                </fieldset>
            </form>
        </div>        
       
        <div id="footer">
            <div class="fCopy maxwidth">
                <div class="fCopyright">&copy; 48SURD</div>
            </div>
        </div>
    </div>		
</body>
</html>