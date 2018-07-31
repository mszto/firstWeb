<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="scripts/script.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/indexcss.css" type="text/css">
<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
</style>
</head>
<body>

<div id="editPerson">
<form>
	<div class="personData" style="height: 200px; width: 700px">
		<fieldset style="height: 200px">
			<legend>Osoba</legend>
				<div style="float: left;">

				</div>
				<div style="float: left; margin-left: 10px; width: 550px ">
					<fieldset style="width: 500px; height: 150px; background-color:#5ab57b;">
						imie:<input type="text" id="firstName" name="firstName" disabled>
						Nazwisko:<input type="text" id="lastName" name="lastName" disabled><br/><br/>
						Miasto:<input type="text" id="city" name="city" disabled>
						Ulica:<input type="text" id="street" name="street" disabled><br/><br/>
						nr.dom:<input type="number" id="streetNumber" name="streetNumber" disabled>
						nr.miesz:<input type="number" id="flatNumber" name="flatNumber" disabled><br/><br/>
					</fieldset>
				</div>
		</fieldset>
	</div>
	</form>
	<button id="myBtn">Open Modal</button>
						<button id="myBtns" style="width: 100px" >Znajdz</button><br/><br/>
					<button style="width: 100px">Wprowdz</button>
	</div>

<!-- Trigger/Open The Modal -->


<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>Some text in the Modal..</p>
  </div>

</div>

<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

</body>
</html>