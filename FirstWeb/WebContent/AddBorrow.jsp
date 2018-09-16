<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.ResultSet"%>
<%@ page import="main.DatebaseConnection"%>
<%@ page import="main.Person"%>
<%@ page import="main.Book"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="scripts/script.js"></script>
<link rel="stylesheet" href="css/indexcss.css" type="text/css">
<title>Wo</title>
</head>
<body>

<%
String stan="0";
stan=request.getParameter("click");
if(stan==null)
	stan="0";
System.out.println(stan);
%>

<jsp:useBean id="p" class="main.Person" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="p"/>
<div id="editPerson">
	<div class="personData" style="height: 200px; width: 700px">
		<fieldset style="height: 200px">
			<legend>Osoba</legend>
				<div style="float: left;">
					<button id="myBtn" style="width: 100px" >Znajdz</button><br/><br/>
					<button style="width: 100px" onclick="document.getElementById('addModal').style.display = 'block'">Wprowdz</button>
				</div>
				<div style="float: left; margin-left: 10px; width: 550px ">
				<form method="get">
					<fieldset style="width: 500px; height: 150px; background-color:#5ab57b;">
						imie:<input type="text" id="firstName" name="firstName" value=<%=p.getFirstName() %> disabled>
						Nazwisko:<input type="text" id="lastName" name="lastName" value=<%=p.getLastName() %> disabled><br/><br/>
						Miasto:<input type="text" id="city" name="city" value=<%=p.getCity() %> disabled>
						Ulica:<input type="text" id="street" name="street" value=<%=p.getStreet() %> disabled><br/><br/>
						nr.dom:<input type="text" id="streetNumber" name="streetNumber" value=<%= p.getStreetNumber() %> disabled>
						nr.miesz:<input type="text" id="flatNumber" name="flatNumber" value=<%= p.getFlatNumber() %> disabled><br/><br/>
						<input type="text" id="idPerson" name="idPerson" value=<%=request.getParameter("idPerosn") %> disabled style="display: none">
					</fieldset>
						</form>
				</div>
		</fieldset>
	</div>

	<div class="personData" style="height: 200px">
	<jsp:useBean id="book" class="main.Book" scope="session"></jsp:useBean>
	<jsp:setProperty property="*" name="book"/>
		<fieldset style="height: 200px">
			<legend>Książka</legend>
				<div style="float:left">
					<button style="width: 100px" id="booksButton">Znajdz</button>
				</div>
				<div style="float: left; margin-left: 120px; background-color: #5ab57b">
					<form>
						<fieldset style="width: 300px">
							Tytuł:<input disabled type="text" id="title" name="title" value=<%=book.getTitle() %>><br/><br/>
							Autor:<input disabled type="text" id="author" name="author"  value=<%= book.getAuthor() %>><br/><br/>
							ID:<input type="number" id="idBook" name="idBook" disabled>
						</fieldset>
					</form>
				</div>
		</fieldset>
	</div>
	
	<div class="personData" style="margin-left: 150px; width: 120px">
		<input type="submit" value="ok" style="width: 100px">
	</div>
		
	<div class="personData">
	<button style="width: 100px">Anuluj</button>
	</div>
</div>

<%
if(!stan.equals("1")){
	%>
	<div id="myModal" class="modal">
	<%
}
else{
%>
<div id="myModal" class="modal" style="display: block">

<%}
%>
  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
   	<div><div style="margin-left: 2%">
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
						onclick="EditPerson(this,choosenPerson), choosenPerson.value=<%=rs.getInt("idPersons")%>, row=this">
						<td id="firstNameTable"><%=rs.getString("firstName")%></td>
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
				<form method="get">
					<fieldset>
						Imie:<input type="text" name="firstName"><br />
						<br /> Nazwisko:<input type="text" name="lastName"><br />
						<input type="text" id="click" name="click" value="1" style="display: none">
						<input type="text" id="au" name="author" style="display: none">
						<input type="text" id="ti" name="title" style="display: none">
						<input type="text" id="idB" name="idBook" style="display: none">
						<br /> <input type="submit" value="Szukaj">
					</fieldset>
				</form>
				<button disabled style="margin-top: 3px" id="choosenPerson">Wybierz</button>
				
			</div>
		</div></div>
  </div>

</div>



<%
if(!stan.equals("2")){
	%>
	<div id="booksModal" class="modal">
	<%

}
else{
%>
<div id="booksModal" class="modal" style="display: block">

<%
}
%>
	<div class="modal-content">
	<span class="close">&times;</span>
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
                rs=null;

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
					<tr class="tablerow" onclick="EditPerson(this,choosenBook), idBook.value=<%=rs.getInt("idBooks")%>, row=this;">
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
			<form method="get">
				<fieldset>
					Tytuł:<input type="text" name="title"><br />
					<br /> Autor:<input type="text" name="author"><br />
					<input type="text" name="click" id="click2" value="2" style="display: none">
					<input type="text" id="fn" name="firstName" style="display: none">
					<input type="text" id="ln" name="lastName" style="display: none">
					<input type="text" id="st" name="street" style="display: none">
					<input type="text" id="ci" name="city" style="display: none">
					<input type="text" id="fl" name="flatNumber" style="display: none">
					<input type="text" id="sn" name="streetNumber" style="display: none">
					<br /> <input type="submit" value="Szukaj">
				</fieldset>
			</form>
			<button disabled style="margin-top: 3px" id="choosenBook">Wybierz</button>
		</div>
	</div>
</div>
</div>


<div id="addModal" class="modal">
<div class="modal-content">
<span class="close" onclick="document.getElementById('addModal').style.display = 'none'">&times;</span>
		<form method="get" action="AddBorrow.jsp">
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
	</div>
</div>


<script>
// Get the modal
var modal = document.getElementById('myModal');

var row;

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];
var span2 = document.getElementsByClassName("close")[1];

var btnn = document.getElementById("booksButton");

btnn.onclick=function(){
	document.getElementById('booksModal').style.display="block";
}

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

span2.onclick = function() {
	document.getElementById('booksModal').style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
        document.getElementById('booksModal').style.display="none";
    }
}

choosenPerson.onclick=function(){
	firstName.value=row.cells[0].textContent;
	lastName.value=row.cells[1].textContent;
	city.value=row.cells[2].textContent;
	street.value=row.cells[3].textContent;
	streetNumber.value=row.cells[4].textContent;
	flatNumber.value=row.cells[5].textContent;
	
	fn.value=firstName.value;
	ln.value=lastName.value;
	ci.value=city.value;
	st.value=street.value;
	sn.value=streetNumber.value;
	fl.value=flatNumber.value;
	modal.style.display = "none";
	document.getElementById('click').value="0";
	

}
choosenBook.onclick= function(){
	title.value= row.cells[0].textContent;
	author.value= row.cells[1].textContent;
	
	ti.value=title.value;
	au.value=author.value;
	idB.value=idBook.value;
	document.getElementById('click2').value="0";
	document.getElementById('booksModal').style.display="none";
}

</script>

</body>
</html>