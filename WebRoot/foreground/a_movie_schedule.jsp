<%@ page import="java.util.*" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cn.ant.entity.*"%>
<%@ page import="com.cn.ant.utils.*"%>
<%
List<MovieShow> ACityMovieShow = (List<MovieShow>)request.getAttribute("a_city_moviec_show");
List<Movie> movieList = (List<Movie>)request.getAttribute("movie_list");
List<MovieCity> movieCityList = (List<MovieCity>)request.getAttribute("moviecity_list");
//session.getAttribute("用户名");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>ANT</title>
<link href="/AntMoviesForeground/foreground/css/bootstrap.css"
	rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link rel="stylesheet"
	href="/AntMoviesForeground/foreground/css/menu.css" />
<link href="/AntMoviesForeground/foreground/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<script src="/AntMoviesForeground/foreground/js/jquery.min.js"></script>
<script src="/AntMoviesForeground/foreground/js/bootstrap.min.js"></script>
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>

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
<!--  -->
<link href="/AntMoviesForeground/foreground/css_1/base.css"
	rel='stylesheet' type='text/css' />
<link href="/AntMoviesForeground/foreground/css_1/movie_times.css"
	rel='stylesheet' type='text/css' />
<link
	href="/AntMoviesForeground/foreground/css_1/jquery-ui-1.8.5.custom.css"
	rel='stylesheet' type='text/css' />
<link href="/AntMoviesForeground/foreground/css_1/boxy.css"
	rel='stylesheet' type='text/css' media="screen" />
<link href="/AntMoviesForeground/foreground/css_1/quicklogin.css"
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
</head>
<body>
	<!-- header-section-starts -->
	<div class="header-top-strip" style="background:#F1F7F7">
		<div class="container" >
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
									title="Enter a valid email" /> <input type="text"
									class="email" placeholder="Mobile Number" maxlength="10"
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
				<div style="float: left;margin-right: 16px;">
					
				<div style="float: left;">
					<a style="font-size:1em;margin-top: 9px;">个人中心</a>
				</div>
				<!---pop-up-box---->
				<link href="/AntMoviesForeground/foreground/css/popuo-box.css"
					rel="stylesheet" type="text/css" media="all" />
				<script
					src="/AntMoviesForeground/foreground/js/jquery.magnific-popup.js"
					type="text/javascript"></script>
				<!---//pop-up-box---->
				<div id="small-dialog1" class="mfp-hide">
					
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
				<!-- 登陆界面显示
				 <script>
					$('#myModal').modal('show');
				</script> -->
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="container">
		<div class="main-content">
			<div class="header">
				<div class="logo" style="float: left">
					<h1>Ant影视城</h1>
				</div>
				<div style="float: left">
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
					<a href="index.html" class="navbar-brand"><i class="fa fa-home"></i></a>
				</div>
				<!-- end navbar-header -->

				<div id="defaultmenu" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active" ><a style="background:#003B64;color:#fff"
							href="/AntMoviesForeground/foreground/index.jsp">主页</a></li>
						<li class="dropdown w3_megamenu-fw" style="background:#FFF200;"><a
							href="/AntMoviesForeground/foreground/movie_schedule.jsp"
							class="dropdown-toggle" style="color:#000;font-size:15px">电影排期<b class="caret"></b></a></li>
						<!-- Mega Menu -->
						<li class="dropdown"><a href="#" data-toggle="dropdown"
							class="dropdown-toggle">关于我们<b class="caret"></b></a>
							<ul class="dropdown-menu" role="menu">

								<li><a href="/AntMoviesForeground/foreground/about.jsp">关于我们</a></li>
								<li><a href="/AntMoviesForeground/foreground/contact.jsp">联系我们</a></li>
							</ul> <!-- end dropdown-menu --></li>
						<!-- end dropdown-submenu -->
					</ul>
					<!-- end dropdown-menu -->
					</li>
					<!-- end standard drop down -->
					<!-- end dropdown w3_megamenu-fw -->
					</ul>
					<!-- end nav navbar-nav -->
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"></li>
					</ul>
				</div>
				<!-- end #navbar-collapse-1 --> </nav>
				<!-- end navbar navbar-default w3_megamenu -->
			</div>
			<div class="review-slider" >
					<!-- 影片信息 -->
					<div id="filmTime" class="" style="display: block;">
						<%for(int j= 0;j<movieList.size();j++){ %>
						<b class="title" id="20160420053659188722_title">7月19日
							&gt;&gt; 
							
							<a class="alightblue" target="_blank"
							href="">&nbsp;<%=movieCityList.get(0).getcName() %></a>
							&gt;&gt; 
							
							<a class="alightblue" target="_blank"
							href=""><%=movieList.get(j).getmName() %></a>
						</b>
						<table width="1000" border="0" class="movie_list"
							align="center">
							<tbody>
								<tr align="center" class="bg bgc">
									
									<td width="12%"><b class="title2">放映时间</b></td>
									<td width="16%"><b class="title2">影厅空位</b></td>
									<td width="8%"><b class="title2">语言</b></td>
									<td width="8%"><b class="title2">版本</b></td>
									<td width="8%"><b class="title2">片长</b></td>
									<td width="18%"><b class="title2">优惠信息</b></td>
									<td width="12%"><b class="title2">网购价</b></td>
									<td width=""><b class="title2">购票</b></td>
								</tr>
								<%for(int k = 0;k<ACityMovieShow.size();k++){ 
									if(ACityMovieShow.get(k).getMovie().getmName().equals(movieList.get(j).getmName())){
								%>
								<tr align="center" class="bgc bgcs">
									
									<td><b class="org" name="showTime"><%=ACityMovieShow.get(k).getMovie().getmReleaseTime() %></b></td>
									<td><span style="color:#769B70"><b>余63/85</b></span></td>
									<td><%=ACityMovieShow.get(k).getMovie().getmCountry() %></td>
									<td name="version"><%=ACityMovieShow.get(k).getMovie().getmVersion() %></td>
									<td><%=ACityMovieShow.get(k).getMovie().getmTimeLength() %>分钟</td>
									<td><div style="color:#ED5C27;">
											<b>全场<%=ACityMovieShow.get(k).getsOnSale() %>折</b>
										</div></td>
									<td><b class="org"><%=ACityMovieShow.get(k).getMovie().getmPrice() %>元</b>
									</td>
									<td ><a style="width:110px;height:40px;background:#5DB6E0;font-size:17px;color:#fff;"
										href="/AntMoviesForeground/userdo/chose_seat.do?movie_show_id=<%=ACityMovieShow.get(k).getsId() %>">购票</a></td>
								</tr>
								<%}} %>
							</tbody>
						</table>
						
					
<style>
#order_tip_dialog {
	display: none;
	height: auto !important;
}

#order_tip_dialog .attention_edit_main {
	font-size: 14px;
	color: #000000;
	height: auto;
	line-height: 28px;
	text-align: center;
}
</style>
		<%} %>
			</div>
		</div>
	</div>
</div>


		</div>

		<!--orderTipDialog end-->
		<div id="dialogFrame2" style="display:none;"></div>
		<div class="copy-rights text-center">
			<p>
				© 2016 | Design by <a href="about.jsp">Ant</a>
			</p>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {

			/* var defaults = {
				containerID : 'toTop', // fading element id
				containerHoverID : 'toTopHover', // fading element hover id
				scrollSpeed : 1200,
				easingType : 'linear'
			}; */

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