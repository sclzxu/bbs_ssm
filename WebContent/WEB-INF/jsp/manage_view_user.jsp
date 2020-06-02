<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
<title>用户信息</title>
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

<!-- Shared on MafiaShare.net  --><!-- Shared on MafiaShare.net  --></head>

<body>

<!-- Left side content -->
<%@ include file="server/server_left.jsp" %>

<!-- Right side -->
<div id="rightSide">

    <!-- Top fixed navigation -->
    <%@ include file="server/server_top_nav.jsp" %>
    
    <!-- Responsive header -->
    <%@ include file="server/server_header.jsp" %>
    
    <div class="line"></div>
    
    <!-- Main content wrapper -->
    <div class="wrapper">
    	<!-- Validation form -->
    	<form:form cssClass="form" method="post" modelAttribute="user" action="">
        	<fieldset>
                <div class="widget">
                    <div class="title"><img src="${pageContext.request.contextPath}/statics/image/icons/dark/alert.png" alt="" class="titleIcon" /><h6>用户信息</h6></div>
                    <div class="formRow">
                    	<form:label path="userId">账户:</form:label>
                        <div class="formRight">
                        	<form:input path="userId" cssClass="validate[required]" />
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="formRow">
                    	<form:label path="userAlice">昵称:</form:label>
                        <div class="formRight">
                        	<form:input path="userAlice" cssClass="validate[required]" />
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="formRow">
                    	<form:label path="userSex">性别:</form:label>
                        <div class="formRight">
                        	<form:input path="userSex" cssClass="validate[required]" />
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="formRow">
                    	<form:label path="userEmail">邮箱:</form:label>
                        <div class="formRight">
                        	<form:input path="userEmail" cssClass="validate[required]" />
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="formRow">
                    	<label for="userPhoto">头像:</label>
                        <div class="formRight">
                        	<img alt="" src="${pageContext.request.contextPath}/statics/file/${user.userPhoto}"></img>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="formRow">
                    	<form:label path="userScore">积分:</form:label>
                        <div class="formRight">
                        	<form:input path="userScore" cssClass="validate[required]"/>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="formRow">
                    	<form:label path="userLevel.levelMessage">等级:</form:label>
                        <div class="formRight">
                        	<form:input path="userLevel.levelMessage" cssClass="validate[required]" />
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="formRow">
                    	<label for="userCreateDate">创建日期:</label>
                        <div class="formRight">
                        	<input type="text" id="userCreateDate" class="validate[required]" value='<fmt:formatDate value="${user.userCreateDate}" pattern="yyyy年MM月dd日"/>'/>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="clear"></div>
                </div>
                
            </fieldset>
    	</form:form>
    </div>
    
    <!-- Footer line -->
    <%@ include file="server/server_footer.jsp" %>

</div>

<div class="clear"></div>

</body>
</html>

    