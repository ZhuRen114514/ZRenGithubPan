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
MemorySearch(bm,"5570643",&gs,DWORD);
printf("共搜索%d个数据\n",gs);
MemoryOffset(bm,"82",0x4,&gs,DWORD);
printf("共偏移%d个数据\n",gs);
Print();
MemoryWrite(bm,"4325459",0x0,DWORD);
MemoryWrite(bm,"88",0x4,DWORD);
puts("沙盒改生存开");puts("修改完成");
ClearResults();
}
