<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>My Show a Entertainment Category Flat Bootstarp
	responsive Website Template | About :: w3layouts</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="/AntMoviesForeground/foreground/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<script src="/AntMoviesForeground/foreground/js/jquery.min.js"></script>
<script src="/AntMoviesForeground/foreground/js/bootstrap.min.js"></script>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="My Show Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!--webfont-->
<link href='http://fonts.googleapis.com/css?family=Oxygen:400,700,300'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<!-- start menu -->
<link href="/AntMoviesForeground/foreground/css/megamenu.css"
	rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js/megamenu.js"></script>
<script>
	$(document).ready(function() {
		$(".megamenu").megamenu();
	});
</script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js/jquery.leanModal.min.js"></script>
<link rel="stylesheet"
	href="/AntMoviesForeground/foreground/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="/AntMoviesForeground/foreground/css/menu.css" />
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<!---- start-smoth-scrolling---->
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js/move-top.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1200);
		});
	});
</script>
<!---- start-smoth-scrolling---->
</head>
<body>
	<!-- header-section-starts -->

	<div class="header-top-strip" id="home">
		<div class="container">
			<div class="header-top-left">
				<p>
					<a class="play-icon popup-with-zoom-anim" href="#small-dialog1">请选择您的城市</a>
				</p>
				<div id="small-dialog" class="mfp-hide">
					<div class="select-city">
						<h3>Resend Confirmation</h3>
						<p>Lorem Ipsum is simply dummy text of the printing and
							typesetting industry</p>
						<div class="confirmation">
							<form>
								<input type="text" class="email" placeholder="Email"
									required="required" pattern="([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?"
									title="Enter a valid email" /> <input type="text" class="email"
									placeholder="Mobile Number" maxlength="10"
									pattern="[1-9]{1}\d{9}" title="Enter a valid mobile number" />
								<input type="submit" value="SEND">
							</form>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<div class="header-top-right">
				<div class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title">Modal title</h4>
							</div>
							<div class="modal-body">
								<p>One fine body&hellip;</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save
									changes</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
				<div style="float: left;margin-right: 16px;"><img alt="图片记载失败" src="/AntMoviesForeground/foreground/images/ant_logo.jpg" style="border_radius:15px;width:30px;height:30px"/> </div>
				<div style="float: left;margin-right: 16px;"><p style="font-size:1em;margin-top: 9px;">欢迎李四来到Ant</p></div>
				<div style="float: left;" ><a style="font-size:1em;margin-top: 9px;" href="#">个人中心</a></div>
				<!---pop-up-box---->
				<link href="/AntMoviesForeground/foreground/css/popuo-box.css" rel="stylesheet" type="text/css"
					media="all" />
				<script src="/AntMoviesForeground/foreground/js/jquery.magnific-popup.js" type="text/javascript"></script>
				<!---//pop-up-box---->
				<div id="small-dialog1" class="mfp-hide">
					<div class="select-city">
						<h3>Select Your City</h3>
						<select class="list_of_cities"><option value="">Select
								Your City</option>
							<optgroup label="Andhra Pradesh">
								<option style="padding-left: 10px;" value="ANAN">Anantapur</option>
								<option style="padding-left: 10px;" value="CHDM">Chinnamandem</option>
								<option style="padding-left: 10px;" value="GUDR">Gudur</option>
								<option style="padding-left: 10px;" value="GUNT">Guntur</option>
								<option style="padding-left: 10px;" value="JANG">Jangareddy
									Gudem</option>
								<option style="padding-left: 10px;" value="KAKI">Kakinada</option>
								<option style="padding-left: 10px;" value="KURN">Kurnool</option>
								<option style="padding-left: 10px;" value="MART">Martur</option>
								<option style="padding-left: 10px;" value="PRVT">Parvathipuram</option>
								<option style="padding-left: 10px;" value="RAJA">Rajahmundry</option>
								<option style="padding-left: 10px;" value="TENA">Tenali</option>
								<option style="padding-left: 10px;" value="TIRU">Tirupati</option>
								<option style="padding-left: 10px;" value="VIJA">Vijayawada</option>
								<option style="padding-left: 10px;" value="VIZA">Vizag</option>
								<option style="padding-left: 10px;" value="VIZI">Vizianagaram</option>
							</optgroup>
							<optgroup label="Arunachal Pradesh">
								<option style="padding-left: 10px;" value="TAWA">Tawang</option>
								<option style="padding-left: 10px;" value="ZIRO">Ziro</option>
							</optgroup>
							<optgroup label="Assam">
								<option style="padding-left: 10px;" value="DIB">Dibrugarh</option>
								<option style="padding-left: 10px;" value="GUW">Guwahati</option>
								<option style="padding-left: 10px;" value="JORT">Jorhat</option>
								<option style="padding-left: 10px;" value="SIL">Silchar</option>
								<option style="padding-left: 10px;" value="TINS">Tinsukia</option>
							</optgroup>
							<optgroup label="Bihar">
								<option style="padding-left: 10px;" value="HAJI">Hajipur</option>
								<option style="padding-left: 10px;" value="PATN">Patna</option>
							</optgroup>
							<optgroup label="Chhattisgarh">
								<option style="padding-left: 10px;" value="BHILAI">Bhilai</option>
								<option style="padding-left: 10px;" value="BILA">Bilaspur</option>
								<option style="padding-left: 10px;" value="CHAM">Champa</option>
								<option style="padding-left: 10px;" value="DHMT">Dhamtari</option>
								<option style="padding-left: 10px;" value="DURG">Durg</option>
								<option style="padding-left: 10px;" value="JAGD">Jagdalpur</option>
								<option style="padding-left: 10px;" value="KAWA">Kawardha</option>
								<option style="padding-left: 10px;" value="KNGN">Kondagaon</option>
								<option style="padding-left: 10px;" value="KRBA">Korba</option>
								<option style="padding-left: 10px;" value="RAIG">Raigarh</option>
								<option style="padding-left: 10px;" value="RAIPUR">Raipur</option>
								<option style="padding-left: 10px;" value="TNO">Tilda
									Neora</option>
							</optgroup>
							<optgroup label="Croatia">
								<option style="padding-left: 10px;" value="DBRV">Dubrovnik</option>
							</optgroup>
							<optgroup label="Goa">
								<option style="padding-left: 10px;" value="GOA">Goa</option>
							</optgroup>
							<optgroup label="Gujarat">
								<option style="padding-left: 10px;" value="ADPR">Adipur</option>
								<option style="padding-left: 10px;" value="AHD">Ahmedabad</option>
								<option style="padding-left: 10px;" value="AND">Anand</option>
								<option style="padding-left: 10px;" value="ANKL">Ankleshwar</option>
								<option style="padding-left: 10px;" value="BHAR">Bharuch</option>
								<option style="padding-left: 10px;" value="BHNG">Bhavnagar</option>
								<option style="padding-left: 10px;" value="DAMA">Daman</option>
								<option style="padding-left: 10px;" value="GDHAM">Gandhidham</option>
								<option style="padding-left: 10px;" value="GNAGAR">Gandhinagar</option>
								<option style="padding-left: 10px;" value="HIMM">Himmatnagar</option>
								<option style="padding-left: 10px;" value="IDAR">Idar</option>
								<option style="padding-left: 10px;" value="JAM">Jamnagar</option>
								<option style="padding-left: 10px;" value="JETP">Jetpur</option>
								<option style="padding-left: 10px;" value="JUGH">Junagadh</option>
								<option style="padding-left: 10px;" value="KTCH">Kutch</option>
								<option style="padding-left: 10px;" value="NADI">Nadiad</option>
								<option style="padding-left: 10px;" value="NVSR">Navsari</option>
								<option style="padding-left: 10px;" value="PALN">Palanpur</option>
								<option style="padding-left: 10px;" value="PATA">Patan</option>
								<option style="padding-left: 10px;" value="RAJK">Rajkot</option>
								<option style="padding-left: 10px;" value="SANA">Sanand</option>
								<option style="padding-left: 10px;" value="SILV">Silvassa</option>
								<option style="padding-left: 10px;" value="SURT">Surat</option>
								<option style="padding-left: 10px;" value="VAD">Vadodara</option>
								<option style="padding-left: 10px;" value="VLSD">Valsad</option>
								<option style="padding-left: 10px;" value="VAPI">Vapi</option>
							</optgroup>
							<optgroup label="Haryana">
								<option style="padding-left: 10px;" value="AMB">Ambala</option>
								<option style="padding-left: 10px;" value="DHRA">Dharuhera</option>
								<option style="padding-left: 10px;" value="FARI">Faridabad</option>
								<option style="padding-left: 10px;" value="HISR">Hisar</option>
								<option style="padding-left: 10px;" value="JHAJ">Jhajjar</option>
								<option style="padding-left: 10px;" value="JIND">Jind</option>
								<option style="padding-left: 10px;" value="KAIT">Kaithal</option>
								<option style="padding-left: 10px;" value="KARN">Karnal</option>
								<option style="padding-left: 10px;" value="KUND">Kundli</option>
								<option style="padding-left: 10px;" value="KURU">Kurukshetra</option>
								<option style="padding-left: 10px;" value="PNCH">Panchkula</option>
								<option style="padding-left: 10px;" value="PAN">Panipat</option>
								<option style="padding-left: 10px;" value="REWA">Rewari</option>
								<option style="padding-left: 10px;" value="ROH">Rohtak</option>
								<option style="padding-left: 10px;" value="SISA">Sirsa</option>
								<option style="padding-left: 10px;" value="RAIH">Sonipat</option>
								<option style="padding-left: 10px;" value="YAMU">Yamunanagar</option>
							</optgroup>
							<optgroup label="Himachal Pradesh">
								<option style="padding-left: 10px;" value="BADD">Baddi</option>
								<option style="padding-left: 10px;" value="DMSL">Dharamsala</option>
								<option style="padding-left: 10px;" value="HAMI">Hamirpur
									(HP)</option>
								<option style="padding-left: 10px;" value="KANG">Kangra</option>
								<option style="padding-left: 10px;" value="KULU">Kullu</option>
								<option style="padding-left: 10px;" value="MANA">Manali</option>
								<option style="padding-left: 10px;" value="SMLA">Shimla</option>
								<option style="padding-left: 10px;" value="SCO">Solan</option>
							</optgroup>
							<optgroup label="Jammu and Kashmir">
								<option style="padding-left: 10px;" value="JAMM">Jammu</option>
								<option style="padding-left: 10px;" value="KATH">Kathua</option>
								<option style="padding-left: 10px;" value="KATR">Katra</option>
								<option style="padding-left: 10px;" value="LEHA">Ladakh</option>
							</optgroup>
							<optgroup label="Jharkhand">
								<option style="padding-left: 10px;" value="BOKA">Bokaro</option>
								<option style="padding-left: 10px;" value="DOGH">Deoghar</option>
								<option style="padding-left: 10px;" value="DHAN">Dhanbad(Jharkhand)</option>
								<option style="padding-left: 10px;" value="JMDP">Jamshedpur</option>
								<option style="padding-left: 10px;" value="RANC">Ranchi</option>
							</optgroup>
							<optgroup label="Karnataka">
								<option style="padding-left: 10px;" value="BELG">Belgaum</option>
								<option style="padding-left: 10px;" value="BANG">Bengaluru</option>
								<option style="padding-left: 10px;" value="BIDR">Bidar</option>
								<option style="padding-left: 10px;" value="COOR">Coorg</option>
								<option style="padding-left: 10px;" value="DAVA">Davangere</option>
								<option style="padding-left: 10px;" value="GULB">Gulbarga</option>
								<option style="padding-left: 10px;" value="HUBL">Hubli</option>
								<option style="padding-left: 10px;" value="KWAR">Karwar</option>
								<option style="padding-left: 10px;" value="MLR">Mangalore</option>
								<option style="padding-left: 10px;" value="MANI">Manipal</option>
								<option style="padding-left: 10px;" value="MYS">Mysore</option>
								<option style="padding-left: 10px;" value="TUMK">Tumkur</option>
								<option style="padding-left: 10px;" value="UDUP">Udupi</option>
							</optgroup>
							<optgroup label="Kerala">
								<option style="padding-left: 10px;" value="99">Alappuzha</option>
								<option style="padding-left: 10px;" value="ANHL">Anchal</option>
								<option style="padding-left: 10px;" value="ANGA">Angamaly</option>
								<option style="padding-left: 10px;" value="ERNK">Ernakulam</option>
								<option style="padding-left: 10px;" value="KANN">Kannur</option>
								<option style="padding-left: 10px;" value="KARG">Karunagapally</option>
								<option style="padding-left: 10px;" value="KOCH">Kochi</option>
								<option style="padding-left: 10px;" value="KOLM">Kollam</option>
								<option style="padding-left: 10px;" value="KTYM">Kottayam</option>
								<option style="padding-left: 10px;" value="MVLR">Mavellikara</option>
								<option style="padding-left: 10px;" value="THAL">Thalayolaparambu</option>
								<option style="padding-left: 10px;" value="THSR">Thrissur</option>
								<option style="padding-left: 10px;" value="TRIV">Trivandrum</option>
							</optgroup>
							<optgroup label="Madhya Pradesh">
								<option style="padding-left: 10px;" value="BLGT">Balaghat</option>
								<option style="padding-left: 10px;" value="BETU">Betul</option>
								<option style="padding-left: 10px;" value="BHOP">Bhopal</option>
								<option style="padding-left: 10px;" value="CHIN">Chhindwara</option>
								<option style="padding-left: 10px;" value="DEWAS">Dewas</option>
								<option style="padding-left: 10px;" value="GWAL">Gwalior</option>
								<option style="padding-left: 10px;" value="HRDA">Harda</option>
								<option style="padding-left: 10px;" value="IND">Indore</option>
								<option style="padding-left: 10px;" value="JABL">Jabalpur</option>
								<option style="padding-left: 10px;" value="KHDW">Khandwa</option>
								<option style="padding-left: 10px;" value="NMCH">Neemuch</option>
								<option style="padding-left: 10px;" value="RATL">Ratlam</option>
								<option style="padding-left: 10px;" value="SAMP">Sagar</option>
								<option style="padding-left: 10px;" value="SARN">Sarni</option>
								<option style="padding-left: 10px;" value="SEHO">Sehore</option>
								<option style="padding-left: 10px;" value="SEON">Seoni</option>
								<option style="padding-left: 10px;" value="SHIV">Shivpuri</option>
								<option style="padding-left: 10px;" value="UJJN">Ujjain</option>
							</optgroup>
							<optgroup label="Maharashtra">
								<option style="padding-left: 10px;" value="AHMED">Ahmednagar</option>
								<option style="padding-left: 10px;" value="AKOL">Akola</option>
								<option style="padding-left: 10px;" value="ALBG">Alibaug</option>
								<option style="padding-left: 10px;" value="AMRA">Amravati</option>
								<option style="padding-left: 10px;" value="AURA">Aurangabad</option>
								<option style="padding-left: 10px;" value="BARA">Baramati</option>
								<option style="padding-left: 10px;" value="BEED">Beed</option>
								<option style="padding-left: 10px;" value="BHIW">Bhiwandi</option>
								<option style="padding-left: 10px;" value="BOIS">Boisar</option>
								<option style="padding-left: 10px;" value="BULD">Buldana</option>
								<option style="padding-left: 10px;" value="CHAN">Chandrapur</option>
								<option style="padding-left: 10px;" value="DHLE">Dhule</option>
								<option style="padding-left: 10px;" value="DHUL">Dhulia</option>
								<option style="padding-left: 10px;" value="INDA">Indapur</option>
								<option style="padding-left: 10px;" value="JALG">Jalgaon</option>
								<option style="padding-left: 10px;" value="KHED">Khed</option>
								<option style="padding-left: 10px;" value="KHOP">Khopoli</option>
								<option style="padding-left: 10px;" value="KOLH">Kolhapur</option>
								<option style="padding-left: 10px;" value="LAT">Latur</option>
								<option style="padding-left: 10px;" value="LAVA">Lavasa</option>
								<option style="padding-left: 10px;" value="LNVL">Lonavala</option>
								<option style="padding-left: 10px;" value="MHAD">Mahad</option>
								<option style="padding-left: 10px;" value="MALE">Malegaon</option>
								<option style="padding-left: 10px;" value="MUMBAI">Mumbai</option>
								<option style="padding-left: 10px;" value="NAGP">Nagpur</option>
								<option style="padding-left: 10px;" value="NAND">Nanded</option>
								<option style="padding-left: 10px;" value="NASK">Nashik</option>
								<option style="padding-left: 10px;" value="PALG">Palghar</option>
								<option style="padding-left: 10px;" value="PANC">Panchgani</option>
								<option style="padding-left: 10px;" value="PARB">Parbhani</option>
								<option style="padding-left: 10px;" value="PEN">Pen</option>
								<option style="padding-left: 10px;" value="PHAL">Phaltan</option>
								<option style="padding-left: 10px;" value="PIMP">Pimpri</option>
								<option style="padding-left: 10px;" value="PUNE">Pune</option>
								<option style="padding-left: 10px;" value="RAI">Raigad</option>
								<option style="padding-left: 10px;" value="SANG">Sangli</option>
								<option style="padding-left: 10px;" value="SATA">Satara</option>
								<option style="padding-left: 10px;" value="SOLA">Solapur</option>
								<option style="padding-left: 10px;" value="TMB">Tembhode</option>
								<option style="padding-left: 10px;" value="UDGR">Udgir</option>
								<option style="padding-left: 10px;" value="WARD">Wardha</option>
							</optgroup>
							<optgroup label="Meghalaya">
								<option style="padding-left: 10px;" value="RNG">Rongjeng</option>
								<option style="padding-left: 10px;" value="SHLG">Shillong</option>
							</optgroup>
							<optgroup label="Nagaland">
								<option style="padding-left: 10px;" value="DMPR">Dimapur</option>
							</optgroup>
							<optgroup label="NCR">
								<option style="padding-left: 10px;" value="NCR">National
									Capital Region (NCR)</option>
							</optgroup>
							<optgroup label="Orissa">
								<option style="padding-left: 10px;" value="BLSR">Balasore</option>
								<option style="padding-left: 10px;" value="BHUB">Bhubaneshwar</option>
								<option style="padding-left: 10px;" value="PURI">Puri</option>
								<option style="padding-left: 10px;" value="SAMB">Sambalpur</option>
							</optgroup>
							<optgroup label="Punjab">
								<option style="padding-left: 10px;" value="ABOR">Abohar</option>
								<option style="padding-left: 10px;" value="AHMG">Ahmedgarh</option>
								<option style="padding-left: 10px;" value="AMRI">Amritsar</option>
								<option style="padding-left: 10px;" value="BNGA">Banga</option>
								<option style="padding-left: 10px;" value="BAR">Barnala</option>
								<option style="padding-left: 10px;" value="BHAT">Bathinda</option>
								<option style="padding-left: 10px;" value="CHD">Chandigarh</option>
								<option style="padding-left: 10px;" value="HOSH">Hoshiarpur</option>
								<option style="padding-left: 10px;" value="JALA">Jalandhar</option>
								<option style="padding-left: 10px;" value="KHAN">Khanna</option>
								<option style="padding-left: 10px;" value="KOTK">Kotkapura</option>
								<option style="padding-left: 10px;" value="LUDH">Ludhiana</option>
								<option style="padding-left: 10px;" value="MNSA">Mansa</option>
								<option style="padding-left: 10px;" value="MOGA">Moga</option>
								<option style="padding-left: 10px;" value="MOHL">Mohali</option>
								<option style="padding-left: 10px;" value="NAVN">Nawanshahr</option>
								<option style="padding-left: 10px;" value="PATH">Pathankot</option>
								<option style="padding-left: 10px;" value="PATI">Patiala</option>
								<option style="padding-left: 10px;" value="PATR">Patran</option>
								<option style="padding-left: 10px;" value="RUPN">Rupnagar</option>
								<option style="padding-left: 10px;" value="SANR">Sangrur</option>
								<option style="padding-left: 10px;" value="ZIRK">Zirakpur</option>
							</optgroup>
							<optgroup label="Rajasthan">
								<option style="padding-left: 10px;" value="ABRD">Abu
									Road</option>
								<option style="padding-left: 10px;" value="AJMER">Ajmer</option>
								<option style="padding-left: 10px;" value="ALSR">Alsisar
									(Rajasthan)</option>
								<option style="padding-left: 10px;" value="ALWR">Alwar</option>
								<option style="padding-left: 10px;" value="BANS">Banswara</option>
								<option style="padding-left: 10px;" value="BEAW">Beawar</option>
								<option style="padding-left: 10px;" value="BHIL">Bhilwara</option>
								<option style="padding-left: 10px;" value="BHWD">Bhiwadi</option>
								<option style="padding-left: 10px;" value="BIK">Bikaner</option>
								<option style="padding-left: 10px;" value="DAUS">Dausa</option>
								<option style="padding-left: 10px;" value="JAIP">Jaipur</option>
								<option style="padding-left: 10px;" value="JSMR">Jaisalmer</option>
								<option style="padding-left: 10px;" value="JODH">Jodhpur</option>
								<option style="padding-left: 10px;" value="KISH">Kishangarh</option>
								<option style="padding-left: 10px;" value="KOTA">Kota</option>
								<option style="padding-left: 10px;" value="NEEM">Neemrana</option>
								<option style="padding-left: 10px;" value="SIKR">Sikar</option>
								<option style="padding-left: 10px;" value="SRIG">Sri
									Ganganagar</option>
								<option style="padding-left: 10px;" value="UDAI">Udaipur</option>
							</optgroup>
							<optgroup label="Singapore">
								<option style="padding-left: 10px;" value="SING">Singapore</option>
							</optgroup>
							<optgroup label="Tamil Nadu">
								<option style="padding-left: 10px;" value="ARIY">Ariyalur</option>
								<option style="padding-left: 10px;" value="ARNI">Arni</option>
								<option style="padding-left: 10px;" value="ARUP">Aruppukottai</option>
								<option style="padding-left: 10px;" value="CHEN">Chennai</option>
								<option style="padding-left: 10px;" value="COIM">Coimbatore</option>
								<option style="padding-left: 10px;" value="CUDD">Cuddalore</option>
								<option style="padding-left: 10px;" value="DHAR">Dharapuram</option>
								<option style="padding-left: 10px;" value="DMPI">Dharmapuri</option>
								<option style="padding-left: 10px;" value="DIND">Dindigul</option>
								<option style="padding-left: 10px;" value="EROD">Erode</option>
								<option style="padding-left: 10px;" value="KNPM">Kanchipuram</option>
								<option style="padding-left: 10px;" value="KUMB">Kumbakonam</option>
								<option style="padding-left: 10px;" value="MADU">Madurai</option>
								<option style="padding-left: 10px;" value="MTPM">Mettuppalayam</option>
								<option style="padding-left: 10px;" value="OOTY">Ooty</option>
								<option style="padding-left: 10px;" value="POND">Pondicherry</option>
								<option style="padding-left: 10px;" value="PUDH">Pudhukottai</option>
								<option style="padding-left: 10px;" value="SALM">Salem</option>
								<option style="padding-left: 10px;" value="SIV">Sivakasi</option>
								<option style="padding-left: 10px;" value="TAJO">Tanjore</option>
								<option style="padding-left: 10px;" value="TENK">Tenkasi</option>
								<option style="padding-left: 10px;" value="TIRV">Tirunelveli</option>
								<option style="padding-left: 10px;" value="TIRP">Tirupur</option>
								<option style="padding-left: 10px;" value="TRIC">Trichy</option>
								<option style="padding-left: 10px;" value="VELL">Vellore</option>
							</optgroup>
							<optgroup label="Telangana">
								<option style="padding-left: 10px;" value="ADIL">Adilabad</option>
								<option style="padding-left: 10px;" value="AMAN">Amangal</option>
								<option style="padding-left: 10px;" value="HYD">Hyderabad</option>
								<option style="padding-left: 10px;" value="KARIM">Karimnagar</option>
								<option style="padding-left: 10px;" value="KHAM">Khammam</option>
								<option style="padding-left: 10px;" value="MRGD">Miryalaguda</option>
								<option style="padding-left: 10px;" value="NIZA">Nizamabad</option>
								<option style="padding-left: 10px;" value="PEDA">Peddapalli</option>
								<option style="padding-left: 10px;" value="POCH">Pochampally</option>
								<option style="padding-left: 10px;" value="SDDP">Siddipet</option>
								<option style="padding-left: 10px;" value="SURY">Suryapet</option>
								<option style="padding-left: 10px;" value="UPPA">Uppal</option>
								<option style="padding-left: 10px;" value="WAR">Warangal</option>
							</optgroup>
							<optgroup label="Tripura ">
								<option style="padding-left: 10px;" value="AGAR">Agartala</option>
							</optgroup>
							<optgroup label="Uttar Pradesh">
								<option style="padding-left: 10px;" value="AGRA">Agra</option>
								<option style="padding-left: 10px;" value="ALI">Aligarh</option>
								<option style="padding-left: 10px;" value="ALLH">Allahabad</option>
								<option style="padding-left: 10px;" value="BARE">Bareilly</option>
								<option style="padding-left: 10px;" value="BIJ">Bijnor</option>
								<option style="padding-left: 10px;" value="GHAR">Ghazipur</option>
								<option style="padding-left: 10px;" value="GRKP">Gorakhpur</option>
								<option style="padding-left: 10px;" value="KANP">Kanpur</option>
								<option style="padding-left: 10px;" value="LUCK">Lucknow</option>
								<option style="padding-left: 10px;" value="MATH">Mathura</option>
								<option style="padding-left: 10px;" value="MERT">Meerut</option>
								<option style="padding-left: 10px;" value="MORA">Moradabad</option>
								<option style="padding-left: 10px;" value="MUZ">Muzaffarnagar</option>
								<option style="padding-left: 10px;" value="RENU">Renukoot</option>
								<option style="padding-left: 10px;" value="SAHA">Saharanpur</option>
								<option style="padding-left: 10px;" value="VAR">Varanasi</option>
							</optgroup>
							<optgroup label="Uttarakhand">
								<option style="padding-left: 10px;" value="DEH">Dehradun</option>
								<option style="padding-left: 10px;" value="HRDR">Haridwar</option>
								<option style="padding-left: 10px;" value="MSS">Mussoorie</option>
								<option style="padding-left: 10px;" value="NAIN">Nainital</option>
								<option style="padding-left: 10px;" value="RAMN">Ramnagar</option>
								<option style="padding-left: 10px;" value="RKES">Rishikesh</option>
								<option style="padding-left: 10px;" value="ROOR">Roorkee</option>
								<option style="padding-left: 10px;" value="RUDP">Rudrapur</option>
							</optgroup>
							<optgroup label="West Bengal">
								<option style="padding-left: 10px;" value="ASANSOL">Asansol</option>
								<option style="padding-left: 10px;" value="BEHA">Berhampore</option>
								<option style="padding-left: 10px;" value="BLPR">Bolpur</option>
								<option style="padding-left: 10px;" value="BURD">Burdwan</option>
								<option style="padding-left: 10px;" value="COBE">Cooch
									Behar</option>
								<option style="padding-left: 10px;" value="DARJ">Darjeeling</option>
								<option style="padding-left: 10px;" value="DURGA">Durgapur</option>
								<option style="padding-left: 10px;" value="HALD">Haldia</option>
								<option style="padding-left: 10px;" value="HOOG">Hooghly</option>
								<option style="padding-left: 10px;" value="HWRH">Howrah</option>
								<option style="padding-left: 10px;" value="JPG">Jalpaiguri</option>
								<option style="padding-left: 10px;" value="KOLK">Kolkata</option>
								<option style="padding-left: 10px;" value="RANA">Ranaghat</option>
								<option style="padding-left: 10px;" value="SILI">Siliguri</option>
							</optgroup></select>
						<div class="clearfix"></div>
					</div>
				</div>

				<script>
					$(document).ready(function() {
						$('.popup-with-zoom-anim').magnificPopup({
							type : 'inline',
							fixedContentPos : false,
							fixedBgPos : true,
							overflowY : 'auto',
							closeBtnInside : true,
							preloader : false,
							midClick : true,
							removalDelay : 300,
							mainClass : 'my-mfp-zoom-in'
						});

					});
				</script>
				<!-- Large modal -->
				<button class="btn btn-primary" data-toggle="modal"
					data-target="#myModal">登录</button>
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myLargeModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">还等什么，赶快加入吧！</h4>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-md-8"
										style="border-right: 1px dotted #C2C2C2; padding-right: 30px;">
										<!-- Nav tabs -->
										<ul class="nav nav-tabs">
											<li class="active"><a href="#Login" data-toggle="tab">登陆</a></li>
											<li><a href="#Registration" data-toggle="tab">注册</a></li>
										</ul>
										<!-- Tab panes -->
										<div class="tab-content">
											<div class="tab-pane active" id="Login">
												<form role="form" class="form-horizontal">
													<div class="form-group">
														<label for="email" class="col-sm-2 control-label">
															账号</label>
														<div class="col-sm-10">
															<input type="email" class="form-control" id="email1"
																placeholder="Email" />
														</div>
													</div>
													<div class="form-group">
														<label for="exampleInputPassword1"
															class="col-sm-2 control-label"> 密码</label>
														<div class="col-sm-10">
															<input type="password" class="form-control"
																id="exampleInputPassword1" placeholder="password" />
														</div>
													</div>
													<div class="row">
														<div class="col-sm-2"></div>
														<div class="col-sm-10">
															<button type="submit" class="btn btn-primary btn-sm">
																登陆</button>
															<a href="javascript:;">Forgot your password?</a>
														</div>
													</div>
												</form>
											</div>
											<div class="tab-pane" id="Registration">
												<form role="form" class="form-horizontal">
													<div class="form-group">
														<label for="email" class="col-sm-2 control-label">
															昵称</label>
														<div class="col-sm-10">
															<div class="row">
																<div class="col-md-3">
																	<select class="form-control">
																		<option>先生</option>
																		<option>女士</option>

																	</select>
																</div>
																<div class="col-md-9">
																	<input type="text" class="form-control"
																		placeholder="Name" />
																</div>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label for="email" class="col-sm-2 control-label">
															邮箱：</label>
														<div class="col-sm-10">
															<input type="email" class="form-control" id="email"
																placeholder="Email" />
														</div>
													</div>
													<div class="form-group">
														<label for="mobile" class="col-sm-2 control-label">
															电话：</label>
														<div class="col-sm-10">
															<input type="email" class="form-control" id="mobile"
																placeholder="Mobile" />
														</div>
													</div>
													<div class="form-group">
														<label for="password" class="col-sm-2 control-label">
															密码：</label>
														<div class="col-sm-10">
															<input type="password" class="form-control" id="password"
																placeholder="Password" />
														</div>
													</div>
													<div class="row">
														<div class="col-sm-2"></div>
														<div class="col-sm-10">
															<button type="button" class="btn btn-primary btn-sm">
																保存</button>
															<button type="button" class="btn btn-default btn-sm">
																取消</button>
														</div>
													</div>
												</form>
											</div>
										</div>

									</div>
									<div class="col-md-4">
										<div class="row text-center sign-with"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- <script>
					$('#myModal').modal('no');
				</script> -->
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="container">
		<div class="main-content">
			<div class="header">
				<div class="logo">
					<a href="index.jsp"><h1>Ant 影视城</h1></a>
				</div>
				<div class="search">
					<div class="search2">
						<form>
							<i class="fa fa-search"></i> <input type="text"
								value="搜索电影"
								onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Search for a movie, play, event, sport or more';}" />
						</form>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="bootstrap_container">
				<nav class="navbar navbar-default w3_megamenu" role="navigation">
				<div class="navbar-header">
					<button type="button" data-toggle="collapse"
						data-target="#defaultmenu" class="navbar-toggle">
						<span class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a href="index.html" class="navbar-brand"><i class="fa fa-home"></i></a>
				</div>
				<!-- end navbar-header -->

				<div id="defaultmenu" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="index.jsp">主页</a></li>
						<!-- Mega Menu -->
						<li class="dropdown w3_megamenu-fw"><a href="/AntMoviesForeground/foreground/movie_schedule.jsp"
							class="dropdown-toggle">电影排期<b
								class="caret"></b></a>
							</li>
						<li class="dropdown"><a href="#" data-toggle="dropdown"
							class="dropdown-toggle">关于我们<b class="caret"></b></a>
							<ul class="dropdown-menu" role="menu">

								<li><a href="about.jsp">关于我们</a></li>
								<li><a href="contact.jsp">联系我们</a></li>
							</ul>
							<!-- end dropdown-menu --></li>
						<!-- end dropdown-submenu -->
					</ul>
					<!-- end dropdown-menu -->
					</li>
					<!-- end standard drop down -->
					<!-- end dropdown w3_megamenu-fw -->
					</ul>
					<!-- end nav navbar-nav -->

					<ul class="nav navbar-nav navbar-right">
						
					</ul>
					<!-- end nav navbar-nav navbar-right -->
				</div>
				<!-- end #navbar-collapse-1 --> </nav>
				<!-- end navbar navbar-default w3_megamenu -->
			</div>
			<!-- end container -->

			<!-- AddThis Smart Layers END -->

			<ol class="breadcrumb">
				<li><a href="index.jsp">主页</a></li>
				<li class="active">关于我们</li>
			</ol>
			<!----->
			<div class="about-section">

				<div class="tabs-box">
					<ul class="tabs-menu">
						<li><a href="#tab1"><span> </span>关于我们</a></li>
						<li><a href="#tab2"><span> </span>我们的发展史</a></li>
						<li><a href="#tab3"><span> </span>我们的工作</a></li>
						<li><a href="#tab4"><span> </span>加入我们</a></li>
					</ul>
					<div class="clearfix"></div>
					<div class="tab-grids">
						<div id="tab1" class="tab-grid">
							<h5>Ant 影视城的信息一览</h5>
							<p>Ant影城位于成都市最繁华的郫县，是黔东南州第一家大型正规城市院线影城，拥有着老影院不可攀比的时尚格调和高雅风情以及无比真实、震撼的观影效果。</p>
							<p>全力打造，殿堂享受</p>
							<p>Ant影城总经营面积高达2200平方米，严格按照国际影城标准设计和配置。影城秉承国际影院的时尚风格，装修豪华，高雅大方，拥有6个视听效果一流、温馨舒适的观映厅，其中普通影厅4个，3D影厅2个，共设796个豪华舒适座椅。</p>
							<p>高档设备，视听享受</p>
							<p>采用当今电影工业最先进的放映设备及数码音响，为电影爱好者们带来真正的极致享受。独特声学设计的隔音墙壁，最大限度地还原大片声效;超大的进口无缝式清晰银幕，
								国际流行的全方位、大坡度、无遮挡式最佳观映视野设计，让观众享受到逼真而震撼的视听效果。</p>
							<p>影讯查询，方便快捷</p>
							<p>影讯查询方式：拨打影讯咨询电话：0855-8237399； 地址：成都郫县（原天上人间）
								随时随处查询凯瑞国际影城最新影讯、每日排片、时段票价、优惠活动。</p>
							<p>特色经营，一站到位</p>
							<p>影城特设的卖品部，采用纯正椰油制作的爆米花，美味可口。影城时尚休闲区更设有时尚杂志和最新报纸，让观众候影时也能掌握天下大事，触碰时尚脉搏。影城搭配卖品部，特色化的经营让观众在体验精彩绝伦的电影之外，还能享受现代化影城的一站式服务。
							</p>
						</div>
						<div id="tab2" class="tab-grid">
							<h5>2016 发展史</h5>
							<a href="#">There are many variations of passages of Lorem
								Ipsum available, but the majority </a> <a href="#">It is a long
								established fact that a reader will be distracted by the
								readable</a> <a href="#">Lorem Ipsum is simply dummy text of the
								printing and typesetting industry</a>
							<p>Duis iaculis justo nec tellus bibendum rhoncus. Phasellus
								quis pretium leo, sed porta ligula. Mauris vitae ornare nisi, et
								dapibus elit. Vestibulum vel urna malesuada, bibendum orci sed,
								venenatis nunc. Morbi dignissim est tortor, ac aliquam augue
								blandit at. Pellentesque pulvinar convallis augue, in sodales
								risus feugiat et. Ut viverra pellentesque tellus eu consectetur.
								Maecenas eget massa nulla. Fusce convallis et sapien a
								hendrerit. Etiam viverra maximus dolor, ac tempor sapien.</p>
						</div>
						<div id="tab3" class="tab-grid">
							<h5>我们的工作</h5>
							<a href="#">Lorem Ipsum is simply dummy text of the printing
								and typesetting industry</a> <a href="#">There are many
								variations of passages of Lorem Ipsum available, but the
								majority </a> <a href="#">It is a long established fact that a
								reader will be distracted by the readable</a> <a href="#">Lorem
								Ipsum is simply dummy text of the printing and typesetting
								industry</a> <a href="#">There are many variations of passages
								of Lorem Ipsum available, but the majority </a> <a href="#">It
								is a long established fact that a reader will be distracted by
								the readable</a>
						</div>
						<div id="tab4" class="tab-grid">
							<div class="tb-one">
								<h3>前端维护</h3>
								<h4>岗位要求</h4>
								<p>1. 3年以上前端开发经验，有完整的前端项目经验</p>
								<p>2. 熟练使用jQuery, Mootools或Yui等主流Javascript库/框架</p>
								<p>3. 熟练使用Photoshop/Fireworks对设计图进行切割和导出</p>
							</div>
							<div class="tb-one">
								<h3>售票员</h3>
								<h4>岗位要求</h4>
								<p>1. 专科（含）以上学历，有相关工作经验，可以学习接受新事物；</p>
								<p>2. 基本的英语读写能力，熟悉办公软件、办公设备使用；</p>
								<p>3. 具备良好的语言表达能力，较强的沟通、协调能力，有较强的团队协作精神；</p>
								<p>4. 具备较强的抗压能力、服务意识和执行力，思维敏捷，性格乐观积极；</p>
							</div>
							<div class="tb-one">
								<h3>清洁工</h3>
								<h4>岗位要求</h4>
								<p>1. 踏实能干，不怕脏、不怕累</p>
								<p>2. 文明服务、礼貌待人，并注意保持个人的仪容仪表，树立良好形象</p>
								<p>3. 爱岗敬业，听从上级领导指挥，在规定时间内按照工作标准，保质保量地</p>
								<p>4. 完成各自分管区域内的清洁工作</p>
								<p>5. 遵守考勤制度，按时上下班，不迟到、早退，不旷工离岗，工作时间不干私活，不做与工作无关的事情</p>
							</div>
							<div class="tb-one">
								<h3>申请您喜欢的职位:</h3>
								<div class="tb-two">
									<input type="text" value="姓名" onfocus="this.value = '';"
										onblur="if (this.value == '') {this.value = '姓名';}"> <input
										type="text" value="职位" onfocus="this.value = '';"
										onblur="if (this.value == '') {this.value = '职位';}"> <input
										type="text" value="邮箱" onfocus="this.value = '';"
										onblur="if (this.value == '') {this.value = '邮箱';}"> <input
										type="text" value="电话" onfocus="this.value = '';"
										onblur="if (this.value == '') {this.value = '电话';}"> <span>附加信息:<span>
											<textarea onfocus="this.value = '';"
												onblur="if (this.value == '') {this.value = '附加信息';}"></textarea>
											<div class="t-btn">
												<form>
													<input type="submit" value="提交">
												</form>
											</div>
								</div>
							</div>
						</div>
					</div>

					<div class="clearfix"></div>
				</div>
				<!--start-carrer-->
				<!----- Comman-js-files ----->
				<script>
					$(document).ready(function() {
						$("#tab2").hide();
						$("#tab3").hide();
						$("#tab4").hide();
						$(".tabs-menu a").click(function(event) {
							event.preventDefault();
							var tab = $(this).attr("href");
							$(".tab-grid").not(tab).css("display", "none");
							$(tab).fadeIn("slow");
						});
					});
				</script>
			</div>
		</div>
		<div class="copy-rights text-center">
			<p>© 2016 | Design by Ant GROUP</p>
		</div>
	</div>
	<script src="js/responsive-tabs.js"></script>
	<script type="text/javascript">
		$('#myTab a').click(function(e) {
			e.preventDefault();
			$(this).tab('show');
		});

		$('#moreTabs a').click(function(e) {
			e.preventDefault();
			$(this).tab('show');
		});

		(function($) {
			// Test for making sure event are maintained
			$('.js-alert-test').click(function() {
				alert('Button Clicked: Event was maintained');
			});
			fakewaffle.responsiveTabs([ 'xs', 'sm' ]);
		})(jQuery);
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			/*
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<a href="#home" class="scroll" id="toTop" style="display: block;">
		<span id="toTopHover" style="opacity: 1;"> </span>
	</a>
</body>
</html>