require "common"

function  fight3v3()

	pid=0;
	while(isBattle())
	do
		if pid==0 then
			mSleep(50);
			x1,y1=175,595;
			d=3000;
			x2,y2=300,605;
			if FindEnemy() then
				pid=1;
			else
				swipMoveHM(x1,y1,x2,y2,d);
			end
			pid=1;
		end 
		if pid==1 then
			goFight() ;
			pid=0;
		end
	end
	while(1)
	do
		otherx,othery =getColorXY(651,677,653,679,"0|0|0xffffff")
		if otherx>0 and othery>0 then
			tap(otherx,othery);
		end
		rjjxx,rjjxy=getColorXY(658,686,660,688,"0|0|0xddeffb")
		if rjjxx>0 and rjjxy>0 then
			tap(rjjxx,rjjxy);
			return
		end
	end
end

function isBattle()
	shopx,shopy = getColorXY(46,296,48,298,"0|0|0xe5cc88")
	return shopx>0;
end

function goFight()
	
	sysLog("战斗")
	tapNumber(1220,650); --普攻
	while(FindEnemy())
	do 
		sysLog("打架");
		tapNumber(1220,650); --普攻
		tapNumber(1000,650); --1技能
		tapNumber(1070,520); --2技能
		tapNumber(1220,450); --3技能
		
		
		tapNumber(1024,540); --4技能英雄的2技能
		tapNumber(1116,463); --4技能英雄的3技能
		
		tapNumber(140,300); --买装备
		tapNumber(1140,360);--升级大招
		tapNumber(920,580); --升级1
		tapNumber(1000,440); --升级2
		
		tapNumber(964,480); --4技能英雄的升级1
		tapNumber(1065,393); --4技能英雄的升级2
		
		
		tapNumber(1220,650);
		tapNumber(880,667);
		
	end
	
	tapNumber(1220,650); --普攻
end
function FindEnemy()
	
	x,y= getColorXY( 600,13, 602,15, "0|0|0x8b1e17" )
	
	if x>0 then
		sysLog("发现敌人")
		return true
	else
		sysLog("没发现敌人")
		return false
	end
	
end
function swipMoveHM(x1,y1,x2,y2,time)
	local Step,x,y = 1,x1,y1
	touchDownFix(1,x,y)
--	local function v(z,c) if z > c then return (-1 * Step) else return Step end end
--	while (math.abs(x-x2)>=Step) or (math.abs(y-y2)>=Step) do
--		if math.abs(x-x2)>=Step then x = x + v(x1,x2) end
--		if math.abs(y-y2)>=Step then y = y + v(y1,y2) end
--		touchMoveFix(1, x, y)
--		--mSleep(10)
--	end
	touchMoveFix(1, x2, y2)
	touchUpFix(1,x2,y2)
--	while time>=0
--	do
		
--		tapNumber(1000,650);
--		mSleep(20)
--		tapNumber(1070,520);
--		mSleep(100)
--		time=time-1600;
--	end
end