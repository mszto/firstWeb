package main.Servlets;

import main.DatebaseConnection;
import main.Person;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddPersonServlet")
public class AddPersonServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Person person=new Person();
        DatebaseConnection datebaseConnection=DatebaseConnection.getInstance();

        person.setFirstName(request.getParameter("firstName"));
        person.setLastName(request.getParameter("lastName"));
        person.setStreet(request.getParameter("street"));
        person.setCity(request.getParameter("city"));
        person.setStreetNumber(Integer.parseInt(request.getParameter("streetNumber")));
        String flat=request.getParameter("flatNumber");
        if(flat!="") {
            person.setFlatNumber(Integer.parseInt(request.getParameter("flatNumber")));
        }
        datebaseConnection.InsertPerson(person);

        request.getRequestDispatcher("ResultPerson.jsp").forward(request,response);
    }
}
