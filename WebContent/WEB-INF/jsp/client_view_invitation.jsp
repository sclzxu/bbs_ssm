<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
<title>贴子浏览</title>
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
<script src="${pageContext.request.contextPath}/statics/js/wangEditor.min.js"></script>

<!-- Shared on MafiaShare.net  --><!-- Shared on MafiaShare.net  -->
<style>
	.w-e-text-container{height: 100px !important;}
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
    	<form class="form" method="post" action="${pageContext.request.contextPath}/client/client_view_invitation">
		<input type="hidden" name="invitation.invitationId" value="${invitation.invitationId}"/>
		<input type="hidden" name="ansMessage" id="ansMessage"/>
		<fieldset>
			<div class="widget">
				<!-- 帖子内容 -->
				<div class="title">
					<h6>${invitation.invitationTitle }
					 <c:if test="${!empty loginer && loginer.userId!=invitation.user.userId}">
					 	<c:choose>
					 		<c:when test="${empty inter }">
						 		<a href="${pageContext.request.contextPath}/client/add_new_invitation_inter?invitationId=${invitation.invitationId}"><strong>收藏此贴</strong></a>
					 		</c:when>
					 		<c:otherwise>
					 			<a href="${pageContext.request.contextPath}/client/del_invitation_inter?invitationId=${invitation.invitationId}"><strong>取消收藏</strong></a>
					 		</c:otherwise>
					 	</c:choose>
					 </c:if>
					 </h6>
				</div>
				<div class="formRow">
 					<div class="wUserInfo">
                        <a class="wUserPic"><img style="width:40px;" src="${pageContext.request.contextPath}/statics/file/${invitation.user.userPhoto}" alt="" /></a>
                        <ul class="leftList">
                            <li><a><strong>${invitation.user.userAlice }</strong></a></li>
                            <li><a><strong><fmt:formatDate value="${invitation.invitationCreate }" pattern="yyyy-MM-dd"/></strong></a></li>
                        </ul>
                        <div class="formRight">${invitation.invitationMessage }</div>
                        <div class="clear"></div>
                    </div>
					<div class="clear"></div>
				</div>
				
				<div class="clear" style="border-bottom: 20px solid #EEE;"></div>
				<!-- 帖子回复 -->
				<c:forEach items="${anss }" var="ans">
				<div class="formRow">
 					<div class="wUserInfo">
                        <a class="wUserPic"><img style="width:40px;" src="${pageContext.request.contextPath}/statics/file/${ans.user.userPhoto}" alt="" /></a>
                        <ul class="leftList">
                            <li><a><strong>${ans.user.userAlice }</strong></a></li>
                            <li><a><strong><fmt:formatDate value="${ans.ansDate }" pattern="yyyy-MM-dd"/></strong></a></li>
                        </ul>
                        <div class="formRight">${ans.ansMessage }</div>
                        <div class="clear"></div>
                    </div>
					<div class="clear"></div>
				</div>
				</c:forEach>
				
				<div class="clear" style="border-bottom: 10px solid #EEE;"></div>
				<div class="formRow">
					<label>&nbsp;</label>
					<div class="formRight" id="editor"></div>
					<div class="clear"></div>
				</div>
				<div class="formSubmit"><input type="submit" value="回复" class="redB" /></div>
				<div class="clear"></div>
			</div>
		</fieldset>
	</form>
    </div>
    
    <!-- Footer line -->
    <%@ include file="client/client_footer.jsp" %>

</div>

<div class="clear"></div>
<script>
	var E = window.wangEditor;
	var editor = new E('#editor');
	// 自定义菜单配置
	editor.customConfig.menus = [
    	'head',// 标题
   	 	'bold',// 加粗
    	'fontSize',//字号
    	'fontName', //字体
    	'italic',//倾斜
    	'underline',//下划线
    	'strikeThrough',  // 删除线
    	'foreColor',  // 文字颜色
    	'backColor',  // 背景颜色
    	'justify',  // 对齐方式
    	'emoticon',  // 表情
    	'image',  // 插入图片
    	'undo',  // 撤销
    	'redo'  // 重复
	];
	// 自定义配置颜色（字体颜色、背景色）
	editor.customConfig.colors = [
'#000000','#eeece0','#1c487f','#4d80bf','#c24f4a','#8baa4a','#7b5ba1','#46acc8','#f9963b'
	];
	// 自定义字体
	editor.customConfig.fontNames = [
    '宋体','黑体','华文新魏','微软雅黑','Arial','Tahoma','Verdana'
];
	// 关闭粘贴样式的过滤
	editor.customConfig.pasteFilterStyle = true;
	// 忽略粘贴内容中的图片
	editor.customConfig.pasteIgnoreImg = true;
	// 上传图片到服务器
	editor.customConfig.uploadImgServer = '${pageContext.request.contextPath}/upload';
	// 隐藏“网络图片”tab
	editor.customConfig.showLinkImg = false;
	// 将图片大小限制为 1M
	editor.customConfig.uploadImgMaxSize = 1 * 1024 * 1024;
	// 限制一次最多上传 5 张图片
	editor.customConfig.uploadImgMaxLength = 5;
	// 监听函数，可使用监听函数在上传图片的不同阶段做相应处理
	editor.customConfig.uploadImgHooks = {
		customInsert: function (insertImg, result, editor) {
    		for(var i in result){
    			insertImg('${pageContext.request.contextPath}/statics/file/'+result[i]);
    		}
		}
	}
	editor.create();
	// 下面的script用于处理提交 
$(function(){
 $("form").submit(function(){
	 // 把富文本框中的内容作为id为ansMessage的值
	 $("#ansMessage").val(editor.txt.html());
 });
});
</script>
</body>
</html>

    