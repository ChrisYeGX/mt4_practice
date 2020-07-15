
//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {
   //hua("test","显示字体测试",300,10,0,RosyBrown);
   if(IsTradeAllowed()==true)
      {
         hua("eadagou","已经打钩允许自动交易",10,10,0,Yellow);
          if(OrderSend(Symbol(),OP_BUY,MarketInfo(Symbol(),MODE_MINLOT),Ask,500,Ask-1000*Point,Ask+1000*Point)>0)
           {
              hua("yunxuzhineng","允许EA智能交易,并且允许OrderSend函数设置止损和止盈价格",10,10,0);
           }
          else
           {
              if(OrderSend(Symbol(),OP_BUY,MarketInfo(Symbol(),MODE_MINLOT),Ask,500,0,0)>0)
               {
                  hua("yunxuzhineng","允许EA智能交易,但是OrderSend函数止损和止盈价格必须设置为0",10,10,0,Yellow);
               }
              else
               {
                  hua("yunxuzhineng","不允许EA智能交易",10,10,0,Red);
               }
           }
      }
   else
      {
         hua("eadagou","没有打钩允许自动交易",10,10,0,Red);
      }
   if(IsDllsAllowed()==true)
      {
         hua("dlldagou","已经打钩允许导入动态链接库",10,25,0,Yellow);
      }
   else
      {
         hua("dlldagou","没有打钩允许导入动态链接库",10,25,0,Red);
      }
   hua("ganggan","交易杠杆是"+AccountLeverage( ) +":1",10,40,0,Yellow);
   hua("diancha","此货币对的当前点差"+DoubleToStr(MarketInfo(Symbol(),MODE_SPREAD),0),10,55,0,Yellow);
   hua("zuixiao","此货币对的最小下单手数"+DoubleToStr(MarketInfo(Symbol(),MODE_MINLOT),2),10,70,0,Yellow);
   hua("zuida","此货币对的最大下单手数"+DoubleToStr(MarketInfo(Symbol(),MODE_MAXLOT),2),10,85,0,Yellow);
   hua("baozhengjin","此货币对1标准手所需保证金"+DoubleToStr(MarketInfo(Symbol(),MODE_MARGINREQUIRED),0)+"美金",10,100,0,Yellow);
   hua("bodongyidian","下1标准手"+Symbol()+"价格波动"+DoubleToStr(Point,Digits)+"就是:"+DoubleToStr(MarketInfo(Symbol(),MODE_TICKVALUE),1)+"美金",10,115,0,Yellow); 
   if(IsExpertEnabled()==true)
     {
         hua("anxia","已经按下智能交易按钮",10,130,0,Yellow);
     }
   else
     {
         hua("anxia","没有按下智能交易按钮",10,130,0,Red);
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