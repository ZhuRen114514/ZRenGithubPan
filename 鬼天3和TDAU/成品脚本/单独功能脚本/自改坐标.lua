function tzmpy(srcs)
  local lscf={}
  if #srcs["参数"][2]==0 then
    gg.clearResults()
    gg.setRanges(srcs["参数"][1])
    gg.searchNumber(srcs["主"][1],srcs["主"][2])
    local syz=gg.getResults(10000000)
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
      gg.alert("未搜索到值")
    end
  end
  for a=1,#srcs["参数"][2] do
    lscf[#lscf+1]={address=srcs["参数"][2][a].address+srcs["改"][1],flags=srcs["改"][3],value=srcs["改"][2],freeze=srcs["参数"][3]}
  end
  gg.addListItems(lscf)
  gg.setValues(lscf)
end
nydz={}
zbnydz={}
srcs={
["参数"]={32,zbnydz,false},
["改"]={0x0,1034147594,4},
["主"]={1034147594,4},
["副1"]={0x184,1065353216,4},
}
tzmpy(srcs)
zbnydz=srcs["参数"][2]
local lscf={}
for a=0,2 do
  local z=a*0x8
  lscf[a+1]={address=zbnydz[1].address+0x1C4+z,flags=16,value=0}
end
lscf=gg.getValues(lscf)
local zg=gg.prompt({"X轴","Y轴","Z轴","是否冻结X坐标","是否冻结Y坐标","是否冻结Z坐标","是否关闭下落"},{lscf[1].value,lscf[2].value,lscf[3].value,false,false,false,false},{"number","number","number","checkbox","checkbox","checkbox","checkbox"})
if zg==nil then
else
local ft=0
if zg[7]==false then
ft=100
else
ft=0
end
srcs={
["参数"]={32,nydz,false},
["改"]={0x2C,ft,16},
["主"]={1075838976,4},
["副1"]={0x4,1069547520,4},
}
tzmpy(srcs)--先关闭下落
nydz=srcs["参数"][2]
srcs={
["参数"]={32,zbnydz,zg[4]},
["改"]={0x1C4,zg[1],16},
["主"]={1034147594,4},
["副1"]={0x184,1065353216,4},
}
tzmpy(srcs)
zbnydz=srcs["参数"][2]
srcs={
["参数"]={32,zbnydz,true},
["改"]={0x1CC,zg[2],16},
["主"]={1034147594,4},
["副1"]={0x184,1065353216,4},
}
tzmpy(srcs)
zbnydz=srcs["参数"][2]
srcs={
["参数"]={32,zbnydz,zg[6]},
["改"]={0x1D4,zg[3],16},
["主"]={1034147594,4},
["副1"]={0x184,1065353216,4},
}
tzmpy(srcs)
zbnydz=srcs["参数"][2]
gg.sleep(1000)
srcs={
["参数"]={32,zbnydz,zg[5]},
["改"]={0x1CC,zg[2],16},
["主"]={1034147594,4},
["副1"]={0x184,1065353216,4},
}
tzmpy(srcs)
zbnydz=srcs["参数"][2]
end