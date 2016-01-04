
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>User Settings</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/5.5.2/css/foundation.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.css">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/foundation/5.5.2/js/foundation.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.js"></script>
    
    <style>
    </style>
    
</head>
 <%
         if(session.getAttribute("admin")==null || session.getAttribute("admin") == "" || session.getAttribute("admin") == " " )
         {
             response.sendRedirect("caught.jsp");
         }
         else
         {
             
         %>
<body><center>
    <fieldset >
        <legend>  Log History </legend><br><br>
    <form>
        <%
         Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/VAJRA", "superuser", "superuser");
        PreparedStatement ps=null;
        PreparedStatement ps1=null;
        ResultSet rs=null;
        int p=0;
    
         
  %>
        <table border="1" border-color:"darkolivegreen">
            <tr>
                <td> Time </td>
                <td> Source IP</td>
                
            </tr>
            <%
             ps=con.prepareStatement("select * from logs");
             
             ResultSet rs1=ps.executeQuery();
             while(rs1.next())
             {
             %>
             
             
                   
                     <tr>
                         <td><%=rs1.getString(1)%></td>
                         <td> 
                         <%=rs1.getString(2)%>
                         
                         </td>
                         <%}%>
                         
                     </tr>
            
            
        </table>
    </form>
    </fieldset>
    
    </center>
    
</body>
<%
         }
             %>
</html>
