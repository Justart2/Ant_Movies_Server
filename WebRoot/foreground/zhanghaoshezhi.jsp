<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.cn.ant.entity.* , com.cn.ant.utils.*"%>
<%
	User user = (User)session.getAttribute("user_info");
%> 
<html>
<head>
<title>ANT</title>
<link href="/AntMoviesForeground/foreground/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="/AntMoviesForeground/foreground/css/style.css" rel="stylesheet" type="text/css" media="all" />

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<!-- start menu -->
<script type="text/javascript" src="/AntMoviesForeground/foreground/js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<script type="text/javascript" src="/AntMoviesForeground/foreground/js/jquery.leanModal.min.js"></script>
<script src="/AntMoviesForeground/foreground/js/easyResponsiveTabs.js" type="text/javascript"></script>
		    <script type="text/javascript">
			    $(document).ready(function () {
			        $('#horizontalTab').easyResponsiveTabs({
			            type: 'default', //Types: default, vertical, accordion           
			            width: 'auto', //auto or any width like 600px
			            fit: true   // 100% fit in a container
			        });
			    });
</script>
<!---- start-smoth-scrolling---->
<script type="text/javascript" src="/AntMoviesForeground/foreground/js/move-top.js"></script>
<script type="text/javascript" src="/AntMoviesForeground/foreground/js/easing.js"></script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
				});
			});
		</script>
		<!-- center User -->
		<link type="text/css" rel="stylesheet" href="/AntMoviesForeground/foreground/user_css/base.css" />
<link type="text/css" rel="stylesheet" href="/AntMoviesForeground/foreground/user_css/user_center.css" />
<link type="text/css" rel="stylesheet" href="/AntMoviesForeground/foreground/user_css/jquery-ui-1.8.5.custom.css">
<script type="text/javascript">
<!--
 var IPData = new Array();
//-->
</script>

<script type="text/javascript" src="/AntMoviesForeground/foreground/user_js/jquery-1.4.4.min.js"></script>

<script type="text/javascript" src="/AntMoviesForeground/foreground/user_js/cityArray.js"></script>
<script type="text/javascript" src="/AntMoviesForeground/foreground/user_js/prvArray.js"></script>
<script type="text/javascript" src="/AntMoviesForeground/foreground/user_js/cinemaArray.js"></script>
<script type="text/javascript" src="/AntMoviesForeground/foreground/user_js/groupCityArray.js"></script>

<script type="text/javascript" src="/AntMoviesForeground/foreground/user_js/getArray.js"></script>
<script type="text/javascript" src="/AntMoviesForeground/foreground/user_js/printCity.js"></script>
<script type="text/javascript" src="/AntMoviesForeground/foreground/user_js/jquery.boxy.js"></script>
<script type="text/javascript" src="/AntMoviesForeground/foreground/user_js/ylDropDownList-1.2.js"></script>
<link rel="stylesheet" rev="stylesheet"	href="/AntMoviesForeground/foreground/user_css/boxy.css" type="text/css" media="screen" />
<script type="text/javascript">
//ie6 redirect
if( $.browser.msie && $.browser.version.indexOf('6') !=-1){
	window.location='http://www.wandafilm.com:80/ie6_bad.jsp';
}
</script>
<script type="text/javascript" src="/AntMoviesForeground/foreground/js/upload.js"></script>
<script type="text/javascript" src="/AntMoviesForeground/foreground/user_js/jquery-ui-1.8.5.custom.min.js"></script>
<script type="text/javascript" src="/AntMoviesForeground/foreground/user_js/base.js"></script>
<script type="text/javascript" src="/AntMoviesForeground/foreground/user_js/user_center.js"></script>
<link rel="stylesheet" rev="stylesheet" href="/AntMoviesForeground/foreground/user_css/quicklogin.css" media="screen" />
<!-- 这是提示框的js和css -->
	<script src="/AntMoviesForeground/foreground/tishi/jquery-2.1.3.min.js"></script>
	<link rel="stylesheet" href="/AntMoviesForeground/foreground/tishi/sweet-alert.css">
	<script src="/AntMoviesForeground/foreground/tishi/sweet-alert.js"></script>
<script type="text/javascript">
		function modifyPassword() {
			var pasw1 = $("#u_newPassWord").val();
			var pasw2 = $("#u_confirmPassWord").val();
			var code = $("#user_modify_id").val();
			if(pasw1!=""&&pasw2!=""&&pasw1 == pasw2){
					 $.ajax({
						url:"/AntMoviesForeground/userAccount/modifyPasw.do?pasw="+pasw1+"&id="+code,
						success: function(date){
							swal("修改成功!", "", "success");
						}
					});  
			}else {
				swal("修改失败!", "输入有误，请重新输入=>", "error");
			}
		}
	</script>
<script type="text/javascript">
		function modifyUserMsg() {
			var user_id=$("#user_id_modify").val();
			var name = $("#nickName").val();
			var email = $("#email").val();
			var sex = $("#sex-box").val();
			var birthday = $("#birthDay").val();
			if(name!=""&&email!=""&&sex!=""&&birthday!=""){
					//location.href = '/BackstageSystem0/ModifyLoginPaswServlet?pa='+ pass1;
					 $.ajax({
						url:"/AntMoviesForeground/userAccount/modifyUserMsg.do?user_id="+user_id+"&name="+name+"&birthday="+birthday+"&sex="+sex+"&email="+email,
						success: function(date){
							swal("修改成功!", "", "success");
						}
					});  
			}else {
				swal("修改失败!", "信息不能为空", "error");
			}
		}
	</script>	
</head>
<body>
	<!-- header-section-starts -->
		
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
<!--head end-->
	
<div class="content">
	<div class="user_center_path">
		您当前的位置：<a href="javascript:void(0)">首页</a> > <a href="javascript:void(0)" class="current">账号设置</a>
	</div>

	<div class="user_center_content clearfix">
		<!-- 左侧导航开始 -->
		
<div class="user_center_nav">
	<em class="title">
          	<img  src="<%=HttpUtil.httpURL %>/ant_images/<%=user.getuPicture() %>" style="width: 165px; height: 150px" />
          </em>
	<div class="split">&nbsp;</div>
	<div id="navibar_0" ><a href="/AntMoviesForeground/foreground/personCenter.jsp">用户中心首页</a></div>
	<div id="navibar_6" class="current"><a href="/AntMoviesForeground/foreground/zhanghaoshezhi.jsp">账号设置</a></div>
	<div id="navibar_1"><a href="/AntMoviesForeground/order/user_order.do?user_id=<%=user.getuId()%>">我的订单</a></div>
</div>
<script>
  	$(function() {
    	var currentNavibar = 'navibar_' + '6';
     	$("#" + currentNavibar).attr("class", "current");
  	});
</script>
		<!-- 左侧导航结束 -->

		<div class="user_center_main">
			<div class="user_center_title"><span class="personal_data_icon">账号设置</span></div>
			<div class="user_center_tabnav">
				<a href="javascript:void(0)" class="current" data-tag="base_info">用户资料</a>
                
				<a href="javascript:void(0)" data-tag="pic_info">头像修改</a>
				<a href="javascript:void(0)" data-tag="safe_set">安全设置</a>
			</div>
			<!-- 基本信息 -->
			<div id="base_info" class="personal_data_tabInfo">
				<table class="table_form" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<th><font size="5px">基本信息</font></th>
						</tr>
						<tr>
							<th align="right">登录账号：</th>
							<td>
								<%=user.getuPhone() %>
							</td>
						</tr>
						<tr>
							<th align="right">昵称：</th>
							<td>
							<input type="hidden" id="user_id_modify" value=<%=user.getuId() %>>
							<input type="text" id="nickName" name="nickName" class="input_text_style" value=<%=user.getuName() %> />
								<span style="color: red; margin-left: 10px" id="nickName_tip">*</span>
							</td>
						</tr>
						<tr>
							<th align="right">注册手机：</th>
							<td>
										<input type="text" class="input_text_style disable" value=<%=user.getuPhone() %> disabled />
										<!-- <a href="javascript:void(0)" id="edit_bind_phone">[修改]</a> -->
											<!-- <a href="javascript:void(0)" id="changebindphone">更改手机号</a> -->						
							</td>
						</tr>
						<tr>
							<th align="right">常用邮箱：</th>
							<td>
								<input type="text" id="email" name="email" class="input_text_style" value=<%=user.getuMail() %> />
								<span style="color: red; margin-left: 10px" id ="email_tip">*</span>   
							</td>
						</tr>
						<tr>
							<th align="right">性别：</th>
							<td>
	                            <!-- <ul class="sex-box">
	                            
		                            <li tt="1" class="selSex">男</li>
		                            <li tt="2" style="">女</li>
	                            </ul> -->
	                            <input id="sex-box" type="radio" name="sex" <% if(user.getuSex()==1){ %> checked="checked" <% } %> value="1">男
	                             <input id="sex-box" type="radio" name="sex" <% if(user.getuSex()==0){ %> checked="checked" <% } %> value="0">女
	                            <span style="color: red; margin-left: 10px" id="sex_tip">*</span>   
                            </td>
						</tr>
						<tr>
							<th align="right">出生日期：</th>
							<td>
								<input type="text" id="birthDay" class="input_text_style" value=<%=user.getuAge() %> />
								<span style="color: red; margin-left: 10px" id="birthDay_tip">*</span>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="tools_box" style="clear:both; padding-top:10px; +padding-top:0px;+margin:-20px 0 40px 0;">
					<a href="javascript:void(0)" onclick="modifyUserMsg()"  id="modifyMemberBtn" style="border:0px; cursor:pointer;  width:100px; min-width:100px;height:35px; line-height:35px; text-align:center; margin-left:170px; float:left; background-color:#5DB6E0; color:#fff; font-size:16px !important; text-decoration:none;">保存</a>
				</div>
			</div>
			<!-- 安全设置 -->
			<div id="safe_set" class="personal_data_tabInfo" style="display: none;">
			<input type="hidden" id="user_modify_id" value=<%=user.getuId() %>>
				<table cellpadding="0" cellspacing="0" class="table_membership_card">
					<tr>
						<th>旧密码：</th>
						<td colspan="2"><input type="password" id="u_oldPassword" name="oldPassword" class="input_text_style" value=<%=user.getuPsw() %> /></td>
					</tr>
					<tr>
						<th>新密码：</th>
						<td><input type="password" id="u_newPassWord" name="newPassWord" class="input_text_style" value="" /></td>
						<td style="font-size: 12px;">长度六位以上的字母或数字</td>
					</tr>
					<tr>
						<th>确认新密码：</th>
						<td><input type="password" id="u_confirmPassWord" name="confirmPassWord" class="input_text_style" value=""/></td>
						<td style="font-size: 12px;">再次输入与上面相同的密码</td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td><a href="javascript:void(0)" class="set_attention_sub" onclick="modifyPassword()">保存修改</a></td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</div>

			<!-- 修改头像 -->
			<div id="pic_info" class="personal_data_tabInfo clearfix" style="display: none;">
				
				<form action="/AntMoviesForeground/userAccount/modifyUserPhoto.do" method="post"
							enctype="multipart/form-data">
							<div style="margin-left: 50px;top:20px;border-color: black;">
					
						<img width="400px" height="400px"  src="<%="".equals(user.getuPicture()) ? "/AntMoviesForeground/foreground/images/b3.jpg"
					: HttpUtil.httpURL+"/ant_images/" + user.getuPicture()%>" id="pic"/></div>
							<input type="hidden" name="user_id" value=<%=user.getuId() %>>
					<table class="table_form"  cellpadding="0" border="0" id="upload_pic_table">
						<tbody>
	                    	<tr>
	                        	<th colspan="2" style="padding-top:30px;">请选择新的图片上传，文件大小不能超过1M<br/>支持.jpg/.jpeg/.gif/.png</th>
	           					<input style="margin-top: 20px;margin-left: 20px"  type="file" name="imgFile" onchange="previewImage(this,'pic')"/>	             	
	                        </tr>
	                        
						</tbody>
	                    <tfoot>
	                    	<tr>
	                        	<td>&nbsp;</td>
	                        	<td colspan="2"><button class="set_attention_sub" id="uploadPhotoBtn" >保存</button></td>
	                        </tr>
	                    </tfoot>
					</table>
				</form>
				
				
					
				</div>
			</div>                      	 	 	 
		</div>
	</div>

</div>
<!-- 绑定设置 -->
<style>
#bind_third_party_wrapper{ display:none;}
.bind_third_party_box, .unbind_third_party_box{ margin:0px 15px; text-align:center;}
.bind_content{font-size:14px; margin-bottom:15px;}
.bind_content label{ margin-right:10px;}
.bind_content input{ margin-right:5px;}
.bind_sub_btn a{ margin-right:30px; float:none;}
.bind_sub_btn .set_attention_sub{ color:#ffffff;}
.bind_sub_btn .cancel{ color:#909090; text-decoration:none; vertical-align: bottom;}
</style>
<script type="text/javascript">
 var bindThirdPartyDialog = null;
 var wrapperObj = null;
 $(document).ready(function(){
	 
	 //关闭弹出框
	$(".bind_set_cancel, .unbind_cancel").click(function(){
		bindThirdPartyDialog.dialog("close");
	});
	
	//绑定同步设置弹出框
	$(".bind_set").click(function(){
		var source = $(this).attr('tt');
		$('#source').val(source);

		$.ajax({
			type: "GET",
		   	url: basePath + "user/binding_mgr.do?m=queryBindingSyn",
		   	data: "source=" + source,
		   	dataType: "text", 
		   	success: function(data){
				var json='';
		        eval('json=' + data + ';');
				if (json.error === undefined){
					$("#synComment").attr("checked", json.comment);
					$("#synFilmScore").attr("checked", json.score);
					$("#synTicket").attr("checked", json.ticket);
					return true;
				} else {
					showAlert(json.error);
					return false;
				}
		   }
		});
		
		wrapperObj = $(this).parents("td");
		//ajax操作...
		bindThirdPartyDialog = $(".bind_third_party_box").dialog({
			width : 655,
			position : 'center',
			modal : true,
			title : "同步设置",
			closeText : "X"
		});	
	});
	
	//取消绑定弹出框
	$(".cancel_bind").click(function(){
		var source = $(this).attr('tt');
		$('#source').val(source);

		var sourceName = "新浪";
		if (source == 'douban') {
			sourceName = "豆瓣"; 
		}

		wrapperObj = $(this).parents("td");
		$('#cancelBindContent').text("您确认要解除您的万达电影网帐号与" + sourceName + "账号绑定吗？");
		bindThirdPartyDialog = $(".unbind_third_party_box").dialog({
			width : 655,
			position : 'center',
			modal : true,
			title : "确认信息",
			closeText : "X"
		});	
	});
	
	//保存绑定同步设置
	$(".bind_set_save").click(function(){
		var source = $('#source').val();
		var synComment = $('#synComment:checked').attr("checked") == true ? "1" : "0";
		var synFilmScore = $('#synFilmScore').attr("checked") == true ? "1" : "0";
		var synTicket = $('#synTicket').attr("checked") == true ? "1" : "0";
		
		$.ajax({
			type: "GET",
		   	url: basePath + "user/binding_mgr.do?m=synBinding",
		   	data: "source=" + source + "&synComment=" + synComment + "&synFilmScore=" + synFilmScore + "&synTicket=" + synTicket,
		   	success: function(data){
				if (data == '1') {
					//showAlert("已修改同步设置");
					bindThirdPartyDialog.dialog("close");
				} else {
					showAlert("同步设置异常，请联系客服");
				}
		   }
		});
	});
	
	//取消绑定
	$(".unbind_sub").click(function(){
		var source = $('#source').val();
		$.ajax({
			type: "GET",
		   	url: basePath + "user/binding_mgr.do?m=delBinding",
		   	data: "source="+source,
		   	dataType: "text", 
		   	success: function(data){
			   	if (data == '1') {
			   		wrapperObj.find(".bind_third_party").show();
					wrapperObj.find(".bind_third_party_set").hide();
					bindThirdPartyDialog.dialog("close");
				} else {
					showAlert("取消绑定失败，请联系管理员！");
				}
		    }
		});
	});
 });
</script>

<script type="text/javascript">
	function preview(img, selection) {
		if (!selection.width || !selection.height) return;
	    
	  	var proportion = $("#proportion").val();
	    $('#x').val(Math.round((selection.x1)*proportion)-3);
	    $('#y').val(Math.round((selection.y1)*proportion)-3);
	    $('#wigth').val(Math.round((selection.width)*proportion));
	    $('#height').val(Math.round((selection.height)*proportion));    
	}
</script>

<script>
$(function(){
	// 初始化基本信息
	initBaseInfo();	

	// 常去影城
	var selectedCinemaId = '369';  
 	var selectedCinemaName = '兰州康桥广场店';
 	theCinemaId = getCinemaArray(theCityCode)[0][0];//默认影院
 	initCenterEditCinema('5879519637', theCinemaId, selectedCinemaId, selectedCinemaName);	// getArray.js
	$("#select_cinema").val(selectedCinemaId);
});

//修改详细信息
function modifyDetailedInformation(){
	//到达影城
	var gotowandaWay = $('#gotowanda_way').val();
	//职业
	var profession = $('#profession').val();
	//收入
	var income = $('#income').val();
	//是否单身
	var marriage = $('#marriage').val();
	//是否有孩子
	var children = $('#children').val();
	
	var likeType = "";
	$("input[name='like_type']:checkbox").each(function(){
		if($(this).attr("checked")){
			likeType += $(this).val()+"  "; 
		}
	});

}


// 修改基本资料
$("#modifyMemberBtn").click(function() {
	//昵称验证
	var nickName=$("#nickName").val();
	var pattern = new RegExp("[`~!@#$^&*()=|{}'\":;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");
	var rs = ""; 
	for (var i = 0; i < nickName.length; i++) { 
		rs = rs+nickName.substr(i, 1).replace(pattern, ''); 
	}
	$("#nickName").attr('value',rs);
	var flag = pattern.exec(nickName);
	$("#nickName").parent().find('span').html('*');
	if(flag){
		$("#nickName").parent().find('span').html('*部分特殊字符不可输入');	
		return;
	}
	
	//判断昵称不能为空
	if(nickName == 'undefined' || nickName==""){
		showAlert("请填写昵称!");
		$("#nickName_tip").html("请填写昵称!");
		return false;
	}
	$("#nickName_tip").html("");

	//验证邮箱 //邮箱格式校验
	var email = $("#email").val();
	if(email == 'undefined' || email==""){
		showAlert("请填写邮箱!");
		$("#email_tip").html("请填写邮箱!");
		return false;
	}else if(!/^[.\-_a-zA-Z0-9]+@[\-_a-zA-Z0-9]+[.a-zA-Z0-9]{1,}$/.test(email)){
		showAlert("您的电子邮件格式不正确!");
		$("#email_tip").html("您的电子邮件格式不正确!");
		return false;
	}
	$("#email_tip").html("");
	
	//性别
	var sex = "";
	$(".sex-box li").each(function() {
		if ($(this).hasClass("selSex")) {
			sex = $(this).attr('tt');
		}
	});

	//生日
	var birthDay = $("#birthDay").val();
	if(birthDay == 'undefined' || birthDay==""){
		showAlert("请填写生日!");
		$("#birthDay_tip").html("请填写生日!");
		return false;
	}
	$("#birthDay_tip").html("");
	
	
	//常去的万达影城
  	var favoriteCinema = $("#select_cinema").val();
  	if (favoriteCinema == 0) {
  	  	showAlert("请选择常去影院!");
  	   $("#cinema_tip").html("请选择常去影院!");
  		return false;
  	}
  	$("#cinema_tip").html("");


  //到达影城
	var gotowandaWay = $('#gotowanda_way').val();
	if(gotowandaWay==""){
		showAlert("请选择如何到达影城!");
		$("#gotowanda_tip").html("请选择如何到达影城!");
		return false;
	}
	$("#gotowanda_tip").html("");
	
	var marriage ="";
	$(".marriage-box li").each(function() {
		if ($(this).hasClass("selMarriage")) {
			marriage = $(this).attr('tt');
		}
	});
	
	var children ="";
	$(".children-box li").each(function() {
		if ($(this).hasClass("selchildren")) {
			children = $(this).attr('tt');
		}
	});
	
	//购票渠道
	var buyTicket = $('#buyticket_way').val();
	
	//职业
	var profession = $('#profession').val();
	//收入
	var income = $('#income').val();
	//是否单身

	//是否有孩子

	
	var likeType = "";
	$("input[name^='like_type_']:checkbox").each(function(){
		if($(this).attr("checked")){
			likeType += $(this).val()+"  "; 
		}
	});

	if (buyTicket == '' || profession == '' || income == '' || likeType ==''){
		showConfirmIs('您还未完善所有的“附加信息”！ 立即完善您的“附加信息”, 将获得400积分和一次大转盘抽奖机会！',
		function(){
			return ;
		},function(){
			modifyMemberBaseInfo(nickName, sex, birthDay, favoriteCinema, email, gotowandaWay, profession, income, marriage, children, likeType, buyTicket );
		});
	}else{
		modifyMemberBaseInfo(nickName, sex, birthDay, favoriteCinema, email, gotowandaWay, profession, income, marriage, children, likeType, buyTicket );
	}
});

//提交信息
function modifyMemberBaseInfo(nickName, sex, birthDay, favoriteCinema, email, gotowandaWay, profession, income, marriage, children, likeType, buyTicket ){
	$.ajax({
		type: 'POST',
		url: basePath + "judgeUser.do?m=judgeSessionUser",
		success: function (data) {
			if (data == 'sessionIsNull') {
				location.href = basePath + "common/login.jsp";
			} else if (data == 'sessionIsNotNull') {
				var dataMap = {"nickName":nickName, "sex":sex, "birthDay":birthDay, "favoriteCinema":favoriteCinema,"email":email,
						"gotowandaWay":gotowandaWay,"profession":profession,"income":income,"marriage":marriage,"children":children,
						"likeType":likeType,"buyTicket":buyTicket};
			    $.ajax({
					type: "post",
					url: basePath + "user/info_mgr.do?m=modifyMemberBaseInfo",
					dataType: "json",
					data: dataMap,
					beforeSend : function(XMLHttpRequest) {
						$('#modifyMemberBtn').hide();
						$('#modifyLoading').attr('style', 'margin-left: 200px;display:block');
					},
					success: function(data) {
						$('#modifyLoading').hide();
						$('#modifyMemberBtn').show();
						if($.trim(data.returnMessage) == "会员资料修改成功！"){
							
							//判断信息是否完整
							if(buyTicket == '' || profession == '' || income == '' || likeType ==''){
								data.returnMessage = ' 您已成功获得400积分,\n（积分将会在半小时内充值到您的账户中，请耐心等待）';
							}else{
								data.returnMessage = '您已成功获得400积分\n和一次大转盘抽奖机会；\n（积分将会在半小时内充值到您的账户中，请耐心等待）';
							}
							data.returnMessage = '会员资料修改成功！';
						}else if($.trim(data.returnMessage) == "您输入的基本信息不全，请填写完整后再提交！"){
							data.returnMessage = '请完善个人资料后再进行保存！';
						}
						showAlert(data.returnMessage);
					}
			                                
			   });
			}
		}
   	});

	//切换标签
   	$(".user_center_tabnav a").eq("0").addClass("current").siblings("a").removeClass("current");
   	$("#" + $(".user_center_tabnav a").eq("0").attr("data-tag")).show().siblings(".personal_data_tabInfo").hide();
}

var dialogObject = null;
function showConfirmIs(msg, callback1, callback2){
	var maxAlertWidth = 600; var minAlertWidth = 400; msgFontSize = 16;
	var msgWidth = msg.length * msgFontSize + 64;//计算宽度
	msgWidth = (msgWidth < maxAlertWidth)?msgWidth:maxAlertWidth;
	msgWidth = (msgWidth > minAlertWidth)?msgWidth:minAlertWidth;
	var dialogContent = "<div style='padding:.5em 32px'><p style='margin:2px 0 40px 0;text-align:center; color:#000; font:"+msgFontSize+"px/24px \"微软雅黑\";'>"+msg+"</p></div>";
	dialogObject = $(dialogContent).dialog({
		width : msgWidth,
		height : "auto",
		position : 'center',
		modal : true,
		title : "提示信息",
		closeText : "X",
		buttons:{
			'继续完善附加信息':function(){
				callback1();
				dialogObject.dialog('destroy');
				dialogObject = null;
    		},
    		'    不用了，直接提交':function(){
    			if(typeof callback2 == "function") 
    				callback2();
    			dialogObject.dialog('destroy');
    			dialogObject = null;
    		}
		},
		open:function(event,ui){
			$('.ui-dialog .ui-dialog-buttonpane button').eq(0).children('span').addClass('set_attention_sub');
			$('.ui-dialog .ui-dialog-buttonpane button').eq(1).children('span').addClass('cancel').attr('style','line-height:30px;width:auto;min-width:0px;margin-left:40px;+width:40px;+min-width:40px;');
		}
	});
}

// 初始化基本信息
function initBaseInfo() {
	var sex = 'M';
	var flag = false;
    $(".sex-box li").each(function() {
    	$(this).removeClass("selSex");
 		if ($(this).attr('tt') == sex) {
 	 		flag = true;
 			$(this).addClass("selSex");
 			$(this).siblings('li').removeClass("selSex");
 	 	}
 	})
 	if (!flag) {
 		$(".sex-box li").first().addClass("selSex");	// 默认选中"男"
 	}
	$("#birthDay" ).datepicker({changeYear: true, yearRange: '1912:2012'});


	//设置如何到达影城
	var gotowandaWay_hidden =  $('#gotowandaWay_hidden').val();
	$("#gotowanda_way").val(gotowandaWay_hidden);

	//职业
	var profession_hidden = $('#profession_hidden').val();
	$("#profession").val(profession_hidden);

	//收入
	var income_hidden = $('#income_hidden').val();
	$('#income').val(income_hidden);

	//是否单身
	var marriage = $('#marriage_hidden').val();

	var tempMarriage = false;
    $(".marriage-box li").each(function() {
    	$(this).removeClass("selMarriage");
 		if ($(this).attr('tt') == marriage) {
 			tempMarriage = true;
 			$(this).addClass("selMarriage");
 			$(this).siblings('li').removeClass("selMarriage");
 	 	}
 	})
 	if (!tempMarriage) {
 		$(".marriage-box li").first().addClass("selMarriage");	// 默认选中"是"
 	}

	//否有孩子
	var children = $('#children_hidden').val();
	var tempchildren = false;
    $(".children-box li").each(function() {
    	$(this).removeClass("selchildren");
 		if ($(this).attr('tt') == children) {
 			tempchildren = true;
 			$(this).addClass("selchildren");
 			$(this).siblings('li').removeClass("selchildren");
 	 	}
 	})
 	if (!tempchildren) {
 		$(".children-box li").first().addClass("selchildren");	// 默认选中"是"
 	}

	//常用购票渠道
	var buyticketWay_hidden = $('#buyticketWay_hidden').val();
	$('#buyticket_way').val(buyticketWay_hidden);

	var likeType_hidden = $('#likeType_hidden').val();
	if( likeType_hidden != '' && likeType_hidden != null){
		var likeTypeTemp = likeType_hidden.split("  ");
		for(var i = 0; likeTypeTemp.length > i; i++){
			if(likeTypeTemp[i] != undefined && likeTypeTemp[i] != ''){
				$("input:checkbox[name=like_type_"+likeTypeTemp[i]+"]").attr("checked",true);
			}
		}
	}
	
}

// 修改影城
function changeCinemaCity(obj) {
   initCenterEditCinema(obj.value, theCinemaId, "", "");
   $("#select_cinema").val(selectedCinemaId);
}

// 修改密码
function modifyPassword00() {
	var oldPassword = $('#oldPassword').val();
	var newPassWord = $('#newPassWord').val();
	var confirmPassWord = $('#confirmPassWord').val();
	if (oldPassword == '') {
		showAlert('旧密码不能为空！');
		return false;
	}
	if (newPassWord == '') {
		showAlert('新密码不能为空！');
		return false;
	}
	if (confirmPassWord == '') {
		showAlert('确认新密码不能为空！');
		return false;
	}
	if (oldPassword == newPassWord) {
		showAlert('旧密码和新密码相同！');
		return false;
	}
	if (newPassWord != confirmPassWord) {
		showAlert('新密码和确认密码不相同！');
		return false;
	}

	$.ajax({
		type: 'POST',
		url: basePath + "judgeUser.do?m=judgeSessionUser",
		success: function (data) {
			if (data == 'sessionIsNull') {
				location.href = basePath + "common/login.jsp";
			} else if (data == 'sessionIsNotNull') {
				var dataMap = {"oldPassword": oldPassword, "newPassWord": newPassWord, "confirmPassWord": confirmPassWord};
			    $.ajax({
					type: "post",
					url: basePath + "user/info_mgr.do?m=modifyPassword",
					data: dataMap,
					success: function(data) {
						var msg = eval('(' + data + ')');
						var flag = msg.flag;
						var text = msg.text;
						$('#oldPassword').val('');
						$('#newPassWord').val('');
						$('#confirmPassWord').val('');
						if($.trim(text) == '修改会员密码成功！'){
							text = '登录密码修改成功，请牢记新密码！';
						}else if($.trim(text) == "修改会员密码失败，您输入的旧密码不正确！"){
							text = '请输入正确的旧密码！';
						}
						showAlert(text);
					}
			                                
			   });
			}
		}
   	});
}



// 图片预览	.jpg/.jpeg/.gif/.png
$("#memberPhoto").change(function() {		
	var img = $("#memberPhoto").val();
	$("#buttonType").val("update");
	$("#errorTip").text("");
	if($.trim(img) != "")  {
		//var fileType = "jpg,bmp,png";
		var fileType = "jpg,jpeg,gif,png";
   	  	var extendFileName = img.split(".");
   		var types = fileType.split(",");
   	  	var imgFlag = false;
   	 	for(var i=0,j=types.length; i<j; i++) {
  			if(extendFileName[1].toLowerCase()==types[i]) {
  			   imgFlag = true;
  			}
		}
		if(imgFlag) {
	 		$("#uploadPhotoForm").submit();
	 		$("#cutOut").css("display","block");
	 		$("#memberPicNew").imgAreaSelect({ aspectRatio: '1:1', handles: true,
				fadeSpeed: 200, onSelectChange: preview,x1: 175, y1: 50, x2: 325, y2: 200,persistent:true});
		} else {
			$("#errorTip").text("您上传的不是图片类型，只能上传jpg,jpeg,gif,png类型!");
		}
	} else {
		$("#errorTip").text("请先点击浏览，选择你要上传的图片!");
	}
	return false;
});


// 点击保存时，上传图片
$("#uploadPhotoBtn").click(function() {
	$("#memberPicNew").imgAreaSelect({remove: true});
	$("#buttonType").val("save");
	var img = $("#memberPhoto").val();
	$("#cutOut").css("display","none");
	$("#errorTip").text("");
	if($.trim(img) != "") {
		//var fileType = "jpg,bmp,png";
		var fileType = "jpg,jpeg,gif,png";
	  	var extendFileName = img.split(".");
	   	var types = fileType.split(",");
	   	var imgFlag = false;
		
	   	for(var i=0,j=types.length;i<j;i++) {
  			if(extendFileName[1].toLowerCase()==types[i]) {
  			   imgFlag=true;
  			}
		}
		if(imgFlag) {
			$("#uploadPhotoForm").submit();
		} else {
			$("#errorTip").text("您上传的不是图片类型，只能上传jpg,jpeg,gif,png类型!");
		}
	} else {
		$("#errorTip").text("请先点击浏览，选择你要上传的图片!");
	}
	return false;
});



$("#changebindphone").click(function(){
	var phoneNum = $(this).parent().find('input').attr('value');
	location.href=basePath+"user_center/user_phone_change.jsp?phoneNum="+phoneNum;
})
</script>
<div id="dialogFrame" style="display:none;"></div>
<script>
$("#dialogFrame").load(basePath + "user_center/bind_phone_dialog.jsp");
$("#changebindphone").click(function(){
	var phoneNum = $(this).find('input').attr('value');
	location.href=basePath+"user_center/user_phone_change.jsp?phoneNum="+phoneNum;
})
</script>


<div id="footer">
  
  <div class="footer2 green">
   
 </div>

 <div id="R" style="display: inline-block;">
 	<div style="display: block;text-align: center;">
		Copyright © 2011-2013 Wandafilm.com ALL rights reserved
	
 	</div>
 </div>
</div>
<script type="text/javascript">
function openRebort(){
	var city = $('#city').text().substring(0,$('#city').text().lastIndexOf('['));
	var basePath = 'http://www.wandafilm.com:80/';
	robotI = open(basePath + 'common/robotreply.jsp?city='+city,'RobotI');
}
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F12e233684b48dc67054644eaa9e278fc' type='text/javascript'%3E%3C/script%3E"));
</script>
</div>
<script type="text/javascript">
function openRebort(){
	var city = $('#city').text().substring(0,$('#city').text().lastIndexOf('['));
	var basePath = 'http://www.wandafilm.com:80/';
	robotI = open(basePath + 'common/robotreply.jsp?city='+city,'RobotI');
}
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F12e233684b48dc67054644eaa9e278fc' type='text/javascript'%3E%3C/script%3E"));
</script>
		</div>
			<div class="copy-rights text-center">
				<p>© 2016  | Ant GROUP</p>
			</div>
	</div>
 <script src="js/responsive-tabs.js"></script>
    <script type="text/javascript">
      $( '#myTab a' ).click( function ( e ) {
        e.preventDefault();
        $( this ).tab( 'show' );
      } );

      $( '#moreTabs a' ).click( function ( e ) {
        e.preventDefault();
        $( this ).tab( 'show' );
      } );

      ( function( $ ) {
          // Test for making sure event are maintained
          $( '.js-alert-test' ).click( function () {
            alert( 'Button Clicked: Event was maintained' );
          } );
          fakewaffle.responsiveTabs( [ 'xs', 'sm' ] );
      } )( jQuery );

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
							
							$().UItoTop({ easingType: 'easeOutQuart' });
							
						});
					</script>
				<a href="#home" class="scroll" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</body>
</html>