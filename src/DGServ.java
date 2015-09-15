/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ANTHRAX
 */
/*
	Server program
*/

import java.util.*;
import java.io.*;
import java.net.*;

public class DGServ	
{
	public static void main(String args[])	throws SocketException, IOException 
        {
		final int port = 4000;
		byte []buffA = new byte[256];
		byte []buffB = new byte[256];
                String message = null;
		DatagramSocket s = new DatagramSocket(port); 
                DatagramPacket pack = new DatagramPacket(buffA, buffA.length);
		s.receive(pack);
                message = new String(pack.getData());
                System.out.println(message);
                File file = new File("test.txt");
                buffB = new String("Got it ").getBytes();
                DatagramPacket pack2 = new DatagramPacket(buffB, buffB.length, pack.getAddress(), pack.getPort());
                s.send(pack2);
	}
}
