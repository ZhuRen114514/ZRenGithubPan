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
MemorySearch(bm,"20",&gs,DWORD);
printf("共搜索%d个数据\n",gs);
MemoryOffset(bm,"50",0x20,&gs,DWORD);
MemoryOffset(bm,"0.5",0x28,&gs,FLOAT);
printf("共偏移%d个数据\n",gs);
Print();
MemoryWrite(bm,"0",0x28,FLOAT);
MemoryWrite(bm,"0.05",0x2C,FLOAT);
MemoryWrite(bm,"999999999",0x30,DWORD);
puts("RPG强化");puts("修改完成");
ClearResults();
}
