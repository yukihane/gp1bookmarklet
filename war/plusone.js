(function(){
  var iframe_url = "http://plusonebookmarklet.appspot.com/plusone.jsp" + "?url=" + encodeURIComponent(document.location.href);
  var div = document.createElement("div");
  div.id = "yukihane_plusone";
  var str = "<style>#yukihane_plusone{position: fixed; top: 10px; right: 20px; width: 150px; height: 90px;z-index: 9999;background: #f4f4f4;padding: 10px;border: thin solid #999;}#ex small {font:Verdana, Geneva, sans-serif;font-size:9px;float:right;display:block}</style><div id='ex'><small><a href='#' onClick=\"document.getElementById('yukihane_plusone').style.display='none'; return false;\" title='Click to close this window'>Close</a></small><iframe frameborder='0' scrolling='no' src='" + iframe_url + "' width='120px' height='75px' style='backgroundColor: white;'></iframe></div>";
  div.innerHTML = str;
  document.body.insertBefore(div, document.body.firstChild);
})()
