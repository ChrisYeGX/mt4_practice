
//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {
   //hua("test","��ʾ�������",300,10,0,RosyBrown);
   if(IsTradeAllowed()==true)
      {
         hua("eadagou","�Ѿ��������Զ�����",10,10,0,Yellow);
          if(OrderSend(Symbol(),OP_BUY,MarketInfo(Symbol(),MODE_MINLOT),Ask,500,Ask-1000*Point,Ask+1000*Point)>0)
           {
              hua("yunxuzhineng","����EA���ܽ���,��������OrderSend��������ֹ���ֹӯ�۸�",10,10,0);
           }
          else
           {
              if(OrderSend(Symbol(),OP_BUY,MarketInfo(Symbol(),MODE_MINLOT),Ask,500,0,0)>0)
               {
                  hua("yunxuzhineng","����EA���ܽ���,����OrderSend����ֹ���ֹӯ�۸��������Ϊ0",10,10,0,Yellow);
               }
              else
               {
                  hua("yunxuzhineng","������EA���ܽ���",10,10,0,Red);
               }
           }
      }
   else
      {
         hua("eadagou","û�д������Զ�����",10,10,0,Red);
      }
   if(IsDllsAllowed()==true)
      {
         hua("dlldagou","�Ѿ��������붯̬���ӿ�",10,25,0,Yellow);
      }
   else
      {
         hua("dlldagou","û�д������붯̬���ӿ�",10,25,0,Red);
      }
   hua("ganggan","���׸ܸ���"+AccountLeverage( ) +":1",10,40,0,Yellow);
   hua("diancha","�˻��ҶԵĵ�ǰ���"+DoubleToStr(MarketInfo(Symbol(),MODE_SPREAD),0),10,55,0,Yellow);
   hua("zuixiao","�˻��ҶԵ���С�µ�����"+DoubleToStr(MarketInfo(Symbol(),MODE_MINLOT),2),10,70,0,Yellow);
   hua("zuida","�˻��ҶԵ�����µ�����"+DoubleToStr(MarketInfo(Symbol(),MODE_MAXLOT),2),10,85,0,Yellow);
   hua("baozhengjin","�˻��Ҷ�1��׼�����豣֤��"+DoubleToStr(MarketInfo(Symbol(),MODE_MARGINREQUIRED),0)+"����",10,100,0,Yellow);
   hua("bodongyidian","��1��׼��"+Symbol()+"�۸񲨶�"+DoubleToStr(Point,Digits)+"����:"+DoubleToStr(MarketInfo(Symbol(),MODE_TICKVALUE),1)+"����",10,115,0,Yellow); 
   if(IsExpertEnabled()==true)
     {
         hua("anxia","�Ѿ��������ܽ��װ�ť",10,130,0,Yellow);
     }
   else
     {
         hua("anxia","û�а������ܽ��װ�ť",10,130,0,Red);
     }
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
    
   return(0);
  }
void hua(string a_name_0, string a_text_8, int a_x_16, int a_y_20, int a_corner_40 = 0, color a_color_36 = Yellow, int a_fontsize_32 = 10, string a_fontname_24 = "Arial") 
{
   if (a_text_8 != "") 
   {
      if (ObjectFind(a_name_0) < 0) 
      {
         ObjectCreate(a_name_0, OBJ_LABEL, 0, 0, 0);
         ObjectSetText(a_name_0, a_text_8, a_fontsize_32, a_fontname_24, a_color_36);
         ObjectSet(a_name_0, OBJPROP_CORNER, a_corner_40);
         ObjectSet(a_name_0, OBJPROP_XDISTANCE, a_x_16);
         ObjectSet(a_name_0, OBJPROP_YDISTANCE, a_y_20);
      }
     else ObjectSetText(a_name_0, a_text_8, a_fontsize_32, a_fontname_24, a_color_36);
   }
}