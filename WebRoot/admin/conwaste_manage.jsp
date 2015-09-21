<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/admin/bootstrap.min.css">
<link rel="stylesheet" href="css/admin/admin.css">
<title>建筑垃圾准运管理</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/yyucadapter.js"></script>

</head>
<body>
	<div class="main-title">
		<h3>建筑垃圾准运管理</h3>
	</div>
	<div class="alert alert-info">
	  	<p><span class="bold">注意：</span>建筑垃圾准运管理</p>
		<p><span class="bold">提示：</span>信息设置好以后<strong><font color="#FF0000" size="+1">查看</font></strong>即可</p>
	</div>
	
	


<div class="pagination">
 <!--  <ul>

    <li class="disabled"><span>上一页</span></li>
  </ul>
 -->  
</div>
	<div class="tb-toolbar">
		
		<a href="conwasteAction!goToAdd" class="btn btn-small btn-primary">新增</a>
		<!-- 
		<button class="btn btn-small" onClick="dellbs('a',this)" id="del">删除</button>
		 -->
	</div>
	<table class="table table-bordered">
			<thead>
				<tr>
					
					<th>编号</th>
					<th>准运单位</th>
					<th>负责人</th>
					<th>联系电话</th>
					<th>车辆数量</th>
					<th>车牌号码</th>
					<th>运输线路</th>
					<th>运输时限</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				  <s:iterator value="conwastes" var="conwaste" status="index">
			      <tr>
			      		
						<td>
							<s:property value="#index.count"/>
						</td>
						<td><s:property value="unit"/></td>
						<td><s:property value="person"/></td>
						<td><s:property value="phone"/></td>
						<td><s:property value="sum"/></td>
						<td><s:property value="carnumber"/></td>
						<td><s:property value="line"/></td>
						<td>
							<s:property value="timelimit"/>
						</td>
						<td><span>
						<s:if test="status==1">
							已审核
						</s:if>
						<s:else>
							未审核
						</s:else>
						</span></td>
						<td>
						<span>
						[
						<a href="conwasteAction!load?id=<s:property value="id"/>">修改</a>
						]
						</span>
						
						<span>
						[
						<a href="conwasteAction!delete?id=<s:property value="id"/>" >删除</a>
						]
						</span>
						
						</td>
				  </tr>
				  </s:iterator>
						</tbody>
		</table>

	


<div class="pagination">
  <!-- <ul>

    <li class="disabled"><span>上一页</span></li>
  </ul> -->
  
</div>

<script type="text/javascript">
$(function() {
	$("#gotonext").click(function(){
		window.parent.$('.menu-yuding').trigger('click');
	});
});

function dellbs(id,o){
	if(id=='a'){
		if(confirm('确定删除这些信息吗？')){
			var ids = [];
			$('td').find('input[type="checkbox"]:checked').each(function(){
				ids[ids.length] = $(this).val();
			});
			ajax('microVote-del.html',{ id:ids.join(',')},function(){
				$('td').find('input[type="checkbox"]:checked').each(function(){
					$(this).parent().parent().remove();
				});
			});	
		}
	}else{
		if(confirm('确定删除此条信息吗？')){
			ajax('microVote-del.html',{ id:id},function(){
				$(o).parent().parent().parent().remove();
			});	
		}
	}	
}

function selallck(o){
	if($(o).prop('checked')){
		$('td').find('input[type="checkbox"]').prop('checked',true);
	}else{
		$('td').find('input[type="checkbox"]').prop('checked',false);
	}
}
</script>

<div id="gotonext"  >
	<img src="media/images/admin/v3/yuding.png" ></img>
</div>

<br/><br/><br/></body></html>