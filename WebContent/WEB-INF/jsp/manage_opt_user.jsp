<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<% long date = new Date().getTime(); request.setAttribute("now",date); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
<title>用户操作</title>
<link href="${pageContext.request.contextPath}/statics/css/main.css"
	rel="stylesheet" type="text/css" />

<script
	src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>

<script
	src="${pageContext.request.contextPath}/statics/js/plugins/spinner/ui.spinner.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/spinner/jquery.mousewheel.js"></script>

<script
	src="${pageContext.request.contextPath}/statics/js/jquery-ui.min.js"></script>

<script
	src="${pageContext.request.contextPath}/statics/js/plugins/charts/excanvas.min.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/charts/jquery.sparkline.min.js"></script>

<script
	src="${pageContext.request.contextPath}/statics/js/plugins/forms/uniform.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/forms/jquery.cleditor.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/forms/jquery.validationEngine-en.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/forms/jquery.validationEngine.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/forms/jquery.tagsinput.min.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/forms/autogrowtextarea.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/forms/jquery.maskedinput.min.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/forms/jquery.dualListBox.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/forms/jquery.inputlimiter.min.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/forms/chosen.jquery.min.js"></script>

<script
	src="${pageContext.request.contextPath}/statics/js/plugins/wizard/jquery.form.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/wizard/jquery.validate.min.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/wizard/jquery.form.wizard.js"></script>

<script
	src="${pageContext.request.contextPath}/statics/js/plugins/uploader/plupload.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/uploader/plupload.html5.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/uploader/plupload.html4.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/uploader/jquery.plupload.queue.js"></script>

<script
	src="${pageContext.request.contextPath}/statics/js/plugins/tables/datatable.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/tables/tablesort.min.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/tables/resizable.min.js"></script>

<script
	src="${pageContext.request.contextPath}/statics/js/plugins/ui/jquery.tipsy.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/ui/jquery.collapsible.min.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/ui/jquery.prettyPhoto.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/ui/jquery.progress.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/ui/jquery.timeentry.min.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/ui/jquery.colorpicker.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/ui/jquery.jgrowl.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/ui/jquery.breadcrumbs.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/ui/jquery.sourcerer.js"></script>

<script
	src="${pageContext.request.contextPath}/statics/js/plugins/calendar.min.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/plugins/elfinder.min.js"></script>

<script src="${pageContext.request.contextPath}/statics/js/custom.js"></script>

<!-- Shared on MafiaShare.net  -->
<!-- Shared on MafiaShare.net  -->
<style>
.wContentButton {
	margin-top: 0px;
}
</style>
</head>

<body>

	<!-- Left side content -->
	<%@ include file="server/server_left.jsp"%>

	<!-- Right side -->
	<div id="rightSide">

		<!-- Top fixed navigation -->
		<%@ include file="server/server_top_nav.jsp"%>

		<!-- Responsive header -->
		<%@ include file="server/server_header.jsp"%>

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
						<div class="title">
							<img src="images/icons/dark/alert.png" alt="" class="titleIcon" />
							<h6>用户操作</h6>
						</div>
						<div class="formRow">
							<label for="userId">账户:</label>
							<div class="formRight">
								<input id="userId" type="text" value="${user.userId }"
									readonly="readonly" />
							</div>
							<div class="clear"></div>
						</div>
						<div class="formRow">
							<label for="userLevel">等级:</label>
							<div class="formRight">
								<input id="userLevel" type="text"
									value="${user.userLevel.levelMessage }" readonly="readonly" />
							</div>
							<div class="clear"></div>
						</div>
						<div class="formRow">
							<label for="userLevel">提升等级:</label>
							<div class="formRight">
								<div class="oneFour">
									<a
										href="${pageContext.request.contextPath}/server/uplevel?userId=${user.userId}"
										title="" class="wContentButton bluewB">等级提升</a>
								</div>
							</div>
							<div class="clear"></div>
						</div>
					</div>
				</fieldset>
			</form>
			<form action="${pageContext.request.contextPath}/server/level_down" method="post" id="pauseForm">
				<input type="hidden" name="userId" value="${user.userId}"/>
				<input type="hidden" name="date" id="downDate"/>
				<fieldset>
					<div>
						<div class="formRow">
							<label>暂时降级:</label>
							<div class="formRight">
								<c:choose>
									<c:when test="${user.levelDown!=null && user.levelDown.getTime()>now }">
										<div class="oneFour">
											<span style="color: red;">降级日期至:<fmt:formatDate value="${user.levelDown }" pattern="yyyy年MM月dd日"/></span><br/>
											<a id="levelCover" href="${pageContext.request.contextPath}/server/un_level_down?userId=${user.userId}" title=""
												class="wContentButton redwB">取消降级</a>
										</div>
									</c:when>
									<c:otherwise>
										<div class="datepickerInline"></div>
										<div class="oneFour">
											<a id="levelDown" href="#" title=""
												class="wContentButton redwB">暂时降级</a>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="clear"></div>
						</div>
					</div>
				</fieldset>
			</form>
			<form action="${pageContext.request.contextPath}/server/lock_user" method="post" id="lockForm">
				<input type="hidden" name="userId" value="${user.userId}"/>
				<input type="hidden" name="date" id="lockDate"/>
				<fieldset>
					<div>
						<div class="formRow">
							<label>锁定账户:</label>
							<div class="formRight">
								<c:choose>
									<c:when test="${user.userLock!=null && user.userLock.getTime()>now }">
										<div class="oneFour">
											<span style="color: red;">锁定日期至:<fmt:formatDate value="${user.userLock }" pattern="yyyy年MM月dd日"/></span><br/>
											<a href="${pageContext.request.contextPath}/server/un_user_lock?userId=${user.userId}" title="" class="wContentButton redwB">解除锁定</a>
										</div>
									</c:when>
									<c:otherwise>
										<div class="datepickerInline"></div>
										<div class="oneFour">
											<a id="lockUser" href="#" title="" class="wContentButton redwB">锁定账户</a>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="clear"></div>
						</div>

						<div class="clear"></div>
					</div>
				</fieldset>
			</form>
		</div>

		<!-- Footer line -->
		<%@ include file="server/server_footer.jsp"%>

	</div>

	<div class="clear"></div>
	<script>
$(function(){
	// 降级处理
	$("#levelDown").click(function(event){
		event.preventDefault();	// 禁止超链接默认行为
		// 获取禁止的日期日期时间
		var $obj = $(this).parent().siblings().find(".ui-state-active").eq(0);
		var $date = $obj.parent().attr("data-year")
					+ '-' + $obj.parent().attr("data-month")
					+ '-' + $obj.html();
		// 把 $date设置给id为downDate的标签
		$("#downDate").val($date);
		// 提交表单
		$("#pauseForm").submit();
	});
	// 锁定账户
	$("#lockUser").click(function(event){
		event.preventDefault();	// 禁止超链接默认行为
		// 获取禁止的日期日期时间
		var $obj = $(this).parent().siblings().find(".ui-state-active").eq(0);
		var $date = $obj.parent().attr("data-year")
					+ '-' + $obj.parent().attr("data-month")
					+ '-' + $obj.html();
		// 把 $date设置给id为downDate的标签
		$("#lockDate").val($date);
		// 提交表单
		$("#lockForm").submit();
	});
});
</script>
</body>
</html>

