/**
 *  Configuration file for wiring of sendAckC module to other common 
 *  components needed for proper functioning
 *
 *  @author Luca Pietro Borsani
 */

#include "sendAck.h"

configuration sendAckAppC {}

implementation {


/****** COMPONENTS *****/
  components MainC, sendAckC as App;
  components new AMSenderC(AM_SEND_MSG);
  components new AMReceiverC(AM_SEND_MSG);
  components new TimerMilliC();
  components ActiveMessageC;
  components new FakeSensorC();
  //add the other components here

/****** INTERFACES *****/
  //Boot interface
  App.Boot -> MainC.Boot;

  /****** Wire the other interfaces down here *****/
  App.Receive -> AMReceiverC;
  App.AMControl -> ActiveMessageC;
  App.MilliTimer -> TimerMilliC;
  App.Packet -> AMSenderC;
  App.AMSend -> AMSenderC;
  App.Read -> FakeSensorC;
  App.PacketAcknowledgements -> AMSenderC.Acks;

}

