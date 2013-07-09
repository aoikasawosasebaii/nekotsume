package HtmlPrint;
use strict;
sub new {
	my $pkg=shift;
	bless {},$pkg;
}
sub css {
	my $css=<<"EOS_CSS"
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/tabs.css">
<link rel="stylesheet" type="text/css" href="css/jquery.lightbox-0.5.css">
<link href="jquery-ui-1.10.3.custom/css/south-street/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" type="text/css">
<style type="text/css">
	body {
		font-family:'Lucida Grande','Hiragino Kaku Gothic ProN', Meiryo, sans-serif;
		background-color:rgb(146, 70, 19); 
	}
	#firstline {
		color: rgb(228, 191, 75);
	}
	#menuplan {
	}
	.center_ph {
		text-align:center;
	}
	#title { 
		color:rgb(1, 1, 1);
		text-align: left; 
		font-weight:bold;
	}
	#tel { 
		float: right; 
		font-weight:bold;
	}
	
	#gmap_canvas {
		width: 500px;
		height: 300px;
		float: right;
		margin-right:10px;
	}
	#access {
		margin-left:30px;
	}
	/*
	 #clear { clear: both; } 
	*/
</style>
EOS_CSS
}
sub js {
	my $js=<<'EOS_JS';
<script language="javascript" type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script language="javascript" type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script language="javascript" type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/script.js" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.lightbox-0.5.min.js"></script>

<script language="javascript" type="text/javascript">
$(function() {
  $('#gallery a').lightBox();
});

(function($){
        $(function(){
                $('#tabs').tabs();
        }); 
})(jQuery);

var map;
/* google map */
$(document).ready(function(){
	$("#contact").click(function(){
		var latlng = new google.maps.LatLng(35.499466 , 139.407067);
		var opts = {
			zoom: 17,
			center: latlng,
			mapTypeId: google.maps.MapTypeId.ROADMAP,
			navigationControl: false
		};
		map = new google.maps.Map(document.getElementById("gmap_canvas"), opts);
		var marker = new google.maps.Marker({
			icon: "http://maps.google.co.jp/mapfiles/ms/icons/red-pushpin.png",
			position: map.getCenter(),
			map: map,
			title: 'Here'
		});
	});
	$("#gal").click(function(){
		 $('#Wrapper').css( 'min-width', '100px');
	});
	$("#top,#menu,#contact").click(function(){
		 $('#Wrapper').css( 'min-width', '1000px');
	});
});
/* google map end */
</script>
EOS_JS
	return $js;
}
sub head {
	my $css=css();
	my $js=js();
	my $TITLE="ネイルサロン〜ねこのつめとぎ〜";
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
<div id="Wrapper">
        <div id=firstline>秋葉原のプライベートネイルサロン「Cradle（クレイドル）」です。</div>
        <div id="Contents">
		<div id="title">ジェルネイル専門　ねこのつめとぎ<span id="tel">Tel:03-6206-0947</span></div>
		<div id="tabs">
			<ul>
				<li id="top"><a href="#tab1">Top</a></li>
				<li id="menu"><a href="#tab2">Menu</a></li>
				<li id="gal"><a href="#tab3">Gallery</a></li>
				<li id="contact"><a href="#tab4">Contact</a></li>
			</ul>

			<div id="tab1">
				<p>お客さまひとりひとりに合わせたカウンセリング、ケア、アート等のご提案をさせていただきます。 プライベートサロンなので、周りを気にせずゆっくりとおくつろぎください。</p>
				<p>お客さまひとりひとりに合わせたカウンセリング、ケア、アート等のご提案をさせていただきます。 プライベートサロンなので、周りを気にせずゆっくりとおくつろぎください。</p>
				<img src="images/original/head_img.jpg" alt="" class="photo01">
				<p>お客さまひとりひとりに合わせたカウンセリング、ケア、アート等のご提案をさせていただきます。 プライベートサロンなので、周りを気にせずゆっくりとおくつろぎください。</p>
				<p>お客さまひとりひとりに合わせたカウンセリング、ケア、アート等のご提案をさせていただきます。 プライベートサロンなので、周りを気にせずゆっくりとおくつろぎください。</p>
			</div>
			<div id="tab2">
				<table id="menuplan"> 
					<tr><td colspan="2" class="t_top">料金</td></tr>
					<tr><td class="t_line01">ハンドクリアジェル（整爪＞しっかりとした甘皮周りのケア込み）</td><td class="t_line01">10本/6000円</td></tr>
					<tr><td class="t_line02">ジェルオフ（付け替えの場合）</td>                                <td class="t_line02">1本/200円</td></tr>
					<tr><td class="t_line01">ハンドクリアジェル（整爪＞しっかりとした甘皮周りのケア込み）</td><td class="t_line01">10本/6000円</td></tr>
					<tr><td class="t_line02">ジェルオフ（付け替えの場合）</td>                                <td class="t_line02">1本/200円</td></tr>
					<tr><td class="t_line01">ハンドクリアジェル（整爪＞しっかりとした甘皮周りのケア込み）</td><td class="t_line01">10本/6000円</td></tr>
					<tr><td class="t_line02">ジェルオフ（付け替えの場合）</td>                                <td class="t_line02">1本/200円</td></tr>
				</table>
			</div>
			<div id="tab3">
				<p>Neil Gallery</@>
				<div id="cover">
					<div id="content">
						<div class="inner1">
							<div class="inner2">
								<div class="inner3">
									<div id="main">
										<ul id="gallery">
											<li><a href="images/pl01.jpg"><img src="images/p01.jpg" alt="" width="180" height="135"></a></li>
											<li><a href="images/pl02.jpg"><img src="images/p02.jpg" alt="" width="180" height="135"></a></li>
											<li><a href="images/pl03.jpg"><img src="images/p03.jpg" alt="" width="180" height="135"></a></li>
											<li><a href="images/pl04.jpg"><img src="images/p04.jpg" alt="" width="180" height="135"></a></li>
											<li><a href="images/pl05.jpg"><img src="images/p05.jpg" alt="" width="180" height="135"></a></li>
											<li><a href="images/pl06.jpg"><img src="images/p06.jpg" alt="" width="180" height="135"></a></li>
											<li><a href="images/pl07.jpg"><img src="images/p07.jpg" alt="" width="180" height="135"></a></li>
											<li><a href="images/pl08.jpg"><img src="images/p08.jpg" alt="" width="180" height="135"></a></li>
											<li><a href="images/pl09.jpg"><img src="images/p09.jpg" alt="" width="180" height="135"></a></li>
											<li><a href="images/pl10.jpg"><img src="images/p10.jpg" alt="" width="180" height="135"></a></li>
											<li><a href="images/pl11.jpg"><img src="images/p11.jpg" alt="" width="180" height="135"></a></li>
											<li><a href="images/pl12.jpg"><img src="images/p12.jpg" alt="" width="180" height="135"></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="tab4">
				<p>お客さまひとりひとりに合わせたカウンセリング、ケア、アート等のご提案をさせていただきます。 プライベートサロンなので、周りを気にせずゆっくりとおくつろぎください。</p>
				<div class="center_ph">
				<img src="images/original/head_img.jpg" alt="" class="ph10">
				</div>
				<div id="gmap_canvas"></div>
				<div id="access">
				<p>Access</p>
				<br>
				<br>
				<br>
				<p>Adress: 千代田区外神田4-9-7
				<br>JR線「秋葉原」駅電気街口徒歩5分</p>
				<p>Tel:1234-56789</p>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
EOS
=pod
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
	</div>
	<!-- Main end -->

	<!-- Footer -->
	<div id="footer">
		<h1>FOOTER</h1>
	</div>
	<!-- Footer end -->
=cut
	return $body;
}

1;
