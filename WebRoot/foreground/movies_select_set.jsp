<%@ page import="java.util.*" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cn.ant.entity.*"%>
<%@ page import="com.cn.ant.utils.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	User user = (User)session.getAttribute("user_info");
	MovieShow movieShow = (MovieShow) session
			.getAttribute("movie_show_for_seat");
	String[] seatRow = movieShow.getMoviehall().gethSeat().split(";");
	ArrayList<String> choseSeatList = new ArrayList<String>();
	Float acount = movieShow.getMovie().getmPrice();
	Integer discount = movieShow.getsOnSale();
	if(discount!=0&&discount!=null){
		acount = acount*discount/10;
	}
	String result=(String)request.getAttribute("result");
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Ant选座购票</title>
<link href="/AntMoviesForeground/foreground/css/bootstrap.css"
	rel='stylesheet' type='text/css' />
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
<script src="/AntMoviesForeground/foreground/js/easyResponsiveTabs.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#horizontalTab').easyResponsiveTabs({
			type : 'default', //Types: default, vertical, accordion           
			width : 'auto', //auto or any width like 600px
			fit : true
		// 100% fit in a container
		});
	});
</script>
<script type="text/javascript">
 	
 	function getXMLHttprequest(){
 		return new XMLHttpRequest();
 	}
    function getPhoneNum(){
 		var number=document.getElementById("regMobile").value;
 		xmlhttp=getXMLHttprequest();
 		xmlhttp.open("get","/AntMoviesForeground/other/phone_check.do?phone_num="+number,true);
 		xmlhttp.onreadystatechange=callBacka9;
 		xmlhttp.send();
    }
    function callBacka9(){
    	if(xmlhttp.readyState==4 && xmlhttp.status==200){
    		var xmlDoc=xmlhttp.responseXML;
    		var code=xmlDoc.getElementsByTagName("message")[0].firstChild.nodeValue;
    		document.getElementById("phone_result").innerHTML=code;
    	}
    }
</script>

<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js/move-top.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js/easing.js"></script>

<!--  -->
<link href="/AntMoviesForeground/foreground/movie_schedual/base.css"
	rel='stylesheet' type='text/css' />
<link
	href="/AntMoviesForeground/foreground/movie_schedual/movie_times.css"
	rel='stylesheet' type='text/css' />
<link
	href="/AntMoviesForeground/foreground/movie_schedual/bjquery-ui-1.8.5.custom.css"
	rel='stylesheet' type='text/css' />
<link href="/AntMoviesForeground/foreground/movie_schedual/boxy.css"
	rel='stylesheet' type='text/css' media="screen" />
<link
	href="/AntMoviesForeground/foreground/movie_schedual/quicklogin.css"
	rel='stylesheet' type='text/css' />
<style type="">
#filmDiv a {
	width: 202px;
}

#cinemaDiv a {
	width: 270px;
}
</style>
<!--  -->
<!-- 选座的js 和CSS -->
<link type="text/css" rel="stylesheet"
	href="/AntMoviesForeground/foreground/css_1/movie_buy.css" />
<link type="text/css" rel="stylesheet"
	href="/AntMoviesForeground/foreground/css_1/base.css" />
<link
	href="/AntMoviesForeground/foreground/css_1/jquery-ui-1.8.5.custom.css"
	rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet"
	href="/AntMoviesForeground/foreground/css_1/jquery.lightbox-0.5.css" />
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js_1/cityArray.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js_1/jsArray/prvArray.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js_1/cinemaArray.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js_1/groupCityArray.js"></script>

<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js_1/getArray.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js_1/printCity.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js_1/jquery.boxy.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js_1/ylDropDownList-1.2.js"></script>
<link rel="stylesheet" rev="stylesheet"
	href="/AntMoviesForeground/foreground/css_1/boxy.css" type="text/css"
	media="screen" />
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js_1/jquery.lightbox-0.5.min.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js_1/jquery-ui-1.8.5.custom.min.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js_1/base.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js_1/movie_buy.js"></script>
<link rel="stylesheet" rev="stylesheet"
	href="/AntMoviesForeground/foreground/css_1/quicklogin.css"
	media="screen" />
<!-- InstanceEndEditable -->
<script>
	javascript: window.history.forward(1);
</script>
<style>
.aodi_dialog {
	z-index: 1002;
	outline: 0px;
	position: fixed;
	height: auto;
	width: 100%;
	top: 10%;
	overflow: visible;
}
</style>

<script>
	var states = new Array();
	<%
			for (int i = 0; i < seatRow.length; i++) {%>
				states[<%=i%>] = new Array();
				<%for (int j = 0; j < seatRow[i].length(); j++) {%>
					states[<%=i%>][<%=j%>] = "<%=seatRow[i].charAt(j) + ""%>";
				<%}
			}%>
	var choseSeat = new Array();
	function changeImage(str) {
		
		 
			var strs= new Array();
			strs=str.split(" ");
			var i=strs[0];
			var j=strs[1];
			var img = document.getElementById(i+""+j);
			var seatElement = document.getElementById("seat");
			var priceAmount = document.getElementById("amount");
			var seatss = "";
			if (states[i][j] == "0") {
				if(choseSeat.length<6){
				img.src = "/AntMoviesForeground/foreground/image_1/sit_div_img3.jpg";
				states[i][j] = "1";
				choseSeat.push(i+"."+j);
				//alert(choseSeat[0]);
				
				for(var s = 0;s<choseSeat.length;s++){
					seatss+="【 "+(choseSeat[s].split(".")[0]-0+1)+"排，"+(choseSeat[s].split(".")[1]-0+1)+"座 】";
				}
				//alert(seatss);
				seatElement.innerHTML=seatss;
				priceAmount.innerHTML= choseSeat.length*<%=acount%>;
				}else{
					alert("您最多只能买6张票");
				}
			} else {
				img.src = "/AntMoviesForeground/foreground/image_1/sit_div_img.jpg";
				states[i][j] = "0";
				for(var x=0;x<choseSeat.length;x++){
					var temp = i+"."+j;
					if(choseSeat[x]==temp){
						var a = choseSeat[choseSeat.length-1];
						choseSeat[choseSeat.length-1] = choseSeat[x];
						choseSeat[x] = a;
						choseSeat.pop();
						
					}
				}
				for(var s = 0;s<choseSeat.length;s++){
					seatss+="【 "+(choseSeat[s].split(".")[0]-0+1)+"排，"+(choseSeat[s].split(".")[1]-0+1)+"座 】";
				}
				//alert(seatss);
				seatElement.innerHTML = seatss;
				priceAmount.innerHTML = choseSeat.length*<%=acount%>
	;
		}
	}
	function sendSeat() {
		if (choseSeat.length == 0) {
			alert("您还没有选择座位！");
		} else {
			var a2 = document.getElementById("u_center");
			if(a2.innerHTML=="个人中心"){
				$('#myModal').modal('show');
			}else{
				var seatElement = document.getElementById("seat");
				var priceAmount = document.getElementById("amount");
				window.location.href = "/AntMoviesForeground/order/get_order.do?seat="
						+ choseSeat + "&acount=" + priceAmount.innerHTML;
			}
			
		}
	}
</script>
<style>
.seat_content tr {
	height: 35px;
}

.seat_content tr td {
	width: 30px;
	height: 30px;
}
</style>
<!--  -->
<script type="text/javascript">
	function checklogin() {
		var a1 = document.getElementById("login_btn");
		var a2 = document.getElementById("u_center");
		var users = "<%=user%>";
		if(users=="null"){
			a1.innerHTML="登录";
			a2.innerHTML="个人中心";
		}else{
			a1.innerHTML="退出";
			<%if(user!=null){%>
			a2.innerHTML="<%=user.getuName()%>
	";
<%}%>
	}

	}
	function checkLogin() {
		var a1 = document.getElementById("login_btn");
		var a2 = document.getElementById("u_center");
		if (a1.innerHTML == "退出") {
			window.location = "/AntMoviesForeground/user/login-out.do";
		} else {
			$('#myModal').modal('show');
		}
	}
	function checkPerson() {
		var a2 = document.getElementById("u_center");
		if (a2.innerHTML == "个人中心") {
			$('#myModal').modal('show');
		} else {
			window.location.href = "/AntMoviesForeground/foreground/personCenter.jsp";
		}
	}
	function choseCity() {
		var city = document.getElementById("citys");
		window.location.href = "/AntMoviesForeground/foreground/searchcity/SearchCity.html";
	}
</script>

</head>
<body onload="checklogin()">
	<!-- header-section-starts -->
	<div class="header-top-strip">
		<div class="container">
			<div class="header-top-left">
				<a class="play-icon popup-with-zoom-anim" href="javascript:void(0)"
					onclick="choseCity()" id="citys"><%=session.getAttribute("city_id")%></a>
			</div>
			<div class="header-top-right">

				<div style="float: left;">
					<li class="dropdown" style="display: inline-block;"><a
						href="javascript:void(0)" onclick="checkPerson()" id="u_center"
						class="dropdown-toggle" style="font-size:1em;margin-top: 4px;">个人中心<b
							class="caret"></b></a></li>
				</div>

				<button class="btn btn-primary" id="login_btn"
					onclick="checkLogin()" data-toggle="modal" data-target="#myModal">登录</button>
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
										style="border-right: 1px dotted #C2C2C2;padding-right: 30px;">
										<!-- Nav tabs -->
										<ul class="nav nav-tabs">
											<li class="active"><a href="#Login" data-toggle="tab">登陆</a></li>
											<li><a href="#Registration" data-toggle="tab">注册</a></li>
										</ul>
										<!-- Tab panes -->
										<div class="tab-content">
											<div class="tab-pane active" id="Login">
												<form class="form-horizontal"
													action="/AntMoviesForeground/user/login.do" method="post">
													<div class="form-group">
														<label for="email" class="col-sm-2 control-label">
															账号</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" name="user_code"
																id="email1" placeholder="Email" />
														</div>
													</div>
													<div class="form-group">
														<label for="exampleInputPassword1"
															class="col-sm-2 control-label"> 密码</label>
														<div class="col-sm-10">
															<input type="password" name="user_psw"
																class="form-control" id="exampleInputPassword1"
																placeholder="password" />
														</div>
													</div>
													<div class="row">
														<div class="col-sm-2"></div>
														<div class="col-sm-10">
															<button type="submit" class="btn btn-primary btn-sm">
																登录</button>
															<a href="javascript:;">Forgot your password?</a>
														</div>
													</div>
												</form>
											</div>
											<div class="tab-pane" id="Registration">
												<form action="/AntMoviesForeground/user/register.do"
													method="post" class="form-horizontal">
													<div class="form-group">
														<label for="email" class="col-sm-2 control-label">
															昵称</label>
														<div class="col-sm-10">
															<div class="row">
																<div class="col-md-3">
																	<select class="form-control" name="user_sex">
																		<option>先生</option>
																		<option>女士</option>

																	</select>
																</div>
																<div class="col-md-9">
																	<input type="text" name="user_nake"
																		class="form-control" placeholder="Name" />
																</div>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label for="email" class="col-sm-2 control-label">
															邮箱：</label>
														<div class="col-sm-10">
															<input type="email" name="user_email"
																class="form-control" id="email" placeholder="Email" />
														</div>
													</div>
													<div class="form-group">
														<label for="mobile" class="col-sm-2 control-label">
															电话：</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" name="user_phone"
																id="mobile" placeholder="Mobile" />
														</div>
													</div>
													<div class="form-group">
														<label for="password" class="col-sm-2 control-label">
															密码：</label>
														<div class="col-sm-10">
															<input type="password" name="user_password"
																class="form-control" id="password"
																placeholder="Password" />
														</div>
													</div>
													<div class="row">
														<div class="col-sm-2"></div>
														<div class="col-sm-10">
															<button type="submit" class="btn btn-primary btn-sm">
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
										<div class="row text-center sign-with">
											<img
												src="/AntMoviesForeground/foreground/images/ant_logo.jpg" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="container">
		<div class="main-content">
			<div class="header">
				<div class="logo" style="float:left">
					<a href="index.html"><h1>Ant影视城</h1></a>
				</div>
				<div style="float:left">
					<img src="/AntMoviesForeground/foreground/images/ant_logo.jpg"
						width="45px" height="38px" />
				</div>
				<div class="search">
					<div class="search2">
						<form>
							<i class="fa fa-search"></i> <input type="text"
								value="请输入你要查询的关键字" onfocus="this.value = '';"
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
					<a href="/AntMoviesForeground/movies/all_movies.do"
						class="navbar-brand"><i class="fa fa-home"></i></a>
				</div>
				<!-- end navbar-header -->

				<div id="defaultmenu" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="dropdown w3_megamenu-fw"><a
							href="/AntMoviesForeground/movies/all_movies.do">主页</a></li>
						<!-- Mega Menu -->
						<li class="active"><a
							href="/AntMoviesForeground/movieshow/all-movie-show.do"
							class="dropdown-toggle">电影排期<b class="caret"></b></a></li>
						<li class="dropdown"><a
							href="/AntMoviesForeground/foreground/about.jsp"
							class="dropdown-toggle">关于我们<b class="caret"></b></a> <!-- end dropdown-menu --></li>
						<!-- end dropdown-submenu -->
					</ul>
					<!-- end dropdown-menu -->
					</li>
					<!-- end standard drop down -->
					<!-- end dropdown w3_megamenu-fw -->
					</ul>
					<!-- end nav navbar-nav -->

					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" data-toggle="dropdown"
							class="dropdown-toggle">联系我们<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li>
									<form id="contact1" action="#" name="contactform" method="post">
										<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
											<input type="text" name="name" id="name1"
												class="form-control" placeholder="Name"> <input
												type="text" name="email" id="email1" class="form-control"
												placeholder="Email">
										</div>
										<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
											<input type="text" name="phone" id="phone1"
												class="form-control" placeholder="Phone"> <input
												type="text" name="subject" id="subject1"
												class="form-control" placeholder="Subject">
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<textarea class="form-control" name="comments" id="comments1"
												rows="6" placeholder="Your Message ..."></textarea>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="pull-right">
												<input type="submit" value="SEND" id="submit1"
													class="btn btn-primary small">
											</div>
										</div>
										<div class="clearfix"></div>
									</form>
								</li>
							</ul></li>
					</ul>
					<!-- end nav navbar-nav navbar-right -->
				</div>
				<!-- end #navbar-collapse-1 --> </nav>
				<!-- end navbar navbar-default w3_megamenu -->

			</div>

			<!-- end container -->

			<div class="e-payment-section">
				<div class="content clearfix" style="">
					<div class="crumbs">
						您当前的位置：<a href="javascript:void(0)" class="aashy"
							style="display:inline">电影排期</a> > <a class="aashy"
							href="javascript:void(0)" style="display:inline">选座</a>
					</div>
					<input type="hidden" name="noLevelHintFlag" id="noLevelHintFlag"
						value="1" />
					<div class="bgwhite sit" style="height:500px">
						<h3>
							选择座位 <span><label id="cinemaId"></label><%=movieShow.getMoviehall().getMovieCity().getcName()%>，<%=movieShow.getMovie().getmName()%>，<label
								id="filmT"><%=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(movieShow
					.getsTime())%></label>点，<label id="filmC"><%=movieShow.getMoviehall().gethName()%></label></span>
							<!-- 
			<a class="ablue" href="movie_times.html">返回放映时刻表</a>
			-->
						</h3>
						<div class="choose_exp clearfix">
							<div style="float:left;padding-top:30px">
								<img src="/AntMoviesForeground/foreground/image_1/sit_div.jpg" />
							</div>
							<div id="sit_green" style="margin-left:168px">
								<img
									src="/AntMoviesForeground/foreground/image_1/sit_div_img.jpg"></img><span
									style="position:absolute;margin-left:5px">可选的座位</span>
							</div>
							<div class="sit_ashy">
								<img
									src="/AntMoviesForeground/foreground/image_1/sit_div_img2.jpg"></img><span
									style="position:absolute;margin-left:2px">已售出的座位</span>
							</div>
							<div class="sit_orange" style="margin-left:36px">
								<img
									src="/AntMoviesForeground/foreground/image_1/sit_div_img3.jpg"></img><span
									style="position:absolute;margin-left:5px">您选择的座位</span>
							</div>



							<div class="seat_content"
								style="margin-top:10px;height:auto;width:100%" id="sit_div">

								<table
									style="margin:auto;margin-top:50px;text-align:center;border: 0px;">
									<%
										for (int i = 0; i < seatRow.length; i++) {
									%>
									<tr height="10px">
										<td><%=i + 1%></td>
										<%
											for (int j = 0; j < seatRow[i].length(); j++) {
																																					if ((seatRow[i].charAt(j) + "").equals("0")) {
										%>
										<td><a href="javascript:void(0)"
											onclick="changeImage('<%=i+" "+j%>')"> <img
												src="/AntMoviesForeground/foreground/image_1/sit_div_img.jpg"
												id="<%=i+""+j%>" />
										</a></td>
										<%
											}
																																					if ((seatRow[i].charAt(j) + "").equals("1")) {
										%>
										<td><a href="javascript:void(0)"> <img
												src="/AntMoviesForeground/foreground/image_1/sit_div_img2.jpg"
												id="" />
										</a></td>
										<%
											}
																																					if ((seatRow[i].charAt(j) + "").equals(" ")) {
										%>
										<td></td>
										<%
											}
										%>

										<%
											}
										%>
										<td><%=i + 1%></td>
									</tr>
									<%
										}
									%>
								</table>
							</div>
						</div>

						<a id="rest" class="alightblue" style="display: none"
							href="javascript:void(0)" onclick="rest();">重新选座</a>
					</div>
					<div class="bgwhite money" style="width:1000px">
						<p
							style="margin-left:30px;padding-left:0px;padding-top:10px;padding-bottom:10px">
							您选择了：<span id="seat"></span> <span id="goods" class=""></span>
						</p>
						<span class="moneytal">订单总金额：<span id="amount">0.00</span>元
							<span id="buyBtn"> <img src="image/loading.gif"
								class="nextbtn_loading" /> <a href="javascript:void(0)"
								onclick="sendSeat()" id="nextbtn" class="button_green_next">下一步</a>
						</span>
						</span>
					</div>

				</div>
			</div>
		</div>
		<div class="copy-rights text-center">
			<p>© 2016 | Ant GROUP</p>
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