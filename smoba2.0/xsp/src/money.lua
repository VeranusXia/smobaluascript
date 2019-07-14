require "common"

local Points = {
	{name = "冒险之旅" ,point = {x = 1058, y =568} ,color = "0x1a2e4a"}, 
	{name = "冒险模式" ,point = {x = 825, y =600} ,color = "0x5af2fb"}, 
	{name = "挑战" ,point = {x = 671, y =570} ,color = "0xffffff"}, 
	{name = "下一步" ,point = {x = 1010, y =627} ,color = "0xddeffb"},
	{name = "闯关" ,point = {x = 988, y =600} ,color = "0xffffff"}, 
	{name = "跳过" ,point = {x = 1267, y =28} ,color = "0xd8ebf7"} ,
	{name = "跳过" ,point = {x = 1241, y =51} ,color = "0x5e4524"},
	{name = "点击屏幕继续" ,point = {x = 681, y =677} ,color = "0xffffff"},
	{name = "再次挑战" ,point = {x = 1091, y =687} ,color = "0xffffff"},
	{name = "再次挑战" ,point = {x = 1091, y =687} ,color = "0xb6a485"},
	{name = "战令升级" ,point = {x = 545, y =689} ,color = "0x36618c"},
	{name = "成就升级" ,point = {x = 546, y =656} ,color = "0xe3eafc"},
	{name = "防沉迷" ,point = {x = 890, y =501} ,color = "0xf6e1e6"} 
}
local fuzz = 90
function startMoney()
    local count = 0;
	while(1)
	do
		local appid = runtime.getForegroundApp()
		if appid=="com.tencent.smoba" or appid=="com.tencent.tmgp.sgame" then
			for i, p in pairs(Points) do
			   if findcolorandtap(p , fuzz) then
			        if p.name == "再次挑战" then
						count = count +1 ;
					end
					HUD("已刷次数:"..count)
			   end
			end
			sleep(1000)
		end
	end
end

