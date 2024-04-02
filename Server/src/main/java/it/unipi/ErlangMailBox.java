package it.unipi;

import com.ericsson.otp.erlang.OtpMbox;
import com.ericsson.otp.erlang.OtpNode;

import java.io.IOException;

public class ErlangMailBox {
    private static OtpMbox mbox;

    private ErlangMailBox() {

        try {
            OtpNode node = new OtpNode("javaNode", "mycookie");
            mbox = node.createMbox("mailbox");
        } catch (IOException e) {
            System.out.println(e.getMessage());
            mbox = null;
        }

    }

    public static OtpMbox getErlangMailBox() {

        if (mbox == null) {
            new ErlangMailBox();
        }
        return mbox;
    }
}
