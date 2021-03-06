package main.Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.Book;
import main.DatebaseConnection;

@WebServlet(name = "AddBook")
public class AddBook extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Book book=new Book();
        book.setTitle(request.getParameter("title"));
        book.setAuthor(request.getParameter("author"));
        String bo=request.getParameter("borrow");

        if(bo != ""){
            book.setBorrow(Integer.parseInt(bo));
        }
        String flat=request.getParameter("available");
        if(flat!="") {
            book.setAvailable(Integer.parseInt(request.getParameter("available")));
        }
        
        DatebaseConnection datebaseConnection=DatebaseConnection.getInstance();
        datebaseConnection.InsertBook(book);
        request.getRequestDispatcher("Books.jsp").forward(request,response);
    }
}

