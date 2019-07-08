require "common"

local Points = {
	
	{name = "游戏中" ,point = {x = 47, y =297} ,color = "0xe5cc88"},
	{name = "发现敌人" ,point = {x = 601, y =14} ,color = "0x8b1e17"},
	{name = "点击屏幕继续" ,point = {x = 652, y =678} ,color = "0xffffff"},
	{name = "继续人机" ,point = {x = 659, y =687} ,color = "0xddeffb"},
	{name = "往上进攻" ,point = {x = 219, y =204} ,color = "0xddeffb"},
}
local fuzz = 95 
function start3V3()
	while(isBattle())
	do
		if isRight() then
			tapLtoR2()
		else
			tapLtoR()
		end
		tapNumber(1220,650); --普攻
		if FindEnemy() then
			Attact()
			sleep(3000)
		end
	end
	while(1)
	do
		if isOver() then
			return
		end
	end
end


function Attact()
	tapNumber(1220,650) --普攻
	while(FindEnemy())
	do 
		tapNumber(1220,650) --普攻
		tapNumber(1000,650) --1技能
		tapNumber(1070,520) --2技能
		tapNumber(1220,450) --3技能
		
		
		tapNumber(980,540) --4技能英雄的2技能
		tapNumber(1080,463) --4技能英雄的3技能
		 
		tapNumber(140,300) --买装备
		tapNumber(1140,360) --升级大招
		tapNumber(920,580) --升级1
		tapNumber(1000,440) --升级2
		
		tapNumber(920,480) --4技能英雄的升级1
		tapNumber(1020,400) --4技能英雄的升级2
		
		
		tapNumber(1220,650)
		tapNumber(880,667)
		
	end
	
	tapNumber(1220,650); --普攻
	
end

function isBattle()
	return findcolor(Points[1] , fuzz)
end

function isRight()
	return findcolor(Points[5] , fuzz)

end

function isOver()
	local o1= findcolorandtap(Points[3] , fuzz)
	local o2 =	findcolorandtap(Points[4] , fuzz)
	return (o1 or o2);
end

function FindEnemy()
	return findcolor(Points[2] , 75)
end