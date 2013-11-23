function gas() {
    alert('test');
}
function showForm(x) {

    if (x === 1)
        document.getElementById("loginformid").style.display = "none"; /*To Hide*/

    else if (x === 2)
        document.getElementById("loginformid").style.display = "block"; /*To Show*/
    document.getElementById("showFormButton").hidden = "true";

}

function checkLogin() {
    var u = document.getElementById("usernamelogin").value;
    var p = document.getElementById("passwordlogin").value;

    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
            var ut = xmlhttp.responseText.trim();
            alert(u);
            // alert(u);
            if (xmlhttp.responseText.trim() == u) { // jika sama
                var object = {username: u, timestamp: new Date().getTime()};
                localStorage.setItem("key", JSON.stringify(object));
                window.location = "dashboard/index.jsp";
            } else {
                alert('Username/password error!');
            }
        }
    };

    xmlhttp.open("GET", "login/?u=" + u + "&p=" + p, true);
    xmlhttp.send();
}



//buat check register segala rupa

function checkUsername() {
    if (document.getElementByName("regusername").value === document.getElementByName("regpassword")) {
        document.getElementById("registerButton").setAtrribute('disable', 'true');
    } else {
        document.getElementById("registerButton").removeAttribute('disable');
    }
}

function checkPassword() {
    if (document.getElementByName("password").value === document.getElementByName('username').value ||
            document.getElementByName("password").value === document.getElementByName('email').value) {
        document.getElementByName('register').setAttribute('disabled', 'true');
    } else {
        document.getElementByName('register').removeAttribute('disabled');
    }
}

function checkConfirmPassword() {
    if (document.getElementByName("password").value !== document.getElementById("confirmpassword").value) {
        document.getElementByName("register").setAttribute('disabled', 'true');
    } else {
        document.getElementByName("register").removeAttribute('disabled');
    }
}