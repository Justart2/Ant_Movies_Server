<%@ page import="java.util.*" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cn.ant.entity.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.cn.ant.utils.*"%>
<%
	User user = (User)session.getAttribute("user_info");
	Movie movie = (Movie)request.getAttribute("movie_info");
	List<UserEvaluate> movieEva = (List<UserEvaluate>)request.getAttribute("movie_evaluate");
	String[] movieAnyPic = movie.getmStagePhotos().split(";");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Ant电影详情</title>
<link rel="stylesheet"
	href="/AntMoviesForeground/foreground/css/bootstrap.css"
	type='text/css' />
<link rel="stylesheet"
	href="/AntMoviesForeground/foreground/css/style.css" type="text/css" />
<link rel="stylesheet"
	href="/AntMoviesForeground/foreground/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="/AntMoviesForeground/foreground/css/menu.css" />
<link rel="stylesheet"
	href="/AntMoviesForeground/foreground/css/megamenu.css" type="text/css" />

<link
	href="/AntMoviesForeground/foreground/css_1/jquery-ui-1.8.5.custom.css"
	rel="stylesheet" type="text/css"></link>
<link type="text/css" rel="stylesheet"
	href="/AntMoviesForeground/foreground/css_1/jquery.lightbox-0.5.css" />
<link type="text/css" rel="stylesheet"
	href="/AntMoviesForeground/foreground/css_1/base.css" />
<link type="text/css" rel="stylesheet"
	href="/AntMoviesForeground/foreground/css_1/movie_details.css" />
<link rel="stylesheet"
	href="/AntMoviesForeground/foreground/css_1/user_pagination.css"
	type="text/css"></link>
<link rel="stylesheet" rev="stylesheet"
	href="/AntMoviesForeground/foreground/css_1/boxy.css" type="text/css"
	media="screen" />
<style type="text/css">
.cboxPhoto {
	width: 700px !important;
	height: 504px !important;
}
</style>
<script type="text/javascript">
	var IPData = new Array();
</script>

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
<script src="/AntMoviesForeground/foreground/js/easyResponsiveTabs.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js/move-top.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js/easing.js"></script>
<script src="/AntMoviesForeground/foreground/js/jquery.min.js"></script>
<script src="/AntMoviesForeground/foreground/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js_1/cityArray.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js_1/prvArray.js"></script>
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
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js/jquery.knob.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js_1/jquery-ui-1.8.5.custom.min.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js/jquery.lightbox-0.5.min.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js/jquery.pagination.js"></script>
<script language="javascript"
	src="/AntMoviesForeground/foreground/js/movie_details.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js_1/base.js"></script>
	
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
	function evaluate_submit(){
		var a2 = document.getElementById("u_center");
		if(a2.innerHTML=="个人中心"){
			$('#myModal').modal('show');
		}else{
			var contents = document.getElementById("evaluate_content").value;
			if(contents==""){
				alert("您还没有评价！");
			}else{
				<%if(user!=null){%>
				window.location.href="/AntMoviesForeground/user/evaluate.do?user_id=<%=user.getuId()%>&movie_id=<%=movie.getmId()%>&evaluate_content="+contents;
				<%}%>
				
			}
			
		}
	}
</script>

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

			<!-- main start -->
			<div class="content" style="width:1000px;margin:auto;padding:0px">

				<div class="crumbs">
					您当前的位置：<a href="javascript:void(0)" class="aashy"
						style="display:inline">首页</a> > <a class="aashy"
						href="javascript:void(0)" style="display:inline">正在热映</a> > <a
						class="ablack" href="javascript:void(0)"
						style="display:inline; cursor: default;"
						title="快手枪手快枪手 For A Few Bullets"><b><%=movie.getmName()%></b></a>
				</div>
				<div class="bgwhite movie_information"
					style="width:1000px;margin:auto;">
					<span class="date">
						<div class="info_details">
							<h5>
								上映日期：<%=new SimpleDateFormat("yyyy-MM-dd").format(movie.getmReleaseTime()) %>
							</h5>
							<dl>
								<dt>导演：</dt>
								<dd><%=movie.getmDirector()%></dd>
								<dt>主演：</dt>
								<dd><%=movie.getmActor()%></dd>
								<dt>类型：</dt>
								<dd><%=movie.getmType()%></dd>
								<dt>国家：</dt>
								<dd><%=movie.getmCountry()%></dd>
								<dt>版本：</dt>
								<dd><%=movie.getmVersion()%></dd>
								<dt>片长：</dt>
								<dd><%=movie.getmTimeLength()%></dd>
							</dl>
							<a id="button_orange_gp" href="/AntMoviesForeground/movieshow/all-movie-show.do?movie_id=<%=movie.getmId()%>"
								class="set_attention_sub">购票</a>
						</div>
						<div class="appraise">
							<img
								src="<%=HttpUtil.httpURL %>/ant_images/<%=movie.getmPicture()%>"
								width="220px" height="255px" />
						</div>
					</span>
					<div class="story">
						<h5>影片剧情：</h5>
						<p style="margin:5px">
							<!-- 不要折行，折行会使两个连接的字之间有空格 -->
							<%=movie.getmDescription()%>
						</p>
					</div>
					<div class="story">
						<h5>影片剧照：</h5>
						<a id="a_qdz_2" style="display:none;"
							onclick="perfectWorld_submit()" href="javascript:void(0)"></a>
						<div class="movie_imges clearfix">
							<%
								for (int i = 0; i < movieAnyPic.length; i++) {
							%>
							<a
								href="<%=HttpUtil.httpURL %>/ant_images/<%=movieAnyPic[i]%>"
								class="movie_imge"> <img
								src="<%=HttpUtil.httpURL %>/ant_images/<%=movieAnyPic[i]%>"
								alt="<%=movie.getmName()%>" />
							</a>
							<%
								}
							%>
						</div>
					</div>
					<div class="movie_say">
						<h5 style="padding-left:15px">影评</h5>
						<!-- 评论展示区 start -->
						<%
							for (int i = 0; i < movieEva.size(); i++) {
						%>
						<div
							style="width:230px;height:130px;margin:20px;float:left;border:1px solid #5DB6E0;background:#F1F1F1;padding:5px;position:relative;">
							<h5><%=movieEva.get(i).getUser().getuName()%></h5>
							<div style="height:65px;text-align:center;width:100%;font-size:15px;"><%=movieEva.get(i).geteInfo()%></div>
							<div style="position:absolute;right:5px;bottom:0px;"><%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
						.format(movieEva.get(i).geteTime())%></div>
						</div>
						<%
							}
						%>
						<!-- 评论展示区 end -->
						<div class="paging pagination"></div>
					</div>

					<div class="movie_say_say" id="cinecism">
						<table id="say_main">
							<thead>
								<tr>
									<th style="padding:5px 5px;" colspan="2"><h5>发影评：</h5></th>
								</tr>
							</thead>

							<tbody>


								<tr>
									<td colspan="2" style=" position:relative;display:block;"><textarea
											wrap="virtual" id="evaluate_content" name="content" width="800px"
											onkeydown="countChar('content','counter',event);"
											onkeyup="countChar('content','counter',event);">
           				</textarea></td>
								</tr>
								<tr>
									<td colspan="2"><div
											style="border-top:1px solid #f1f1f1; margin-top: 30px;margin-bottom: 0px;"></div></td>
								</tr>
								<tr>

									<td><a href="javascript:void(0)" 
										onclick="evaluate_submit()" class="set_attention_sub"
										style="float:right; margin-top:10px;">发表</a>
										<p id="greyTxt">
											<span id="prompt_content">您可以输入</span><span id="counter">5
												— 140</span>个字
										</p></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
</body>
</html>