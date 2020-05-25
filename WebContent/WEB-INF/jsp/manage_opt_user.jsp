<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
<title>用户操作</title>
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
.wContentButton{
	margin-top: 0px;
}
</style>
</head>

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
    	<div class="nNote nInformation hideit">
            <p>${error }</p>
        </div>
    	<!-- Validation form -->
    	<form action="" class="form">
        	<fieldset>
                <div class="widget">
                    <div class="title"><img src="images/icons/dark/alert.png" alt="" class="titleIcon" /><h6>用户操作</h6></div>
                    <div class="formRow">
                    	<label for="userId">账户:</label>
                        <div class="formRight">
                        	<input id="userId" type="text" value="${user.userId }" readonly="readonly"/>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="formRow">
                    	<label for="userLevel">等级:</label>
                        <div class="formRight">
                        	<input id="userLevel" type="text" value="${user.userLevel.levelMessage }" readonly="readonly"/>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="formRow">
                    	<label for="userLevel">提升等级:</label>
                        <div class="formRight">
                        	<div class="oneFour" style="margin-left: 5px;"><a href="${pageContext.request.contextPath}/server/uplevel?userId=${user.userId}" title="" class="wContentButton bluewB">等级提升</a></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="formRow">
                    	<label>暂时降级:</label>
                    	<div class="formRight">
                        	<div class="datepickerInline"></div>
                        	<div class="oneFour"><a href="#" title="" class="wContentButton redwB">暂时降级</a></div>
                    	</div>
                    	<div class="clear"></div>
                	</div>
                	<div class="formRow">
                    	<label>锁定账户:</label>
                    	<div class="formRight">
                        	<div class="datepickerInline"></div>
                        	<div class="oneFour"><a href="#" title="" class="wContentButton redwB">锁定账户</a></div>
                    	</div>
                    	<div class="clear"></div>
                	</div>
                    
                    <div class="clear"></div>
                </div>
                
            </fieldset>
    	</form>
    </div>
    
    <!-- Footer line -->
    <%@ include file="server/server_footer.jsp" %>

</div>

<div class="clear"></div>

</body>
</html>

    