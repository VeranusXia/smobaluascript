require "common"


local MovetoTower = coroutine.create(
	function() 
	 
	x1,y1=176,594;
	x2,y2=244,500;
	d=15000;
	--x2,y2=176,300;
	while(1)
	do 
sysLog("位移");
		my = findImg("盟友.png", 90,  300, 100, 900, 530,"盟友");
		death = findImg("死亡.png", 80, 584, 0, 734, 30,"死亡");
		if death==true or d<1000 then 
			d=15000;
		end
		if my==false then
			swipMove(x1,y1,x2,y2,d);  
		end
		tapNumber(140,300); --买装备
		tapNumber(1140,360);--升级大招
		tapNumber(920,580); --升级1
		tapNumber(1000,440); --升级2
		d= d/2;
		coroutine.yield();
	end
end);

local GoFight = coroutine.create(
function() 
while(1)
do 
sysLog("打架");
	tapNumber(1220,650);
	tapNumber(1000,650);
	tapNumber(1070,520);
	tapNumber(1220,450);
	
	tapNumber(140,300); --买装备
	tapNumber(1140,360);--升级大招
	tapNumber(920,580); --升级1
	tapNumber(1000,440); --升级2
	
	tapNumber(1220,650);
	coroutine.yield();
end
end);

local FindImg= coroutine.create(
function()
while(1)
do
tapNumber(1220,650);
sysLog("开始战斗");
key = findImg("血条.png", 80, 770, 30, 830, 60,"血条");
key2 = findImg("血条2.png", 80, 300, 100, 900, 530,"血条2");
key3 = findImg("血条3.png", 80, 650, 0, 720, 30,"血条3");
key4 = findImg("塔血.png", 80, 300, 100, 900, 530,"塔血");
rjjx = getButton("人机继续.png", 80, 580, 670, 750, 720,"人机继续");
if rjjx ==true then
	coroutine.yield();
	return true;
end
if   key==true or key2==true or key3==true or key4==true then 
	  coroutine.resume(GoFight); 
else 
	  coroutine.resume(MovetoTower); 
	
end   
end
end)

function Fight()  
coroutine.resume(FindImg);
end




