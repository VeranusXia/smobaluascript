require "common"
function goMoney()
	pid = -1;
	while(1)
	do
		appid = frontAppName() 
		if appid=="com.tencent.smoba" then 
			if pid <1 or pid==-1 then
				cg = getButton("闯关.png", 80, 922, 603, 1100, 660 ,"闯关");
				if cg==true then 
					pid=1;
				end
			end 
			   
			if pid==1 or pid==-1 then
				zd = getButton("自动.png", 80, 1217, 0, 1272, 50 ,"自动");
				tg = getButton("跳过.png", 80, 1170, 0, 1320, 80 ,"跳过");
				tg2 = getButton("跳过2.png", 80, 1170, 0, 1320, 80,"跳过");
				jx = getButton("继续.png", 80, 567, 673, 771, 726 ,"继续");
				if jx==true then
					   pid=2;
				elseif zd  then  
				   tap(1,1);
				end
			end
			
			 if pid ==2 or pid==-1 then
				zc =getButton("再次.png", 80, 1013, 650, 1196, 712 ,"再次闯关");
				if zc==true then 
					pid=0;
				end
			end 
			
			
			 
		end
	end
end