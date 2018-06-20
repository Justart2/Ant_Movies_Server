/**
*	@author liujiangyu
*/
	
var maxCharNum = 140;//评论字数上限
var minCharNum = 5;//评论字数下限
//倒记时
var timeLeft = 15 * 60 * 1000;
var hasShow = false;
var showId;

function Time() {
	if (timeLeft == 0) {
		//直接将该订单状态改为订单失效，屏蔽立即支付按钮
		//window.location = basePath + "user/m2_init.html";
		$("#payLeftTime_"+$("#unpayOrderID").val()).hide();
		$("#buyPaySpan_"+$("#unpayOrderID").val()).html("已失效");
		$("#orderCancelSpan_"+$("#unpayOrderID").val()).hide();
		return false;
	}

	var startMinutes = parseInt(timeLeft / (60 * 1000), 10);
	var startSec = parseInt((timeLeft - startMinutes * 60 * 1000) / 1000);
	$("#timeOver_"+$("#unpayOrderID").val()).html(startMinutes + "分" + startSec + "秒");
	timeLeft = timeLeft - 1000;
	setTimeout("Time()", 1000);
}
$(document).ready(function(){
	timeLeft = $("#leftTime").val() * 1000;
	//showAlert(timeLeft);
	//showAlert($("#unpayOrderID").val());
	if($("#unpayOrderID").val()!=null&&$("#unpayOrderID").val()!=''){
		$("#payLeftTime_"+$("#unpayOrderID").val()).show();
		Time();
	}
	$(".user_center_tabnav a").click(function(){
		var lastCurrent = $(".user_center_tabnav a.current");
		
		var hideTag = lastCurrent.attr("data-tag");
		if (hideTag == 'online_ticket') {
			$('#orderDiv').hide();
		} else {
			$("#" + lastCurrent.attr("data-tag")).hide();	
		}
		
		var showTag = $(this).attr("data-tag");
		if (showTag == 'online_ticket') {
			$('#orderDiv').show();
		} else {
			$("#" + $(this).attr("data-tag")).show();
		}
		
		$(".user_center_tabnav a").removeClass("current");
		$(this).addClass("current");
		this.blur();
		return false;

	});

	$(".order_handle").click(function(){
		$("#" + $(this).attr("data-tag")).toggle();
		return false;
	});
	
	$("#get_code_bt").click(function(){

		$("#bind_phone_explain").show();
		$("#bind_phone_input").val("13522088044");
		$("#bind_phone_code_input")[0].disabled = false;
		$("#bind_phone_code_input").removeClass("disable");

		return false;

	});

	/*上传文件*/
	$("#selPic,#uploadPic").click(function(){
		$("#memberPhoto").click();
	});
	
	$("#_save").click(function(){
		if($("#fileInput").val() =="" || $("#fileInput").val() ==null || $("#fileInput").val() === undefined){
			showAlert("请选择文件!");
			return false;
		}
		$(this).addClass("load");
		setTimeout("$('#_save').removeClass('load');$('#_pic').hide();$('#pic').attr('src',$('#_pic').attr('src'));",1000);
	});
	
	$("#fileInput").click(function(){
		$("#uploadPic").val($("#fileInput").val());
	});
	
	//选择性别(男/女)
	$(".sex-box li").click(function(){
		$(".sex-box li").removeClass("selSex");
		$(this).addClass("selSex");
	});
	
	//是否单身
	$(".marriage-box li").click(function(){
		$(".marriage-box li").removeClass("selMarriage");
		$(this).addClass("selMarriage");
	});
	
	//是否有孩子
	$(".children-box li").click(function(){
		$(".children-box li").removeClass("selchildren");
		$(this).addClass("selchildren");
	});
	
	$(".add_pg").click(function(){
		var filmId = $(this).attr('id');
		$('#filmId').val(filmId);
		if (hasShow == false || filmId != showId) {
			hasShow = true;
			showId = filmId;
			$(".pg_comment_wrapper").attr("style","display:block;");
			$(this).parents("li").after($(".pg_comment_wrapper"),function(){
//				$(".pg_comment_wrapper").fadeIn();
			});
//			showAlert($(this).parents("li").position().left+","+$(this).parents("li").position().top);
			$(".pg_comment_wrapper .borderSpan").css("left",$(this).parents("li").position().left-290);
//			$(".pg_comment_wrapper .fullSpan").css("left",$(this).parents("li").position().left/2);
		} else {
			hasShow = false;
			showId = "";
			$(".pg_comment_wrapper").attr("style","display:none;");
		}
	});
	
	// 用户中心添加评价
	$("#shaiyixia_btn").click(function(){
		//表单域验证...
		 if(!validateComment())return false;//若验证不通过则跳出
		//ajax请求
		 
		 $.ajax({
				type: 'POST',
				url: basePath + "judgeUser.do?m=judgeSessionUser",
				success: function (data) {
					if (data == 'sessionIsNull') {
						location.href = basePath + "common/login.jsp";
					} else if (data == 'sessionIsNotNull') {
					  	var filmId = $("#filmId").val();
					  	var content = $("#content").val().replace(/[\r\n]/g, "");
					  	var code = $('#code').val();
					  	
					  	var cmType = $("input[name='piaogen_type']:checked").val();
					  	if (cmType != '1' && cmType != '2') {
					  		showAlert("请选择喜欢或者不喜欢");
					  		return false;
					  	}
					  	
					  	var filmName = $('#film_name_' + filmId).text();
					  	var cmTypeStyle = '';
					  	var cmTypeName = '';
					  	if (cmType == '1') {
					  		var cmTypeStyle = 'pg_like';
						  	var cmTypeName = '喜欢';
					  	} else if (cmType == '2') {
					  		var cmTypeStyle = 'pg_hate';
						  	var cmTypeName = '不喜欢';
					  	}
					  	
					  	var dataMap = {"filmId": filmId, "commentContent": content, 'cmType': cmType, 'code': code};
					 	$.ajax({
					  		type: "post",
					  		url: basePath + "user/comment.do?m=addFilmComment",
					     	data: dataMap,
					  		success: function(data) {
					 			$("#checkcode").css("display", "none");
					 			$("#spcode").click();
					  			$('#button_green_fb').removeClass("load");
					        	var json='';
					        	eval('json=' + data + ';');
					       		if (json.error == undefined) {
					       			var myDate = new Date();
					       			var ts = '<li>' +
					            	        '	<p class="piaogen_film_name">' + filmName + '</p>' +
					        	            '    <div class="pg">' +
					                        '    	<div class="pg_icon ' + cmTypeStyle + '" title="' + cmTypeName + '"></div>' +
					                        '        <div class="pg_content">' +
					                        '        	影片评价：<span class="view_assess">' + cmTypeName + '</span><br>' +
						                    '           	观影时间：<span class="view_time">' + myDate.getFullYear() + '-' + myDate.getMonth() + 1 + '-' + myDate.getDate() + ' ' + myDate.getHours() + ':' + myDate.getMinutes() + '</span>' +
					                        '        </div>' +
					    	                '    	<span class="add_pg" style="display: none; "></span>' +
						                    '    </div>' +
					                        '</li>';
					       			$('#comment_list').append(ts);
					       			$('#film_' + filmId).remove();
					       			$("#content").val("");
					          		$("#code").val("");
					       			cleanPGForm();
					       		} else{
					       			showAlert(json.error);
					       			if (json.userCommentCount >= 3) {
					       				$("#checkcode").css("display", "");
					    			}
					     			return false;
					   			}
							}
						});
					}
				}
		   	});
	});
	
	
	//控制“投诉建议” 问题类别下拉框的显示
	$('#myQus').click(function(){
		$('#queryType').show();
		$('#linkManBox').hide();
	});
	
	$('#newQus').click(function(){
		$('#queryType').hide();
		$('#linkManBox').show();
	});
	
	// 用户首页修改昵称
	$('#username_div').click(function(){
		$('#username_div').attr("style","display: none;");
		$('#modify_username_div').attr("style","display: inline;");
		$('#username_input').focus();
	});
	$('#cancel_nickname').click(function(){
		$('#username_input').val($('#username_hidden').val());
		$('#username_div').attr("style","display: inline;");
		$('#modify_username_div').attr("style","display: none;");
	});
	$('#save_nickname').click(function(){
		var nickName = $('#username_input').val();
		var sex = $('#sex_hidden').val();
		var favoriteCinema = $('#cinema_hidden').val();
		var time = $('#birthday_hidden').val();
		if (nickName == null || nickName == "") {
			showAlert("昵称不能为空");
			return;
		}
		if (time == null || time == "" || sex == null || sex == "" || favoriteCinema == null || favoriteCinema == "") {
			showAlert("请先至”账号设置“中填写相关信息才能使用此功能");
			$('#username_input').val($('#username_hidden').val());
			$('#username_div').attr("style","display: inline;");
			$('#modify_username_div').attr("style","display: none;");
			return;
		}
		var date = new Date();
		date.setTime(time);
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		if (month < 10) {
			month = "0" + month;
		}
		var day = date.getDate();
		if (day < 10) {
			day = "0" + day;
		}
		var birthDay = year + "-" + month  + "-" + day;
		$.ajax({
			type: 'POST',
			url: basePath + "judgeUser.do?m=judgeSessionUser",
			success: function (data) {
				if (data == 'sessionIsNull') {
					location.href = basePath + "common/login.jsp";
				} else if (data == 'sessionIsNotNull') {
					$("#save_nickname").attr("style","display: none;");
					$("#cancel_nickname").attr("style","display: none;");
					$("#modifyLoading").attr("style","width: 16px; height: 16px; display: inline;");
					var dataMap = {"nickName":nickName, "sex":sex, "birthDay":birthDay, "favoriteCinema":favoriteCinema};
				    $.ajax({
						type: "post",
						url: basePath + "user/info_mgr.do?m=modifyMemberBaseInfo",
						dataType: "json",
						data: dataMap,
						success: function(data) {
							showAlert(data.returnMessage,function(){window.location= basePath + "user/m1_init.html";});
						}
				                                
				   });
				}
			}
	   	});
	});
});


	/**验证评论信息*/
	function validateComment(){
		var comment = $("#content");
		var counter = $("#counter");
		if(comment.val()=="" || $("#content").val().length < minCharNum){//为空或小于minCharNum字数
			counter.addClass("content_err"); 
			counter.text(minCharNum-comment.val().length);
			$("#prompt_content").html("您还需要输入");
			return false;
		}
		return true;
	}

	//实时更新评论文本字数
	function countChar(textareaName,spanName,event){
		var promptContent = "您可以输入";
		var evt = event || window.event;
		var areaContent = $("#"+textareaName).val().replace(/[\r\n]/g,"");//将回车符和换行符排除在限制字符外
		var count = areaContent.length;
		$("#"+spanName).text(maxCharNum - areaContent.length);
		if( count >= maxCharNum){
			$("#"+spanName).addClass("content_err"); 
			if(evt.keyCode != 8 && evt.keyCode != 46){event.returnValue = false;}//将回退键和del键排除在外
			return false;
		}else{
			if($("#"+spanName).hasClass("content_err")){
				$("#"+spanName).removeClass("content_err");
			}
		}
		$("#prompt_content").html(promptContent);
		return true;
	}  
	
	//清空票根输入域信息
	function cleanPGForm(){
		$('.pg_comment_wrapper').hide();
		$(".pg_comment_box input[type='text'],.pg_comment_box input[type='password']").val("");
		$("input[name='piaogen_type']:checked").attr("checked", false);
		$("textarea#content").val("");
	}