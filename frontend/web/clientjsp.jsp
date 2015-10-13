<%-- 
    Document   : clientjsp
    Created on : Sep 15, 2015, 12:08:06 PM
    Author     : ANTHRAX
--%>

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
        <script>
            function hello()
            {
                window.open(
'clientjsp.jsp?u1=&p1=',
'_blank' // <- This is what makes it open in a new window.
);

            }
            function hello1()
            {
                window.open(
'IMG-20150814-WA0043.jpg',
'_blank' // <- This is what makes it open in a new window.
);

            }
            
            </script>
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
            String str;
            Socket s = new Socket("localhost",3333);
       //     s.bind(new InetSocketAddress(5555));
           
            
            PrintWriter ot = new PrintWriter(s.getOutputStream(),true);
            BufferedReader in = new BufferedReader(new InputStreamReader(s.getInputStream()));
            BufferedReader stdin = new BufferedReader(new InputStreamReader(System.in));
            while((str = in.readLine()) != null)
            { i++; j++;
               // out.println(str);
                out.println("          \n                                                                                                                                          ");
                out.println("            \n                                                                                                                                        ");
                out.println("              \n                                                                                                                                      ");
                out.println("                \n                                                                                                                                    ");
                        if(j>0)
                {
                    
                %>
                
                <p id="demo">
                     </p>
                <script>
               hello1.call(); 
               </script>
                    <%
            }        
                if(i>0)
                {
                    
                %>
                
                <p id="demo">
                     </p>
                <script>
               hello.call(); 
               </script>
                    <%
            }
            }
        }
        catch(Exception e)
        {
            
        }
           %>
    </body>
</html>
