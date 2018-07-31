package main.Servlets;

import main.DatebaseConnection;
import main.Person;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import static com.sun.xml.internal.fastinfoset.alphabet.BuiltInRestrictedAlphabets.table;

@WebServlet(name = "SchearchServlet")
public class SchearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Person person=new Person();
        person.setFirstName(request.getParameter("firstName"));
        person.setLastName(request.getParameter("lastName"));
        person.setCity(request.getParameter("city"));
        person.setStreet(request.getParameter("street"));
        person.setStreetNumber(Integer.parseInt(request.getParameter("streetNumber")));

        String flat=request.getParameter("flatNumber");
        if(flat!="") {
            person.setFlatNumber(Integer.parseInt(request.getParameter("flatNumber")));
        }

        DatebaseConnection datebaseConnection=DatebaseConnection.getInstance();
        datebaseConnection.UpdatePerson(person, Integer.parseInt(request.getParameter("id")));
        request.getRequestDispatcher("ResultPerson.jsp").forward(request,response);

    }
}
