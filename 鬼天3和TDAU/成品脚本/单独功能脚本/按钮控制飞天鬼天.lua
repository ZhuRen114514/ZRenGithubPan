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

gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber(':Quit',gg.TYPE_BYTE,false,gg.SIGN_EQUAL,0, -1)
gg.getResults(100000)
gg.editAll('0',gg.TYPE_BYTE)
gg.clearResults()

andz={}

srcs={
  ["参数"]={"A",andz},
  ["特征"]={
    {1103626240,"D"},
    {-0x4,-1052770304,"D"},
  },
  ["修改"]={}
}
tzmpy(srcs)
andz=srcs["参数"][2]

nydz={}

srcs={
  ["参数"]={"A",nydz},
  ["特征"]={
    {1075838976,"D"},
    {0x4,1069547520,"D"},
  },
  ["修改"]={
    {0x2C,0,"D",false}
  },
}
tzmpy(srcs)
nydz=srcs["参数"][2]

srcs={
  ["参数"]={"A",nydz},
  ["特征"]={
    {1075838976,"D"},
    {0x4,1069547520,"D"},
  },
  ["修改"]={
    {0x2C,100,"F",false},
    {0x28,800,"F",false},
    {0x24,99999999,"F",false},
    {-0x8,25,"F",false},
    {-0xC,25,"F",false},
  },
}
tzmpy(srcs)
nydz=srcs["参数"][2]

hdan={{address=andz[1].address+0x1C,flags=4,value=0}}
tyan={{address=hdan[1].address+0x60,flags=4,value=0}}

while true do
gg.sleep(100)
  tyan=gg.getValues(tyan)
  hdan=gg.getValues(hdan)
  if tyan[1].value==1 then
  srcs={
  ["参数"]={"A",nydz},
  ["特征"]={
    {1075838976,"D"},
    {0x4,1069547520,"D"},
  },
  ["修改"]={
    {0x2C,100,"F",false},
  },
}
tzmpy(srcs)
nydz=srcs["参数"][2]
   else
   srcs={
  ["参数"]={"A",nydz},
  ["特征"]={
    {1075838976,"D"},
    {0x4,1069547520,"D"},
  },
  ["修改"]={
    {0x2C,0,"F",false}
  },
}
tzmpy(srcs)
nydz=srcs["参数"][2]
  end
  if hdan[1].value==1 then
  srcs={
  ["参数"]={"A",nydz},
  ["特征"]={
    {1075838976,"D"},
    {0x4,1069547520,"D"},
  },
  ["修改"]={
    {0x2C,-20,"F",false}
  },
}
tzmpy(srcs)
nydz=srcs["参数"][2]
   else
   srcs={
  ["参数"]={"A",nydz},
  ["特征"]={
    {1075838976,"D"},
    {0x4,1069547520,"D"},
  },
  ["修改"]={
    {0x2C,0,"F",false}
  },
}
tzmpy(srcs)
nydz=srcs["参数"][2]
  end
end
