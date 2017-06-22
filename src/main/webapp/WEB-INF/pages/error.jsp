<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="<c:url value="/resources/css/buttons.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
    <div class="page_block" style="width: 250px">
        <div id="page_info_wrap" class="page_info_wrap">
            <h1>Error</h1>
            <p style="color: #3BB85D">${errorMessage.getMessage()}</p>
        </div>
    </div>

</body>
</html>
