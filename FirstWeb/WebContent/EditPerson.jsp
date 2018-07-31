<%@ page import="main.DatebaseConnection"%>
<%@ page import="java.sql.ResultSet"%><%--
  Created by IntelliJ IDEA.
  User: dkoby
  Date: 06.07.2018
  Time: 12:40
  To change this template use File | Settings | File Templates.
--%>
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
    int id= Integer.parseInt(request.getParameter("id"));
    rs=datebaseConnection.getData("Select * from persons p where p.idPersons="+id);

    rs.next();
%>
	<div id="editPerson">
		<form method="get" action="personsGet">
			<div class="personData">
				<fieldset>
					<legend>Dane</legend>
					Imię:<input type="text" name="firstName" required
						value="<%=rs.getString("firstName")%>"><br />
					<br /> Nazwisko:<input type="text" name="lastName"
						value="<%=rs.getString("lastName")%>" required><br />
					<br /> ID:<input type="hidden" name="id" value="<%=id%>">
				</fieldset>
			</div>

			<div class="personData">
				<fieldset>
					<legend>Dane Adresowe</legend>
					Miejscowosc:<input type="text" name="city"
						value="<%=rs.getString("city")%>" required><br />
					<br /> Ulica:<input type="text" name="street"
						value="<%=rs.getString("street")%>"><br />
					<br /> Nr. Domu:<input type="number" name="streetNumber" min="0"
						value="<%=rs.getInt("streetNumber")%>" required><br />
					<br /> Nr. mieszkania:<input type="number" name="flatNumber"
						min="0" value="<%=rs.getInt("flatNumber")%>"><br />
					<br />
				</fieldset>
			</div>
			<div class="personData">
				<input style="width: 150px" type="submit" value="ok">
			</div>
		</form>
		<div class="personData">
			<button style="width: 150px" onclick="goToPage('ResultPerson.jsp')">Anuluj</button>
		</div>
	</div>
</body>
</html>
