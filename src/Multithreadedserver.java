

//package lab3ques2;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.IOException;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;


class  Handler implements Runnable{
    Socket clisock;
    Thread t;
    Handler(Socket s,String name){
        clisock=s;
        t=new Thread(this,name);
        t.start();
    }
    public void run()
    {
        String str;
        try{
            InetAddress address=clisock.getInetAddress();
            //clisock.
            System.out.println(address);
            System.out.println("Using Process : "+clisock.getPort());
         //   clisock.getLocalPort();
      //      System.out.println(address.getHostAddress());
            
          //  if(address=="/127.0.0.1");
           if( address.getHostAddress().equals("127.0.0.2"))
           { System.out.println(address);
               PrintWriter out =
        new PrintWriter(clisock.getOutputStream(), true);
 /*   BufferedReader in = new BufferedReader(
        new InputStreamReader(clisock.getInputStream()));*/
    //out.println("Hello You are IN");
     out.write("Hello You are IN"); out.flush();
      out.write("Hello You are IN"); out.flush();
    /* while ((str = in.readLine()) != null) {
        str="from server"+str;
        out.println(str);
        if (str.equals("Bye."))
            break;}*/
           }
     else
     {
         System.out.println(address.getHostName()+ " is now trapped in VajraVyuha");
         PrintWriter out =
        new PrintWriter(clisock.getOutputStream(), true);
        /*           BufferedReader in = new BufferedReader(
        new InputStreamReader(clisock.getInputStream()));*/
         
             for(int i=1;i>0;i++)
             {
          //       Thread.sleep(1);
                 out.write("VAJRAVYUHA GOT YOU");
               out.write(i);
               if(i%50==0)
               {   out.write("VAJRAVYUHA GOT YOU");//Thread.sleep(1000);
               }
               //System.out.print(input.readLine().toString());
               out.flush();
                  
               //  String pp= Integer.toString(i);
                 out.println(i);
                 out.flush();
                 if(i>200000)
                 {
                     clisock.close();
                     System.out.println("Vajravyuha Closed Socket");
                     break;
                 }
                 }
                // out.println(pp);out.println(pp);
          //   System.out.print(i);
            // if(i%50==0);
             
             
             
     } /* catch (IOException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
        }*/
                 
             
    
        }catch(IOException e){
            System.out.println(e);
        } /*catch (InterruptedException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
        }*/
    }

}      
        
        
    


public class Multithreadedserver {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        String str;
        int count=0;
    
        try {
            ServerSocket serverSocket = new ServerSocket(3333);
            while(true){
                
                Socket clientsocket = serverSocket.accept();
                
                count++;
                System.out.println("accepted client"+count);
                new Handler(clientsocket,"client"+count);
            }
    }catch( IOException e){System.out.println(e);}
    }}
