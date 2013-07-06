package HtmlPrint;
use strict;
sub new {
	my $pkg=shift;
	bless {},$pkg;
}
sub css {
	my $css=<<"EOS_CSS"
<style type="text/css">
	body {
		font-family:'Lucida Grande','Hiragino Kaku Gothic ProN', Meiryo, sans-serif;
		color: rgb(21, 221, 238);
	}
	#gmap_canvas {
		width: 500px;
		height: 300px;
	}
</style>
EOS_CSS
}
sub js {
	my $js=<<"EOS_JS";
<script language="javascript" type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script language="javascript" type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script language="javascript" type="text/javascript">
var map;
/* google map */
\$(document).ready(function(){
	var latlng = new google.maps.LatLng(35.705576,109.751952);
	var opts = {
		zoom: 5,
		center: latlng,
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		navigationControl: false
	};
	map = new google.maps.Map(document.getElementById("gmap_canvas"), opts);
});
function zoomIn() {
	var level = map.getZoom();
	level ++;
	map.setZoom(level);
}
function zoomOut() {
	var level = map.getZoom();
	if (level != 0){
		level --;
	}
	map.setZoom(level);
}
/* google map end */
</script>
EOS_JS
	return $js;
}
sub head {
	my $css=css();
	my $js=js();
	my $TITLE="ネイル";
	my $keywords='"ネイル,小田急線"';
	my $description='"説明文・概要"';
	my $classification='"カテゴリ名をいれる"';

	my $head =<<"EOS";
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ja">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta name="Author" content="Shouhei Itoh">
<meta name="keywords" content=${keywords}>
<meta name="description" content=${description}>
<meta name="classification" content=${classification}>

<title>$TITLE</title>
$css
$js
</head>
EOS
	return $head;
}

sub body {
	my $body =<<'EOS';
<body>
<div id="all">

	<!-- Header -->
	<div id="header">
		<noscript>
		<p>ブラウザの設定で、JavaScriptを、有効にして下さい。</p>
		</noscript>
		<h1>これはみだし</h1>
	</div>
	<!-- Heaer end -->

	<!-- Main -->
	<div id="main">
		<p>AAAAAAAAAAA</p>
		<div id="gmap">
			<div id="gmap_canvas"></div>
			<p>
				<input type="button" id="zoomin" value="zoom in" onclick="zoomIn()">
				<input type="button" id="zoomout" value="zoom out" onclick="zoomOut()">
			</p>
		</div>
	</div>
	<!-- Main end -->

	<!-- Footer -->
	<div id="footer">
		<h1>FOOTER</h1>
	</div>
	<!-- Footer end -->
</div>
</body>
</html>
EOS
	return $body;
}

1;
