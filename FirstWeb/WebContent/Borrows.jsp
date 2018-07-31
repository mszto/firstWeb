<%@ page import="main.DatebaseConnection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="main.Borrow"%>
<%@ page import="java.sql.Date"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<script src="scripts/script.js"></script>
<link rel="stylesheet" href="css/indexcss.css" type="text/css">
<title>Wo</title>
</head>
<body>

	<button class="tablink" onclick="openPage('Borrows',this,'#597f67')"
		style="background-color: #597f67">Wypożyczenia</button>
	<button class="tablink" onclick="openPage('Books',this,'#597f67')">Ksiązki</button>
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

	<div id="Borrows" class="tabcontent" style="display: block">
		<div>
			<table id="tableBorrow">
				<thead>
					<tr>
						<th>Tytuł</th>
						<th>Osoba</th>
						<th>data wypożyczenia</th>
						<th>data oddania</th>
					</tr>
				</thead>
				<tbody>
					<%
                DatebaseConnection datebaseConnection=DatebaseConnection.getInstance();
                ResultSet rs=null;
                Borrow borrow=new Borrow();
                borrow.setTitle(request.getParameter("title"));
                borrow.setFirstName(request.getParameter("imie"));
                borrow.setLastName(request.getParameter("nazwisko"));
                borrow.setOd(request.getParameter("od"));
                borrow.setDate(request.getParameter("do"));

                rs=datebaseConnection.getData(borrow);
				
                try{
                    while(rs.next()){

            %>
					<tr class="tableRow"
						onclick="EditPerson(this,editBorrow), idBorrow.value=<%=rs.getInt("idBorrows")%>">
						<td><%=rs.getString("title")%></td>
						<td><%=rs.getString("firstName")+" "+rs.getString("lastName")%></td>
						<td><%=rs.getDate("fromb")%></td>
						<td><%=rs.getDate("tob")%></td>
					</tr>
					<%
                }
                }catch (Exception e){
                    e.printStackTrace();
                }
            %>
				</tbody>
			</table>
		</div>
		<div class="field">
			<form method="get" action="">
				<input id="idBorrow" value="" name="idBook" style="display: none">
				<input type="submit" value="Edytuj" id="editBorrow">
			</form>
			<button style="margin-top: 15px" onclick="goToPage('AddBorrow.jsp')">Dodaj</button>
		</div>
		<div class="field">
			<form method="get" action="Borrows.jsp">
				<fieldset>
					Tytuł:<input type="text" name="title"><br />
					<br /> imię:<input type="text" name="imie"><br />
					<br /> nazwisko:<input type="text" name="nazwisko"><br />
					<br /> wypożyczone od:<input type="date" name="od" id="datefrom"
						required><br />
					<br /> wypożyczone do:<input type="date" name="do" id="dateto"
						required><br />
					<br /> <input type="submit" value="Szukaj">
					<script> var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth()+1;
                var yyyy = today.getFullYear();

                if(dd<10) {
                    dd = '0'+dd
                }

                if(mm<10) {
                    mm = '0'+mm
                }
                document.getElementById("dateto").value=yyyy+"-"+mm+"-"+dd;
                dd=today.getDate()-20;
                if(dd<1){
                	dd=today.getDate()+10;
                }else{
                	dd=today.getDate()-20;
                }
                document.getElementById("datefrom").value=yyyy+"-"+mm+"-"+dd;
                </script>
				</fieldset>
			</form>
		</div>
	</div>

</body>
</html>
