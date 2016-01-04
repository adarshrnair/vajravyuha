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
    
     <script>
     function trail() {
     var x,y;
     if (confirm("Save Changes!") == true) 
     {
        x = "You pressed Yes!";
     } 
     else 
     {
        x = "You pressed No!";
    }
    alert(x);}
</script>
    <style>
        
        #col{
            color: black;
        }
        
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
        <legend> <% 
             String s = session.getAttribute("admin").toString();
        Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/VAJRA", "superuser", "superuser");
            PreparedStatement ps=null;
            ResultSet rs=null;
            ps=con.prepareStatement("Select * from admins where uname=?");
            ps.setString(1, s);
      
        rs=ps.executeQuery();
         while(rs.next())
        {
             String s1=rs.getString(3);
             %>
             <%=s1%>
            
             <%
        }
        %>
        
             </legend><br><br>
        <img src="765-default-avatar.png"  width="100" height="100">
    <form>
        <table><tr><td>
            Change Password:</td> <td><input type="text" name="txt1"  width="10" required></td></tr><br>
            <tr><td>
            Change Phone No: </td><td><input type="text" name="txt2"  width="10"></td></tr><br>
            
        </table><br>
        
         <div id="col">
        <input type="button" class="button info large" style="background-color:darkolivegreen" value="Save" onclick="trail()"></button>
         </div>
   
        
    </form>
    </fieldset>
   

    </center>
    
</body>
<%
         }
             %>
</html>
