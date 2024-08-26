--[[
作者:主人
QQ:2150614172

作者技术不强是个小白，脚本写得很垃圾，大佬不喜勿喷谢谢。
本人非常热爱编程和外挂，可惜没有人愿意收我
如果有愿意收我为徒的可以联系我

写这个的原因是联合搜索太慢了，而鬼天3这个游戏的基址又不好抓
所以我想到了内存搜索CPP的偏移写法导出的二进制修改速度很快
所以想办法弄成了这个脚本

该函数可以 最多支持6个副特征码 1个主特征码 
可一次性修改1个偏移后的值
该函数需要输入一个表用于存放特定功能的地址
下次调用函数时如果表里面有上次修改的地址，会直接通过上一次搜出来的地址进行偏移修改
省略掉搜索的过程实现快速修改对应地址的值


放弃上个版本的变量采用输入一个表来替代变量

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
      if #srcs["特征"]~=0 then
        for a=2,#srcs do
          for b=1,#ztzm do
            ztzm[b]={address=ztzm[b].address+srcs["特征"][a][1],flags=LXPD(srcs["特征"][a][3]),value=srcs["特征"][a][2]}
          end
          ztzm=gg.getValues(ztzm)
          for b=1,#ztzm do
            if ztzm[b].value==srcs["特征"][a][2] then
              lscf[#lscf+1]={address=ztzm[b].addresssrcs["特征"][a][1],flags=LXPD(srcs["特征"][a][3]),value=srcs["特征"][a][2]}
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
--下为示例


nydz={}

srcs={
  ["参数"]={"A",nydz},
  ["特征"]={
    {1075838976,"D"},
    {0x4,1069547520,"D"},
  },
  ["修改"]={
    {0x28,999999,"F",false},
    {0x30,0,"D",false}
  },
}
tzmpy(srcs)
nydz=srcs["参数"][2]

--qksydj()

