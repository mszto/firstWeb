<%--
  Created by IntelliJ IDEA.
  User: dkoby
  Date: 05.07.2018
  Time: 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="main.DatebaseConnection"%>
<%@ page import="main.Person"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<html>
<head>
<script src="scripts/script.js"></script>
<link rel="stylesheet" href="css/indexcss.css" type="text/css">
<title>Wo</title>
</head>
<body>

	<button class="tablink" onclick="openPage('Borrows',this,'#597f67')">Wypożyczenia</button>
	<button class="tablink" onclick="openPage('Books',this,'#597f67')">Ksiązki</button>
	<button class="tablink" onclick="openPage('Person',this,'#597f67')">Osoby</button>
	<script>openPage('Person',this,'#326d5b')</script>

	<div id="Person" class="tabcontent" style="display: block">

		<div style="margin-left: 2%">
			<table id="table">
				<thead>
					<tr>
						<th>Imie</th>
						<th>Nazwisko</th>
						<th>Miasto</th>
						<th>Ulica</th>
						<th>nr. domu</th>
						<th>nr. lokalu</th>
					</tr>
				</thead>
				<tbody>
					<%
                Person person=new Person();
                DatebaseConnection data=DatebaseConnection.getInstance();
                ResultSet rs=null;
                person.setFirstName(request.getParameter("firstName"));
                person.setLastName(request.getParameter("lastName"));
                rs=data.getData(person);

            try{
                if(rs==null) {
            %>
					<td>Brak Wyników</td>
					<%
            }else{
                    while (rs.next()) {
            %>
					<tr class="tablerow"
						onclick="EditPerson(this,buttonEdit), idPerson.value=<%=rs.getInt("idPersons")%>">
						<td><%=rs.getString("firstName")%></td>
						<td><%=rs.getString("lastName")%></td>
						<td><%=rs.getString("city")%></td>
						<td><%=rs.getString("street")%></td>
						<td><%=rs.getInt("streetNumber")%></td>
						<td><%=rs.getInt("flatNumber")%></td>
					</tr>
					<%
                            }
                        }
                }
                        catch(Exception e){
                            e.printStackTrace();
                        }
            %>
				</tbody>
			</table>
			<div class="field">
				<form method="get" action="EditPerson.jsp">
					<input id="idPerson" value="" name="id" style="display: none">
					<input type="submit" id="buttonEdit" value="Edytuj" disabled
						onclick="this.disabled=true">
				</form>
				<button style="margin-top: 15px" onclick="goToPage('AddPerson.jsp')">Dodaj</button>
			</div>
			<div class="field">
				<form method="get" action="ResultPerson.jsp">
					<fieldset>
						Imie:<input type="text" name="firstName"><br />
						<br /> Nazwisko:<input type="text" name="lastName"><br />
						<br /> <input type="submit" value="Szukaj">
					</fieldset>
				</form>
			</div>
		</div>
	</div>

	<div id="Books" class="tabcontent">
		<div>
			<table id="tableBooks">
				<thead>
					<tr>
						<th>Tytuł</th>
						<th>Autor</th>
						<th>dostępne</th>
						<th>wypożyczone</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Brak Wyników</td>
					</tr>
				</tbody>
			</table>

			<div class="field">
				<form method="get" action="EditBook.jsp">
					<input id="idBook" value="" name="idBook" style="display: none">
					<input type="submit" value="Edytuj" id="editBook">
				</form>
				<button style="margin-top: 15px" onclick="goToPage('AddBook.jsp')">Dodaj</button>
			</div>

			<div class="field">
				<form method="get" action="Books.jsp">
					<fieldset>
						Tytuł:<input type="text" name="title"><br />
						<br /> Autor:<input type="text" name="author"><br />
						<br /> <input type="submit" value="Szukaj">
					</fieldset>
				</form>
			</div>

		</div>

	</div>

</body>
</html>
