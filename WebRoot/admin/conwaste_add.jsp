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
<title>新增建筑垃圾准运信息</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/yyucadapter.js"></script>

<link rel="stylesheet" href="css/admin/bootstrap.min.css">
<link rel="stylesheet" href="css/admin/admin.css">
<style type="text/css">
	table td {
		min-width:50px;
		overflow:hidden;text-overflow:ellipsis;
	}
	#picsethere{
		width: 510px;
		display: block;
	}
	#picsethere img{
		max-width: 500px;
		display: block;
	}
</style>
</head>
<body>
	<h3>新增建筑垃圾准运信息</h3>
	<div class="alert alert-info">
	  	<p><span class="bold">说明：</span>请输入完整的信息</p>
        <s:hidden name="conwaste.status" value="0"></s:hidden>
	</div>
	<form class="form-horizontal" id="lbsForm" action="conwasteAction!add" method="post">
		<div class="control-group">
	    	<label class="control-label" for="keyword">准运单位</label>
	    	
	    	<div class="controls">
	    	<s:textfield name="conwaste.unit" cssClass="span4"></s:textfield>
	    	</div>
	  	</div>
		<div class="control-group">
	    	<label class="control-label" for="keyword">负责人</label>
	    	
	    	<div class="controls">
	    	<s:textfield name="conwaste.person" cssClass="span4"></s:textfield>
	    	</div>
	  	</div>
		<div class="control-group">
	    	<label class="control-label" for="keyword">联系电话</label>
	    	
	    	<div class="controls">
	    	<s:textfield name="conwaste.phone" cssClass="span4"></s:textfield>
	    	</div>
	  	</div>
		<div class="control-group">
	    	<label class="control-label" for="keyword">车辆数量</label>
	    	
	    	<div class="controls">
	    	<s:textfield name="conwaste.sum" cssClass="span4"></s:textfield>
	    	</div>
	  	</div>
	  	<div class="control-group">
	    	<label class="control-label" for="keyword">车牌号码</label>
	    	
	    	<div class="controls">
	    	<s:textfield name="conwaste.carnumber" cssClass="span4"></s:textfield>
	    	</div>
	  	</div>
	  	<div class="control-group">
			<label class="control-label" for="detail">运输路线</label>
			<div class="controls">
			<s:textarea name="conwaste.line" cssClass="span5" cssStyle="height:100px;width:520px;"></s:textarea>
			</div>
		</div>
		<div class="control-group">
	    	<label class="control-label" for="keyword">运输时限</label>
	    	
	    	<div class="controls">
	    	<s:textfield name="conwaste.timelimit" cssClass="span4"></s:textfield>
	    	</div>
	  	</div>
	  	<div class="control-group">
			<label class="control-label" for="detail">备注</label>
			<div class="controls">
			<s:textarea name="conwaste.note" cssClass="span5" cssStyle="height:100px;width:520px;"></s:textarea>
			</div>
		</div>
		
 		<div class="control-group">
		    <div class="controls">
		    <s:token></s:token>
		      <button id="save-btn" type="submit" class="btn btn-primary btn-large">保存</button>
		     
		    </div>
	    </div>
	</form>
<script type="text/javascript" src="js/comm.js"></script>

<br/><br/><br/></body>

</html>