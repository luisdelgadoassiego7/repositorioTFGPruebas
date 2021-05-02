<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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
			<tr>
				<td>${tfgi.title}</td>
				<td>${tfgi.name}</td>
				<td>${tfgi.email}</td>
				<td>${tfgi.advisor}</td>
				<td>${tfgi.status}</td>
				<td>${tfgi.grade}</td>
				<c:if test="${tfgi.status > 3}">
					<td><form action="FormBajaMemoriaServlet">
							<input type="hidden" name="tfgemail" value="${tfgi.email}" /> <input
								type="submit">Memoria TFG</input>
						</form></td>
				</c:if>
				<c:if test="${tfgi.status == 1}">
					<td>
						<form action="FormProfessorServlet">
							<input type="hidden" id="tfgemail" name="tfgemail" value="${tfgi.email}" />
							<input type="submit" value="Aceptar Tutela"></input>
						</form>
					</td>
				</c:if>
				<c:if test="${tfgi.status == 4}">
					<td>
						<form action="FormProfessorServlet">
							<input type="hidden" id="tfgemail" name="tfgemail" value="${tfgi.email}" />
							<input type="submit">Proponer defensa</input>
						</form>
					</td>
				</c:if>
				<c:if test="${tfgi.status == 6}">
					<td>
						<form action="FormProfessorServlet">
							<input type="hidden" id="tfgemail" name="tfgemail" value="${tfgi.email}" />
							<input type="text" id="mark" name="mark" value="${tfgi.mark}" placeholder="Nota de la defensa" />
							<input type="submit">Poner nota</input>
						</form>
					</td>
				</c:if>
				<c:if test="${tfgi.status != 1 and tfgi.status != 4 and tfgi.status != 6}">
					<td></td>
				</c:if>
			</tr>
		</c:forEach>
	</table>

	<h2>Modificar memoria</h2>
	<c:if test="${tfg.status > 3}">
		<form action="FormBajaMemoriaServlet" method="get">
			<input type="hidden" name="tfgemail" value="${tfg.email}" />
			<button type="submit">Descargar memoria</button>
		</form>
	</c:if>

	<%@ include file="FormLogout.jsp"%>

</body>
</html>