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
	while(rjjx==false)
	do
		sysLog("移动")
		x1,y1=176,594;
		x2,y2=239,500;
		time=5;
		
		my = findImg("盟友.png", 90,  300, 100, 900, 530,"盟友");
		--death = findImg("死亡.png", 80, 584, 0, 734, 30,"死亡");
		death = findColor2(613,9,613,9,0xf9eeee,"死亡");
		
		if my==true  then 
			time =0;
			mSleep(3000);
		end
		if death==true then 
			while death
			do
				mSleep(3000)
				--death = findImg("死亡.png", 80, 584, 0, 734, 30,"死亡");
		death = findColor2(613,9,613,9,0xf9eeee,"死亡");
			end
			 
			swipMove(176,594,176,749,5000)
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
				  mSleep(1200);
				  touchMoveFix(1,x2,y2)
				  time=0;
				  touchUpFix(1,x2,y2) 
				  break;
			end
			
			
			tapNumber(1220,650); --普攻
			feResult = FindEnemy();
			
			 if  feResult==true then
				  touchMoveFix(1,70,750)
				  mSleep(700);
				  touchMoveFix(1,x2,y2)
				  time=0;
				  touchUpFix(1,x2,y2)
				  goFight(); 
				  break;
			end
			
			mSleep(500)
			time=time-1; 
			rjjx=overFight();
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
		
		 feResult = FindEnemy();
		--tower= FindTower(); 
		if feResult==false then
			tapNumber(778 , 673); 
			 return;
		end
		 
		
	end
end

function FindEnemy()
	--key = findImg("血条.png", 80, 770, 30, 830, 60,"血条");
	--key2 = findImg("血条2.png", 80, 300, 100, 900, 530,"血条2");
	--key3 = findImg("血条3.png", 80, 650, 0, 720, 30,"血条3");
	 --result =	key==true or key2==true or key3==true  ;
	 --return result;
	 x,y= getColorXY( 657,7, 657,7, "0|0|0xa02521" ) 
	 --sysLog(x);
	 if x>0 then 
		 return true 
	 else
		 return false
	 end
	
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
		xt,yt=220,30;
	 end
	 searchMe();
	if xm<0 then return false end 
	  
	
	if xt-xm<=20 or ym-yt<=10	then
		   return false;
	   else 
		   return false;
	   end
end


function overFight()
	--rjjx = getButton("人机继续.png", 80, 580, 670, 750, 720,"人机继续");
	--rjjx = getColorButton(639,689,639,689,0x404040,"0xd5dfe4")
	 x,y= getColorXY( 639,689,639,689, "0|0|0xd5dfe4" ) 
	 rjjx = x>0;
	return rjjx;  
end



function Fightv3()  
	sysLog("开始战斗");  
	swipMove(176,594,176,749,5000)
	MoveAndSearch();
end