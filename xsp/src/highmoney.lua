require "common"

function HighMoney()
	pid = -1;
	j=1;
	while(1)
	do
		appid = frontAppName() 
		if appid=="com.tencent.smoba" or appid=="com.tencent.tmgp.sgame" then 
			if pid <1 or pid==-1 then
				cg = getButton("闯关.png", 80, 922, 603, 1100, 660 ,"闯关");
				if cg==true then 
					pid=1;
				end
			end 
			   
			if pid==1 or pid==-1 then
				tg2 = getButton("跳过2.png", 80, 1170, 0, 1320, 80,"跳过");
				if tg2==true then 
					mSleep(500);
					pid=2;
				end
			end
			
			if pid==2 then 
				mSleep(50);
				x1,y1=175,595;
				d=3700;
				x2,y2=115,475;
				swipMoveHM(x1,y1,x2,y2,d);   
				
				mSleep(50);
				x2,y2=115,469;
				swipMoveHM(x1,y1,x2,y2,d);   
				
				mSleep(50);
				x2,y2=115,463;
				swipMoveHM(x1,y1,x2,y2,d); 
				
				mSleep(50);
				x2,y2=115,457;  
				swipMoveHM(x1,y1,x2,y2,d);  
				
				
				pid=3;
			end
			   
			if pid==3 or pid==-1 then
				zd = getButton("自动.png", 80, 1217, 0, 1272, 50 ,"自动");
				tg2 = getButton("跳过2.png", 80, 1170, 0, 1320, 80,"跳过");
				jx = getButton("继续.png", 80, 567, 673, 771, 726 ,"继续");
				if jx==true then
					   pid=4;
				elseif zd  then  
					   tap(1,1);
				end
			end
			 
			
			 if pid ==4 or pid==-1 then
				zc =getButton("再次.png", 80, 1013, 650, 1196, 712 ,"再次闯关");
				if zc==true then 
					text= "已刷次数:"..j;
					HUD(text , 0); 
					j=j+1;
					pid=0;
				end
			end 
			
			
			 
		end
	end
end


function swipMoveHM(x1,y1,x2,y2,time)
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
	while time>=0
	do
		
		tapNumber(1000,650);
		mSleep(20)
		tapNumber(1070,520);
		mSleep(1000)
		time=time-1000;
	end	
	touchUpFix(1,x2,y2)
end