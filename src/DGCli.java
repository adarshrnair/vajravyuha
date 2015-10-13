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
	Client program
*/

import java.util.*;
import java.io.*;
import java.net.*;

public class DGCli	
{
	public static void main(String args[]) throws UnknownHostException,IOException,SocketException
        {
		final int port = 4000;
                byte [] buff1 = new byte[256];
		byte [] buff2 = new byte[256];
                String message = new String("Check");
                buff1 = message.getBytes();
                InetAddress address = InetAddress.getByName("localhost");
                DatagramSocket s = new DatagramSocket();
		DatagramPacket packet = new DatagramPacket(buff1, buff1.length, address, port);
                s.send(packet);
                s.receive(packet);
                message = new String(packet.getData(), 0, packet.getLength());
                System.out.println(message + "done");
	}
}
