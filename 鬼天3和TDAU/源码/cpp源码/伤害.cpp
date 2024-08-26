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
MemorySearch(bm,"500",&gs,DWORD);
printf("共搜索%d个数据\n",gs);
MemoryOffset(bm,"10",0x4,&gs,FLOAT);
MemoryOffset(bm,"17",0xC,&gs,DWORD);
MemoryOffset(bm,"500",0xB0,&gs,DWORD);
printf("共偏移%d个数据\n",gs);
Print();
MemoryWrite(bm,"2147483647",0x60,DWORD);
MemoryWrite(bm,"2147483647",0x1C0,DWORD);
puts("改伤害开");puts("修改完成");
ClearResults();
}
