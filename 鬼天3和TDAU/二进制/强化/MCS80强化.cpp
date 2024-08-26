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
MemorySearch(bm,"7",&gs,FLOAT);
printf("共搜索%d个数据\n",gs);
MemoryOffset(bm,"8",-0x4,&gs,DWORD);
MemoryOffset(bm,"0.89999997616",0x4,&gs,FLOAT);
printf("共偏移%d个数据\n",gs);
Print();
MemoryWrite(bm,"0.00030000001",0x4,FLOAT);
MemoryWrite(bm,"25",-0x4,DWORD);
puts("MCS80强化");puts("修改完成");
ClearResults();
}
