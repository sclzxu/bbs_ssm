<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
<title>个人收藏</title>
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
        <!-- Dynamic table -->
        <div class="widget">
            <div class="title"><img src="${pageContext.request.contextPath}/statics/image/icons/dark/full2.png" alt="" class="titleIcon" /><h6>个人收藏</h6></div>                          
            <table cellpadding="0" cellspacing="0" border="0" class="display dTable">
            <thead>
            <tr>
            <th>发帖日期</th>
            <th>标题</th>
            <th>板块</th>
            <th>分类</th>
            <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${invitations}" var="inv">
            <tr class="gradeC">
            	<td><fmt:formatDate value="${inv.invitationCreate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            	<td><a href="${pageContext.request.contextPath}/client_view_invitation/${inv.invitationId}">${inv.invitationTitle}</a></td>
            	<td>${inv.plate.plateTitle}</td>
            	<td class="center">${inv.category.category}</td>
            	<td class="center"><a href="${pageContext.request.contextPath}/client/del_invitation_inter?invitationId=${inv.invitationId}"><strong>取消收藏</strong></a></td>
            </tr>
            </c:forEach>
            </tbody>
            </table>  
        </div>
    </div>
    
    <!-- Footer line -->
    <%@ include file="client/client_footer.jsp" %>

</div>

<div class="clear"></div>
<script>
$(function(){
	// 触发点击 “<th>发帖日期</th>” 单击事件
	$(".dTable").find("th").first().trigger("click");
});
</script>
</body>
</html>
    