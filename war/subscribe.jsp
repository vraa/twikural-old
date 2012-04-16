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

		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
		<link type="text/css" rel="stylesheet" href="css/bootstrap-responsive.min.css" />
		<link type="text/css" rel="stylesheet" href="css/twikural.css?58305" />
		
		<title>Twikural - தினம் இரு திருக்குறள்</title>
		
	</head>
	<body id="app" class="subscribe">
		<div class='container'>
			<div class='row'>
				<div class='span4'>
					<a class='btn btn-danger' href="http://twikural.veerasundar.com"><i class='icon-arrow-left icon-white'></i> Back to Front page</a>
				</div>
			</div>
			
			<article class='hero-unit'>
				<h1>
					To Subscribe, Follow Us or Like Us
				</h1>
				<p>After you've subscribed, from the next day onwards, you'll get a Thirukkural sent to you (either a Twitter direct message / Facebook Update).</p>
				<br/><br/>
				<div class='row'>
					<div class='span3'>
						<a href="https://twitter.com/twikural" class="twitter-follow-button" data-show-count="false" data-size="large">Follow @twikural</a>
						<br/>
						<br/>
						<script charset="utf-8" src="http://widgets.twimg.com/j/2/widget.js"></script>
						<script>
						new TWTR.Widget({
						  version: 2,
						  type: 'profile',
						  rpp: 2,
						  interval: 30000,
						  width: 250,
						  height: 300,
						  theme: {
						    shell: {
						      background: '#b3c987',
						      color: '#fdfffa'
						    },
						    tweets: {
						      background: '#f5f5f5',
						      color: '#594c59',
						      links: '#175c91'
						    }
						  },
						  features: {
						    scrollbar: false,
						    loop: false,
						    live: false,
						    behavior: 'all'
						  }
						}).render().setUser('twikural').start();
						</script>
					</div>
					<div class='span4'>
						<br/><br/><br/>	
						<div class="fb-like-box" data-href="https://www.facebook.com/twikural" data-width="292" data-show-faces="true" data-stream="false" data-header="true"></div>
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