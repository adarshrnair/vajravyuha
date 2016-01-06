
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package multi_socket;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */


class Handler implements Runnable
{
    Socket sock;
    Thread t;
    Handler(Socket s){
        sock=s;
        t=new Thread(this);
        t.start();
    }
    @Override
    public void run() {
         BufferedReader keyRead = new BufferedReader(new InputStreamReader(System.in));
	                      // sending to client (pwrite object)
      OutputStream ostream = null; 
        try {
            ostream = sock.getOutputStream();
        } catch (IOException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
        }
      PrintWriter pwrite = new PrintWriter(ostream, true);
 
                              // receiving from server ( receiveRead  object)
      InputStream istream = null;
        try {
            istream = sock.getInputStream();
        } catch (IOException ex) {
            Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
        }
      BufferedReader receiveRead = new BufferedReader(new InputStreamReader(istream));
 
      String receiveMessage, sendMessage = null;               
      while(true)
      {
             try {
                 if((receiveMessage = receiveRead.readLine()) != null)
                 {
                     System.out.println(receiveMessage);         
                 }    } catch (IOException ex) {
                 Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
             }
             try { 
                 sendMessage = keyRead.readLine();
             } catch (IOException ex) {
                 Logger.getLogger(Handler.class.getName()).log(Level.SEVERE, null, ex);
             }
        pwrite.println(sendMessage);             
        pwrite.flush();
      } 
    }

}
        
        
        
public class Multi_socket {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        // TODO code application logic here
             ServerSocket sersock = new ServerSocket(3000);
            
      System.out.println("Server  ready for chatting");
       while(true)
       {
      Socket sock = sersock.accept( );    
      new Handler(sock);
                              // reading from keyboard (keyRead object)
                  
       }
    }
    
    
}
