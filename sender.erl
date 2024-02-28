-module(sender).
-export([send/1]).

send(Message) ->
    ReceiverNode = 'receiver_node@192.168.1.6',
    ReceiverPid = {receiver, ReceiverNode},
    ReceiverPid ! Message.
