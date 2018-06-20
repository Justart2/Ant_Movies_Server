var uccontrol = (function(){
		//初始化数据
		var userName = '';//用户名称
		var superCookieName = 'wandafilm';//cookie名称
		var jingxuancontent = 'wanda/news.do?m=getNewByNewId&newsId=';//谈资url
		var picType = '';//图片类型
		var getuvFlag = function(){
			return userName != ''?true:false;
		};
		var filmtypearray = {};
			filmtypearray['film_info_init_hot'] = 1;//影片详情
			filmtypearray['focus'] = 2; //影片看点看爆料
			filmtypearray['stage'] = 3;//影片剧照
			filmtypearray['titbit'] = 4;//花絮
			filmtypearray['playbill'] = 5;//海报
			filmtypearray['comingsoon'] = 6;//预报片点击
			filmtypearray['movie_times.jsp?filmId'] = 7;//排期
			filmtypearray['trade/step2.do'] = 8;//选座
			filmtypearray['trade/step3.do'] = 9;//订单支付
			/**首页导航菜单*/
			filmtypearray['homeHd'] = 10;//电影首页
			filmtypearray['timeHd'] = 11;//电影排期
			filmtypearray['appHd'] = 12;//移动购票
			filmtypearray['jingxuan'] = 13;//电影谈资
			filmtypearray['groupHd'] = 14;//今日团购
			filmtypearray['actUrl'] = 15;//促销活动
			
			filmtypearray['wanda/news.do'] = 16;//谈资新闻
			filmtypearray['active'] = 17;//活动
			
		var filmtypestr = {};
			filmtypestr[0] = 'film_info_init_hot';
			filmtypestr[1] = 'movie_times.jsp?filmId';
			filmtypestr[2] = 'trade/step2.do';
			filmtypestr[3] = 'trade/step3.do';
			filmtypestr[4] = 'wanda/news.do';
		//活动Id
		var activeId = $('#countrecorduser').attr('active');
		//undefined
		var undefinedstr;
		/*记录业务执行*/
		var record = function(filmtype,url){
			getArgs();
			if(null == url || '' == url || null == filmtype || filmtype == '')
				return;
			url = url.replace(basePath,'').replace('http://www.wandafilm.com/','');
			if(filmtype == 8 || filmtype == 9)
				url = url.substring(0,url.lastIndexOf('&sid'));
			var relationId = filmtype;
			if(filmtype == 16){
				 url = url.substring(url.length-20);
				 relationId = url;
			}
			if(filmtype == 17){
				relationId = url;
			}
			var date = formatDate(new Date(),'yyyy-MM-dd');
			var name = encodeURIComponent(url+userName);
			var cookies = getCookie(superCookieName+date);
			var uvFlag = getuvFlag();//true执行uv
			if(null == cookies || ""==cookies){
				pvuvrecord(cookies,name,uvFlag,date,filmtype,relationId);
			}else{
				var cookieValues = cookies.split('/');
				var executeFlag = true;
				for(var i = 0 ; i< cookieValues.length; i++){
					if(name == cookieValues[i]){
						executeFlag = false;
						continue;
					}
				}
				if(executeFlag){
					pvuvrecord(cookies,name,uvFlag,date,filmtype,relationId);
				}
			}
		};
	    //记录cookie操作
		var pvuvrecord = function(cookies,name,uvFlag,date,filmtype,relationId){
			if(null == cookies)
				cookies = '';
			clearCookie(superCookieName+date);
			addCookie(superCookieName+date,cookies+'/'+name);
			recordCount(uvFlag,filmtype,date,relationId);//执行uv pv
		};
		//记录添加执行
		var recordCount = function(uvFlag,countType,date,relation){
			var url = basePath + 'baseInfo/websitestatistic.do?m=uvpvRecord';
			$.ajax({
    			type:"post",
    			url:url, 
    			data:{"uvFlag": uvFlag,"countType":countType,"date":date,"relation":relation},
    			success:function (data) {
    			}
    		});
		};
		var initFilmUrl = function(url){
			url = url.toLowerCase();
			var str = url.substring(url.lastIndexOf('videos'),url.lastIndexOf('.flv'));
			return str;
		};
		var getImgUrl = function(url){
			url = url.toLowerCase();
			var str = url.substring(url.lastIndexOf('images'),url.lastIndexOf('.'));
			return str;
		};
		var getMore = function(url){
			url = url.toLowerCase();
			var str = url.substring(url.lastIndexOf('topics'),url.lastIndexOf('.'));
			return str;
		}
		//第二天8点有效期
		var addCookie = function(name,value){
			var Days = 1;
			var exp = new Date();
			var milseconds = exp.getHours()*60*60*1000+exp.getMinutes()*60*1000+exp.getSeconds()*1000;
			exp.setTime(exp.getTime() + Days*24*60*60*1000 - milseconds);
			var str = exp.toString();
			document.cookie = name + "="+ value + ";expires=" + str;
		};
	
		var getCookie = function(name){
			var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
			if(arr=document.cookie.match(reg))
				return (arr[2]);
			else
				return null;
		};
		var clearCookie = function(name){
			var exp = new Date();
			exp.setTime(exp.getTime() - 1);
			var cval=getCookie(name);
			if(cval!=null)
				document.cookie= name + "="+cval+";expires="+exp.toGMTString();
		};
		var clearAll = function(){
			var keys=document.cookie.split(';');
			if(keys){
				for(var i = keys.length; i--;){
					var coname = keys[i].split('=')[0];
					if(coname.indexOf(superCookieName)>0)
						clearCookie(coname);
				}
			}
		};
		
		var initdata = function(){
			//预告片
			$('div[class="playBtn"],div[id="player_box"]').mousedown(function(){
				var url = $('#flash_box').find('param[name="FlashVars"]').attr('value');
				url = initFilmUrl(url);
				record(filmtypearray['comingsoon'],url);
			});
			//预告片
			$('div[id="player_nav"]').find('a').click(function(){
				var url = $(this).attr('href');
				url = initFilmUrl(url);
				record(filmtypearray['comingsoon'],url);
			});
			//剧照
			$('li[id="pic_box1"]').click(function(){
				var url = $(this).find('div[class="preview_pic more_pic1 load"]').find('img').attr('src');
				url = getImgUrl(url);
				picType = filmtypearray['stage'];
				record(picType,url);
			});
			//剧照
			$('.story').find('div[class="movie_imges clearfix"]').find('a').find('img').click(function(){
				var url = $(this).attr('src');
				url = getImgUrl(url);
				picType = filmtypearray['stage'];
				record(picType,url);
			});
			//花絮
			$('li[id="pic_box2"]').click(function(){
				var url = $(this).find('div[class="preview_pic more_pic2 load"]').find('img').attr('src');
				url = getImgUrl(url);
				picType = filmtypearray['titbit'];
				record(picType,url);
			});
			//海报
			$('li[id="pic_box3"]').click(function(){
				var url = $(this).find('div[class="preview_pic more_pic3 haibao_small_pic load"]').find('img').attr('src');
				url = getImgUrl(url);
				picType = filmtypearray['playbill'];
				record(picType,url);
			});
			//看点爆料
			$('.show_more2').click(function(){
				var url = $(this).attr('href');
				url = getMore(url);
				picType = filmtypearray['focus'];
				record(picType,url);
			});
			//首页导航菜单
			$('#menu ul li a').click(function(){
				var id = $(this).attr('id');
				picType = filmtypearray[id];
				record(picType,superCookieName+id);
			});
			//异步加载其他
			$.each(filmtypestr,function(i,v){
				var url = window.location.href;
				var url1 = url.substring(0,url.lastIndexOf('?url='));
				if(url1 != '')
					url = url1;
				if(url.indexOf(v) > 0){
					record(filmtypearray[v],url);
					return;
				}
			});
			//活动
			if(null == activeId || '' == activeId){
				activeId = $('#countrecorduser').attr('active');
			}
			if(null != activeId && ''!=activeId && undefinedstr != activeId){
				record(filmtypearray['active'],activeId);
			};
			
		};
	    var formatDate = function(date,format){
	        var paddNum = function(num){
	          num += "";
	          return num.replace(/^(\d)$/,"0$1");
	        };
	        var cfg = {
	           yyyy : date.getFullYear()
	          ,yy : date.getFullYear().toString().substring(2)
	          ,M  : date.getMonth() + 1
	          ,MM : paddNum(date.getMonth() + 1)
	          ,d  : date.getDate()
	          ,dd : paddNum(date.getDate())
	          ,hh : date.getHours()
	          ,mm : date.getMinutes()
	          ,ss : date.getSeconds()
	        };
	        format || (format = "yyyy-MM-dd hh:mm:ss");
	        return format.replace(/([a-z])(\1)*/ig,function(m){return cfg[m];});
	    };
	    var getArgs = function(){ 
	    	userName = $('#countrecorduser').attr('src').split('?')[1].split('=')[1];
	    };
	    var picPrev = function(dom){
	    	var url = $(dom).parent().parent().find('img[id="lightbox-image"]').attr('src');
	    	url = getImgUrl(url);
	    	record(picType,url);
	    };
	    var picNext = function(dom){
	    	var url = $(dom).parent().parent().find('img[id="lightbox-image"]').attr('src');
	    	url = getImgUrl(url);
	    	record(picType,url);
	    };
		return {initdata:initdata,picPrev:picPrev,picNext:picNext};
	})();
$(document).ready(function(){
	uccontrol.initdata();
});