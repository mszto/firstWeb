<%@ page import="main.DatebaseConnection"%>
<%@ page import="main.Book"%>
<%@ page import="java.sql.ResultSet"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<script src="scripts/script.js"></script>
<link rel="stylesheet" href="css/indexcss.css" type="text/css">
<title>Wo</title>
</head>
<body>
	<button class="tablink" onclick="openPage('Borrows',this,'#597f67')">Wypożyczenia</button>
	<button class="tablink" onclick="openPage('Books',this,'#597f67')"
		style="background-color: #597f67">Ksiązki</button>
	<button class="tablink" onclick="openPage('Person',this,'#597f67')">Osoby</button>

	<div id="Person" class="tabcontent">
		<div style="padding-left: 2%">
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
					<td>Brak Wyników</td>
				</tbody>
			</table>
		</div>
		<div class="field">
			<form method="get" action="EditPerson.jsp">
				<input id="idPerson" value="" name="id" style="display: none">
				<input type="submit" id="buttonEdit" value="Edytuj" disabled>
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

	<div id="Books" class="tabcontent" style="display: block">

		<div>
			<table id="tableBooks">
				<thead>
					<tr>
						<th style="width: 300px">Tytuł</th>
						<th style="width: 200px">Autor</th>
						<th style="width: 50px">dostępne</th>
						<th style="width: 50px">wypo</th>
					</tr>
				</thead>
				<tbody>
					<%
                DatebaseConnection connection=DatebaseConnection.getInstance();
                Book book=new Book();
                ResultSet rs=null;

                book.setTitle(request.getParameter("title"));
                book.setAuthor(request.getParameter("author"));
                rs=connection.getData(book);

            try{
            if(rs==null) {
            %>
					<td>Brak Wyników</td>
					<%
                }else{
                while (rs.next()) {
            %>
					<tr class="tableRow"
						onclick="EditPerson(this,editBook), idBook.value=<%=rs.getInt("idBooks")%>">
						<td style="width: 280px"><%=rs.getString("title")%></td>
						<td style="width: 200px"><%=rs.getString("author")%></td>
						<td style="width: 50px"><%=rs.getInt("available")%></td>
						<td style="width: 50px"><%=rs.getInt("borrow")%></td>
					</tr>
					<%
                        }
                    }
                }catch (Exception e){
                e.printStackTrace();
                }
            %>
				</tbody>
			</table>
		</div>

		<div class="field">
			<form method="get" action="EditBook.jsp">
				<input id="idBook" value="" name="idBook" style="display: none">
				<input type="submit" value="Edytuj" id="editBook" disabled>
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

</body>
</html>
