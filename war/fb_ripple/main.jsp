<%
response.setHeader("X-Frame-Options","SAMEORIGIN");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Water Ripple</title>
		<style type="text/css">
			#container {
				margin:20px auto;
				text-align:center;
			}
		</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<script type="text/javascript" src="./jquery.getimagedata.min.js"></script>
<script type="text/javascript" src="./ripple.js"></script>

<div id="fb-root"></div>
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '258312730928160', // App ID
      status     : true, // check login status
      cookie     : true, // enable cookies to allow the server to access the session
      xfbml      : true  // parse XFBML
    });

    // Additional initialization code here
$(document).ready(function() {
	FB.getLoginStatus(function(response) {
		if (response.status === 'connected') {
			atFirst();
		} else {
			myLogIn(atFirst);
		}
	});
	
	function myLogIn(func) {
		FB.login(function(response) {
			if (response.authResponse) {
				func.call();
			} else {
				alert("fail");
				// failed
			}
		}, {perms:'user_photos'});
	}

	function atFirst() {
		FB.api('/me/albums', function(response) {
			var d;
			for(var i = 0;i < response.data.length; i++) {
				if( typeof response.data[i].count != "undefined" && response.data[i].count > 0) {
					d = response.data[i];
					break;
				}
			}
			FB.api('/' + d.id + '/photos', function(res) {
				var num2 = Math.floor(Math.random() * res.data.length);
				var purl = res.data[num2].source;
				ripple(purl, document.getElementById('container'));
			});
		});
	}
});
  };

  // Load the SDK Asynchronously
  (function(d){
     var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement('script'); js.id = id; js.async = true;
     js.src = "//connect.facebook.net/en_US/all.js";
     ref.parentNode.insertBefore(js, ref);
   }(document));


</script>
	</head>
	<body>
		<div id="rippledebug"></div>
		<div id="container">
		</div>
	</body>
</html>
