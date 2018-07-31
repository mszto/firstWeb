package main;


import java.sql.Date;

public class Borrow {
    private String title;
    private String firstName;
    private String lastName;
    private Date od;
    private Date date;
    private int  idPerson;
    private int idBook;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getOd() {
        return od;
    }

    public void setOd(String od) {
        if(od!="")
        this.od = Date.valueOf(od);
        else{
            this.od=null;
        }
    }

    public Date getDate() {
        return date;
    }

    public void setDate(String date) {
        if(date!="")
        this.date = Date.valueOf(date);
        else{
         this.date=null;
        }
    }

    public int getIdPerson() {
        return idPerson;
    }

    public void setIdPerson(int idPerson) {
        this.idPerson = idPerson;
    }

    public int getIdBook() {
        return idBook;
    }

    public void setIdBook(int idBook) {
        this.idBook = idBook;
    }

}
