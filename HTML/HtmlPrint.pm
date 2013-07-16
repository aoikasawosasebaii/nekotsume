package HtmlPrint;
use strict;
sub new {
	my $pkg=shift;
	bless {},$pkg;
}
sub css {
	my $css=<<"EOS_CSS"
<link rel="stylesheet" type="text/css" href="css/tabs.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.10.3.custom.min.css">
<link rel="stylesheet" type="text/css" href="css/jquery.lightbox-0.5.css">
<style type="text/css">
	body {
		font-family:'Lucida Grande','Hiragino Kaku Gothic ProN', Meiryo, sans-serif;
		background-color:rgb(146, 70, 19); 
	}
	#Contents {
		visibility:hidden;
	}
	.photo01 {
		width:100%;
		height:200px;
	}
	.photo02 {
	}
	#firstline {
		color: rgb(228, 191, 75);
	}
	#tabs_navie_original {
		font-family: 'Monotype Corsiva';
	}
	#menuplan {
	}
	#title { 
		color:rgb(1, 1, 1);
		text-align: left; 
		font-weight:bold;
	}
	#cp {
		text-align: right; 
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="js/script.js" charset="utf-8"></script>
<script src="js/jquery.lightbox-0.5.min.js"></script>
<script src="http://maps.google.com/maps/api/js?sensor=false"></script>

<script>
$(function() {
	$('#gallery a').lightBox();
});
(function($){
	$(function(){
		$('#tabs').tabs();
	}); 
})(jQuery);

/* google map */
var map;
$(document).ready(function(){
	$(function() {
		$('#Contents').css("visibility","visible");
	});
	$("#head_access").click(function(){
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
	// change min-width
	$("#head_gal").click(function(){
		 $('#Wrapper').css( 'min-width', '100px');
	});
	// fix min-width
	$("#head_top,#head_menu,#head_access,#head_contact").click(function(){
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
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="Author" content="Shouhei Itoh">
<meta name="keywords" content=${keywords}>
<meta name="description" content=${description}>

<title>$TITLE</title>
$css
$js
</head>
EOS
	return $head;
}

sub body {
	my $imgBasePath='images/original/';
	my $img =[
		# List of pictuture
		"20130713044734.jpg",
		"20130713044734.jpg",
		"20130713044734.jpg",
		"20130713044734.jpg",
		"20130713044734.jpg",
		"20130713044734.jpg",
		"20130713044734.jpg",
		"20130713044734.jpg",
		"20130713044734.jpg",
		"20130713044734.jpg"
	];
	my $w="170px"; my $h="260px";
	my $galHtml;
	for (@{$img}) {
		my $imgPath=$imgBasePath.$_;
		$galHtml.="<li><a href=\"$imgPath\"><img src=\"$imgPath\" alt=\"\" style=\"width: $w;  height:$h;\"></a></li>";
	}
	my $body =<<"EOS";
<body>
<div id="Wrapper">
        <div id=firstline>（このページは作成中のページです）おしゃれなプライベートサロンでくつろげるネイルサロン ねこつめです。</div>
        <div id="Contents">
		<div id="title">ジェルネイル専門　ねこのつめとぎ<span id="tel">小田急線　相武台駅より、徒歩３分　Tel:XXX-XXXX-XXXX</span></div>
		<div id="tabs">
			<ul id="tabs_navie_original">
				<li id="head_top">     <a href="#tab1">Top</a></li>
				<li id="head_menu">    <a href="#tab2">Menu</a></li>
				<li id="head_gal">     <a href="#tab3">Gallery</a></li>
				<li id="head_access">  <a href="#tab4">Access</a></li>
				<li id="head_contact"> <a href="#tab5">Contact</a></li>
			</ul>

			<div id="tab1">
				<p>プライベートサロンなので、周りを気にせずおくつろぎください。</p>
				<img src="images/original/head_img.jpg" alt="" class="photo01">
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
				<p>Neil Gallery</p>
				<div id="cover">
					<div id="content">
						<div class="inner1">
							<div class="inner2">
								<div class="inner3">
									<div id="main">
										<ul id="gallery">
											$galHtml
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="tab4">
				<p>プライベートサロンなので、周りを気にせずおくつろぎください。</p>
				<img src="images/original/head_img.jpg" alt="" class="photo02">
				<div id="gmap_canvas"></div>
				<div id="access">
					<br>
					<br>
					<br>
					<div id="Adress">Adress:
						<br>神奈川県相模原市南区相武台1-25-4 マキアージュ302
					</div>
					<div id="Access">Access:
						<br>小田急線「相武台」駅XX口徒歩5分
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
				</div>
			</div>
			<div id="tab5">
				<!-- FC2RetalForm Start -->
<script type="text/javascript" src="http://form1.fc2.com/parts/index.php?id=860480"></script>
<noscript><a href="http://form1.fc2.com/form/?id=860480" target="_blank">[FC2メールフォーム]</a></noscript>
<!-- FC2RetalForm End   -->
			</div>
		</div>
	</div>
	<div id="cp">© 2013- Shouhei ito.</div>
</div>
</body>
</html>
EOS
	return $body;
}

1;
