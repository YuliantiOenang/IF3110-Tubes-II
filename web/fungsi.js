/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function gas() {
    alert('test');
}
function showForm(x) {

    if (x == 1)
        document.getElementById("loginformid").style.display = "none"; /*To Hide*/

    else if (x == 2)
        document.getElementById("loginformid").style.display = "block"; /*To Show*/
    document.getElementById("showFormButton").hidden = "true";

}

function checkUsername() {
    if (document.getElementById(regusername).value == document.getElementById(regpassword))
    {
        document.getElementById(registerButton).setAtrribute('disable', 'true');
    }
    else
    {
        document.getElementById(registerButton).removeAttribute('disable');
    }
}

function checkLogin()
{
    var u = document.getElementById("usernamelogin").value;
    var p = document.getElementById("passwordlogin").value;

    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();
    }
    else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xmlhttp.onreadystatechange = function()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            var ut = xmlhttp.responseText.trim();
            alert(u);
           // alert(u);
            if (xmlhttp.responseText.trim() == u) // jika sama
            {
                
                var object = {username: u, timestamp: new Date().getTime()};
                localStorage.setItem("key", JSON.stringify(object));
                window.location = "dashboard/index.jsp";
            }
            else
            {
                alert('Username/password error!');
            }
        }
    };

    xmlhttp.open("GET", "login/?u=" + u + "&p=" + p, true);
    xmlhttp.send();
}