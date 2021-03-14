<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
Connection con = null;
PreparedStatement ps = null;

String proid = request.getParameter("pid");
String pname = request.getParameter("pname");
String usrname = request.getParameter("usrname");
String price = request.getParameter("price");
String cardname = request.getParameter("cardname");
String cardnumber = request.getParameter("cardnumber");
String expmonth = request.getParameter("expmonth");
String expyear = request.getParameter("expyear");
String cvv = request.getParameter("cvv");
String sssemail = session.getAttribute("sssemail").toString();


try{
 con = Dbcon.DbConnection.getConnection();
 String sqlQuery = "insert into ptransc(pid,pname,usrname,sssemail,price,cardname,cardnumber,expmonth,expyear,cvv) values(?,?,?,?,?,?,?,?,?,?)";
 ps = con.prepareStatement(sqlQuery);
 ps.setString(1, proid);
 ps.setString(2, pname);
 ps.setString(3, usrname);
 ps.setString(4, sssemail);
 ps.setString(5, price);
 ps.setString(6, cardname);
 ps.setString(7, cardnumber);
 ps.setString(8, expmonth);
 ps.setString(9, expyear);
 ps.setString(10, cvv);
 int no = ps.executeUpdate();
 if(no>0){
 response.sendRedirect("recom.jsp?msg=success");
 }else{
 response.sendRedirect("recom.jsp?msg=faild");
 }
 
}catch(Exception ex){
ex.printStackTrace();
response.sendRedirect("recom.jsp?msg=faild");
}


%>