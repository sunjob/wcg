<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
    <head>
    <title>在线投诉</title>
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/yyucadapter.js"></script>
    <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="css/mwm/hotel/hotels.css" media="all" />
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
		<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
        <meta name="Keywords" content="" />
        <meta name="Description" content="" />
        <!-- Mobile Devices Support @begin -->
            <meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
            <meta content="no-cache,must-revalidate" http-equiv="Cache-Control">
            <meta content="no-cache" http-equiv="pragma">
            <meta content="0" http-equiv="expires">
            <meta content="telephone=no, address=no" name="format-detection">
            <meta name="apple-mobile-web-app-capable" content="yes" /> <!-- apple devices fullscreen -->
            <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
        <!-- Mobile Devices Support @end -->
        <script type="text/javascript" src="js/mwm/swipe.js"></script>
        <style>
            img{ width:100%!important;}
        </style>
		<script type="text/javascript" src="res/choujiang/js/weixin-api.js"></script>
    </head>
        <body id="hotels" ondragstart="return false;" onselectstart="return false;" >
		
<script type="text/javascript">
        var mysharelink = window.location.href;	
		// 所有功能必须包含在 WeixinApi.ready 中进行
        WeixinApi.ready(function (Api) {

            // 微信分享的数据
            var wxData = {
                "appId": "", // 服务号可以填写appId
                "imgUrl": 'http://www.weixinrs.com/res/share/wyy.jpg',
                "img_width": "265",
                "img_height": "265",
                "link": mysharelink,
                "desc": '欢迎大家在线预约，超便利，省去一大推繁琐流程，只要你有微信就统统搞定！',
                "title": '微信预约，让你先人一步！'
            };

            // 分享的回调
            var wxCallbacks = {
                // 分享操作开始之前
                ready: function () {
                    // 你可以在这里对分享的数据进行重组
                    wxData.link = mysharelink;
                },
                // 分享被用户自动取消
                cancel: function (resp) {
                   // 你可以在你的页面上给用户一个小Tip，为什么要取消呢？
                },
                // 分享失败了
                fail: function (resp) {
                    // 分享失败了，是不是可以告诉用户：不要紧，可能是网络问题，一会儿再试试？
                },
                // 分享成功
                confirm: function (resp) {
                    // 分享成功了，我们是不是可以做一些分享统计呢？
                    $.ajax({
                        /*url: "http://weisft.com/youxi/lujinxgsg/myshare/todo.aspx?do=addsharetimes&id=" + myguid,*/
                        type: "POST",
                        dataType: "text",
                        data: null,
                        success: function (data) {
                        }
                    });
                },
                // 整个分享过程结束
                all: function (resp) {
                     // 如果你做的是一个鼓励用户进行分享的产品，在这里是不是可以给用户一些反馈了？
                }
            };

            // 用户点开右上角popup菜单后，点击分享给好友，会执行下面这个代码
            Api.shareToFriend(wxData, wxCallbacks);

            // 点击分享到朋友圈，会执行下面这个代码
            Api.shareToTimeline(wxData, wxCallbacks);

            // 点击分享到腾讯微博，会执行下面这个代码
            Api.shareToWeibo(wxData, wxCallbacks);
        });

	function addComplaint()
	{
		var name = document.getElementById('name').value;
		var telphone = document.getElementById('telphone').value;
		var comptype = document.getElementById('comptype').value;
		var content = document.getElementById('content').value;
		if(name=='')
		{
			alert("请输入您的姓名.");
			return;
		}
		if(telphone=='')
		{
			alert("请输入您的电话.");
			return;
		}
		if(!(/(^(\d{3,4}-)?\d{7,8})$|(^1[3|4|5|8][0-9]{9})/.test(telphone))){
	        alert("不是正确的11位手机号,请重新输入.");
			return;
	    }
		if(comptype==0)
		{
			alert("请选择投诉类型.");
			return;
		}
		if(content=='')
		{
			alert("请输入投诉内容.");
			return;
		}
		runUrl('complaintAction!addComplaint?name='+name+'&telphone='+telphone+'&comptype='+comptype+'&content='+content);
	}
	
	function runUrl(url){	
		console.log(url);
		url=encodeURI(url);
		url=encodeURI(url);
		window.location=url;
	}


    </script>

<section class="body">
	<div class="banner">
	<div id="imgs_box" class="box_swipe">
		<img alt="" src="res/yy_pic.jpg" style="width: 100%;">	
	</div>
	</div>
	<div class="cardexplain">


			<!--后台可控制是否显示-->
			<ul class="round">
				<li>
					<h2>投诉简介</h2>
					<div class="text">投诉简介投诉简介</div>
					
				</li>
				<li class="tel"><a href="tel:12319"><span>12319</span></a></li>
				
			</ul>

<!--<ul class="round">
                <li>
                    <a href="myby-483.html" >
                        <span>我的在线预约</span>
                    </a>
                </li>
            </ul>-->
		  

			<ul class="round">
				<form action="javascript:void(0);" method="post" id="theform">
				<li class="title mb"><span class="none">请认真填写在线投诉</span></li>
			

								<li class="nob">
					<table class="kuang" border="0" cellpadding="0" cellspacing="0" width="100%">
						<tbody><tr>
							<th>联系人</th>
							<td>
							<s:textfield name="complaint.name" id="name" cssClass="px" placeholder="请输入您的名字"></s:textfield>
							
							</td>
						</tr>
					</tbody></table>
				</li>
								<li class="nob">
					<table class="kuang" border="0" cellpadding="0" cellspacing="0" width="100%">
						<tbody><tr>
							<th>联系电话</th>
							
							<td>
							<s:textfield name="complaint.telphone" id="telphone" cssClass="px" placeholder="请输入您的电话"></s:textfield>
							
							</td>
						</tr>
					</tbody></table>
				</li>
								
								<li class="nob">
					<table class="kuang" border="0" cellpadding="0" cellspacing="0" width="100%">
						<tbody><tr>
							<th>投诉类型</th>
							<td>
								<s:select name="complaint.comptype" id="comptype" cssClass="dropdown-select" list="#{'1':'市容面貌','2':'宣传广告','3':'园林绿化','4':'黑车','5':'城市湖道','6':'街面秩序','7':'施工管理'}" label="投诉类型" headerKey="" headerValue="请选择投诉类型"></s:select> 
						
							</td>
						</tr>
					</tbody></table>
				</li>
								
								<li class="nob">
					<table class="kuang" border="0" cellpadding="0" cellspacing="0" width="100%">
						<tbody><tr>
							<th>投诉内容</th>
							<td>
							
							
							<s:textarea name="complaint.content" id="content"  cssClass="pxtextarea" cssStyle="height:99px;overflow-y:visible" placeholder="请投诉"></s:textarea>
							
							</td>
						</tr>
					</tbody></table>
				</li>
								</form>
			</ul>
			<div class="footReturn">
				<a id="showcard" class="submit" href="javascript:void(addComplaint());">提交投诉</a>
				<div class="window" id="windowcenter">
					<div id="title" class="wtitle">提示<span class="close" id="alertclose"></span></div>
					<div class="content">
						<div id="txt"></div>
					</div>
				</div>
			</div>
		</div>
	<div class="plugback">
		<a href="javascript:history.back(-1)">
			<div class="plugbg themeStyle">
				<span class="plugback">
				</span>
			</div>
		</a>
	</div>
</section>
	<div class="mfooter" id="wxgjfooter" style="text-align: center;width: 100%;height: 20px;line-height: 20px;margin-top:10px;">
<span class="sp2"><a href="#" style="color: #5e5e5e;font-size: 12px;"><!--@39MI提供技术支持--></a></span>
</div>
<div style="width: 0px;height: 0px;overflow: hidden;">

</div>
<script>
/**
$(function(){
	if($('body').height()<$(window).height()){
		$('body').height($(window).height());
		$('#wxgjfooter').css('position','fixed').css('bottom','0px');
	}
});
**/
</script>
     <script>
    	$(document).ready(function(){
    		$(function(){
				new Swipe(document.getElementById('imgs_box'), {
					speed:500,
					//auto:3000,
					callback: function(index, elem){
						var lis = $('#imgs_box').children("ol").children();
						lis.removeClass("on").eq(index).addClass("on");
					}
				}); 
			});
    		
    		$('#showcard').click(function(){

    			$.ajax({
    			url:'yybyok-483-1-.html',
    			data:$('#theform').serialize(),
    			type:'POST',
    			success:function(m){
    				if(m=='ok'){
    					$('#txt').text('提交成功');
    					$('#windowcenter').slideDown();
    				}if(m=='rep'){
    					$('#txt').text('请勿重复提交');
    					$('#windowcenter').slideDown();
    				}
    				setTimeout(function(){
    					$('#windowcenter').slideUp();
    				},1000);
    			}
    			});
    		});
    	});
   	</script>        		
</body>        		
</html>