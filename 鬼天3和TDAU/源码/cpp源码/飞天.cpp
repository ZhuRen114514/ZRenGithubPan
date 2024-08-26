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
Print();MemoryWrite(bm,"0",0x28,FLOAT);//下落速度
puts("飞天开");puts("修改完成");
ClearResults();
}
