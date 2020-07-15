
//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {
//----
   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+
int deinit()
  {
//----
   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
int start()
  {
   if(OrdersTotal()==0)
     {
        //OrderSend(Symbol(),OP_BUY,0.1,Ask,100,Ask-200*Point,Ask+200*Point);
        int ticket=OrderSend(Symbol(),OP_BUY,0.1,Ask,100,0,0);
        if(ticket>0)
          {
            if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES)==true)
              {
                OrderModify(OrderTicket(),OrderOpenPrice(),OrderOpenPrice()-200*Point,OrderOpenPrice()+200*Point,0);
              }
          }
     }
   return(0);
  }
//+------------------------------------------------------------------+