

<!DOCTYPE html>
<%@page import="myConnection.MyCon"%>
        <%@page import="java.sql.*" %>
        <%@page session="true" %>
<html>
    <head>
        <title>Login Page</title>
        <style>
            body {background-color: lightblue;}
        th   {color:green; font-size: 20px}
        h1    {color:green;}
        input{font-size: 20px}
        
        </style>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <br><br><br><br><br><br><br>
   <form method="post" action="index.jsp">  
       
       
     <center>
         
        
             <font color="red" size="15">W</font>
        <font color="green" size="15">E</font>
        <font color="blue" size="15">L</font>
        <font color="orange" size="15">C</font>
        <font color="violet" size="15">O</font>
        <font color="blue" size="15">M</font>
        <font color="orange" size="15">E</font>
        <br>
             <table>
             <tr>
              <th>USERNAME  </th>
              <td>   </td>
              <td><input type="text" name="userName" size="20"></td>
             
            </tr>  
            <br><br>
           <tr> 
             <th>PASSWORD  </th>
             <td>   </td>
             <td><input type="password" name="userPass" size="20"></td> 
           </tr> 
           <br><br>
           <tr> 
             <th>DATABASE  </th>
             <td>   </td>
             <td><input type="text" name="dbinfo" size="20"></td> 
           </tr> 
             </table>
        <br><br>
             <table>
        <tr> 
           <td></td> 
           <td><input type="submit" value="Submit" size="20"> 
               <input type="reset" value="Reset" size="20"></td>    
        </tr>   
         </table>    
        
     </center>
   </form>
   <% 
   String sql=null,us=null,pass=null,db=null;
   us=request.getParameter("userName");
   pass=request.getParameter("userPass");
   db=request.getParameter("dbinfo");
   Connection con=null;
   PreparedStatement ps=null;
   ResultSet rs=null;
   if(us!=null && pass!=null && db!=null)
   {
   con=MyCon.getConnection("jdbc:mysql://localhost:3306/test");
    sql="select * from logindb where username=? and password=?";
    ps=con.prepareStatement(sql);
    ps.setString(1, us);
    ps.setString(2, pass);
    rs=ps.executeQuery();
    if(rs.next())
    {
        session.setAttribute("userDb", db);
    response.sendRedirect("qb.jsp");
    }
   }
   
   
   %>
        
    </body>
</html>
