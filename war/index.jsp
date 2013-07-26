<%@page import="javax.jdo.JDOObjectNotFoundException"%>
<%@page import="com.google.appengine.api.datastore.KeyFactory"%>
<%@page import="com.google.appengine.api.datastore.Key"%>
<%@page import="com.veerasundar.twikural.model.TwikuralData"%>
<%@page import="com.veerasundar.twikural.model.Thirukural"%>
<%@page import="com.veerasundar.twikural.PMF"%>
<%@page import="javax.jdo.PersistenceManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<meta name="description"
	content="Twikural is a free serice that sends Thirukural, every day directly to your Twitter/Facebook account." />
<meta name="keyword"
	content="thirukural, twikural, thiruvalluvar, tamil" />

<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet"
	href="css/bootstrap-responsive.min.css" />
<link type="text/css" rel="stylesheet" href="css/twikural.css?58305" />

<link href="http://feeds.feedburner.com/twikural" rel="alternate"
	type="application/rss+xml" title="Subscribe to Twikural via RSS" />

<title>Twikural - தினம் இரு திருக்குறள்</title>

</head>
<body id="app">
	<%-- SCRIPTLETS NOT RECOMMENDED. BUT FOR SIMIPLICITY AM USING.  --%>
	<%
		PersistenceManager pm = PMF.get().getPersistenceManager();
		if (request.getAttribute("tamil") == null) {
			Key tDataKey = KeyFactory.createKey(
					TwikuralData.class.getSimpleName(), "twitter");
			TwikuralData tData = null;
			try {
				tData = pm.getObjectById(TwikuralData.class, tDataKey);

				int nextKuralId = (tData == null) ? 1 : tData
						.getNextKuralId() - 1;
				Thirukural kural = pm.getObjectById(Thirukural.class,
						nextKuralId);
				if (kural != null) {
					request.setAttribute("tamil", kural.getTamil()
							.getValue());
					request.setAttribute("kalaignar", kural.getKalaignar()
							.getValue());
					request.setAttribute("muva", kural.getMuva().getValue());
					request.setAttribute("pops", kural.getPops().getValue());
					request.setAttribute("english", kural.getEnglish()
							.getValue());
					request.setAttribute("explain", kural.getExplain()
							.getValue());
					request.setAttribute("id", tData.getNextKuralId() - 1);
					request.setAttribute("next", Long.toString(
							tData.getNextKuralId() + 10297, 16));
					request.setAttribute("prev", Long.toString(
							tData.getNextKuralId() - 2 + 10297, 16));
				}
			} catch (JDOObjectNotFoundException e) {
				// Ignore.
			}
		}
	%>
	<div class='container'>
		<header class='row'>
			<div class='span6'>
				<h2>twikural</h2>
				<p>Sends Thirukural to your Twitter / Facebook, everyday morning
					and evening.</p>
			</div>
			<div class='actions span3 offset3'>
				<a href="archive" class="btn btn-info"><i
					class='icon-book icon-white'></i> Archives</a> &nbsp;&nbsp; <a
					href="subscribe.jsp" class="btn btn-danger"><i
					class='icon-star icon-white'></i> Subscribe</a>
			</div>
		</header>
		<%-- Kural section --%>
		<article class='hero row'>
			<div class='span2'>
				<%
					if (request.getAttribute("prev") != null) {
				%>
				<br /> <br /> <br /> <br /> <br /> <a
					href="kural?id=<%=request.getAttribute("prev")%>" class="btn"><i
					class="icon-arrow-left"></i> Previous</a>
				<%
					}
				%>
			</div>
			<div class='span2'>
				<br /> <a href="https://twitter.com/share"
					class="twitter-share-button" data-via="twikural" data-size="large">Tweet</a>
				<img src="img/valluvar.jpg" class='photo' /> <a
					href="subscribe.jsp" class="btn btn-danger"><i
					class='icon-star icon-white'></i> Subscribe</a> <br /> <br />
			</div>
			<div class="span6">
				<br /> <br /> <br /> <br />
				<h1><%=request.getAttribute("tamil")%></h1>
				<p class='seqno'>
					குறள் எண்:
					<%=request.getAttribute("id")%></p>
			</div>
			<div class="span2">
				<%
					if (request.getAttribute("next") != null) {
				%>
				<br /> <br /> <br /> <br /> <br /> <a
					href="kural?id=<%=request.getAttribute("next")%>" class="btn"><i
					class="icon-arrow-right"></i> Next</a>
				<%
					}
				%>
			</div>
		</article>
		<%-- Kural explanation section --%>
		<section class='row explanation'>
			<article class='span4 kalaignar'>
				<section class='content'>
					<h3>கலைஞர்</h3>
					<p><%=request.getAttribute("kalaignar")%></p>
				</section>
			</article>
			<article class='span4 pops'>
				<section class='content'>
					<h3>சாலமன் பாப்பையா</h3>
					<p><%=request.getAttribute("pops")%></p>
				</section>
			</article>
			<article class='span4 muva'>
				<section class='content'>
					<h3>மு. வரதராசனார்</h3>
					<p><%=request.getAttribute("muva")%></p>
				</section>
			</article>
		</section>
		<footer class='row credits'>
			Developed by <a href="http://veerasundar.com">Veera</a> : For
			feedback, contact <a href="mailto:veera.k.sundar@gmail.com">veera.k.sundar@gmail.com</a>
		</footer>
	</div>

	<%-- 3rd party JS --%>
	<script>
		!function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (!d.getElementById(id)) {
				js = d.createElement(s);
				js.id = id;
				js.src = "//platform.twitter.com/widgets.js";
				fjs.parentNode.insertBefore(js, fjs);
			}
		}(document, "script", "twitter-wjs");
	</script>
	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-2028306-36' ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>
</body>
</html>