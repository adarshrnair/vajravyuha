<%-- 
    Document   : logselect
    Created on : 3 Jan, 2016, 10:23:32 AM
    Author     : r.adarsh1994
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.net.Socket"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <h1>Loading .... </h1>
        
        <%=request.getHeader("X-Forwarded-For") %></br>
        <%=request.getHeader("X-Forwarded-For") %></br>
          <%= request.getHeader("Proxy-Client-IP") %>
          </br>           <%=request.getHeader("WL-Proxy-Client-IP") %>
          </br><%= request.getHeader("HTTP_CLIENT_IP")%>
           </br><%=request.getHeader("HTTP_X_FORWARDED_FOR") %>
          </br><%= request.getRemoteAddr() %>
          <h2>Please wait .... </h2>
          <%
          int i=0;
          int j=0;
          try
        {
            String email="aakhilanair7@gmail.com";
            String pwd;
            Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/VAJRA", "superuser", "superuser");
            PreparedStatement ps=null;
            ResultSet rs=null;
            int p=0;
            String user=request.getParameter("UNAME");
          //  System.out.
            pwd=request.getParameter("PWD");
           // System.out.println(pwd);
            ps=con.prepareStatement("Select * from admins where uname=?");
            ps.setString(1, user);
      
        rs=ps.executeQuery();
        while(rs.next())
        {
            String s1=rs.getString(1);
            System.out.println(s1);
            String s2=rs.getString(2);
            System.out.println(s2);
            email=rs.getString(4);
            System.out.println(email);
            if(s1.equals(user) && s2.equals(pwd))
            {
                p++;
                session.setAttribute("user", user);
         //       response.sendRedirect("welcome.jsp");
                
             //   break;
            }
        }
        if(p==0)
        {
            %>
            
            
                
            
            <%
            response.sendRedirect("error.html");
        }
        else
        {
            String to=email;//change accordingly  
  
  //Get the session object  
  Properties props = new Properties();  
  props.put("mail.smtp.host", "smtp.gmail.com");  
  props.put("mail.smtp.socketFactory.port", "465");  
  props.put("mail.smtp.socketFactory.class",  
            "javax.net.ssl.SSLSocketFactory");  
  props.put("mail.smtp.auth", "true");  
  props.put("mail.smtp.port", "465");  
   
  Session session1 = Session.getInstance(props,  
   new javax.mail.Authenticator() {  
   protected PasswordAuthentication getPasswordAuthentication() {  
   return new PasswordAuthentication("r.adarsh1994@gmail.com","9744547214");//change accordingly  
   }  
  });  
   
  //compose message  
  try {  
   MimeMessage message = new MimeMessage(session1);  
   message.setFrom(new InternetAddress("r.adarsh1994@gmail.com"));//change accordingly  
   message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
   message.setSubject("USER LOG IN");  
   message.setText("It is found that someone has logged in to your profile which is secured by Vajravyuha. Kindly report if it is not you.");  
     
   //send message  
   Transport.send(message);  
  
   System.out.println("message sent successfully");  
   
  } catch (MessagingException e) {throw new RuntimeException(e);}     
            response.sendRedirect("ADMIN_PROFILE.html");
        }
          
            
        }
        catch(Exception e)
        {
            
        }
           %>
    </body>
</html>