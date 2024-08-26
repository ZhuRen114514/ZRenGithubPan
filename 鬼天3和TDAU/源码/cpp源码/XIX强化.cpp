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
MemorySearch(bm,"1055286886",&gs,DWORD);
printf("共搜索%d个数据\n",gs);
MemoryOffset(bm,"1058642330",0x4,&gs,DWORD);
MemoryOffset(bm,"3",0x8,&gs,DWORD);
printf("共偏移%d个数据\n",gs);
Print();
MemoryWrite(bm,"0",0x0,DWORD);
MemoryWrite(bm,"0",0x4,DWORD);
MemoryWrite(bm,"0",0x8,DWORD);
puts("XIX强化1");puts("修改完成");
ClearResults();
{
PACKAGENAME *bm="com.PctWorks.S3CNE";
BypassGameSafe();
SetSearchRange(A_ANONMYOUS);
puts("开始内存搜索...");
MemorySearch(bm,"1073741824",&gs,DWORD);
printf("共搜索%d个数据\n",gs);
MemoryOffset(bm,"1028443341",-0x44,&gs,DWORD);
MemoryOffset(bm,"1065353216",0x4,&gs,DWORD);
printf("共偏移%d个数据\n",gs);
Print();
MemoryWrite(bm,"966609234",-0x44,DWORD);
MemoryWrite(bm,"1086324736",0x4,DWORD);
puts("XIX强化2");puts("修改完成");
ClearResults();
}
}
