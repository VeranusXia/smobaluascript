require "common"

local t1,t2,t3=true,true,true
local xm,ym=-1,-1 
local xt1,yt1=-1,-1
local xt2,yt2=-1,-1
local xt3,yt3=-1,-1


function searchMe()
	
	x1, y1 = getColorXY( 0, 0, 250, 250, "0|0|0x26bb54" )
	if x1>0 then 
		xm,ym=x1,y1
	end 
end

function searchTower1()
	
	x, y = getColorXY( 140, 80, 150, 110, "0|0|0xd61717" ) 
	if x<0 then
		t1=false 
	else
		t1=true;
		xt1,yt1=x,y;
	end  
	 return xt1,yt1;
	
end
function searchTower2()
	 
	x, y = getColorXY( 160, 55, 170, 75, "0|0|0xd71717" )  
	if x<0 then t2=false 
	else
		t2=true;
		xt2,yt2=x,y;
	end 
	 return xt2,yt2;
end
function searchTower3()
	 
	x, y = getColorXY( 188, 36, 193, 53, "0|0|0xd61717" )  
	if x<0 then t3=false 
	else
		t3=true;
		xt3,yt3=x,y
	end 
	 return xt3,yt3;
end

function MoveAndSearch()
	rjjx=overFight();
	if rjjx==true then
		return true;
	end
	while(rjjx==false)
	do
		x1,y1=176,594;
		x2,y2=242,500;
		time=10;
		
		my = findImg("盟友.png", 90,  300, 100, 900, 530,"盟友");
		death = findImg("死亡.png", 80, 584, 0, 734, 30,"死亡");
		
		if my==true or death==true then 
			time =0;
			mSleep(3000);
		end
		
		
		
		local Step,x,y = 20,x1,y1
		touchDownFix(1,x,y)
		local function v(z,c) if z > c then return (-1 * Step) else return Step end end
		while (math.abs(x-x2)>=Step) or (math.abs(y-y2)>=Step) do
			if math.abs(x-x2)>=Step then x = x + v(x1,x2) end
			if math.abs(y-y2)>=Step then y = y + v(y1,y2) end
			touchMoveFix(1, x, y)
			mSleep(20)
		end
		touchMoveFix(1, x2, y2) 
		while time>0  
		do
			 
			tapNumber(1220,650); --普攻
			
			tower= FindTower(); 
 
			
			if tower==true  then
				  touchMoveFix(1,70,750)
				  mSleep(1800);
				  touchMoveFix(1,x2,y2)
				  time=0;
				  touchUpFix(1,x2,y2) 
				  break;
			end
			
			
			feResult = FindEnemy();
			
			 if  feResult==true then
				  touchMoveFix(1,70,750)
				  mSleep(800);
				  touchMoveFix(1,x2,y2)
				  time=0;
				  touchUpFix(1,x2,y2)
				  goFight(); 
				  break;
			end
			
			mSleep(1000)
			time=time-1; 
		end	
		touchUpFix(1,x2,y2)
	end
end

function goFight() 
	rjjx=overFight(); 	
	if rjjx==true then
		return true;
	end
	sysLog("战斗") 
	while(rjjx==false)
	do 
		
		sysLog("打架");
		tapNumber(1220,650); --普攻
		tapNumber(1000,650); --1技能
		tapNumber(1070,520); --2技能
		tapNumber(1220,450); --3技能
		tapNumber(140,300); --买装备
		tapNumber(1140,360);--升级大招
		tapNumber(920,580); --升级1
		tapNumber(1000,440); --升级2
		tapNumber(1220,650); 
		
		 feResult = FindEnemy();
		tower= FindTower(); 
		if result==false then
			 return;
		end
		if tower==true  then
		sysLog(1)
			return;
		end
		
	end
end

function FindEnemy()
	key = findImg("血条.png", 80, 770, 30, 830, 60,"血条");
	key2 = findImg("血条2.png", 80, 300, 100, 900, 530,"血条2");
	key3 = findImg("血条3.png", 80, 650, 0, 720, 30,"血条3");
	 result =	key==true or key2==true or key3==true  ;
	 return result;
	
end
function FindTower()
	
 
	 xt,yt=searchTower1()
	   
	 if t1==false then 
		       xt,yt=searchTower2()
	   end
	 if t2==false  then
		    xt,yt=searchTower3()
		 
	 end
	 if t3==false then
		xt,yt=230,40;
	 end
	 searchMe();
	if xm<0 then return false end
	
	sysLog(xt-xm)
	sysLog(ym-yt)
	
	if xt-xm<=30 or ym-yt<=20	then
		   return true;
	   else 
		   return false;
	   end
end


function overFight()
	rjjx = getButton("人机继续.png", 80, 580, 670, 750, 720,"人机继续");
	return rjjx;  
end



function Fightv3()  
	sysLog("开始战斗"); 
	mSleep(7000);
	MoveAndSearch();
end