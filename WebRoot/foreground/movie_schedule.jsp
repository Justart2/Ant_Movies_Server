<%@ page import="java.util.*" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cn.ant.entity.*"%>
<%@ page import="com.cn.ant.utils.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
User user = (User)session.getAttribute("user_info");
List<MovieShow> ACityAMovieShow = (List<MovieShow>)request.getAttribute("a_city_a_movie_show");
List<MovieShow> movieList = (List<MovieShow>)request.getAttribute("movie_list");
List<MovieShow> movieCityList = (List<MovieShow>)request.getAttribute("moviecity_list");
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
<script type="text/javascript">
<%
String arras = (String)request.getAttribute("array");
String array[] = new String[4];
if(arras!=null){
		array = arras.split(",");
	}

%>;
//alert('<%=arras%>');
var paiQ = new Array();
	if(<%=arras%>==null){
		paiQ = new Array();
		paiQ[0] = "<%=DateUtils.getCurrentDate()%>";
		paiQ[1] = "<%=DateUtils.getTommrrowDate()%>";
		<%if(movieCityList.size()>0){%>
		paiQ[2] = "<%=movieCityList.get(0).getMoviehall().getMovieCity().getcId()%>";
		<%}%>
		<%if(movieList.size()>0){%>
		paiQ[3] = "<%=movieList.get(0).getMovie().getmId()%>";
		<%}%>
	}else{
		paiQ[0] = "<%=array[0]%>";
		paiQ[1] = "<%=array[1]%>";
		paiQ[2] = "<%=array[2]%>";
		paiQ[3] = "<%=array[3]%>";
	}
	
	//alert(paiQ[2]);
	function filmClicks(movieId) {
		//alert(movieName);
		paiQ[3] = movieId;
		window.location.href = "/AntMoviesForeground/movieshow/all-movie-show.do?time1="
				+ paiQ[0]
				+ "&time2="
				+ paiQ[1]
				+ "&movie_city_id="
				+ paiQ[2]
				+ "&movie_id="
				+ paiQ[3]
				+ "&array="+paiQ;
	}
	function filmCityClicks(movieCityId) {
		paiQ[2] = movieCityId;
		window.location.href = "/AntMoviesForeground/movieshow/all-movie-show.do?time1="
				+ paiQ[0]
				+ "&time2="
				+ paiQ[1]
				+ "&movie_city_id="
				+ paiQ[2]
				+ "&movie_id="
				+ paiQ[3]
				+ "&array="+paiQ;;
	}
	function movieTime(time) {
		paiQ[0] = time;
		paiQ[1] = dateAdd(time,1);
		window.location.href = "/AntMoviesForeground/movieshow/all-movie-show.do?time1="
				+ paiQ[0]
				+ "&time2="
				+ paiQ[1]
				+ "&movie_city_id="
				+ paiQ[2]
				+ "&movie_id="
				+ paiQ[3]
				+ "&array="+paiQ;;
	}
	
	
	
	Date.prototype.format = function (format) {
        var args = {
            "M+": this.getMonth() + 1,
            "d+": this.getDate(),
            "h+": this.getHours(),
            "m+": this.getMinutes(),
            "s+": this.getSeconds(),
            "q+": Math.floor((this.getMonth() + 3) / 3),  //quarter
            "S": this.getMilliseconds()
        };
        if (/(y+)/.test(format))
            format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var i in args) {
            var n = args[i];
            if (new RegExp("(" + i + ")").test(format))
                format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? n : ("00" + n).substr(("" + n).length));
        }
        return format;
    };

	function dateAdd(date,number) {
		var dates = new Date(date);
     	dates.setDate(dates.getDate() + number);
     	return dates.format("yyyy-MM-dd");
	}

</script>
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
						<li class="dropdown w3_megamenu-fw"><a href="/AntMoviesForeground/movies/all_movies.do">主页</a></li>
						<!-- Mega Menu -->
						<li class="active"><a
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
			
			
			<!-- end container -->
				<div class="review-slider">
					<div class="content">

						<table width="1000" style="+margin-top:0px; margin-bottom: 5px;"
							border="1" cellspacing="0" cellpadding="0">
							<tbody style="width: 100%">
								<tr>
									<th valign="middle" scope="col"
										style="border-left-color:#5db6e0; width: 150px;text-align: center;">放映日期</th>
									<th scope="col" class="th1"
										style="width: 310px;text-align: center;">影城 <a href=""
										class="cinamasel1" id="pictureLilang" style="display: none"></a></th>
									<th scope="col" style="width: 310px;text-align: center;">影片</th>
									<!-- <th scope="col" style="width: 80px;text-align: center;">时间</th> -->
								</tr>
								<tr style="font-size:1.3em">
									<td class="center" style="vertical-align: top">
										<div class="cows6 sco" id="filmTimeDiv">
											<a href="javascript: void(0);" onclick="movieTime('<%=DateUtils.getCurrentDate()%>')" class="gbcr" id="<%=DateUtils.getCurrentDate()%>" name="今日上映"><%=DateUtils.getCurrentDate()%></a>
											<a href="javascript: void(0);" onclick="movieTime('<%=DateUtils.getTommrrowDate()%>')" id="<%=DateUtils.getTommrrowDate()%>" name="明日上映"><%=DateUtils.getTommrrowDate()%></a>
										</div>
									</td>
									<td style="vertical-align: top;" class="">
										<div class="cows4 sco" id="cinemaDiv">
											<%
												for(int i=0;i<movieCityList.size();i++){
											%>
											<a href="javascript:void(0);"
												onclick="filmCityClicks('<%=movieCityList.get(i).getMoviehall().getMovieCity().getcId()%>')"
												class="gbcr">&nbsp;<%=movieCityList.get(i).getMoviehall().getMovieCity().getcName()%></a>
											<%
												}
											%>
										</div>
									</td>
									<td style="vertical-align: top;">
										<div class="cows3 sco" style="vertical-align: top"
											id="filmDiv">
											<%
												for(int i=0;i<movieList.size();i++) {
											%>
											<a href="javascript: void(0);" class="gbcr" id="movid_id"
												onclick="filmClicks('<%=movieList.get(i).getMovie().getmId()%>')"
												title="">&nbsp;<%=movieList.get(i).getMovie().getmName()%></a>
											<%
												}
											%>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="tip_block"
							style="text-align: right;position: relative; z-index:1;">
							<span id="more_description_tip"> </span>
							<style>
#more_description_tip ol li {
	width: 500px;
}
</style>
						</div>

						<!-- 影片信息 -->
						<div id="filmTime" class="" style="display: block;">
							<%
								if(ACityAMovieShow.size()>0){
							%>
							<b class="title" id="20160420053659188722_title"><%=new SimpleDateFormat("yyyy-MM-dd").format(ACityAMovieShow.get(0).getsTime())%>
								&gt;&gt; <a class="alightblue" target="_blank" href="">&nbsp;<%=ACityAMovieShow.get(0).getMoviehall().getMovieCity().getcName()%></a>
								&gt;&gt; <a class="alightblue" target="_blank" href=""><%=ACityAMovieShow.get(0).getMovie().getmName()%></a>
							</b>
							<table width="1000" border="0" class="movie_list" align="center">
								<tbody>
									<tr align="center" class="bg bgc">

										<td width="12%"><b class="title2">放映时间</b></td>
										<td width="16%"><b class="title2">影厅</b></td>
										<td width="8%"><b class="title2">语言</b></td>
										<td width="8%"><b class="title2">版本</b></td>
										<td width="8%"><b class="title2">片长</b></td>
										<td width="18%"><b class="title2">优惠信息</b></td>
										<td width="12%"><b class="title2">网购价</b></td>
										<td width=""><b class="title2">购票</b></td>
									</tr>
									<%
										for(int i=0;i<ACityAMovieShow.size();i++){
									%>
									<tr align="center" class="bgc bgcs">

										<td><b class="org" name="showTime"><%=new SimpleDateFormat("HH:mm").format(ACityAMovieShow.get(i).getsTime())%></b></td>
										<td><span style="color:#769B70"><b><%=ACityAMovieShow.get(i).getMoviehall().gethName() %></b></span></td>
										<td><%=ACityAMovieShow.get(i).getMovie().getmCountry()%></td>
										<td name="version"><%=ACityAMovieShow.get(i).getMovie().getmVersion()%></td>
										<td><%=ACityAMovieShow.get(i).getMovie().getmTimeLength()%></td>
										<td><div style="color:#ED5C27;">
												<%
													String discount="";
																														if(ACityAMovieShow.get(i).getsOnSale()==0) {
																															discount = "无";
																														}else{
																															discount = "全场"+ACityAMovieShow.get(i).getsOnSale()+"折";
																														}
												%>
												<b><%=discount%></b>
											</div></td>
										<td><b class="org"><%=ACityAMovieShow.get(i).getMovie().getmPrice()%>元</b></td>
										<td><a
											style="width:110px;height:40px;background:#5DB6E0;font-size:17px;color:#fff;"
											href="/AntMoviesForeground/userdo/chose_seat.do?movie_show_id=<%=ACityAMovieShow.get(i).getsId()%>">购票</a></td>
									</tr>
									<%
										}
									%>
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
							<%
								}
							%>
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