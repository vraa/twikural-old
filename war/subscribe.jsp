<%@page import="com.veerasundar.twikural.model.Thirukural"%>
<%@page import="com.veerasundar.twikural.PMF"%>
<%@page import="javax.jdo.PersistenceManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		
		<meta name="description" content="Twikural is a free serice that sends Thirukural, every day directly to your Twitter/Facebook account." />
		<meta name="keyword" content="thirukural, twikural, thiruvalluvar, tamil" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
		<link type="text/css" rel="stylesheet" href="css/twikural.css?58305" />
		
		<link href="http://feeds.feedburner.com/twikural" rel="alternate" type="application/rss+xml" title="Subscribe to Twikural via RSS" />
		
		<title>Twikural - தினம் இரு திருக்குறள்</title>
		
	</head>
	<body id="app" class="subscribe">
		<div class='container'>
			<div class='row'>
				<div class='col-md-4'>
					<a class='btn btn-danger' href="http://twikural.veerasundar.com"><span class="glyphicon glyphicon-arrow-left"></span> Back to Front page</a>
				</div>
			</div>
			
			<article class='hero-unit'>
				<h1>
					To Subscribe, Follow Us or Like Us
				</h1>
				<p>After you've subscribed, from the next day onwards, you'll get a Thirukkural sent to you (either a Twitter direct message / Facebook Update).</p>
				<br/><br/>
				<div class='row'>
					<div class='col-md-3'>
						<h2>Twitter</h2>
						<br/>
						<p><a href="https://twitter.com/twikural" class="twitter-follow-button" data-show-count="false" data-size="large">Follow @twikural</a></p>
					</div>
					<div class='col-md-4'>
						<h2>Facebook</h2>
						<br/>
						<div class="fb-like-box" data-href="https://www.facebook.com/twikural" data-width="292" data-show-faces="true" data-stream="false" data-header="true"></div>
					</div>
					<div class='col-md-3'>
						<h2>RSS Feed</h2>
						<br/>
						<p><a href="http://feeds.feedburner.com/twikural">Subscribe via RSS feed</a> so that you'll get notified in your favorite feed reader when we publish Thirukural.</p>
					</div>
				</div>

			</article>
			
		</div>
		
		<%-- 3rd party JS --%>
		<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
		<div id="fb-root"></div>
		<script>(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));</script>
		<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-2028306-36']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
	</body>
</html>