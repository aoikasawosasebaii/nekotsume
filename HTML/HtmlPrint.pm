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
</style>
EOS_CSS
}
sub js {
	my $js=<<"EOS_JS";
<script language="javascript" type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script language="javascript" type="text/javascript">
var map;
/* google map */
function initialize() {
	var latlng = new google.maps.LatLng(35.705576,109.751952);
	var opts = {
		zoom: 5,
		center: latlng,
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		navigationControl: false
	};
	map = new google.maps.Map(document.getElementById("map_canvas"), opts);
}
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
<body onload="initialize()">
EOS
	return $head;
}

sub body {
	my $body =<<'EOS';
<div id="all">

	<!-- HEADER start -->
	<div id="header">
		<h1>これはみだし</h1>
	</div>
	<!-- HEADER end -->

	<!-- Main start -->
	<div id="main">
		<p>AAAAAAAAAAA</p>
		<div id="gmap">
			<div id="map_canvas" style="width:500px; height:300px"></div>
			<p>
				<input type="button" id="zoomin" value="zoom in" onclick="zoomIn()">
				<input type="button" id="zoomout" value="zoom out" onclick="zoomOut()">
			</p>
		</div>
	</div>
	<!-- Main end -->

	<!-- FOOTER start -->
	<div id="footer">
		<h1>FOOTER</h1>
	</div>
	<!-- FOOTER end -->
</div>
</body>
</html>
EOS
	return $body;
}

1;
