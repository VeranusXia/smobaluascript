require "common"
require "fight3V3"
local Points = {
	{name = "对战" ,point = {x = 488, y =523} ,color = "0x61462e"},
	{name = "人机" ,point = {x = 1190, y =309} ,color = "0xffffff"} ,
	{name = "3V3模式" ,point = {x = 809, y =537} ,color = "0xe7f7ef"},
	{name = "5V5模式" ,point = {x = 217, y =540} ,color = "0xf7f4e8"},
	{name = "第一关" ,point = {x = 90, y =135} ,color = "0xffffff"},
	{name = "入门难度" ,point = {x = 834, y =311} ,color = "0xffffff"},
	{name = "开始匹配" ,point = {x = 708, y =628} ,color = "0xffffff"},
	{name = "进入" ,point = {x = 691, y =627} ,color = "0xffffff"},
	{name = "点击屏幕继续" ,point = {x = 652, y =678} ,color = "0xffffff"},
	{name = "选择英雄" ,point = {x = 282, y =383} ,color = "0xd4ecf6"},
	{name = "战斗画面" ,point = {x = 47, y =297} ,color = "0xe5cc88"},
	{name = "继续" ,point = {x = 659, y =687} ,color = "0xddeffb"},
	{name = "返回大厅" ,point = {x = 547, y =688} ,color = "0x346a99"},
	--{name = "人机再来" ,point = {x = 802, y =677} ,color = "0xfaf5e5"},
	--{name = "人机再来" ,point = {x = 802, y =677} ,color = "0xcdbda0"},
	{name = "战令升级" ,point = {x = 566, y =617} ,color = "0xb3ceea"},
	{name = "成就升级" ,point = {x = 546, y =656} ,color = "0xe3eafc"},
	{name = "防沉迷" ,point = {x = 890, y =501} ,color = "0xf6e1e6"},
}
local HeroPoints = {
	{name = "英雄确认" ,point = {x = 1236, y =716} ,color = "0x826338"},
	{name = "取消体验卡" ,point = {x = 534, y =530} ,color = "0xddeffb"}
}
local fuzz = 90


function startComputer(x)
	while(1)
	do
		local appid = runtime.getForegroundApp()
		if appid=="com.tencent.smoba" or appid=="com.tencent.tmgp.sgame" then
			
			for i, p in pairs(Points) do
				if p.name== "3V3模式" and x==5 then
					log(1)
				elseif p.name== "5V5模式" and x==3 then
					log(1)
				elseif p.name =="战斗画面" then
					if findcolor(p , fuzz) then
						start3V3() 
					end
				elseif findcolorandtap(p , fuzz) then
					if p.name == "选择英雄" then
						choosehero()
					end
					if p.name == "5V5模式" then
						tapTtoB(5);
					end
				end
			end
			
			sleep(1000)
			
		end
		
	end
	
end


local herox =1040
local heroy =670
function choosehero()
	tapBtoT(3);
	local yxok=false
	while heroy> 110
	do
		while herox>50
		do
			yxok = findcolorandtap(HeroPoints[1],fuzz)
			if yxok==true then
				herox=herox+120
				return
			end
			sleep(1000)
			tapNumber(herox,heroy)
			sleep(500)
			tycancel = findcolor(HeroPoints[2],fuzz)
			sleep(200)
			herox=herox-120
		end
		if yxok==true then
			return
		end
		if herox<50 then herox =1040 end
		heroy=heroy-130
	end
end