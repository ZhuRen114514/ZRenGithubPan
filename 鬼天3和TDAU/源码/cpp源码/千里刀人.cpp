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
MemorySearch(bm,"10",&gs,DWORD);
printf("共搜索%d个数据\n",gs);
MemoryOffset(bm,"15",-0x4,&gs,DWORD);
MemoryOffset(bm,"0.125",-0x8,&gs,FLOAT);
printf("共偏移%d个数据\n",gs);
Print();
MemoryWrite(bm,"10000000000",-0x8,FLOAT);
MemoryWrite(bm,"2147483647",-0xC,DWORD);
puts("刀人开");puts("修改完成");
ClearResults();
}
