package it.unipi;

import com.ericsson.otp.erlang.*;

public class Main {
    public static void main(String[] args) {
        try {
            // Usa lo stesso cookie specificato nel comando rebar3
            OtpNode node = new OtpNode("javaNode", "mycookie");
            OtpMbox mbox = node.createMbox("mailbox");
            OtpErlangObject[] msg = new OtpErlangObject[2];
            msg[0] = new OtpErlangAtom("java_sender");
            msg[1] = new OtpErlangString("Ciao, come stai?");
            OtpErlangTuple tuple = new OtpErlangTuple(msg);

            // Assicurati di inviare il messaggio al nodo Erlang corretto
            mbox.send("message_receiver", "cowboy_bridge@172.27.187.216", tuple);
            System.out.println("Messaggio inviato al nodo Erlang.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
