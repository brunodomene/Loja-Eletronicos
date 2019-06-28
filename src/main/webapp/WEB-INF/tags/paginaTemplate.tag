
<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ attribute name="titulo" required="true" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:url value="/resources/css" var="url" />
<link rel="stylesheet" href="${url}/bootstrap.min.css">
<link rel="stylesheet" href="${url}/bootstrap.css">
<link rel="stylesheet" href="${url}/produtos-style.css">
<link rel="stylesheet" href="${url}/detalhe-style.css">
<link rel="stylesheet" href="${url}/carrinho.css">
<link rel="stylesheet" href="${url}/main.css">
<link rel="stylesheet" href="${url}/home.css">
<title>Loja Eletrônicos - ${titulo}</title>
</head>

<%@ include file="/WEB-INF/views/cabecalho.jsp" %>

<jsp:doBody />

<%@ include file="/WEB-INF/views/rodape.jsp" %>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

</body>
</html>