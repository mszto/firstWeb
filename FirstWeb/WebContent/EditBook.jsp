<%@ page import="main.DatebaseConnection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<link rel="stylesheet" href="css/indexcss.css" type="text/css">
<script src="scripts/script.js"></script>
<title>Title</title>
</head>
<body>
	<%
    DatebaseConnection datebaseConnection=DatebaseConnection.getInstance();
    ResultSet rs=null;
    int id= Integer.parseInt(request.getParameter("idBook"));
    rs=datebaseConnection.getData("Select * from books b where b.idBooks="+id);

    rs.next();
%>
	<div id="editPerson">
		<form method="get" action="updateBook">
			<div class="personData" style="width: 100%">
				<fieldset>
					<legend>Dane</legend>
					Tytuł:<input type="text" name="title" required
						value="<%=rs.getString("title")%>" class="bookField">
					Dostępne:<input type="number" name="available" min="0"
						value="<%=rs.getString("available")%>"><br />
					<br /> Autor:<input type="text" name="author"
						value="<%=rs.getString("author")%>" class="bookField">
					Wypożyczone:<input type="number" name="borrow" min="0"
						value="<%=rs.getString("borrow")%>"> ID:<input
						type="hidden" name="id" value="<%=id%>">
				</fieldset>
			</div>
			<div class="personData">
				<input style="width: 150px" type="submit" value="ok">
			</div>
		</form>
		<div class="personData">
			<button style="width: 150px" onclick="goToPage('Books.jsp')">Anuluj</button>
		</div>
	</div>

</body>
</html>
