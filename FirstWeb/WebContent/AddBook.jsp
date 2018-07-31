
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<script src="scripts/script.js"></script>
<link rel="stylesheet" href="css/indexcss.css" type="text/css">
</head>
<body>
	<div id="editPerson">
		<form method="get" action="AddBook">
			<div class="personData" style="width: 100%">
				<fieldset>
					<legend>Dane</legend>
					Tytuł:<input type="text" name="title" required class="bookField">
					Dostępne:<input type="number" name="available" min="0"><br />
					<br /> Autor:<input type="text" name="author" class="bookField">
					Wypożyczone:<input type="number" name="borrow" min="0"> ID:<input
						type="hidden" name="id">
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
