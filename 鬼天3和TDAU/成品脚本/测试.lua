gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber(':Quit',gg.TYPE_BYTE,false,gg.SIGN_EQUAL,0, -1)
gg.getResults(100000)
gg.editAll('0',gg.TYPE_BYTE)
--[[
nydz={}
function cshdz(z,y,p,l,d)--第一个是修改的值，第二个是运算符号(1是＋，2是－)，第三个是从主特征码到修改值的偏移量，第四个值是类型，第五个值是是否冻结(true,false)
  if #nydz==0 then--如果nydz里没有值就重新搜索新的值
    gg.clearResults()--清空搜索列表
    gg.setRanges(32)--内存范围
    gg.searchNumber("2.5",16)--主特征码和类型
    local ztzm=gg.getResults(100000)--提取多少个结果
    for a1=1,#ztzm do
      ztzm[a1].address=ztzm[a1].address+0x4 --地址偏移到下一个副特征码
    end
    local ztzm=gg.getValues(ztzm)--获取偏移后地址的值
    for a1=1,#ztzm do
      if ztzm[a1].value==1.5 then--判断偏移后的值是否等于副特征码如果等于就偏移回主特征码然后保存到nydz里
        ztzm[a1].address=ztzm[a1].address-0x4 --把等于副特征码的值偏移回主特征码
        nydz[#nydz+1]=ztzm[a1] --把结果保存进
      end
    end
  end
  local lsdz=gg.getValues(nydz)--获取最新的地址数据
  for a1=1,#nydz do
    if y==0 then--判断是0地址就是－,判断是1地址就是＋
      lsdz[a1]={address=lsdz[a1].address-p,flags=l,value=z,freeze=d}
     else
      lsdz[a1]={address=lsdz[a1].address+p,flags=l,value=z,freeze=d}
    end
  end
  gg.addListItems(lsdz)
  gg.setValues(lsdz)
  print(lsdz)
end



cshdz(100,1,0x2C,16,true)
--cshdz(100,0x2C,16)


function cshdz(z,y,p,l,d)
  if #nydz==0 then
    gg.clearResults()
    gg.setRanges(32)
    gg.searchNumber("2.5",16)
    local ztzm=gg.getResults(100000)
    for a1=1,#ztzm do
      ztzm[a1].address=ztzm[a1].address+0x4
    end
    local ztzm=gg.getValues(ztzm)
    for a1=1,#ztzm do
      if ztzm[a1].value==1.5 then
        ztzm[a1].address=ztzm[a1].address-0x4
        nydz[#nydz+1]=ztzm[a1]
      end
    end
  end
  local lsdz=gg.getValues(nydz)
  for a1=1,#nydz do
    if y==0 then
      lsdz[a1]={address=lsdz[a1].address-p,flags=l,value=z,freeze=d}
     else
      lsdz[a1]={address=lsdz[a1].address+p,flags=l,value=z,freeze=d}
    end
  end
  gg.addListItems(lsdz)
  gg.setValues(lsdz)
end



cshdz(100,1,0x2C,16,false)
--cshdz(100,0x2C,16)

--]]

nydz={}
wdnydz={}
zgjsnydz={}
shzqhnydz={}
gtnydz={}
function cshdz(tzm,ftzm,yy,py,lx,z,y,p,l,d,yngb)
  if #yngb==0 then
    gg.clearResults()
    gg.setRanges(32)
    gg.searchNumber(tzm,lx)
    local ztzm=gg.getResults(100000)
    for a1=1,#ztzm do
      if yy==0 then
        ztzm[a1].address=ztzm[a1].address-py
       else
        ztzm[a1].address=ztzm[a1].address+py
      end
    end
    local ztzm=gg.getValues(ztzm)
    for a1=1,#ztzm do
      if ztzm[a1].value==ftzm then
        if yy==0 then
          ztzm[a1].address=ztzm[a1].address+py
         else
          ztzm[a1].address=ztzm[a1].address-py
        end
        yngb[#yngb+1]=ztzm[a1]
      end
    end
  end
  local lsdz=gg.getValues(yngb)
  for a1=1,#lsdz do
    if y==0 then
      lsdz[a1]={address=lsdz[a1].address-p,flags=l,value=z,freeze=d}
     else
      lsdz[a1]={address=lsdz[a1].address+p,flags=l,value=z,freeze=d}
    end
  end
  gg.addListItems(lsdz)
  gg.setValues(lsdz)
end

--[[
wjiddz={}
shzqhnydz={}
cshdz("1177853952","1177853952",0,0x0,4,"99999999",1,0x4,4,true,shzqhnydz)
cshdz("1177853952","1177853952",0,0x0,4,"99999999",1,0x0,4,true,shzqhnydz)
--[-[
shzqhnydz={}
cshdz("10338935","3",0,0x14,4,"4",0,0xC,16,true,shzqhnydz)
cshdz("10338935","3",0,0x14,4,"8",0,0x8,16,true,shzqhnydz)
cshdz("10338935","3",0,0x14,4,"6",0,0x4,16,true,shzqhnydz)
--]-]
shzqhnydz={}
cshdz("371857150","3",0,0x158,4,"0",0,0x148,4,false,wjiddz)
print(shzqhnydz)
--]]



local LLL=gg.prompt({"自定义血量"})
local BBB
if LLL[1]=="-1" then
BBB=4
else
BBB=16
end
cshdz("16777216","65537",0,0x44,4,LLL[1],0,0xE0,BBB,false,wdnydz)
if #wdnydz==0 then
gg.alert("开启失败")
else
gg.alert("开启成功")
end

local zg=gg.prompt({"自定义高跳高度"})
cshdz("6226027","6226036",1,0xC,4,zg[1],1,0x3C,16,false,gtnydz)


--[[
:|}�0H-���� A��
:0H-����

:|}� ���/� A��
: ���/�

h 7C 7D 9B 01 30 48 2D E9 08 B0 8D E2 20 41 9F E5
h 7C 7D 9B 01 01 00 A0 E3 1E FF 2F E1 20 41 9F E5
]]

function tzmpy(srcs)
  if #srcs["参数"][2]==0 then
    gg.clearResults()
    gg.setRanges(srcs["参数"][1])
    gg.searchNumber(srcs["主"][1],srcs["主"][2])
    local syz=gg.getResults(10000000)
    local lscf={}
    srcs["参数"][2]=syz
    if #syz~=0 then
      if srcs["副1"]~=nil then
        for a=1,#syz do
          syz[a]={address=syz[a].address+srcs["副1"][1],flags=srcs["副1"][3],value=srcs["副1"][2]}
        end
        syz=gg.getValues(syz)
        for a=1,#syz do
          if syz[a].value==srcs["副1"][2] then
            lscf[#lscf+1]={address=syz[a].address-srcs["副1"][1],flags=srcs["副1"][3],value=srcs["副1"][2]}
          end
        end
        syz=lscf
        srcs["参数"][2]=syz
        lscf={}
        if srcs["副2"]~=nil then
          for a=1,#syz do
            syz[a]={address=syz[a].address+srcs["副2"][1],flags=srcs["副2"][3],value=srcs["副2"][2]}
          end
          syz=gg.getValues(syz)
          for a=1,#syz do
            if syz[a].value==srcs["副2"][2] then
              lscf[#lscf+1]={address=syz[a].address-srcs["副2"][1],flags=srcs["副2"][3],value=srcs["副2"][2]}
            end
          end
          syz=lscf
          srcs["参数"][2]=syz
          lscf={}
          if srcs["副3"]~=nil then
            for a=1,#syz do
              syz[a]={address=syz[a].address+srcs["副2"][1],flags=srcs["副2"][3],value=srcs["副2"][2]}
            end
            syz=gg.getValues(syz)
            for a=1,#syz do
              if syz[a].value==srcs["副3"][2] then
                lscf[#lscf+1]={address=syz[a].address-srcs["副3"][1],flags=srcs["副3"][3],value=srcs["副3"][2]}
              end
            end
            syz=lscf
            srcs["参数"][2]=syz
            lscf={}
            if srcs["副4"]~=nil then
              for a=1,#syz do
                syz[a]={address=syz[a].address+srcs["副4"][1],flags=srcs["副4"][3],value=srcs["副4"][2]}
              end
              syz=gg.getValues(syz)
              for a=1,#syz do
                if syz[a].value==srcs["副4"][2] then
                  lscf[#lscf+1]={address=syz[a].address-srcs["副4"][1],flags=srcs["副4"][3],value=srcs["副4"][2]}
                end
              end
              syz=lscf
              srcs["参数"][2]=syz
              lscf={}
              if srcs["副5"]~=nil then
                for a=1,#syz do
                  syz[a]={address=syz[a].address+srcs["副5"][1],flags=srcs["副5"][3],value=srcs["副5"][2]}
                end
                syz=gg.getValues(syz)
                for a=1,#syz do
                  if syz[a].value==srcs["副5"][2] then
                    lscf[#lscf+1]={address=syz[a].address-srcs["副5"][1],flags=srcs["副5"][3],value=srcs["副5"][2]}
                  end
                end
                syz=lscf
                srcs["参数"][2]=syz
                lscf={}
                if srcs["副6"]~=nil then
                  for a=1,#syz do
                    syz[a]={address=syz[a].address+srcs["副6"][1],flags=srcs["副6"][3],value=srcs["副6"][2]}
                  end
                  syz=gg.getValues(syz)
                  for a=1,#syz do
                    if syz[a].value==srcs["副6"][2] then
                      lscf[#lscf+1]={address=syz[a].address-srcs["副6"][1],flags=srcs["副6"][3],value=srcs["副6"][2]}
                    end
                  end
                  syz=lscf
                  srcs["参数"][2]=syz
                  lscf={}
                end
              end
            end
          end
        end
      end
     else
      gg.toast("未搜索到值")
    end
  end
  lscf={}
  for a=1,#srcs["参数"][2] do
    lscf[#lscf+1]={address=srcs["参数"][2][a].address+srcs["改"][1],flags=srcs["改"][3],value=srcs["改"][2],freeze=srcs["参数"][3]}
  end
  gg.addListItems(lscf)
  gg.setValues(lscf)
end
gtnydz={}
gt={}



local zg=gg.prompt({"自定义高跳高度"})
srcs={
["参数"]={32,gtnydz,false},
["改"]={0x3C,zg[1],16},
["主"]={6226027,4},
["副1"]={0xC,6226036,4},
}
tzmpy(srcs)
--cshdz("1075838976","1069547520",1,0x4,4,3000000,1,0x28,16,false,nydz)

srcs={
["参数"]={32,gt,false},
["改"]={0x28,60,16},
["主"]={1075838976,4},
["副1"]={0x4,1069547520,4},
}
tzmpy(srcs)