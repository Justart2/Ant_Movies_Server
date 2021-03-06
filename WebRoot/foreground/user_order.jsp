﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.cn.ant.entity.* , com.cn.ant.utils.*,java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	User user = (User)session.getAttribute("user_info");
	List<Order> orders=(List<Order>)request.getAttribute("user_order");
%>
<html>
<head>
<title>ANT</title>
<link href="/AntMoviesForeground/foreground/css/bootstrap.css"
	rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="/AntMoviesForeground/foreground/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript"
	src="/AntMoviesBackground/background/js/upload.js"></script>
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!--webfont-->
<!-- start menu -->
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js/megamenu.js"></script>
<script>
	$(document).ready(function() {
		$(".megamenu").megamenu();
	});
</script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js/jquery.leanModal.min.js"></script>
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
<!-- center User -->
<link type="text/css" rel="stylesheet"
	href="/AntMoviesForeground/foreground/user_css/base.css" />
<link type="text/css" rel="stylesheet"
	href="/AntMoviesForeground/foreground/user_css/user_center.css" />
<link type="text/css" rel="stylesheet"
	href="/AntMoviesForeground/foreground/user_css/jquery-ui-1.8.5.custom.css">
<script type="text/javascript">
<!--
	var IPData = new Array();
//-->
</script>

<script type="text/javascript"
	src="/AntMoviesForeground/foreground/user_js/jquery-1.4.4.min.js"></script>

<script type="text/javascript"
	src="/AntMoviesForeground/foreground/user_js/cityArray.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/user_js/prvArray.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/user_js/cinemaArray.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/user_js/groupCityArray.js"></script>

<script type="text/javascript"
	src="/AntMoviesForeground/foreground/user_js/getArray.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/user_js/printCity.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/user_js/jquery.boxy.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/user_js/ylDropDownList-1.2.js"></script>
<link rel="stylesheet" rev="stylesheet"
	href="/AntMoviesForeground/foreground/user_css/boxy.css"
	type="text/css" media="screen" />
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/user_js/jquery-ui-1.8.5.custom.min.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/user_js/base.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/user_js/user_center.js"></script>
<link rel="stylesheet" rev="stylesheet"
	href="/AntMoviesForeground/foreground/user_css/quicklogin.css"
	media="screen" />

<!--  -->
</head>
<body>
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
						class="dropdown-toggle" style="font-size:1em;margin-top: 4px;"><%=user.getuName()%><b
							class="caret"></b></a></li>
				</div>

				<button class="btn btn-primary" id="login_btn" onclick="loginOut()"
					data-toggle="modal" data-target="#myModal">退出</button>

			</div>

		</div>
		<div class="clearfix"></div>
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
						<li class="active"><a
							href="/AntMoviesForeground/movies/all_movies.do">主页</a></li>
						<!-- Mega Menu -->
						<li class="dropdown w3_megamenu-fw"><a
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

			<!-- main start -->

			<div class="content">
				<div class="user_center_path">
					您当前的位置：<a href="javascript:void(0)">首页</a> > <a
						href="javascript:void(0)" class="current">个人订单</a>
				</div>

				<div class="user_center_content clearfix">
					<!-- 左侧导航开始 -->

					<div class="user_center_nav">
						<em class="title"> <img id="headerPic" src="<%=HttpUtil.httpURL %>/ant_images/<%=user.getuPicture() %>"
							style="width: 160px; height: 160px" />

						</em>
						<div id="navibar_0">
							<a href="/AntMoviesForeground/foreground/personCenter.jsp">用户中心首页</a>
						</div>
						<div id="navibar_6">
							<a href="/AntMoviesForeground/foreground/zhanghaoshezhi.jsp">账号设置</a>
						</div>
						<div id="navibar_1" class="current">
							<a
								href="/AntMoviesForeground/order/user_order.do?user_id=<%=user.getuId()%>">我的订单</a>
						</div>

					</div>
					<script>
						$(function() {
							var currentNavibar = 'navibar_' + '1';
							$("#" + currentNavibar).attr("class", "current");
						});
					</script>
					<!-- 左侧导航结束 -->
					<!-- 左侧导航结束 -->
					<div class="user_center_main">
						<div class="user_center_title">
							<span class="order_icon">我的订单</span>
						</div>
						<%for(int i=0;i<orders.size();i++){ %>
						<div style="width:750px;height:100px;border:1px dashed #000;font-size:15px;padding:5px;margin:5px;position: relative;">
							<p>
								影院：<%=orders.get(i).getMovieShow().getMoviehall().getMovieCity().getcName()%><br>
								影片：<%=orders.get(i).getMovieShow().getMovie().getmName()%><br>
								场次：<%=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(orders.get(0).getMovieShow()
									.getsTime())%><br> 数量：<%=orders.get(i).getoTicketCount()%>张<br>
								座位：<%=orders.get(i).getMovieShow().getMoviehall().gethName()%>
								<%=orders.get(i).getoSeatInfo()%>
								<br> <font >总价：<%=orders.get(i).getoPrice()%>元
								</font>
								<div style="right:20px;top:50px;position:absolute;color:#EC5C27">
									订单状态：<%=orders.get(i).getoState() %>
								</div>
							</p>

						</div>
					<%} %>
					</div>


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