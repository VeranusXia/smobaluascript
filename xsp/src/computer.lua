require "common"
require "fight"

local  herox =1040 
local  heroy =670

function goComputer()
	
	pid = -1;
	while(1)
	do
		appid = frontAppName() 
		if appid=="com.tencent.smoba" then 
			if pid <1 or pid==-1 then
				rj = getButton("人机.png", 80, 1035, 313, 1161, 338,"人机");
				if rj==true then 
					pid=1;
				end
			end 
			--if pid ==1 or pid==-1 then
				--mode = getButton("模式1.png", 80, 1004, 542, 1072, 564,"模式");
				--if mode==true then 
					--pid=2;
				--end
			--end 
			if pid ==1 or pid==-1 then
				mode = getButton("模式2.png", 80, 250, 542, 320, 564,"模式");
				if mode==true then 
					pid=2;
				end
			end 				
			 
			--if pid ==2 or pid==-1 then
				--diff = getButton("入门1.png", 80, 955, 234, 1090, 277,"入门");
				--if diff==true then 
					--pid=3;
				--end
			--end 
			if pid ==2 or pid==-1 then
				diff = getButton("入门2.png", 80, 220, 234, 360, 277,"入门");
				pp = getButton("匹配.png", 80, 650, 600, 800, 640,"匹配");
				enter = getButton("进入.png", 80, 570, 510, 740, 560,"进入");
				if enter==true then 
					pid=3;
				end
			end 
			 
			if pid ==3 or pid==-1 then
				choose = getButton("选择.png", 80, 287, 327, 332, 420,"选择");
				if choose==true then 
					tapBtoT(3);
					pid=4;
				end
			end 
			 
			if pid ==4 then 
				while heroy> 120
				do 
					while herox>50
					do 
						 mSleep(1000);
						 tapNumber(herox,heroy);
						 mSleep(500);
						 tycancel = getButton("体验取消.png", 80, 483, 483, 590, 530,"体验取消");
						 mSleep(500);
						 yxok = getButton("英雄确认.png", 80, 1147, 680, 1283, 727,"英雄确认");
						 if yxok==true then 
							 pid=5;
							 break;
						 end
						 herox=herox-140;
					end
					if herox<50 then herox =1040 end
					heroy=heroy-150;
				end
			 end
			    
			if pid==5 then
				Fight();
				sysLog("战斗结束");
				pid=6;
				mSleep(2000);
			end
			 
			if pid==6  or pid==-1 then 
				rjjx = getButton("人机继续2.png", 80, 580, 670, 750, 720,"人机继续");
				if rjjx==true then
					pid=7;
				end
			end 
			if pid==7 or pid==-1 then
				rjjx3 = getButton("人机再来.png", 80, 680, 680, 800, 720,"人机再来");
				if rjjx3==true then
					pid=0;
				end
			end 
		end
	end
end