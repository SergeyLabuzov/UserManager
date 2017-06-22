<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

	<title>Страница приветствия</title>
	<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

</head>
<body>
	<div class="page_block">
		<div id="page_info" class="page_info_wrap">
			<h2>Добро пожаловать на данную страничку.</h2>
			<p>Для просмотра стандартного CRUD приложения, которое отображает список
				всех юзеров в базе (с пейджингом), перейдите по ссылке, расположенной чуть ниже данного текста.</p>

			<a href="${pageContext.request.contextPath}/users" title="Перейти к списку пользователей">Перейти к списку пользователей</a>
		</div>
	</div>
</body>
</html>