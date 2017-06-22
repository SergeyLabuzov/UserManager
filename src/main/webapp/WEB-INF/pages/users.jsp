<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<html>
<head>

    <title>Список пользователей</title>
    <link href="<c:url value="/resources/css/input.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/buttons.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/pagination.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

</head>


<body>

    <%-- // use our pagedListHolder --%>
    <jsp:useBean id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder"/>

    <c:url value="/users" var="pagedLink">
        <c:param name="action" value="list"/>
        <c:param name="p" value="~"/>
    </c:url>

    <c:url var="newUrl" value="users/new" />


    <div class="page_block">
        <div id="page_info" class="page_info_wrap">
            <table style="width: 760px">
                <tr>
                    <td width="320px"><a class="btn success btn.small" href="${newUrl}">Add</a></td>
                    <td><form:form modelAttribute="SearchParam" method="POST" action="${pagedLink}"><form:input path="name"/></td>
                    <td><input type="submit" value="Search" /></form:form></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Search by:
                        <c:choose>
                            <c:when test="${SearchParam.name == \"\"}">
                                <strong style="color: firebrick">параметры поиска не заданы</strong>
                            </c:when>
                            <c:when test="${SearchParam.name == \" \"}">
                                <strong style="color: firebrick">символ пробел</strong>
                            </c:when>
                            <c:otherwise>
                                <strong style="color: #3BB85D">${SearchParam.name}</strong>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td></td>
                </tr>
            </table>
        </div>
    </div>

    <div class="page_block">
        <div id="page_info_wrap" class="page_info_wrap">

            <c:if test="${!empty pagedListHolder.pageList}">
                <table style="width: 780px">
                    <tr style="text-align:left; height: 50px">
                        <th width="200">Name</th>
                        <th >Age</th>
                        <th >Access</th>
                        <th >CreatedDate</th>
                        <th style="text-align:center">Actions</th>
                    </tr>
                    <c:forEach items="${pagedListHolder.pageList}" var="user">
                        <c:url var="editUrl" value="users/edit/${user.id}" />
                        <c:url var="deleteUrl" value="users/delete/${user.id}" />
                        <tr style="height: 45px">
                            <td>${user.name}</td>
                            <td>${user.age}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${user.isAdmin}">
                                        Admin
                                    </c:when>
                                    <c:otherwise>
                                        User
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${user.createdDate}</td>
                            <td style="text-align: center">
                                <a class="btn btn.small primary" href="${editUrl}">Edit</a>
                                <a class="btn btn.small error" href="${deleteUrl}">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>
    </div>


    <div class="page_block">
        <div id="page" class="page_info_wrap">
            <%-- // load our paging tag, pass pagedListHolder and the link --%>
            <tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}"/>
        </div>
    </div>



</body>
</html>
