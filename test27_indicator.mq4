
#property indicator_chart_window
#property indicator_buffers 2
#property indicator_color1 Red
#property indicator_color2 White
//--- input parameters
extern int       macd_fast=12;
extern int       macd_slow=26;
extern int       macd_period=9;
extern int bar=10000;
//--- buffers
double ExtMapBuffer1[];
double ExtMapBuffer2[];
datetime uptime=0;
datetime downtime=0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
  {
//---- indicators
   SetIndexStyle(0,DRAW_ARROW);
   SetIndexArrow(0,233);
   SetIndexBuffer(0,ExtMapBuffer1);
   SetIndexEmptyValue(0,0.0);
   SetIndexStyle(1,DRAW_ARROW);
   SetIndexArrow(1,234);
   SetIndexBuffer(1,ExtMapBuffer2);
   SetIndexEmptyValue(1,0.0);
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
int deinit()
  {
//----
   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int start()
  {
   int    counted_bars=IndicatorCounted();
   for(int i=0;i<bar;i++)
     {
        if(High[i]>High[i+1] && High[i+1]>High[i+2] && High[i+2]>High[i+3])//K����߼�������
          {
             if(macd(i)<macd(i+1) && macd(i+1)<macd(i+2) && macd(i+2)<macd(i+3))//macd��״�����½�
               {
                  ExtMapBuffer2[i]=High[i]+10*Point;//��������
                  if(i==0)
                    {
                      if(downtime!=Time[0])
                        {
                           Alert(Symbol()+Period()+"���ӷ������룬�������¼�ͷ");
                           downtime=Time[0];
                        }
                    }
               }
          }
        if(Low[i]<Low[i+1] && Low[i+1]<Low[i+2] && Low[i+2]<Low[i+3])//K����ͼ����½�
          {
             if(macd(i)>macd(i+1) && macd(i+1)>macd(i+2) && macd(i+2)>macd(i+3))//macd��״�����½�
               {
                  ExtMapBuffer1[i]=Low[i]+10*Point;//������һ�ֱ���
                  if(i==0)
                    {
                      if(uptime!=Time[0])
                        {
                          Alert(Symbol()+Period()+"���ӷ������룬�������ϼ�ͷ");
                          uptime=Time[0];
                        }
                    }
               }
          }
     }
   return(0);
  }
double macd(int shift)
  {
     double m=iMACD(Symbol(),0,macd_fast,macd_slow,macd_period,PRICE_CLOSE,MODE_MAIN,shift);
     return(m);
  }

