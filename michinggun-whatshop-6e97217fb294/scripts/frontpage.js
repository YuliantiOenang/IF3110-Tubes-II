
  function validateWithAjax(method, value, value1, value2, value3,value4, target)
  {
    if(encodeURIComponent) {
      var req = new AjaxRequest();
      var params = "method=" + method + "&value=" + encodeURIComponent(value) + "&value1=" + encodeURIComponent(value1) + "&value2=" + encodeURIComponent(value2) + "&value3=" + encodeURIComponent(value3) +"&value4=" + encodeURIComponent(value4) +"&target=" + target;
      req.setMethod("POST");
      req.loadXMLDoc('scripts/validate.php', params);
	  
    }
  }
  
  function checkLoginInfo(username, password, target)
  {
    if(encodeURIComponent) {
      var req = new AjaxRequest();
      var params = "username=" + encodeURIComponent(username) + "&password=" + encodeURIComponent(password) +"&target=" + target;
      req.setMethod("POST");
      req.loadXMLDoc('scripts/validate2.php', params);
	  
    }
  }