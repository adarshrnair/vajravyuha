<%-- 
    Document   : adduser
    Created on : 3 Jan, 2016, 9:15:57 PM
    Author     : r.adarsh1994
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
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
<%
    Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/VAJRA", "superuser", "superuser");
        PreparedStatement ps=null;
        ResultSet rs=null;
        int p=0;
    String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    Random rnd = new Random();
    String E="0";
    String W="0";
    String A="0";
    String R="0";
   
   StringBuilder sb = new StringBuilder( 8 );
   for( int i = 0; i < 8; i++ ) 
      sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );
   

    String user=request.getParameter("txt1");
    String username=request.getParameter("name");
    String pass=sb.toString();
    String email=request.getParameter("txt2");
    String phone=request.getParameter("txt3");
   //quest.getP
    if(request.getParameter("chk2")==null)
     //   if(request.)
    E="0";
    
   else
        E="1";
    if(request.getParameter("chk3")==null)
    W="0";
    else
        W="1";
    if(request.getParameter("chk4")==null)
    A="0";
    else
        A="1";
   if(request.getParameter("chk1")==null)
    R="0";
   else
       R="1";
    
   
    
    if(A.equals("0"))
    {
        ps=con.prepareStatement("Insert into users values(?,?,?,?,?,?,?,?)");
        ps.setString(1, user);
        ps.setString(2, pass);
        ps.setString(3, username);
        ps.setString(4, email);
        ps.setString(5, phone);
        ps.setString(6, R);
        ps.setString(7, W);
        ps.setString(8, E);
        p=ps.executeUpdate();
        if(p>0)
        {
            %>
            <script>
                alert("Successfully Registered, You can now log in");
                </script>
         <%       String to=email;//change accordingly  
  
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
   message.setSubject("REGISTERED");  
   String msg = "You are now made a member of site protected by Vajravyuha. You Username is "+user+" and password is "+pass+". Please change password after login";
   message.setText(msg);  
     
   //send message  
  Transport.send(message);  
  
   System.out.println("message sent successfully");  
   
  } catch (MessagingException e) {throw new RuntimeException(e);}  
            
            
            response.sendRedirect("ADMIN_PROFILE.jsp");
        }
        else
        {
            %>
            <script>
                alert("Something went Wrong. Try Again");
                
                </script>
            <%
            response.sendRedirect("ADMIN_PROFILE.jsp");
        }
    }
    else
    {
        ps=con.prepareStatement("Insert into admins values(?,?,?,?,?)");
        ps.setString(1, user);
        ps.setString(2, pass);
        ps.setString(3, username);
        ps.setString(4, email);
        ps.setString(5, phone);
       
        p=ps.executeUpdate();
        if(p>0)
        {
            %>
            <script>
                alert("Successfully Registered, You can now log in");
                </script>
       <%         String to=email;//change accordingly  
  
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
   message.setSubject("REGISTERED");  
   String msg = "You are now made an Admin of site protected by Vajravyuha. You Username is "+user+" and password is "+pass+". Please change password after login";
   message.setText(msg);  
     
   //send message  
  Transport.send(message);  
  
   System.out.println("message sent successfully");  
   
  } catch (MessagingException e) {throw new RuntimeException(e);}
            
            
            response.sendRedirect("ADMIN_PROFILE.jsp");
        }
        else
        {
            %>
            <script>
                alert("Something went Wrong. Try Again");
                
                </script>
            <%
            response.sendRedirect("ADMIN_PROFILE.jsp");
        }
    }
    %>
