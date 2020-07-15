extern double Lots=0.1;
int magic=1111;
datetime buytime=0;
datetime selltime=0;
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
     double up=iCustom(Symbol(),0,"test25_indicator",6,1);
     double down=iCustom(Symbol(),0,"test25_indicator",7,1);
     double upp=iCustom(Symbol(),0,"test25_indicator",6,2);
     double downp=iCustom(Symbol(),0,"test25_indicator",7,2);
     if(up>0 && upp==0)
       {
         for(int i=0;i<OrdersTotal();i++)
           {
              if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==true)
                {
                   if(OrderType()==OP_SELL && OrderComment()==(Symbol()+"sell"))
                     {
                        OrderClose(OrderTicket(),OrderLots(),Ask,100);
                     }
                } 
           }
         if(buytime!=Time[0])
           {
             if(buy(Lots,0,0,Symbol()+"buy",magic)>0)
               {
                 buytime=Time[0];
               }
           }
       }
     if(down>0 && downp==0)
       {
         for(int i1=0;i1<OrdersTotal();i1++)
           {
              if(OrderSelect(i1,SELECT_BY_POS,MODE_TRADES)==true)
                {
                   if(OrderType()==OP_BUY && OrderComment()==(Symbol()+"buy"))
                     {
                        OrderClose(OrderTicket(),OrderLots(),Bid,100);
                     }
                } 
           }
         if(selltime!=Time[0])
           {
             if(sell(Lots,0,0,Symbol()+"sell",magic)>0)
               {
                 selltime=Time[0];
               }
           }
       }
   return(0);
  }
int buy(double Lots,double sun,double ying,string comment,int magic)
  {
          int kaiguan=0;
            for(int i=0;i<OrdersTotal();i++)
               {
                   if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
                     {
                       if((OrderComment()==comment)&&(OrderMagicNumber()==magic))    
                         {
                           kaiguan=1;                     
                         } 
                      }
               }
            if(kaiguan==0)
              {
                   int ticket=OrderSend(Symbol( ) ,OP_BUY,Lots,Ask,300,0,0,comment,magic,0,White);
                   if(ticket>0)
                   {
                    if(OrderSelect(ticket, SELECT_BY_TICKET)==true)
                      {
                       if((sun!=0)&&(ying!=0))
                        {
                          OrderModify(OrderTicket(),OrderOpenPrice(),OrderOpenPrice()-sun*MarketInfo(Symbol(),MODE_POINT),OrderOpenPrice()+ying*MarketInfo(Symbol(),MODE_POINT),0,Red); 
                        }
                       if((sun==0)&&(ying!=0))
                        {
                          OrderModify(OrderTicket(),OrderOpenPrice(),0,OrderOpenPrice()+ying*MarketInfo(Symbol(),MODE_POINT),0,Red); 
                        }
                       if((sun!=0)&&(ying==0))
                        {
                          OrderModify(OrderTicket(),OrderOpenPrice(),OrderOpenPrice()-sun*MarketInfo(Symbol(),MODE_POINT),0,0,Red); 
                        }
                      }
                   }
              return(ticket);
              }
             else
              {
               return(0);
              }
  }
int sell(double Lots,double sun,double ying,string comment,int magic)
    {
               int kaiguan=0;
                 for(int i=0;i<OrdersTotal();i++)
                    {
                        if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
                          {
                            if((OrderComment()==comment)&&(OrderMagicNumber()==magic))   
                              {
                                kaiguan=1;                     
                              } 
                           }
                    }
                 if(kaiguan==0)
                   {
                        int ticket=OrderSend(Symbol( ) ,OP_SELL,Lots,Bid,300,0,0,comment,magic,0,Red);
                        if(ticket>0)
                        {
                          if(OrderSelect(ticket, SELECT_BY_TICKET)==true)
                           {
                             if((sun!=0)&&(ying!=0))
                              {
                               OrderModify(OrderTicket(),OrderOpenPrice(),OrderOpenPrice()+sun*MarketInfo(Symbol(),MODE_POINT),OrderOpenPrice()-ying*MarketInfo(Symbol(),MODE_POINT),0,Red);
                              } 
                             if((sun==0)&&(ying!=0))
                              {
                               OrderModify(OrderTicket(),OrderOpenPrice(),0,OrderOpenPrice()-ying*MarketInfo(Symbol(),MODE_POINT),0,Red);
                              } 
                             if((sun!=0)&&(ying==0))
                              {
                               OrderModify(OrderTicket(),OrderOpenPrice(),OrderOpenPrice()+sun*MarketInfo(Symbol(),MODE_POINT),0,0,Red);
                              } 
                           }
                        }
                        return(ticket);
                   }
                  else
                   {
                    return(0);
                   } 
  }