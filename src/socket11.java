package lab3ques2;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class socket11
{
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) 
    {
        try
        {
            String str;
            Socket s = new Socket("localhost",3333);
            PrintWriter out = new PrintWriter(s.getOutputStream(),true);
            BufferedReader in = new BufferedReader(new InputStreamReader(s.getInputStream()));
            BufferedReader stdin = new BufferedReader(new InputStreamReader(System.in));
            while((str = stdin.readLine()) != null)
            {
                out.println(str);
                System.out.println(in.readLine());
            }
        }
        catch(Exception e)
        {
            
        }
    }
}