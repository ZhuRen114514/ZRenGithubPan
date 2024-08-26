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



wjiddz={}
local csgo=gg.alert("控人还是权限","权限","控人")
if csgo==1 then
srcs={
["参数"]={32,wjiddz,false},
["改"]={0xA0,1,4},
["主"]={86,4},
["副1"]={-0x50,81,4},
["副2"]={0x50,87,4},
}
tzmpy(srcs)
wjiddz=srcs["参数"][2]
local lscf={{address=wjiddz[1].address+0xA0,flags=4,value=1}}
gg.setValues(lscf)
else
srcs={
["参数"]={32,wjiddz,false},
["改"]={0xA0,1,4},
["主"]={86,4},
["副1"]={-0x50,81,4},
["副2"]={0x50,87,4},
}
tzmpy(srcs)
wjiddz=srcs["参数"][2]
local lscf={{address=wjiddz[1].address+0xA0,flags=4,value=1}}
local zijiid=gg.getValues(lscf)
gg.addListItems(zijiid)
for a1=1,100 do
lscf[1].value=a1
gg.setValues(lscf)
end
gg.setValues(zijiid)
end