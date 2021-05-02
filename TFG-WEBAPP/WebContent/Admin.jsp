<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="UTF-8">
<title>Administración de TFGs (ADMIN)</title>
</head>
<body>

	<table border="1">
		<tr>
			<th>Título</th>
			<th>Estudiante</th>
			<th>Email del estudiante</th>
			<th>Email del tutor</th>
			<th>Estado</th>
			<!--<th>Memoria</th>-->
			<th>Nota</th>
			<th>Actualizar</th>
		</tr>
		<c:forEach items="${tfgs}" var="tfgi">
			<form action="FormAdminServlet" method="post">
				<tr>
					<td><input type="text" id="title" name="title" value="${tfgi.title}" /></td>
					<td><input type="text" id="name" name="name" value="${tfgi.name}" /></td>
					<td><input type="hidden" id="email" name="email" value="${tfgi.email}" />${tfgi.email}</td>
					<td><input type="email" id="advisor" name="advisor" value="${tfgi.advisor}" /></td>
					<td><input type="number" id="status" name="status" value="${tfgi.status}" min="0" max="8" /></td>
					<td><input type="text" id="grade" name="grade" value="${tfgi.grade}" /></td>
					<td><button type="submit">Actualizar valores</button></td>
				</tr>
			</form>
		</c:forEach>
	</table>

	<h2>Aceptación de TFGs</h2>
	<table border="1">
		<tr>
			<th>Estudiante</th>
			<th>TFG</th>
		</tr>
		<c:forEach items="${tfgs}" var="tfgi">
			<tr>
				<c:if test="${tfgi.status == 2}">
					<td><input type="hidden" id="tfgemail" name="tfgemail" value="${tfgi.email}"/>${tfgi.email}</td>
					<td><form action="FormAceptarTFGServlet">
							<input type="hidden" id="tfgemail" name="tfgemail" value="${tfgi.email}" />
							<input type="submit" value="Aceptar TFG"></input>
					</form></td>
				</c:if>
			</tr>
		</c:forEach>
	</table>

	<h2>Crear TFG</h2>
	<form action="FormCreaTFGServlet">
		<input type="email" id="email" name="email" placeholder="Email">
		<input type="password" id="password" name="password" placeholder="Password">
		<input type="text" id="name" name="name" placeholder="Nombre y apellidos">
		<input type="text" id="titulo" name="titulo" placeholder="Título del proyecto">
		<input type="email" id="profesor" name="profesor" placeholder="Profesor tutor">
		<button type="submit">Registrar</button>
	</form>

	<h2>Administración de memorias de TFG</h2>
	<table border="1">
		<tr>
			<th>Estudiante</th>
			<th>Memoria</th>
		</tr>
			<c:forEach items="${tfgs}" var="tfgi">
				<tr>
					<c:if test="${tfgi.status == 3}">
						<td><input type="hidden" name="tfgemail" value="${tfgi.email}" />${tfgi.email}</td> 
						<td><form action="FormSubeMemoriaServlet" method="post" enctype="multipart/form-data">
							<input type="file" name="file" />
							<input type="hidden" name="usuario" value="admin" />
							<input type="submit" value="Subir memoria"></input>
						</form></td>
					</c:if>
				</tr>
				<tr>
					<c:if test="${tfgi.status > 3}">
						<td><input type="hidden" name="tfgemail" value="${tfgi.email}" />${tfgi.email}</td>
						<td><form action="FormBajaMemoriaServlet" method="get">
							<input type="submit" value="Descargar memoria"></input>
						</form></td>
					</c:if>
				</tr>
			</c:forEach>
	</table>
	<h2></h2>

	<%@ include file="FormLogout.jsp"%>

</body>
</html>