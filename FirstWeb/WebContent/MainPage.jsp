<%@ page import="java.sql.ResultSet"%>
<%@ page import="main.DatebaseConnection"%>
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

	<div>

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

		<div id="Borrows" class="tabcontent">
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
						<tr>
							<td>Brak Wyników</td>
						</tr>
					</tbody>
				</table>
				<div class="field">
					<form method="get" action="">
						<input id="idBorrow" value="" name="idBook" style="display: none">
						<input type="submit" value="Edytuj" id="editBorrow">
					</form>
					<button style="margin-top: 15px"
						onclick="goToPage('AddBorrow.jsp')">Dodaj</button>
				</div>
				<div class="field">
					<form method="get" action="Borrows.jsp">
						<fieldset>
							Tytuł:<input type="text" name="title"><br />
							<br /> imię:<input type="text" name="imie"><br />
							<br /> nazwisko:<input type="text" name="nazwisko"><br />
							<br /> wypożyczone od:<input type="date" name="od"><br />
							<br /> wypożyczone do:<input type="date" name="do"><br />
							<br /> <input type="submit" value="Szukaj">
						</fieldset>
					</form>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
