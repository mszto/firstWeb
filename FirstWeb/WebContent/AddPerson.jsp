
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<link rel="stylesheet" href="css/indexcss.css" type="text/css">
<script src="scripts/script.js"></script>
<title>Title</title>
</head>
<body>
	<div id="editPerson">
		<form method="get" action="AddedPerson">
			<div class="personData">
				<fieldset>
					<legend>Dane</legend>
					Imię:<input type="text" name="firstName" required><br />
					<br /> Nazwisko:<input type="text" name="lastName" required><br />
					<br /> ID:<input type="hidden" name="id">
				</fieldset>
			</div>

			<div class="personData">
				<fieldset>
					<legend>Dane Adresowe</legend>
					Miejscowosc:<input type="text" name="city" required><br />
					<br /> Ulica:<input type="text" name="street"><br />
					<br /> Nr. Domu:<input type="number" name="streetNumber" min="1"
						required><br />
					<br /> Nr. mieszkania:<input type="number" name="flatNumber"
						min="1" value="null"><br />
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
