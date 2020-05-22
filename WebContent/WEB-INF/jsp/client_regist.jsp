<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
<title>首页</title>
<link href="${pageContext.request.contextPath}/statics/css/main.css" rel="stylesheet" type="text/css" />

<script src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/statics/js/plugins/spinner/ui.spinner.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/spinner/jquery.mousewheel.js"></script>

<script src="${pageContext.request.contextPath}/statics/js/jquery-ui.min.js"></script>

<script src="${pageContext.request.contextPath}/statics/js/plugins/charts/excanvas.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/charts/jquery.sparkline.min.js"></script>

<script src="${pageContext.request.contextPath}/statics/js/plugins/forms/uniform.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/forms/jquery.cleditor.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/forms/jquery.validationEngine-en.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/forms/jquery.validationEngine.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/forms/jquery.tagsinput.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/forms/autogrowtextarea.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/forms/jquery.maskedinput.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/forms/jquery.dualListBox.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/forms/jquery.inputlimiter.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/forms/chosen.jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/statics/js/plugins/wizard/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/wizard/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/wizard/jquery.form.wizard.js"></script>

<script src="${pageContext.request.contextPath}/statics/js/plugins/uploader/plupload.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/uploader/plupload.html5.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/uploader/plupload.html4.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/uploader/jquery.plupload.queue.js"></script>

<script src="${pageContext.request.contextPath}/statics/js/plugins/tables/datatable.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/tables/tablesort.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/tables/resizable.min.js"></script>

<script src="${pageContext.request.contextPath}/statics/js/plugins/ui/jquery.tipsy.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/ui/jquery.collapsible.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/ui/jquery.prettyPhoto.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/ui/jquery.progress.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/ui/jquery.timeentry.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/ui/jquery.colorpicker.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/ui/jquery.jgrowl.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/ui/jquery.breadcrumbs.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/ui/jquery.sourcerer.js"></script>

<script src="${pageContext.request.contextPath}/statics/js/plugins/calendar.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/elfinder.min.js"></script>

<script src="${pageContext.request.contextPath}/statics/js/custom.js"></script>

<!-- Shared on MafiaShare.net  --><!-- Shared on MafiaShare.net  -->
<style>
.radio{
	margin: 0px !important;
}
</style>
</head>

<body>
<!-- Left side content -->
<%@ include file="client/client_left.jsp" %>

<!-- Right side -->
<div id="rightSide">

    <!-- Top fixed navigation -->
    <%@ include file="client/client_top_nav.jsp" %>
    
    <!-- Responsive header -->
    <%@ include file="client/client_header.jsp" %>
    
    <div class="line"></div>
    
    <!-- Main content wrapper -->
    <div class="wrapper">
    	<!-- Note -->
        <div class="nNote nInformation hideit">
            <p>${error }</p>
        </div>
        <!-- Validation form -->
        <form:form cssClass="form" method="post" modelAttribute="user"
        	action="${pageContext.request.contextPath}/client/client_regist">
        	<fieldset>
                <div class="widget">
                    <div class="title"><img src="${pageContext.request.contextPath}/statics/image/icons/dark/alert.png" alt="" class="titleIcon" /><h6>账户注册</h6></div>
                    <div class="formRow">
                    	<form:label path="userId">账户名:<span class="req">*</span></form:label>
                        <div class="formRight">
                        	<form:input path="userId"/>
                        	<form:errors path="userId" cssStyle="color:red;"/>
                        </div><div class="clear"></div>
                    </div>
                    <div class="formRow">
                    	<form:label path="userPsw">密码:<span class="req">*</span></form:label>
                        <div class="formRight">
                        	<form:password path="userPsw"/>
                        	<form:errors path="userPsw" cssStyle="color:red;"/>
                        </div><div class="clear"></div>
                    </div>
                    <div class="formRow">
                        <label for="reUserPsw">确认密码:<span class="req">*</span></label>
                        <div class="formRight"><input type="password" name="reUserPsw" id="reUserPsw" /></div><div class="clear"></div>
                    </div>
                    <div class="formRow">
                    	<form:label path="userAlice">昵称:</form:label>
                        <div class="formRight"><form:input path="userAlice"/></div><div class="clear"></div>
                    </div>
                    <div class="formRow">
                    	<form:label path="userEmail">邮箱:</form:label>
                        <div class="formRight"><form:input path="userEmail"/></div><div class="clear"></div>
                    </div>
                     <div class="formRow">
                    	<form:label path="userSex">性别:</form:label>
                        <div class="formRight">
                        	<div class="floatL"></div>
                        	<div class="floatL" style="margin: 2px 0 0 10px;">
                        		<form:radiobutton path="userSex" value="男"/>男&nbsp;&nbsp;&nbsp;&nbsp;
                        	</div>
                        	<div class="floatL" style="margin: 2px 0 0 0;">
                        		<form:radiobutton path="userSex" value="女"/>女
                        	</div>
                        </div><div class="clear"></div>
                    </div>
                    <div class="formSubmit"><input type="submit" value="注册" class="redB" /></div>
                    <div class="clear"></div>
                </div>
                
            </fieldset>
        </form:form>      
       	
    </div>
    
    <!-- Footer line -->
    <%@ include file="client/client_footer.jsp" %>

</div>

<div class="clear"></div>

</body>
</html>
    