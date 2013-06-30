package HtmlPrint;
sub new {
	my $pkg=shift;
	bless {},$pkg;
}

sub head {

my $TITLE="ネイル";
my $Keywords='"ネイル,小田急線"';

	my $head =<<"EOS";
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN">
<html lang="ja">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="Keywords" content=${Keywords}>
<meta name="Author" content="Shouhei Itoh">
<link rel="stylesheet" type="text/css" href="base.css">
<link rel="stylesheet" type="text/css" href="base.css">

<title>$TITLE</title>
</head>
<body>
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
		AAAAAAAAAAA
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
