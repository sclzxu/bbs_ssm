<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<div id="leftSide">
    <div class="logo"><a href="index.html"><img src="${pageContext.request.contextPath}/statics/image/logo.png" alt="" /></a></div>
    
    <div class="sidebarSep mt0"></div>
    
    <!-- Left navigation -->
    <ul id="menu" class="nav">
    	<c:forEach items="${plates}" var="plate">
        <li class="tables"><a href="#" title="" class="exp"><span>${plate.plateTitle}</span><strong>${categories.size()+1 }</strong></a>
            <ul class="sub">
            	<li><li><a href="#?plateId=${plate.plateId}&categoryId=0" title="">全部</a></li></li>
            	<c:forEach items="${categories }" var="ctg">
            		<li><a href="#?plateId=${plate.plateId}&categoryId=${ctg.categoryId}" title="">${ctg.category}</a></li>
            	</c:forEach>
            </ul>
        </li>
		</c:forEach>
    </ul>
</div>