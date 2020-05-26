<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<div class="topNav">
        <div class="wrapper">
        	<c:if test="${!empty loginer}">
        		<div class="welcome"><a href="#" title=""><img src="${pageContext.request.contextPath}/statics/image/userPic.png" alt="" /></a><span>您好, ${loginer.userAlice }</span></div>
        	</c:if>
            <div class="userNav">
                <ul>
                	<li><a href="${pageContext.request.contextPath}/" title=""><img src="${pageContext.request.contextPath}/statics/image/icons/topnav/tasks.png" alt="" /><span>首页</span></a></li>
                	<c:if test="${empty loginer }">
                		<li><a href="${pageContext.request.contextPath}/client/client_regist" title=""><img src="${pageContext.request.contextPath}/statics/image/icons/topnav/profile.png" alt="" /><span>注册</span></a></li>
                	</c:if>
                    <li><a href="#" title=""><img src="${pageContext.request.contextPath}/statics/image/icons/topnav/messages.png" alt="" /><span>Settings</span></a></li>
                    <c:if test="${!empty loginer }">
                    	<li class="dd"><a title=""><img src="${pageContext.request.contextPath}/statics/image/icons/topnav/settings.png" alt="" /><span>个人中心</span></a>
                        <ul class="userDropdown">
                            <li><a href="#" title="" class="sAdd">贴子管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/client/client_view_user" title="" class="sInbox">个人信息</a></li>
                            <li><a href="#" title="" class="sOutbox">用户设置</a></li>
                            <li><a href="${pageContext.request.contextPath}/client/client_alter_password" title="" class="sTrash">密码修改</a></li>
                        </ul>
                    	</li>
                    </c:if>
                    <c:choose>
                    	<c:when test="${empty loginer }">
                    		<li><a href="${pageContext.request.contextPath}/login" title=""><img src="${pageContext.request.contextPath}/statics/image/icons/topnav/logout.png" alt="" /><span>登录</span></a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li><a href="${pageContext.request.contextPath}/loginout" title=""><img src="${pageContext.request.contextPath}/statics/image/icons/topnav/logout.png" alt="" /><span>登出</span></a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
    </div>