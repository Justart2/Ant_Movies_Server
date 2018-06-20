/*
 *@选座页面
 *@author LH
 */
var can_not;
var canBuySeats=0;
$(document).ready(function() { 
	$.ajax({
		type:"POST",
		url: "step2.do?m=getWhetherSwitch&sid="+Math.random(),
		success:function(data){
		var msg = $.parseJSON(data);
			if(msg.type == "1" && msg.switchPCAPP == "1"){//都开
				can_not = 0;
			}else if(msg.type == "0" && msg.switchPCAPP == "1"){//PC开
				can_not = 0;
			}else if(msg.type == "1" && msg.switchPCAPP == "2"){//APP开
				can_not = 1;
			}else if(msg.type == "0" && msg.switchPCAPP == "0"){//都关
				can_not = 1;
			}else{
				alert("系统繁忙，请稍后再试");
			}
	}
	});
	canBuySeats=parseInt($('#canBuySeats').val());
	$('.good_item').each(function(){//设置卖品选项初始值
		var buyNumber = $(this).find("input[class='buy_number']");
		var buyNumInput = $(this).find("input[name='buyNum']");
//		if($(this).hasClass('good1')){
//			$(this).find('.increase_num').click();
//		}else{
//			buyNumber.val('0');buyNumInput.val('0');
//		}
	});
	
	var spk = $('#spk').val();
	var cid = $('#cid').val();
	
	initSeat(spk, "01");
	printShowInfo(theCityCode, cid);
	
	/*-------------- 无注册购票  begin --------------*/
	var unRegister = $('#unRegister').val();
	if (unRegister != '') {
		$('#unregDiv').show();
	} else {
		$('#unregDiv').hide();
	}
	
	// 无注册购票--发送手机验证码
	$('.att_sms').click(function() {
		var flagg = "8";
		$('.mobile_err').html('');
		$('.sms_err').html('');
		//验证码提示
		$('.authCode_err').html('');
		
		
		// 判断是否在倒计时中
		if ($(this).hasClass('refsms'))
			return false;
		
		var regMobile = $('#regMobile').val().trim();
		var authCode = $('#authCode').val().trim();
//		alert('authCode：'+authCode);
		
		// 用户名和密码都未输入
		if (regMobile == '' || regMobile == '') {
			$('.mobile_err').html('请输入手机号');
			return false;
		}
		
		
		
		if (/^0{0,1}1[0-9]{10}$/.test(regMobile)) {
			
			if (authCode == '') {
				$('.authCode_err').html('请先输入验证码');
//				alert(请先输入验证码);
				return false;
			}
			
			$.ajax({
				type: 'POST',
				url: basePath + "trade/unRegisterBuy.do?m=sendSms",
				data: {"mobile": regMobile,"authCode":authCode,"flagg":flagg},
				beforeSend : function(XMLHttpRequest) {
					$('.att_sms').hide();
					$('.att_sms_loading').show();
				},
				success: function (data) {
					var rest = eval('(' + data + ')');
//					alert(rest.flag);
					if (rest.flag == 'success') {
						$('.lmtime').show();
						$('.att_sms').addClass('refsms');
						loginShowtime();//启动倒计时
					}
					if(rest.flag == 'authCodeErr'){
						$('.att_sms_loading').hide();
						$('.att_sms').show();
						$('.authCode_err').html(rest.tip);
					}else{
						$('.att_sms_loading').hide();
						$('.att_sms').show();
						$('.mobile_err').html(rest.tip);
					}
					
				}
		   	});
		} else {
			$('.mobile_err').html('请输入正确的手机号');
			return false;
		}
	});
	
	//验证码更新 
	$("b[name='spcode']").bind("click", function () {
		var spcode = $(this).prev('span').children('img');
//		alert(spcode.attr('src'));
		var imgCode = chgUrl(spcode.attr('src'));
		//spcode.attr("src", );
		
		$("img[name='srccode']").each(function() {
			$(this).attr('src', imgCode);
		});
	});	

	
	// 无注册购票--登录或者注册
	$('#loginOrRegisterUser').click(function() {
		$('.mobile_err').html('');
		$('.sms_err').html('');
		
		var regMobile = $('#regMobile').val().trim();	// 手机号
		var sms_code = $('#sms_code').val().trim();	// 验证码
		if (regMobile == '') {
			$('.mobile_err').html('请输入手机号');
			return false;
		}
		if (!/^0{0,1}1[0-9]{10}$/.test(regMobile)) {
			$('.mobile_err').html('请输入正确的手机号');
			return false;
		}
		if (sms_code == '') {
			$('.sms_err').html('请输入验证码');
			return false;
		}
		$.ajax({
			type: 'POST',
			url: basePath + "trade/unRegisterBuy.do?m=loginOrRegisterUser",
			data: {'mobile': regMobile, 'code': sms_code},
			beforeSend : function(XMLHttpRequest) {
				$('.mobile_err').html('');
				$('.sms_err').html('');
				
				$('#loginOrRegisterUser').hide();
				$('.login_loading').show();
			},
			success: function (data) {
				var msg = eval('(' + data + ')');
				if (msg.flag == 'success') {
					// 修改为正常购票
					$('#unRegister').val('');
					$('#unlog').hide();
					$('#mobile').val(regMobile);
					$('#logtd').show();
				} else if (msg.flag == 'codeError') {
					$('.sms_err').html(msg.tip);
				} else {
					$('.mobile_err').html(msg.tip);
				}
				
				$('.login_loading').hide();
				$('#loginOrRegisterUser').show();
			}
	   	});
	});
	/*-------------- 无注册购票  end --------------*/

	// 单击卖品图片放大
	$(".foodImg").lightBox( {
		txtImage: "卖品"
	});
	
	// 当用户停留在电影排期页超过 1 分钟,则弹出购票提示
	window.setTimeout(purchaseTip, 60000);
});

// 当用户停留在电影排期页超过 1 分钟,则弹出购票提示
function purchaseTip() {
	var html = "<div class='purchaseTip'>选好满意的座位后，请点击“下一步”确认订单并在 15 分钟内完成支付 <a class='i_close' href='javascript:void(0);'><img src='" + basePath +"imges/movie/trade/i_close.png' alt=''></a></div>",
		$ele = $(html).appendTo(document.body);
		$ele.fadeIn();
		
		$(".i_close").click(function(e) {
			$(".purchaseTip").fadeOut();
		});
}

// 初始化座位
var sectionId = '01';
function initSeat(spk, scid) {
	var dataStr = "&spk=" + spk;
	if (scid != null){
		dataStr +="&scid=" + scid;
	}
	$.ajax({
			type : "POST",
			url : "step2.do?m=initSeat&sid="+Math.random(),
			data : "dataStr=" + dataStr,
			dataType: "json",
			beforeSend : function(XMLHttpRequest) {
				$(".c_content").html('<img src="' + basePath +'imges/movie/loading.gif" />');
			},
			success : function(msg) {
				var seat = msg;
				var str = "";
				var f = 0;
				var r = 1;
				var rid= 1;

//				var cinemaId = seat[0]['phoCinemaId'];
//				$('#cinemaId').val(cinemaId);
				
				var mr = seat[0]['maxRowNum'];
				var mc = seat[0]['maxColNum'];
				var scid = seat[0]['sectionId'];
				sectionId = scid;
				var size = seat[0]['sections'];
				
		
				var rightimageurl = seat[0]['rightimageurl'];
				var leftimageurl = seat[0]['leftimageurl'];
				var seatnameurl = seat[0]['seatnameurl'];
				var activityid = seat[0]['activityid'];
				var activityname = seat[0]['activityname'];
				//if(activityid != "0"){
				//判断是否有活动，不等于空就是有活动;奥迪活动
				if(activityid != ""){
					$("#sitRed").css('display','block');
//					$("#sitRed").html('<img src=http://images.wandafilm.com/uploadServer/' + seatnameurl +' style=" padding-right:50px;height:13px;margin-top:5px;" />');
					$("#activityname").html(activityname);
				    $("#sit_green").css('margin-left','200px');
					$("#sit_div").html('<img src=http://images.wandafilm.com/uploadServer/' + leftimageurl +' style="float:left;padding-top:34px;padding-left:100px;" />');
					$("#sit_div").append('<img src=http://images.wandafilm.com/uploadServer/' + rightimageurl +' style="float:right;padding-top:28px;padding-right:18px;"/>');
					
				}
				
				
				for (var i=0; i<mr; i++){	//逻辑行
					none = 0;
					var str2 = "";
					for(var j=0; j<mc; j++){	//逻辑列
						f = 0;
						for(var n = 0;n<seat.length;n++){	//匹配座位
							if(seat[n]['rowNum'] == (i+1) && seat[n]['colNum'] == (j+1)){
								none = 1;
								f = 1 ;
								rid = seat[n]['rowId'];
								if(seat[n]['state'] == 'F' && seat[n]['activitystatus']!="1"){
									str2 +=	"<li name='"+seat[n]['colId']+"' data-tag='active'>"+seat[n]['colId']+"</li>";
									break;
								}else if(seat[n]['state'] == 'F' && seat[n]['activitystatus']=="1" ){
									str2 +=	"<li name='"+seat[n]['colId']+"' class='sit_red2' activeseat='aodi' data-tag='locked'>" + seat[n]['colId'] + "</li>";
									break;
								}else if(seat[n]['state'] != 'F' && seat[n]['activitystatus']=="1"){
									str2 +=	"<li name='"+seat[n]['colId']+"' class='sit_ashy2' activeseat='aodi' data-tag='locked'>" + seat[n]['colId'] + "</li>";
									break;
								}else{
									str2 +=	"<li name='"+seat[n]['colId']+"' class='sit_ashy2' data-tag='locked'>" + seat[n]['colId'] + "</li>";
									break;
								}
							}	
						}
						if(f == 0){
							str2 +=	"<li class=\"none\" data-tag='none'>"+(j+1)+"</li>";	
						}
						
					}	
					if( none == 1 ){
						str += " <dl class=\"clearfix\"> " 
							+ "<dt>" + rid  + "</dt>"
		                    + "<dd>"      
		                    + "<ol>" ;
						str += str2;
		                str += "</ol>"       
		                    + "</dd>"        
							+ "<dt class=\"r\">" + rid + "</dt>"      
							+ "</dl>";
					}else{
						str += " <dl class=\"clearfix\"> " 
								+ "<dt> </dt>"
			                    + "<dd>"      
			                    + "<ol>" ;
						str += str2;
		                str += "</ol>"       
		                    + "</dd>"        
							+ "<dt class=\"r\"> </dt>"      
							+ "</dl>";
					}
				}
		
				$(".c_content").html(str);
				var _wh = mc*27 + 60*2;
				$(".c_content").css("width", _wh);
				var _ttemp_str = $(".c_content").height();
				var _ht = mr*40 + 30;
				$(".c_box").css("height",_ht);
				var sitHeight = _ht + 250;
				$(".sit").css("height", sitHeight);
				
				$('#leftPlay').show();
				$('#rightPlay').show();
				$('#rest').show();
				
				triggle(seatnameurl);	// 事件注册，等到座位初始化完成后再注册事件，如果座位没有初始化完就注册事件，则无效
			}
	});
}

//下一步，进入支付页面
function sendSeat(spk) {
	
	//验证用户是否已经登陆,如果没有则弹出登录框
	$.ajax({
		type: 'POST',
		url: basePath + "judgeUser.do?m=judgeSessionUser",
		success: function (data) {
			if (data == 'sessionIsNull') {
				openLoginDialog('reload');
			}else{
				var bool = false;
				$(".c_content dl dd ol li").each(function() {
					if ($(this).hasClass('sit_orange2')) {
						bool = true;
					}
				});
				if (!bool) {
					showAlert("您尚未选座，请选择座位！");
					return;
				}
				
				// 座位
				var seats = $('#seat').text().split('、');
				var seatStr = '';
				for (var i=0; i<seats.length; i++) {
					var pLen = seats[i].indexOf('排');
					var zLen = seats[i].indexOf('座');
					seatStr += seats[i].substring(0, pLen) + ":" + seats[i].substring(pLen + 1, zLen);
					if (i < seats.length - 1) {
						seatStr += ",";
					//	alert(seatStr);//几排几座
					}
				}
				var seatId = spk + "_" + sectionId + "|" + seatStr;		// eg.201200001010_01|8:05,8:06
			//	alert(seatId);//  _ 01 | 6:6//6排6座
				// 卖品
				var goods = $('#goods').text().split('、');
				var goodsStr = '';
				$('.buy_number').each(function() {
					var num = $(this).val();
					if (num != '0') {
						var gid = $(this).attr('id');
						gid = gid.substring(gid.lastIndexOf('_') + 1);
						goodsStr += gid + "_" + num + "|";
					}
				});
				if (goodsStr.length > 0) {
					goodsStr = goodsStr.substring(0, goodsStr.length-1);
				}
				var avtId = $('#avtId').val();

				var generUrl = basePath + "trade/step2.do?m=generOrder";
				var orderUrl = basePath + "trade/step3.do?m=buyPay";
				
				$.ajax({
					type: "GET",
					url: generUrl + "&sid=" + Math.random(),
					data: "seatId=" + seatId + "&gids=" + goodsStr + "&avtId=" + avtId,
					beforeSend: function (XMLHttpRequest) {
						$('#nextbtn').hide();
						$('.nextbtn_loading').show();
						//$("#buyBtn").html('<img src="' + basePath +'imges/movie/loading.gif" style="float:right;margin-right:100px;" />');
					},
					success : function (msg) {
						if (msg == "0"){
							showAlert("对不起，座位被锁定，请选择其他座位！",function(){window.location.reload();});
						} else if (msg == "2") {
							showAlert("您有一笔订单还未支付，为保证资源有效分配，请将原来订单先支付或等待座位释放！",function(){window.location.href = basePath + "user/m2_init.html";});
						} else if (msg == "3") {
							showAlert("您所选择的场次已经过期，请选择其他场次。",
									function(){window.location.href = basePath + 'trade/movie_times.jsp';});
							
						} else if (msg == "4") {
							showAlert("锁定权益失败，请稍后再试",function(){
								window.location.href = basePath + 'trade/movie_times.jsp';
							});
							
						} else if (msg == '5') {
							if (window.confirm('对不起，你选购的卖品已经售罄，您是否继续购票？')) {
								$.ajax({
									type: "GET",
									url: generUrl + "&sid=" + Math.random(),
									data: "seatId=" + seatId + "&gids=&avtId=" + avtId,
									beforeSend: function (XMLHttpRequest) {
										$('#nextbtn').hide();
										$('.nextbtn_loading').show();
										//$("#buyBtn").html('<img src="' + basePath +'imges/movie/loading.gif" style="float:right;margin-right:100px;" />');
									},
									success : function (msg) {
										if (msg == "0"){
											showAlert("对不起！座位可能被锁定，请尝试其他座位。",
													function(){window.location.reload();});
											
										} else if (msg == "2") {
											showAlert("您有一笔订单还未支付，为保证资源有效分配，请将原来订单先支付或等待座位释放！",
													function(){window.location.href = basePath + "user/m2_init.html";});
											
										} else if (msg == "3") {
											showAlert("您所选择的场次已经过期，请选择其他场次。",
													function(){window.location.href = basePath + 'trade/movie_times.jsp';});
											
										} else if (msg == "4") {
											showAlert("锁定权益失败，请稍后再试",
													function(){window.location.href = basePath + 'trade/movie_times.jsp';});
										} else {
											window.location = orderUrl + "&snid=" + msg + "&spk=" + spk + "&sid=" + Math.random();
										}
									}
								});
							} else {
								window.location.reload();
							}
						}else if (msg == "6") {
							showAlert("您所选择的场次属于农行6元活动场次，需参与相应活动才能购买。",function(){
								window.location.href = basePath + 'trade/movie_times.jsp';
							});
						}
						else {
							window.location = orderUrl + "&snid=" + msg + "&spk=" + spk + "&sid=" + Math.random();
						}
					}
				});

			} 
		}
   	});
	
	//当加入了上边的验证用户登录和提示框之后，这步提示就不需要了
	/*var unRegister = $('#unRegister').val();
	if (unRegister != '') {
		showAlert("请确认接收影票的手机号码");
		return false;
	}*/
	
	
}



// 给座位注册事件
function triggle(seatnameurl) {
	var seatnameurl = seatnameurl;
	var price = $('#price').val();
	var avtId = $('#avtId').val();
	$(".c_content dl dd ol li").mouseover(function() {
		$(this).css("z-index","2");
		if($(this).hasClass("none")){return false;}
		var id2 = $(this).text();
		var id1 = $(this).parent("ol").parent("dd").prev("dt").text();
		var tar;
//		if (id2 < 10) {
//			id2 = '0' + id2;
//		}$(".c_content").html('<img src="' + basePath +'imges/movie/loading.gif" />');
		
		if($(this).attr('activeseat')=="aodi"){ 
		    tar = id1 + '排' + id2 + '座'+'<br/>'+'<img src=http://images.wandafilm.com/uploadServer/' + seatnameurl +' style="display:inline-block;vertical-align:middle;height:12px;which:100%;" />';
		    $(this).html("<span class=\"seatDiv2\" id=\"showSt_" + id1 + "_" + id2 + "\"><img src=\"" + basePath + "imges/movie/min_pt.gif\" class=\"ss2\" /><span class=\"setinfo2\">" + tar + "</span></span>" + id2);

		}else{
			tar = id1 + '排' + id2 + '座';
			$(this).html("<span class=\"seatDiv\" id=\"showSt_" + id1 + "_" + id2 + "\"><img src=\"" + basePath + "imges/movie/min_pt.gif\" class=\"ss\" /><span class=\"setinfo\">" + tar + "</span></span>" + id2);

		}
				showSt(id1, id2);
	});
	
	$(".c_content dl dd ol li").mouseout(function() {
		$(this).css("z-index","1");
		if($(this).hasClass("none")){return false;}
		var id2 = $(this).attr('name');
		var id1 = $(this).parent("ol").parent("dd").prev("dt").text();
		$(this).html(id2);
		hideSt(id1, id2);
	});
	
	$(".c_content dl dd ol li").click(function() {//点击座位事件
		if($(this).hasClass("none")){return false;}
		if ($(this).hasClass('sit_ashy2')) {
			return;
		}
		
		var id2 = $(this).attr('name');	// mouseover
		//var id2 = parseInt($(this).text(),10);
		var id1 = $(this).parent("ol").parent("dd").prev("dt").text();
		var tar = id1 + '排' + id2 + '座';
		var oneSeatKey = id1 + '-' + id2;
		var mobuy = $(this);
//		$(".c_content dl").each(function(){
//			//if(parseInt($(this).children("dt").text(),10) == id1){
//			if (parseInt($(this).children("dt").html()) == id1) {
//				$(this).children("dd").children("ol").children("li").each(function(){
//					//if(!$(this).hasClass("none") && parseInt($(this).text(),10) == id2){
//					if(!$(this).hasClass("none") && $(this).attr('name') == id2){
//						
//					}
//				});
//			}
//		});
		
		$('#dsplay').show().next("div.money").hide();
		
		// 变色
		var seatHTML = $('#seat').html();
		if (mobuy.attr('class') == 'sit_orange2') {	// 取消选座
			//开始检测取消
			var preSel = perSelectedSeats(mobuy);
			var afterSel = nextSelectedSeats(mobuy);
			
			var perSeat = mobuy.prev("li");
			var nextSeat = mobuy.next("li");
			
			if (preSel.length >= afterSel.length)
			{
				if (preSel.length > 0)
				{
					for (var i=0;i<afterSel.length;i++)
					{
						cancelSeat(afterSel[i],price);
					}
				}
			}else{
				if (afterSel.length > 0)
				{
					for (var i=0;i<preSel.length;i++)
					{
						cancelSeat(preSel[i],price);
					}
				}
			}
			
			
			if (perSeat.attr('class') == 'sit_orange2' && perSeat.attr('data-tag') == 'locked' && perSeat.attr('dependent') == 'Y')
			{
				if (perSeat.prev("li").attr('data-tag') != 'locked' ){
					cancelSeat(perSeat,price);
				}else if (rightEdageSeat(mobuy)){
					cancelSeat(perSeat,price);
				}
			}
			
			if (nextSeat.attr('class') == 'sit_orange2' && nextSeat.attr('data-tag') == 'locked' && nextSeat.attr('dependent') == 'Y')
			{
				if (nextSeat.next("li").attr('data-tag') != 'locked'  ){
					cancelSeat(nextSeat,price);
				}else if (leftEdageSeat(mobuy)){
					cancelSeat(nextSeat,price);
				}
			}
			
			
			
			cancelSeat(mobuy,price);
//			mobuy.attr('class', '').attr('data-tag','');
//			var seats = seatHTML.split('、');
//			if (seats.length > 1) {
//				$('#seat').html('');
//				var sts = '';
//				for (i=0; i<seats.length; i++) {
//					if (tar != seats[i]) {
//						sts = sts + seats[i] + '、';
//					}
//				}
//				sts = sts.substring(0, sts.length-1);
//				$('#seat').html(sts);
//			} else {
//				$('#seat').html('');
//			}
			
			
			
			
			
			//cancelAll = cancelAll.add(mobuy);
			//showAlert(afterSel.size());
			
			
//			var colid = mobuy.attr('name');	// mouseover
//			//var id2 = parseInt($(this).text(),10);
//			var rowid = parseInt(mobuy.parent("ol").parent("dd").prev("dt").text(),10);
//			var tar = rowid + '排' + colid + '座';
//			
//			for(var j=0;j<seatList.length; j++)
//			{
//				if (seatList[j]==tar){
//					seatList[j]=null;
//				}
//			}
//			
//			
//			sts="";
//			for(var j=0;j<seatList.length; j++)
//			{
//				if (seatList[j]==null){continue;}
//				sts = sts + seatList[j] + "、";
//			}
//			if (sts.substring(sts.length-1 ,sts.length)=="、")
//			{
//				sts = sts.substring(0,sts.length-1)
//			}
//			$('#seat').html(sts);
			// 订单总金额
//			var amount = $('#amount').html();
//			$('#amount').html((parseFloat(amount) - parseFloat(price)).toFixed(2));
		} else {//选座
			var seats = '';
			if ($('#seat').text() != '') {
				seats = $('#seat').text().split('、');
			}
			
			if (seats.length >= canBuySeats) {
				showAlert("最多只能预订"+canBuySeats+"张！");
				return false;
			}
			/* 判断连座start */
			var nameVal = $(this).attr("name");
			var colIndex = $(this).parent("ol").children("li").index($(this).get(0));//列坐标
			if($(this).attr('data-tag')!='locked'){
				var flag1 = false;var flag2 = false;
				if($(this).nextAll("li[data-tag !='none']").eq(0).attr('data-tag') == 'locked'){
					flag1 = true;
				}
				if($(this).prevAll("li[data-tag !='none']").eq(0).attr('data-tag') == 'locked'){
					flag2 = true;
				}
				
				if(!flag1 && !flag2){
					if($(this).nextAll("li[data-tag !='none']").eq(0).nextAll("li[data-tag !='none']").eq(0).length ==1 &&
						$(this).nextAll("li[data-tag != 'none']").eq(0).nextAll("li[data-tag != 'none']").eq(0).attr('data-tag')=='locked'){
						showAlert("您只能购买连号的座位!");return false;
					}
					if($(this).prevAll("li[data-tag !='none']").eq(0).prevAll("li[data-tag !='none']").eq(0).length ==1 &&
						$(this).prevAll("li[data-tag != 'none']").eq(0).prevAll("li[data-tag != 'none']").eq(0).attr('data-tag')=='locked'){
						showAlert("您只能购买连号的座位!");return false;
					}
				}
				if($('#seat').text() != ''){
					if($(this).parents("dl").prev("dl").find("li").eq(colIndex).attr('data-tag') =='locked' ||
							$(this).parents("dl").next("dl").find("li").eq(colIndex).attr('data-tag')=='locked' ||
							$(this).prevAll("li[class != none]").eq(0).attr('data-tag')=='locked' ||
							$(this).nextAll("li[class != none]").eq(0).attr('data-tag')=='locked'){
					}else {
						showAlert("您只能购买连号的座位!");
						return false;
					}

				}
				var perActiveSeats = $(this).prevAll("li[data-tag ='active']");
				var perActiveSeat = $(this).prev("li");
				var nextActiveSeats = $(this).nextAll("li[data-tag ='active']");
				var nextActiveSeat = $(this).next("li");
				
				
				if (edageSeat($(this)))
				{
					//showAlert("本身是边界");
				} else if(perActiveSeat.attr('data-tag') =='locked' || nextActiveSeat.attr('data-tag') =='locked'){
					//showAlert("可以选");
					if ((leftEdageSeat(perActiveSeat)) || rightEdageSeat(nextActiveSeat)){
						$(this).attr('dependent','Y');
					}
				}else if ((leftEdageSeat(perActiveSeat)))
				{
					showAlert("不可以选择此座位");
					return false;
				} else if (rightEdageSeat(nextActiveSeat)){
					showAlert("不可以选择此座位");
					return false;
				}
				
			}
			/* 判断连座end */
			
			mobuy.attr('class', 'sit_orange2').attr('data-tag','locked');////这里添加
			if (mobuy.attr('activeseat') == 'aodi' && can_not == 0) {
				can_not = 1;
				testTime();
			}
			seatList.push(tar);
			var ts = '、';
			if (seatHTML == '') {
				ts = '';
			}
			$('#seat').append(ts).append(tar);
			
			// 订单总金额
			var amount = $('#amount').html();
			$('#amount').html((parseFloat(amount) + parseFloat(price)).toFixed(2));
		}
	});
}
var t = 3;
function testTime() {
	if (t <= 0) {
		t = 3; // 计数器递减
		$("#aodi_dialog").hide();
	} else {
	t--;
	$("#aodi_dialog").show();
	setTimeout("testTime()", 1000);
	}
}
var seatList = new Array();
//取消座位
function perSelectedSeats(seat){
	var seats = new Array();
	var tmp = seat;
	while(true){
		tmp = tmp.prev("li");
		
		if (tmp.attr('data-tag')=='locked' && tmp.attr('class')=='sit_orange2'){
			
			seats.push(tmp);
		}else{
			break;
		}
		
	}
	return seats;
}

function nextSelectedSeats(seat){
	var seats = new Array();
	var tmp = seat;
	while(true){
		tmp = tmp.next("li");
		
		if (tmp.attr('data-tag')=='locked' && tmp.attr('class')=='sit_orange2'){
			
			seats.push(tmp);
		}else{
			break;
		}
		
	}
	//alert("2"+seats+"3");
	return seats;
}

function edageSeat(seat)
{
	var result = false;
	//if (seat.length == 0) {return result ;} 
	
	if (seat.prev("li[class='none']").length>0 || seat[0].previousSibling == null || seat.next("li[class='none']").length>0 || seat[0].nextSibling == null)
	{
		result = true;
	}
	return result;
}

function leftEdageSeat(seat)
{
	var result = false;
	//if (seat.length == 0) {return result ;} 
	
	if (seat.prev("li[class='none']").length>0 || seat[0].previousSibling == null)
	{
		result = true;
	}
	return result;
}

function rightEdageSeat(seat)
{
	var result = false;
	//if (seat.length == 0) {return result ;} 
	
	if (seat.next("li[class='none']").length>0 || seat[0].nextSibling == null)
	{
		result = true;
	}
	return result;
}

function cancelSeat(seat,price)
{    
	if($(seat).attr('activeseat')=="aodi"){
		can_not = 1;
		seat.attr('class', 'sit_red2').attr('data-tag','locked').attr('dependent','Y');
	}else{
	    seat.attr('class', '').attr('data-tag','active').attr('dependent','N');
	}
	var colid = seat.attr('name');	// mouseover
	//var id2 = parseInt($(this).text(),10);
	var rowid = seat.parent("ol").parent("dd").prev("dt").text();
	var tar = rowid + '排' + colid + '座';
	var seatsStr= "";
	var totalPrice = 0;
	for(var j=0;j<seatList.length; j++)
	{
		if (seatList[j]==tar){
			seatList[j]=null;
		} else if (seatList[j] == null){
			continue;
		} else {	
			seatsStr = seatsStr + seatList[j] + "、";
			totalPrice = parseFloat(totalPrice) + parseFloat(price);
		}
	}
	
	
	if (seatsStr.substring(seatsStr.length-1 ,seatsStr.length)=="、")
	{
		seatsStr = seatsStr.substring(0,seatsStr.length-1)
	}
	$('#seat').html(seatsStr);
//	$('#amount').html(parseFloat(totalPrice).toFixed(2));
	// 订单总金额
	var amount = $('#amount').html();
	$('#amount').html((parseFloat(amount) - parseFloat(price)).toFixed(2));
}
function printShowInfo(ccd, cid) {
	var cinema = "";
	for(var i = 0;i < cinemaArray.length;i++){
		if( cinemaArray[i][0]==cid ){
			cinema = cinemaArray[i][1];
			break;
		}
	}
	$('#cinemaId').html(cinema);
}

//增加商品
function add(id, price) {
	$('#dsplay').show();
	
	var typeName = '';
	var num = $('#buy_number_' + id).val();
	if (num < 4) {
		num++;
		$('#buy_number_' + id).val(num);
		typeName = $('#tc_' + id).html();
		tsBuy(id, typeName, num);
		
		// 订单总金额
		var amount = $('#amount').html();
		$('#amount').html((parseFloat(amount) + parseFloat(price)).toFixed(2));
		
		$('#buyNum_' + id).val(num);
	}
}

// 减少商品
function plus(id, price) {
	var typeName = '';
	var num = $('#buy_number_' + id).val();
	if (num > 0) {
		$('#dsplay').show();
		
		num--;
		$('#buy_number_' + id).val(num);
		typeName = $('#tc_' + id).html();
		tsBuy(id, typeName, num);
		
		// 订单总金额
		var amount = $('#amount').html();
		$('#amount').html((parseFloat(amount) - parseFloat(price)).toFixed(2));
		
		$('#buyNum_' + id).val(num);
	}
}

function buyonblur(id, price) {
	var num = $('#buy_number_' + id).val();
	$('#buy_number_' + id).val(num);
	typeName = $('#tc_' + id).html();
	tsBuy(id, typeName, num);
	
	// 订单总金额
	var preNum = $('#buyNum_' + id).val();
	
	var amount = $('#amount').html();
	var total = price * (num-preNum);
	$('#amount').html((parseFloat(amount) + parseFloat(total)).toFixed(2));
	
	var num = $('#buy_number_' + id).val();
	$('#buyNum_' + id).val(num);
}


// 显示选择的座位和卖品
function tsBuy(id, typeName, num) {
	$('#dsplay').show().next("div.money").hide();;
	
	var gdNum = typeName + "<span id=\"goodsNum_" + id + "\">" + num + "</span>" + '份';
	var goodsHTML = $('#goods').html();
	if (goodsHTML.indexOf(typeName, 0) != -1) {
		$('#goodsNum_' + id).html(num);
		
		if (num == 0) {
			var goods = '';
			goodsHTML = $('#goods').html();
			var gds = goodsHTML.split('、');
			for (i=0; i<gds.length; i++) {
				if (gdNum.toLowerCase() != gds[i].toLowerCase()) {
					goods = goods + gds[i] + "、";
				}
			}
			goods = goods.substring(0, goods.length-1);
			$('#goods').html(goods);
		}
	} else {
		if (num != 0) {
			var ts = '、';
			if (goodsHTML == '') {
				ts = '';
			}
			$('#goods').append(ts).append(gdNum);
		}
	}
	
}

function buykeypress(id) {
	if (event.keyCode < 48 || event.keyCode > 57) {
		event.keyCode = 0;
		$('#buy_number_' + id).val('0');
	}
}

function buykeyup(id) {
	var num = $('#buy_number_' + id).val();
	if (num != '') {
		if (num > 4) {
			$('#buy_number_' + id).val('0');
			
		}
		if (num.substring(0, 1) == 0) {
			if (num.length >= 2) {
				$('#buy_number_' + id).val('0');
			}
		}
	}
}

function showSt(id1, id2) {
	$('#showSt_' + id1 + '_' + id2).show();
	$('#showSt_' + id1 + '_' + id2).attr('style', 'display: inline');
}

function hideSt(id1, id2) {
	$('#showSt_' + id1 + '_' + id2).hide();
}

// 重新选座
function rest() {
	var price = $('#price').val();
	$('#seat').html('');
	$(".c_content dl dd ol li").each(function(){
		if ($(this).hasClass('sit_orange2')) {
			$(this).removeClass('sit_orange2').attr('data-tag','');
			var amount = $('#amount').html();
			$('#amount').html((parseFloat(amount) - parseFloat(price)).toFixed(2));
		}
	});
}

// 切换场次
function otherPlay(spk) {
	if (confirm("确定切换到其它场次吗？")) {
		location.href = basePath + 'trade/step2.do?m=movieBuy&spk=' + spk;
	}
}

//无注册购票时发送短信倒计时
var secondVal = 60;
function loginShowtime() {
	$('.lmtime').html('(' + secondVal + ')');
	
	if (secondVal <= 0) {
		secondVal = 60;
		$('.lmtime').hide();
		$('.att_sms').removeClass('refsms');
	} else {
		secondVal --;
		setTimeout("loginShowtime()", 1000);	//每一秒执行一次，实现倒计时效果
	}
}

function chgUrl(url) {
	var timestamp = (new Date()).valueOf();
	url = url.substring(0,url.indexOf("?"));
	if((url.indexOf("&") >= 0)) {
		url = url + "×tamp=" + timestamp;
	}else{
		url = url + "?timestamp=" + timestamp;
	}
	return url;
}
