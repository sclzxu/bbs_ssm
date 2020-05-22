<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
<title>分类列表</title>
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
		<div class="oneTwo"></div>
		<div class="oneTwo">
			<div class="oneTwo"></div>
			<div class="oneTwo"><a href="${pageContext.request.contextPath}/server/manage_add_category" class="wContentButton greenwB">添加分类</a></div>
			<div class="clear"></div>
		</div>
		<div class="widget">
            <div class="title"><img src="${pageContext.request.contextPath}/statics/image/icons/dark/images2.png" alt="" class="titleIcon" /><h6>分类列表</h6></div>
            <div class="gallery">
               <ul>
               		<c:forEach items="${categories}" var="ctg">
               			<li>
                        	<div style="width: 101px;height: 101px;font-size: 16px;vertical-align: middle;line-height: 101px;">
                        		<a href="${pageContext.request.contextPath}/server/del_category/${ctg.categoryId }"><img src="${pageContext.request.contextPath}/statics/image/icons/delete.png" alt="" style="display:block;width:16px;margin: 0px;position: absolute;left: 0px;" /></a>
                            	<a href="${pageContext.request.contextPath}/server/manage_alter_category/${ctg.categoryId }">${ctg.category}</a>
                       		</div>
                    	</li>
               		</c:forEach>
               </ul> 
               <div class="fix"></div>
           </div>
        </div>
    </div>
    
    <!-- Footer line -->
    <%@ include file="server/server_footer.jsp" %>

</div>

<div class="clear"></div>

</body>
</html>

    