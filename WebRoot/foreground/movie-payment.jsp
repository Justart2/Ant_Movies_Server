<%@ page import="java.util.*" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cn.ant.entity.*"%>
<%@ page import="com.cn.ant.utils.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	User user = (User)session.getAttribute("user_info");
	MovieShow movieShow = (MovieShow) session
			.getAttribute("movie_show_for_seat");
	Order order = (Order)request.getAttribute("order_info");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Ant订单支付</title>
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
<!-- order JS and CSS -->
<link type="text/css" rel="stylesheet"
	href="/AntMoviesForeground/foreground/css_1/base.css">
<link type="text/css" rel="stylesheet"
	href="/AntMoviesForeground/foreground/css_1/movie_buy_pay.css">
<link href="/AntMoviesForeground/foreground/css_1/v2_phone_input_1.css"
	rel="stylesheet" type="text/css">
<link
	href="/AntMoviesForeground/foreground/css_1/jquery-ui-1.8.5.custom.css"
	rel="stylesheet" type="text/css">
<link href="/AntMoviesForeground/foreground/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<script src="/AntMoviesForeground/foreground/js/jquery.min.js"></script>
<script type="text/javascript"
	src="/AntMoviesForeground/foreground/js/megamenu.js"></script>
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
<style>
.tip_inline {
	display: inline;
	color: #dd4b39 !important;
	font-size: 12px;
}

.alightblue {
	text-decoration: none;
	color: #2E92CF !important;
}

.alightblue:hover {
	text-decoration: none;
	color: #5db6e0 !important;
}

#new_card_tip {
	padding: 0;
	color: #EC5C27;
	float: none;
	margin: 1px;
	line-height: 15px;
	height: 28px;
	vertical-align: middle;
}
</style>
<link rel="stylesheet" rev="stylesheet"
	href="/AntMoviesForeground/foreground/css_1/boxy.css" type="text/css"
	media="screen">

<link rel="stylesheet" rev="stylesheet"
	href="/AntMoviesForeground/foreground/css_1/quicklogin.css"
	media="screen">

<!-- 网页支付10分钟倒计时 -->
<script type="text/javascript">
    var t = 10*60*1000;
	function timeOver(){
		
		if(t==0){
			cleartInterval(h);
		}
		t -= 1000;
		var m=Math.floor(t/1000/60%60); 
		var s=Math.floor(t/1000%60); 
		document.getElementById("timeOver").innerHTML=m+"分"+s+"秒";
	}
	var h =setInterval(timeOver,1000);
</script>
</head>
<body>
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
						style="font-size:1em;margin-top: 4px;"><%=user.getuName() %><b class="caret"></b></a>
					</li>
				</div>

				<button class="btn btn-primary"  id="login_btn"  onclick="checkLogin()" data-toggle="modal"
					data-target="#myModal">退出</button>
				

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
			
			<div class="e-payment-section" >
				<div class="content clearfix" >
					<div class="bgwhite buy clearfix" style="width:1000px">
						<h3>购买信息</h3>
						<p>
							影院：<%=movieShow.getMoviehall().getMovieCity().getcName() %><br> 影片：<%=movieShow.getMovie().getmName() %><br> 场次：<%=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(movieShow
									.getsTime()) %><br>
							数量：<%=order.getoTicketCount() %>张<br> 座位：<%=movieShow.getMoviehall().gethName() %> <%=order.getoSeatInfo() %> <br> <font class="goodsInfo">总价：<%=order.getoPrice() %>元</font><br>
							 <span
								style="font-size:16px;color:#EC5C27">接收影票的手机号码：</span> <input
								type="text" id="mo_num" value="18919097006" name="mo_num"
								class="ipt" size="20" maxlength="11" style="display: none;">
							<span id="increase_num" onclick="carryts();"
								style="display: none;"></span> <input type="text"
								name="zz_mobile" id="zz_mobile" class="ipt" maxlength="11"
								size="20" value="" style="display:none;"> <span
								id="decrease_num" style="display:none;padding-bottom:10px;"></span>
							<span style="" id="mobile_no">18919097006</span> <span
								class="err_red"
								style="clear:both; line-height:20px;margin-left: 160px;color: red; width: 100%;"></span>
						</p>
						<div class="buy_right">
							交易信息提示：<br>请您在10分钟内完成付款，否则系统将自动释放座位 <span>支付倒计时：<span
								id="timeOver">10分00秒</span></span>
							<p
								style="color: #2e92cf;size: 12px; text-align: center;clear: both;width:300px;">套餐有效期：观影日当天有效
							</p>
						</div>
					</div>
								
					<div class="bgwhite payment clearfix" id="payment_main"
						style="display: block;width:1000px">
						<h3 >
							选择支付方式<span>（不可同时使用）</span>
						</h3>
						<div class="tab_container" style="margin-top:15px">
							<div class="sap_tabs" style="width:100%">
								<div id="horizontalTab"
									style="display: block; width: 80%; margin: 0px;">
									<ul class="resp-tabs-list">
										
										<li class="resp-tab-item" aria-controls="tab_item-1"
											role="tab"><span>自付平台</span></li>
										<li class="resp-tab-item" aria-controls="tab_item-3"
											role="tab"><span>网银支付</span></li>
										<div class="clearfix"></div>
									</ul>
									
										<div class="tab-1 resp-tab-content"
											aria-labelledby="tab_item-1">
											<div id="tagContent">
												<div class="tagContent" id="bank_main"
													style="display: block;">
													<!-- 支付平台：-->
													<ul class="buy_pay_ul" style="width:auto;">
														<li><input type="radio" name="bank" id="zhifubao"
															onclick="paySub('Alipay');"> <label
															for="zhifubao"><img
																src="/AntMoviesForeground/foreground/image_1/pay_zhifubao.gif"></label>
														</li>

														<li><input type="radio" name="bank"
															id="zhifubaosaoma" onclick="paySub('AlipaySaoma');">
															<label for="zhifubaosaoma"><img
																src="/AntMoviesForeground/foreground/image_1/pay_zhifubaosaoma01.png"></label>
														</li>

														<li><input type="radio" name="bank" id="bill99"
															onclick="paySub('Bill99');"> <label for="bill99"><img
																src="/AntMoviesForeground/foreground/image_1/99bill.gif"></label>
														</li>
													</ul>
												</div>

												
											</div>
										</div>
										<div class="tab-1 resp-tab-content"
											aria-labelledby="tab_item-3">
											<div id="tagContent">
												<!-- 快钱支付 -->
												<div class="tagContent " style="" id="kuaijie_main">
													<div style="margin-bottom:20px;">
														请选择以下银行进行支付
														<ul class="clearfix">
															<li><input type="radio" name="bank" id="zhaoshang_p"
																onclick="paySub('Bill99Bank_CMB');"> <label
																for="zhaoshang_p"><img
																	src="/AntMoviesForeground/foreground/image_1/pic_bank_zs.gif"></label>
															</li>
															<li><input type="radio" name="bank" id="gongshang_p"
																onclick="paySub('Bill99Bank_ICBC');"> <label
																for="gongshang_p"><img
																	src="/AntMoviesForeground/foreground/image_1/pic_bank_gs.gif"></label>
															</li>
															<li><input type="radio" name="bank" id="jianshe_p"
																onclick="paySub('Bill99Bank_CCB');"> <label
																for="jianshe_p"><img
																	src="/AntMoviesForeground/foreground/image_1/pic_bank_js.gif"></label>
															</li>
															<li><input type="radio" name="bank" id="nongye_p"
																onclick="paySub('Bill99Bank_ABC');"> <label
																for="nongye_p"><img
																	src="/AntMoviesForeground/foreground/image_1/pic_bank_ny.gif"></label>
															</li>
															<li><input type="radio" name="bank" id="xingye_p"
																onclick="paySub('Bill99Bank_CIB');"> <label
																for="xingye_p"><img
																	src="/AntMoviesForeground/foreground/image_1/pic_bank_xy.gif"></label>
															</li>
															<li><input type="radio" name="bank" id="pufa_p"
																onclick="paySub('Bill99Bank_SPDB');"> <label
																for="pufa_p"><img
																	src="/AntMoviesForeground/foreground/image_1/pic_bank_pf.gif"></label>
															</li>

															<li><input type="radio" name="bank" id="beijing_p"
																onclick="paySub('Bill99Bank_BOC');"> <label
																for="beijing_p"><img
																	src="/AntMoviesForeground/foreground/image_1/pic_bank_bj.gif"></label>
															</li>
															<li><input type="radio" name="bank" id="guangfa_p"
																onclick="paySub('Bill99Bank_CMBC');"> <label
																for="guangfa_p"><img
																	src="/AntMoviesForeground/foreground/image_1/pic_bank_gf.gif"></label>
															</li>

															<li class="more_yh"><input type="radio" name="bank"
																id="bjns_p" onclick="paySub('Bill99Bank_BJRCB');">
																<label for="bjns_p"><img
																	src="/AntMoviesForeground/foreground/image_1/yh_bjns.gif"></label>
															<li class="more_yh"><input type="radio" name="bank"
																id="gd_p" onclick="paySub('Bill99Bank_CEB');"> <label
																for="gd_p"><img
																	src="/AntMoviesForeground/foreground/image_1/yh_gd.gif"></label>
															</li>

															<li class="more_yh"><input type="radio" name="bank"
																id="gf_p" onclick="paySub('Bill99Bank_GDB');"> <label
																for="gf_p"><img
																	src="/AntMoviesForeground/foreground/image_1/yh_gf.gif"></label>
															</li>

															<li class="more_yh"><input type="radio" name="bank"
																id="hz_p" onclick="paySub('Bill99Bank_HZB');"> <label
																for="hz_p"><img
																	src="/AntMoviesForeground/foreground/image_1/yh_hz.gif"></label>
															</li>
															
															<li class="more_yh"><input type="radio" name="bank"
																id="sh_p" onclick="paySub('Bill99Bank_SHB');"> <label
																for="sh_p"><img
																	src="/AntMoviesForeground/foreground/image_1/yh_sh.gif"></label>
															</li>
															<li class="more_yh"><input type="radio" name="bank"
																id="yz_p" onclick="paySub('Bill99Bank_PSBC');">
																<label for="yz_p"><img
																	src="/AntMoviesForeground/foreground/image_1/yh_yz.gif"></label>
															</li>
															<li class="more_yh"><input type="radio" name="bank"
																id="zx_p" onclick="paySub('Bill99Bank_CITIC');">
																<label for="zx_p"><img
																	src="/AntMoviesForeground/foreground/image_1/yh_zx.gif"></label>
															</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						<div id="con"></div>
					</div>
					<div class="bgwhite money">
						<span id="pay_money">应付金额：<%=order.getoPrice() %>元</span> <span id="other_money"></span>
						<span id="goods_money"></span>
						
						 <a id="button_green_pay"
							href="https://openapi.alipay.com/gateway.do" class="" disabled="false"
							style="display: inline;margin-right:10px">确认无误，支付</a>
					</div>
					<!-- <div class="bgwhite"
						style="width: 1000px;margin-top: 20px;font-size: 14px;float: left;color: #222;">
						<p
							style="padding-left: 65px;font-size: 18px; margin: 0; margin-bottom: .5em; padding-top: 1em;">Ant电影网退票政策：</p>
						<ul
							style="padding-left: 65px;margin-left: 3em;margin-bottom: 1em;letter-spacing: 1px;">
							<li>1. 影片开场前1小时可以通过万达电影网退票，影城现场服务台不支持退票；</li>
							<li>2. 使用积分、兑换码所兑换的影票不支持退票；</li>
							<li>3. 参与活动购买特价票不支持退票；</li>
							<li>4. 使用中国移动话费进行支付不支持退票；</li>
							<li>5. 电影票和卖品一起购买成功后，卖品不可单独退换，电影票和卖品退换需执行上述退票政策；</li>
							<li>6.上述退票政策仅适用于通过万达电影网成功购买的电影票；</li>
						</ul>
					</div> -->
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