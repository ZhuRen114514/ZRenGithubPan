--[[
作者:主人
QQ:2150614172

精简代码，优化代码量，修改方法把if改为for循环达到无限副特征码和无限修改值的目的
从可使用6个副特征码提升为无数副特征码
从可修改1个地址提升为无数地址
把输入数字作为内存范围和值的类型取消,改为文字
例如
把类型4也就是D类改为可以直接填"D"来代表这是个D类型，而不是填数字4来代表这是个D类
内存范围32也就是A内存改为可以直接填"A"来代表内存范围是A，而不是填数字32来代表内存A



作者技术不强是个小白，脚本写得很垃圾，大佬不喜勿喷谢谢。
本人非常热爱编程和外挂，可惜没有人愿意收我
如果有愿意收我为徒的可以联系我

写这个的原因是联合搜索太慢了，而鬼天3这个游戏的基址又不好抓
所以我想到了内存搜索CPP的偏移写法导出的二进制修改速度很快
所以想办法弄成了这个脚本


该函数可以 最多支持无数个副特征码 1个主特征码 
可一次性修改无数个偏移后的值
该函数需要输入一个表用于存放特定功能的地址
下次调用函数时如果表里面有上次修改的地址，会直接通过上一次搜出来的地址进行偏移修改
省略掉搜索的过程实现快速修改对应地址的值



使用方法如下:

nydz={} --创建一个变量为nydz的空表

srcs={
  ["参数"]={"A",nydz},  --第一个A为内存范围是A内存,第二个nydz是输入一个变量为nydz的空表
  ["特征"]={            --创建一个键名为"特征"的一个键，并赋值一个表，默认表里的第一个表为主特征码，后续全是副特征码
    {123,"D"},         --在键名为"特征"的表里创建一个新的表(这是"特征"里的第一个表所以这是主特征码并写入参数，第一个是主特征码的值，第二个是主特征码类型
    {0x3,321,"F"},     --创建第二个表，这个表就是副特征码了，第一个值为主特征码到这个特征码的偏移量，第二个值为副特征码的值，第三个值是副特征码值的类型
    {0x6,147,"Q"},     --创建第三个表,这个表就是第二个副特征码，第一个值为从主特征码到第二个副特征码的偏移量，第三个值为这个副特征码值的类型
    --理论上副特征码可以写无数个
  },
  ["修改"]={               --创建一个键名为"修改"的一个键，并赋值一个表
    {0x6,999,"X",false},  --第一个值为从主特征码到第一个修改值的偏移量，第二个值为需要修改的值，第三个值为需要修改的值的类型，第四个值为是否冻结(true是冻结，false是不冻结)
    {0xA,0,"D",true},     --这里同上
    --理论上修改值也可以写无数个
  },
}
tzmpy(srcs)               --输入参数执行

nydz=srcs["参数"][2]       --把修改成功的地址保存，下次使用就不需要搜索而是直接修改地址(重启游戏失效)

qksydj()                  -- 清空保存列表所有冻结值

]]

--判断类型
function LXPD(LX)
  local lx
  if LX == 'A' then
    lx = gg.TYPE_AUTO
   elseif LX == 'D' then
    lx = gg.TYPE_DWORD
   elseif LX == 'F' then
    lx = gg.TYPE_FLOAT
   elseif LX == 'E' then
    lx = gg.TYPE_DOUBLE
   elseif LX == 'W' then
    lx = gg.TYPE_WORD
   elseif LX == 'B' then
    lx = gg.TYPE_BYTE
   elseif LX == 'Q' then
    lx = gg.TYPE_QWORD
   elseif LX == 'X' then
    lx = gg.TYPE_XOR
   else
    lx = gg.TYPE_AUTO
  end
  return lx
end

--判断内存范围
function LCPD(LC)
  local lc
  if LC == 'Jh' then
    lc = gg.REGION_JAVA_HEAP
   elseif LC == 'Ch' then
    lc = gg.REGION_C_HEAP
   elseif LC == 'Ca' then
    lc = gg.REGION_C_ALLOC
   elseif LC == 'Cd' then
    lc = gg.REGION_C_DATA
   elseif LC == 'Cb' then
    lc = gg.REGION_C_BSS
   elseif LC == 'PS' then
    lc = gg.REGION_PPSSPP
   elseif LC == 'A' then
    lc = gg.REGION_ANONYMOUS
   elseif LC == 'J' then
    lc = gg.REGION_JAVA
   elseif LC == 'S' then
    lc = gg.REGION_STACK
   elseif LC == 'As' then
    lc = gg.REGION_ASHMEM
   elseif LC == 'O' then
    lc = gg.REGION_OTHER
   elseif LC == 'B' then
    lc = gg.REGION_BAD
   elseif LC == 'Xa' then
    lc = gg.REGION_CODE_APP
   elseif LC == 'Xs' then
    lc = gg.REGION_CODE_SYS
   else
    lc = 262207
  end
  return lc
end


--主要配置文件
function tzmpy(srcs)
  local lscf={}
  local xgpy={}
  local ztzm={}
  if #srcs["参数"][2]==0 then
    gg.clearResults()
    gg.setRanges(LCPD(srcs["参数"][1]))
    gg.searchNumber(srcs["特征"][1][1],LXPD(srcs["特征"][1][2]))
    ztzm=gg.getResults(99999999999)
    srcs["参数"][2]=ztzm
    if #ztzm==0 then
      gg.alert("未搜索到值")
     else
      if #srcs["特征"]>=2 then
        for a=2,#srcs["特征"] do
          for b=1,#ztzm do
            ztzm[b]={address=ztzm[b].address+srcs["特征"][a][1],flags=LXPD(srcs["特征"][a][3]),value=srcs["特征"][a][2]}
          end
          ztzm=gg.getValues(ztzm)
          for b=1,#ztzm do
            if ztzm[b].value==srcs["特征"][a][2] then
              lscf[#lscf+1]={address=ztzm[b].address-srcs["特征"][a][1],flags=LXPD(srcs["特征"][a][3]),value=srcs["特征"][a][2]}
            end
          end
          srcs["参数"][2]=lscf
          ztzm=lscf
          lscf={}
        end
      end
    end
  end
  if #srcs["修改"]~=0 then
    for a=1,#srcs["修改"] do
      for b=1,#srcs["参数"][2] do
        xgpy[#xgpy+1]={address=srcs["参数"][2][b].address+srcs["修改"][a][1],flags=LXPD(srcs["修改"][a][3]),value=srcs["修改"][a][2],freeze=srcs["修改"][a][4]}
      end
      gg.addListItems(xgpy)
      gg.setValues(xgpy)
      xgpy={}
    end
  end
end

--清空所有冻结值
function qksydj()
  local bclb=gg.getListItems()
  for a1=1,#bclb do
    bclb[a1].freeze=false
  end
  local bclb=gg.getValues(bclb)
  gg.addListItems(bclb)
  gg.clearList()
end


--以上为配置文件
--以下为配置文件使用示例

--[[ 2052        所有枪万能值   冻结崩溃
-0x20   弹夹内子弹数量
-0x74   布尔值，是否全自动
-0x3C   武器后坐力
-0x38   枪左右晃动
-0x50   武器抖动(改100F不抖动)
-0x78   武器伤害
-0x80   开枪间隔(冻结改0)
]]


--[[ 1082130432 偏移0x8自身验证 玩家万能值
-0x10  行走速度
-0xC   奔跑速度
-0x4   跳跃高度  建议60
0x4    下落速度  建议6
0xBC   当前血量

]]
--[[ 65537  65793  两个阵营的怪，偏移0xC后1D验证  怪物万能值
-0x4    当前血量
-0x24   旋转速度
-0x28   跳跃高度
-0x30   奔跑速度
-0x34   行走速度
-0x2C   下落速度
-0x40   一技能CD
-0x3C   二技能CD
-0x38   三技能CD
-0x58   移动速度
]]

wjdz={}

srcs={
  ["参数"]={"A",wjdz},
  ["特征"]={
    {1082130432,"D"},
    {0x8,1082130432,"D"},
  },
  ["修改"]={
    {0x4,0,"F",false},
    {-0x4,0.05,"F",false},
  }
}
tzmpy(srcs)
wjdz=srcs["参数"][2]