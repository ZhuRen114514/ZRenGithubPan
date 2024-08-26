#include "MemoryTools.h"
int main(int argc,char **argv)
{
killGG();
int gs;//用来存储数据个数
void *jg;
PACKAGENAME *bm="com.PctWorks.S3CNE";
BypassGameSafe();
SetSearchRange(A_ANONMYOUS);
puts("开始内存搜索...");
MemorySearch(bm,"2.5",&gs,FLOAT);
printf("共搜索%d个数据\n",gs);
MemoryOffset(bm,"1.5",0x4,&gs,FLOAT);
printf("共偏移%d个数据\n",gs);
Print();
MemoryWrite(bm,"20",-0x8,FLOAT);//前速度
MemoryWrite(bm,"20",-0xC,FLOAT);//左右速度
MemoryWrite(bm,"99999999",0x20,FLOAT);//地面移动惯性
MemoryWrite(bm,"99999999",0x1C,FLOAT);//空中移动惯性
puts("加速2倍开");puts("修改完成");
ClearResults();
}
