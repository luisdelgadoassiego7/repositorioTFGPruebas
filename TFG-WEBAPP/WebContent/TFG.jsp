<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="UTF-8">
<title>Administración del TFG (ALUMNO)</title>
</head>
<body>

	<h2>Bienvenido a la página de gestión de su TFG</h2>

	<h2>Modificar memoria</h2>
	<c:if test="${tfg.status == 3}">
		<form action="FormSubeMemoriaServlet" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="tfgemail" value="${tfg.email}" />
			<input type="file" name="file" />
			<input type="hidden" name="usuario" value="alumno" />
			<input type="submit"> Subir memoria </input>
		</form>
	</c:if>
	<c:if test="${tfg.status > 3}">
		<form action="FormBajaMemoriaServlet" method="get">
			<input type="hidden" name="tfgemail" value="${tfg.email}" />
			<button type="submit">Descargar memoria</button>
		</form>
	</c:if>
	<h2></h2>

	<%@ include file="FormLogout.jsp"%>

</body>
</html>