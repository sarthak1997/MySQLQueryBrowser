<%-- 
    Document   : index
    Created on : 9 Aug, 2016, 6:55:38 PM
    Author     : SarthakJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import= "java.sql.*" %>
<%@page import= "myConnection.MyCon" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SQL QUERY BROWSER</title>
    </head>
    <body>
    <center>
        <br><br><br><br><br><br><br><br><br><br>
        <font color="red" size="15">S</font>
        <font color="green" size="15">Q</font>
        <font color="blue" size="15">L  </font>
        <font color="orange" size="15">B</font>
        <font color="violet" size="15">R</font>
        <font color="blue" size="15">O</font>
        <font color="orange" size="15">W</font>
        <font color="red" size="15">S</font>
        <font color="green" size="15">E</font>
        <font color="violet" size="15">R</font>
        <br><br>
        <form method="post" action="qb.jsp">
        <textarea rows="6" cols="50" name="query" ></textarea>
        <br>
        
            <input type="Submit" value="EXECUTE">
        </form>
        <br><br>
    </center>
    <%
    String sql=null;
    sql=request.getParameter("query");
    String db=null;
    if(sql!=null)
    {
        try{
            Connection con=null;
            db=session.getAttribute("userDb").toString();
        con=MyCon.getConnection("jdbc:mysql://localhost:3306/"+db);
        
        PreparedStatement ps=null;
        
        ps=con.prepareStatement(sql);
    
        
    if(sql.toLowerCase().startsWith("select"))
    {
        
        ResultSet rs=null;
    ResultSetMetaData rsmd=null;
        rs=ps.executeQuery();
        rsmd=rs.getMetaData();
        int cc;
        cc=rsmd.getColumnCount();
        %>
        <div align="center" >
        <table border="1">
            <tr>
                <% 
                for(int i=1;i<=cc;i++)
                {
                out.print("<th>"+rsmd.getColumnName(i) +"</th>");
                }
                out.println("</tr>");
                while(rs.next())
                {
                out.println("<tr>");
                for(int i=1;i<=cc;i++)
                {
                out.println("<td>"+rs.getString(i)+"</td>");
                }
                out.println("</tr>");
                }
                %>
            
        </table>
        
        <%
    }
        
    
    else
    {
    int n;
    n=ps.executeUpdate();
    if(n>1)
    out.println("<center><font color=red size=5>"+n+" Rows Affected</font></center>");
    else
        out.println("<center><font color=red size=5>1 Row Affected</font></center>");
    }
        }
        catch(Exception e)
        {
        out.print(e);
        }
    }
    %>
        </div>
    </body>
</html>
