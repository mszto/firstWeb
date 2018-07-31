package main;




import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.mysql.jdbc.Driver;
import org.apache.tomcat.jdbc.pool.interceptor.ConnectionState;


import java.sql.*;

public class DatebaseConnection {

    private static DatebaseConnection instance = null;
    Connection con=null;
    Statement st=null;


    private DatebaseConnection() throws SQLException {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "");
            st = (Statement) con.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static DatebaseConnection getInstance() {
        if (instance == null) {
            try {
                instance = new DatebaseConnection();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return instance;
    }

    public ResultSet getData( Person p) {
        ResultSet rs=null;
        try {
            if(p.getFirstName()==""&& p.getLastName()=="") {
                rs = st.executeQuery("Select * from persons");
            }else if(p.getFirstName()!=""&& p.getLastName()==""){
                rs=st.executeQuery("Select * from persons p where p.firstName='" + p.getFirstName()+"'");
            }else if(p.getFirstName()==""&& p.getLastName()!=""){
                rs=st.executeQuery("Select * from persons p where  p.lastName='" + p.getLastName()+"'");
            }
            else{
                rs=st.executeQuery("Select * from persons p where p.firstName='" + p.getFirstName() + "' and p.lastName='" + p.getLastName()+"'");
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return rs;
    }

    public ResultSet getData( Book b) {
        ResultSet rs=null;

        try{
            if(b.getTitle()=="" && b.getAuthor()==""){
                rs=st.executeQuery("SELECT * from books");
            }else if(b.getTitle()!="" && b.getAuthor()==""){
                rs=st.executeQuery("SELECT * from books b where b.title='"+b.getTitle()+"'");
            }else if(b.getTitle()=="" && b.getAuthor()!=""){
                rs=st.executeQuery("SELECT * from books b where b.author='"+b.getAuthor()+"'");
            }else{
                rs=st.executeQuery("SELECT * from books b where b.title='"+b.getTitle()+"' and b.author='"+b.getAuthor()+"'");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return rs;
    }

    public ResultSet getData(String x) {
        ResultSet rs=null;
        try {
            rs=st.executeQuery(x);

        } catch (Exception e) {
            System.out.println(e);
        }
        return rs;
    }

    public ResultSet getData(Borrow borrow){
        ResultSet rs=null;

        try{
            if(borrow.getDate()==null && borrow.getOd()==null) {
                rs = st.executeQuery("Select * from borrows");
            }else if(borrow.getFirstName()!="" && borrow.getLastName()!="" && borrow.getTitle()!=""){
                rs=st.executeQuery("SELECT * from borrows b where b.firstName="+borrow.getFirstName()+" and b.lastName="+
                        borrow.getLastName()+" and b.title="+borrow.getTitle()+" and b.fromb<='"+borrow.getDate().toString()+"' and b.fromb>='"+borrow.getOd().toString()+"'");
            }else if(borrow.getFirstName()!="" && borrow.getLastName()!="" && borrow.getTitle()==""){
                rs=st.executeQuery("SELECT * from borrows b where b.firstName="+borrow.getFirstName()+" and b.lastName="+
                        borrow.getLastName()+" and b.fromb<='"+borrow.getDate().toString()+"' and b.fromb>='"+borrow.getOd().toString()+"'");
            }else if(borrow.getFirstName()!="" && borrow.getLastName()=="" && borrow.getTitle()=="") {
                rs = st.executeQuery("SELECT * from borrows b where b.firstName=" + borrow.getFirstName()+" and b.fromb<='"+borrow.getDate().toString()+"' and b.fromb>='"+borrow.getOd().toString()+"'");
            }else if(borrow.getFirstName()=="" && borrow.getLastName()!="" && borrow.getTitle()!="") {
                rs = st.executeQuery("SELECT * from borrows b where b.lastName=" +
                        borrow.getLastName() + " and b.title=" + borrow.getTitle()+" and b.fromb<='"+borrow.getDate().toString()+"' and b.fromb>='"+borrow.getOd().toString()+"'");
            }
            else if(borrow.getFirstName()=="" && borrow.getLastName()=="" && borrow.getTitle()!="") {
                rs = st.executeQuery("SELECT * from borrows b where b.title="+ borrow.getTitle()+" and b.fromb<='"+borrow.getDate().toString()+"' and b.fromb>='"+borrow.getOd().toString()+"'");
            }else if(borrow.getFirstName()=="" && borrow.getLastName()!="" && borrow.getTitle()==""){
                rs = st.executeQuery("SELECT * from borrows b where b.lastName="+ borrow.getLastName()+" and b.fromb<='"+borrow.getDate().toString()+"' and b.fromb>='"+borrow.getOd().toString()+"'");
            }else{
                String time= String.valueOf(borrow.getOd().getYear()+borrow.getOd().getMonth()+borrow.getOd().getDay());
                System.out.println(time);
                Date d=borrow.getOd();
                String dom=d.toString();
                rs=st.executeQuery("SELECT * from borrows b where b.fromb<="+borrow.getDate());
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return rs;
    }

    public void UpdatePerson(Person person,int id){
        try( PreparedStatement statement=con.prepareStatement("update persons p set p.firstName=?,p.lastName=?,p.city=?,p.street=?,p.streetNumber=?,p.flatNumber=? " +
                "where p.idPersons=?")) {

            statement.setString(1, person.getFirstName());
            statement.setString(2, person.getLastName());
            statement.setString(3, person.getCity());
            statement.setString(4, person.getStreet());
            statement.setInt(5, person.getStreetNumber());
            statement.setInt(6, person.getFlatNumber());
            statement.setInt(7,id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void UpdateBook(Book book,int id){
        try( PreparedStatement statement=con.prepareStatement("update books b set b.Title=?,b.Author=?,b.available=?,b.borrow=? "+
                "where b.idBooks=?")) {

            statement.setString(1, book.getTitle());
            statement.setString(2, book.getAuthor());
            statement.setInt(3, book.getAvailable());
            statement.setInt(4, book.getBorrow());
            statement.setInt(5,id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void InsertBook(Book book){
        try(PreparedStatement statement=con.prepareStatement("insert into books (Title,Author,available,borrow) values(?,?,?,?)")){
            statement.setString(1,book.getTitle());
            statement.setString(2,book.getAuthor());
            statement.setInt(3,book.getAvailable());
            statement.setInt(4,book.getBorrow());
            statement.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void InsertPerson(Person person){
        try( PreparedStatement statement=con.prepareStatement("insert into persons (firstName,lastName,city,street,streetNumber,flatNumber)" +
                        "values(?,?,?,?,?,?)")) {

            statement.setString(1, person.getFirstName());
            statement.setString(2, person.getLastName());
            statement.setString(3, person.getCity());
            statement.setString(4, person.getStreet());
            statement.setInt(5, person.getStreetNumber());
            statement.setInt(6, person.getFlatNumber());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

