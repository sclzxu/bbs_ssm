<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<div class="topNav">
        <div class="wrapper">
        	<c:if test="${!empty loginer}">
        		<div class="welcome"><a href="#" title=""><img src="${pageContext.request.contextPath}/statics/image/userPic.png" alt="" /></a><span>您好, ${loginer.userAlice }</span></div>
        	</c:if>
            <div class="userNav">
                <ul>
                	<c:if test="${empty loginer }">
                		<li><a href="${pageContext.request.contextPath}/client/client_regist" title=""><img src="${pageContext.request.contextPath}/statics/image/icons/topnav/profile.png" alt="" /><span>注册</span></a></li>
                	</c:if>
                    <li><a href="#" title=""><img src="${pageContext.request.contextPath}/statics/image/icons/topnav/tasks.png" alt="" /><span>Tasks</span></a></li>
                    <li class="dd"><a title=""><img src="${pageContext.request.contextPath}/statics/image/icons/topnav/messages.png" alt="" /><span>Messages</span><span class="numberTop">8</span></a>
                        <ul class="userDropdown">
                            <li><a href="#" title="" class="sAdd">new message</a></li>
                            <li><a href="#" title="" class="sInbox">inbox</a></li>
                            <li><a href="#" title="" class="sOutbox">outbox</a></li>
                            <li><a href="#" title="" class="sTrash">trash</a></li>
                        </ul>
                    </li>
                    <li><a href="#" title=""><img src="${pageContext.request.contextPath}/statics/image/icons/topnav/settings.png" alt="" /><span>Settings</span></a></li>
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