<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Страница редактирования</title>
  <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/css/input.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/css/buttons.css" />" rel="stylesheet">
</head>
<body>

  <div class="page_block" style="width: 250px">
    <div id="page_info_wrap" class="page_info_wrap">
      <a href="${pageContext.request.contextPath}/users" title="Назад">Вернуться к списку пользователей</a>
      <c:url var="updateUrl" value="/users/update" />
      <form:form modelAttribute="editUser" method="POST" action="${updateUrl}">
        <form:input type="hidden" path="id"/>
        <table>
          <tr>
            <td><form:label path="id">ID:</form:label></td>
            <td><form:input path="id" disabled="true"/></td>
          </tr>

          <tr>
            <td><form:label path="name">Name:</form:label></td>
            <td><form:input path="name"/></td>
          </tr>

          <tr>
            <td><form:label path="age">Age:</form:label></td>
            <td><form:input path="age"/></td>
          </tr>

          <tr>
            <td><form:label path="isAdmin">Access:</form:label></td>
            <td>
              <form:select cssStyle="width: 100%" path="isAdmin">
                <c:if test="${editUser.isAdmin}">
                  <form:option value="true" label="Admin"/>
                  <form:option value="false" label="User"/>
                </c:if>

                <c:if test="${!editUser.isAdmin}">
                  <form:option value="false" label="User"/>
                  <form:option value="true" label="Admin"/>
                </c:if>
              </form:select>
            </td>
          </tr>
        </table>
        <br/>
        <input type="submit" value="Update" />
      </form:form>
    </div>
  </div>

</body>
</html>
