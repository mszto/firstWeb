<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="main.DatebaseConnection"%>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<html>
<head>

<link rel="stylesheet" href="css/indexcss.css" type="text/css" />
<title>Wo</title>


</head>
<body>
	<jsp:useBean id="user" class="main.Person" scope="session"></jsp:useBean>


	<table id="table">
		<thead>
			<tr>
				<th>Imie</th>
				<th>Nazwisko</th>
			</tr>
		</thead>
		<tbody>
			<%

      DatebaseConnection data=DatebaseConnection.getInstance();
      ResultSet rs=data.getData("Select imie, nazwisko from osoby");


      try {
        while (rs.next()) {
          %><tr>
				<td><%=rs.getString("firstName")%></td>
				<td><%=rs.getString("lastName")%></td>
			</tr>
			<%
        }
      }
      catch(Exception e){
          e.printStackTrace();
      }
    %>
		</tbody>

	</table>

</body>
</html>
