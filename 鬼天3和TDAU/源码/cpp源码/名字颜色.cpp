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
MemorySearch(bm,"8",&gs,DWORD);
printf("共搜索%d个数据\n",gs);
MemoryOffset(bm,"0",-0x38,&gs,DWORD);
MemoryOffset(bm,"8",0x8,&gs,DWORD);
MemoryOffset(bm,"1",0x20,&gs,DWORD);
MemoryOffset(bm,"1",0x28,&gs,DWORD);
MemoryOffset(bm,"1",0x40,&gs,DWORD);
MemoryOffset(bm,"-100",0x50,&gs,FLOAT);
MemoryOffset(bm,"1",0x64,&gs,FLOAT);
printf("共偏移%d个数据\n",gs);
Print();
MemoryWrite(bm,"0",-0x40,DWORD);
puts("名字颜色关");puts("修改完成");
ClearResults();
}
