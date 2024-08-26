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
MemorySearch(bm,"65537",&gs,DWORD);
printf("共搜索%d个数据\n",gs);
MemoryOffset(bm,"1",-0xC,&gs,DWORD);
printf("共偏移%d个数据\n",gs);
Print();MemoryWrite(bm,"100000000",-0x74,FLOAT);//下落速度
puts("无敌开");puts("修改完成");
ClearResults();
}
