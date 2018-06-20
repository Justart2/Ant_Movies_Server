<%@ page import="java.util.*" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cn.ant.entity.*"%>
<%@ page import="com.cn.ant.utils.*"%>
<%
	//session.setAttribute("city_id", "成都");
	
	User user = (User)session.getAttribute("user_info"); 
	List<Movie> likeList = (List<Movie>)request.getAttribute("movie_like_list");
	List<Movie> showingList = (List<Movie>)request.getAttribute("movie_showing_list");
	List<Movie> willshowingList = (List<Movie>)request.getAttribute("movie_willshow_list");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Ant影视城</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/AntMoviesForeground/foreground/css/bootstrap.css"
	rel='stylesheet' type='text/css' />
<link rel="stylesheet"
	href="/AntMoviesForeground/foreground/css/menu.css" />
<link href="/AntMoviesForeground/foreground/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet"
	href="/AntMoviesForeground/foreground/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="/AntMoviesForeground/foreground/css/menu.css" />
<link href="/AntMoviesForeground/foreground/css/megamenu.css"
	rel="stylesheet" type="text/css" media="all" />

<script src="/AntMoviesForeground/foreground/js/jquery.min.js"></script>
<script src="/AntMoviesForeground/foreground/js/bootstrap.min.js"></script>
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>

<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js/jquery.leanModal.min.js"></script>
<script src="/AntMoviesForeground/foreground/js/easyResponsiveTabs.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js/move-top.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js/easing.js"></script>
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
			a2.innerHTML="<%=user.getuName()%>";
			<%}%>
		}
		

	}
	function checkLogin(){
		var a1 = document.getElementById("login_btn");
		var a2 = document.getElementById("u_center");
		if(a1.innerHTML=="退出"){
			window.location="/AntMoviesForeground/user/login-out.do";
		}else{
			$('#myModal').modal('show');
		}
	}
	function checkPerson(){
		var a2 = document.getElementById("u_center");
		if(a2.innerHTML=="个人中心"){
			$('#myModal').modal('show');
		}else{
			window.location.href="/AntMoviesForeground/foreground/personCenter.jsp";
		}
	}
	function choseCity(){
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
				<a class="play-icon popup-with-zoom-anim" href="javascript:void(0)" onclick="choseCity()" id="citys"><%=session.getAttribute("city_id") %></a>
			</div>
			<div class="header-top-right">

				<div style="float: left;">
					<li class="dropdown" style="display: inline-block;"><a
						href="javascript:void(0)" onclick="checkPerson()"
						id="u_center" class="dropdown-toggle"
						style="font-size:1em;margin-top: 4px;">个人中心<b class="caret"></b></a>
					</li>
				</div>

				<button class="btn btn-primary"  id="login_btn"  onclick="checkLogin()" data-toggle="modal"
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
					<a href="/AntMoviesForeground/movies/all_movies.do" class="navbar-brand"><i class="fa fa-home"></i></a>
				</div>
				<!-- end navbar-header -->

				<div id="defaultmenu" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="/AntMoviesForeground/movies/all_movies.do">主页</a></li>
						<!-- Mega Menu -->
						<li class="dropdown w3_megamenu-fw"><a
							href="/AntMoviesForeground/movieshow/all-movie-show.do"
							class="dropdown-toggle">电影排期<b class="caret"></b></a></li>
						<li class="dropdown"><a href="/AntMoviesForeground/foreground/about.jsp" 
							class="dropdown-toggle">关于我们<b class="caret"></b></a>
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


			<!-- AddThis Smart Layers END -->


			<div class="main-banner">
				<div class="banner col-md-8" style="width:100%;height:300px">
					<section class="slider">
					<div class="flexslider">
						<ul class="slides">
							<li><img
								src="/AntMoviesForeground/foreground/images/pic1.jpg"
								class="img-responsive" style="height:300px" alt="" /></li>
							<li><img
								src="/AntMoviesForeground/foreground/images/pic2.jpg"
								class="img-responsive" style="height:300px" alt="" /></li>
							<li><img
								src="/AntMoviesForeground/foreground/images/pic3.jpg"
								class="img-responsive" style="height:300px" alt="" /></li>
							<li><img
								src="/AntMoviesForeground/foreground/images/pic4.jpg"
								class="img-responsive" style="height:300px" alt="" /></li>
						</ul>
					</div>
					</section>
					<!-- FlexSlider -->
					<script defer
						src="/AntMoviesForeground/foreground/js/jquery.flexslider.js"></script>
					<link rel="stylesheet"
						href="/AntMoviesForeground/foreground/css/flexslider.css"
						type="text/css" media="screen" />
					<script type="text/javascript">
						$(function() {
							SyntaxHighlighter.all();
						});
						$(window).load(function() {
							$('.flexslider').flexslider({
								animation : "slide",
								start : function(slider) {
									$('body').removeClass('loading');
								}
							});
						});
					</script>
				</div>
				<div class="col-md-4 banner-right"></div>
				<div class="clearfix"></div>
			</div>
			<div class="review-slider"></div>
			<div class="footer-top-grid">
				<div class="list-of-movies col-md-8">
					<div class="tabs">
						<div class="sap_tabs">
							<div id="horizontalTab"
								style="display: block; width: 100%; margin: 0px;">
								<ul class="resp-tabs-list">
									<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>正在热映</span></li>
									<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>本周上映</span></li>
									<div class="clearfix"></div>
								</ul>
								<div class="resp-tabs-container">
									<div class="tab-1 resp-tab-content"
										aria-labelledby="tab_item-0">
										<ul class="tab_img">
											<%
												for(int i=0;i<showingList.size();i++){
											%>
											<li>
												<div class="view view-first">
													<a
														href="/AntMoviesForeground/movies/movie_detail.do?movie_id=<%=showingList.get(i).getmId()%>">
														<img
														src="<%=HttpUtil.httpURL %>/ant_images/<%=showingList.get(i).getmPicture()%>"
														class="img-responsive" alt="" />
														<div class="percentage-w-t-s"
															style="position:absolute;top:5px;right:5px;padding:5px">
															<h5><%=showingList.get(i).getmRate()%>级</h5>
															<div class="clearfix"></div>
														</div> </a>
													<div class="info1"></div>
													<div class="mask"></div>
													<div class="tab_desc">
														<h4 style="margin-bottom:8px;"><%=showingList.get(i).getmName()%></h4>
														<a href="/AntMoviesForeground/movieshow/all-movie-show.do?movie_id=<%=showingList.get(i).getmId()%>">立即订票</a>

													</div>
												</div>
											</li>
											<%
												}
											%>
											<div class="clearfix"></div>
										</ul>
									</div>
									<div class="tab-1 resp-tab-content"
										aria-labelledby="tab_item-1">
										<ul class="tab_img">
											<%
												for(int i=0;i<willshowingList.size();i++){
											%>
											<li>
												<div class="view view-first">
													<a href="/AntMoviesForeground/movies/movie_detail.do?movie_id=<%=willshowingList.get(i).getmId()%>"><img
														src="<%=HttpUtil.httpURL %>/ant_images/<%=willshowingList.get(i).getmPicture()%>"
														class="img-responsive" alt="" />
														<div class="percentage-w-t-s"
															style="position:absolute;top:5px;right:5px;padding:5px">
															<h5><%=willshowingList.get(i).getmRate()%>级</h5>
															<div class="clearfix"></div>
														</div> </a>
													<div class="mask">
														<div class="info1"></div>
													</div>
													<div class="tab_desc">
														<h4 style="margin-bottom:8px;"><%=willshowingList.get(i).getmName()%></h4>
														<a
															href="javascript:void(0)">立即订票</a>

													</div>
												</div>
											</li>
											<%
												}
											%>
											<div class="clearfix"></div>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					

				</div>
				<div class="right-side-bar">
					<div class="top-movies-in-india">
						<h4>热门电影排行</h4>
						<%
							for(int i=0;i<likeList.size();i++){
						%>
						<ul class="mov_list">
							<li><i class="fa fa-star"></i></li>
							<li><%=likeList.get(i).getmRate()%></li>
							<li><a href="/AntMoviesForeground/movies/movie_detail.do?movie_id=<%=likeList.get(i).getmId() %>"><%=likeList.get(i).getmName()%>
									(<%=likeList.get(i).getmVersion()%>) (<%=likeList.get(i).getmCountry()%>)</a></li>
						</ul>
						<%
							}
						%>

					</div>
				</div>
				<div class="clearfix"></div>

			</div>
			</div>
		</div>
		<div class="copy-rights text-center">
			<p>
				© 2015 My Show. All Rights Reserved | Design by <a
					href="http://w3layouts.com/">W3layouts</a>
			</p>
		</div>
	</div>
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