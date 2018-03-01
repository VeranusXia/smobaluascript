require "common"

function MovetoTower1v1()
	rjjx=overFight();
	if rjjx==true then
		return true;
	end
	feResult=false;
	while(rjjx==false)
	do
		sysLog("移动")
		rjjx=overFight();
		x1,y1=176,594;
		x2,y2=244,500;
		time=8000;
		
		my = findImg("盟友.png", 90,  300, 100, 900, 530,"盟友");
		death = findImg("死亡.png", 80, 584, 0, 734, 30,"死亡");
		
		if my==true or death==true then 
			time =0;
			mSleep(3000);
		end
		
		
		local Step,x,y = 20,x1,y1
		touchDown(1,x,y)
		local function v(z,c) if z > c then return (-1 * Step) else return Step end end
		while (math.abs(x-x2)>=Step) or (math.abs(y-y2)>=Step) do
			if math.abs(x-x2)>=Step then x = x + v(x1,x2) end
			if math.abs(y-y2)>=Step then y = y + v(y1,y2) end
			touchMove(1, x, y)
			mSleep(20)
		end
		touchMove(1, x2, y2) 
		while time>0 and rjjx==false
		do
			
			
			tapNumber(1220,650); --普攻
			
			
			tower= FindTower(); 
			if tower==true then
				  touchMove(1,100,750)
				  mSleep(3000)
			end
			
			
			feResult = FindEnemy();
			if feResult==true then
				touchUp(1,x2,y2);
				GoFight1v1(); 
				break;
			end
			
			
			
			
			mSleep(1000)
			time=time-1000; 
		end	
		touchUp(1,x2,y2)
		if feResult==true then
			break;
		end
	end
end 

function GoFight1v1() 
	rjjx=overFight(); 	
	if rjjx==true then
		return true;
	end
	sysLog("战斗") 
	while(rjjx==false)
	do 
		feResult = FindEnemy();
		if result==false   then
			    MovetoTower1v1();
			break;
		end
		
		
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
	key4 = findImg("塔血.png", 80, 300, 100, 900, 530,"塔血");
	tower = findImg("塔.png", 80, 800, 60, 1220, 530,"遇塔");
	tower = findImg("塔2.png", 80, 800, 60, 1220, 530,"遇塔");
	result = key4==true or towner==true;
	return result;
	
end


function overFight()
	rjjx = getButton("人机继续.png", 80, 580, 670, 750, 720,"人机继续");
	return rjjx;  
end

function Fight1v1()  
	sysLog("开始战斗"); 
	mSleep(10000);
	MovetoTower1v1();
end




