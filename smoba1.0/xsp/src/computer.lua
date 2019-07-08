require "common"
require "fightv1"
require "fightv2"
require "fightv3"
require "fight3v3"


function goComputer(m)
	pid = -1;
	herox =1040 ;
	heroy =670;
	n=1;   
	while(1)
	do 
		appid = frontAppName()  
		if appid=="com.tencent.smoba" or appid=="com.tencent.tmgp.sgame" then 
			if pid ==0 or pid==-1 then
				--rj = getButton("人机.png", 80, 1035, 313, 1161, 338,"人机");
 
				--dz= getColorButton(412,579,412,579,0x49352a,"对战")
				dzx,dzy=getColorXY(487,522,489,524,"0|0|0x61462e")
 
				if dzx>0 and dzy>0 then
					tap(dzx,dzy);
				end 
				rj= getColorButton(1189,308,1191,310,0xffffff,"人机")
				if rj==true then 
					pid=1; 
					n=1;
				end
			end     
			if m=="1" then --1v1
				if pid ==1 or pid==-1 then
					--mode = getButton("模式1.png", 80, 1004, 542, 1072, 564,"模式");
					mode= getColorButton(1033,552,1033,552,0x5e7595,"模式")
					if mode==true then 
						pid=2;
						n=1;
					end
				end 
				if pid ==2 or pid==-1 then
					--diff = getButton("入门1.png", 80, 955, 234, 1090, 277,"入门");
					diff= getColorButton(1023,267,1023,267,0x2b261d,"入门")
					if diff==true then 
						pid=3;
						n=1;
					end
				end 
			elseif m=="2" then --5v5
				if pid ==1 or pid==-1 then
					--mode = getButton("模式2.png", 80, 250, 542, 320, 564,"模式");
					mode= getColorButton(159,554,161,554,0xfffaf8,"模式")
					if mode==true then 
						pid=2;
						n=1;
					end
				end 				
				 
				if pid ==2 or pid==-1 then
					--diff = getButton("入门2.png", 80, 220, 234, 360, 277,"入门");
					--diff= getColorButton(268,271,268,271,0xa6a6a6,"入门")
					 diffx,diffy=getColorXY(268,271,268,271,"0|0|0xa6a6a6")
					if diffx>0 and diffy>0 then
						tap(diffx,diffy);
					end
					
					
					--pp = getButton("匹配.png", 80, 650, 600, 800, 640,"匹配");
					pp= getColorButton(674,613,674,613,0xffffff,"匹配")
					 ppx,ppy=getColorXY(674,613,674,613,"0|0|0xffffff")
					if ppx>0 and ppy>0 then
						tap(ppx,ppy);
					end
					
					--	enter = getButton("进入.png", 80, 570, 510, 740, 560,"进入");
					enter= getColorButton(621,578,621,578,0xffffff,"进入")
					if enter==true then 
						pid=3;
						n=1;
					end
				end 
			elseif m=="3" then --3v3 
				if pid ==1 or pid==-1 then
				 
					--mode = getButton("模式2.png", 80, 250, 542, 320, 564,"模式");
					mode= getColorButton(808,536,810,538,0xe7f7ef,"模式")
					if mode==true then 
						pid=2;
						n=1;
					end 
				end 				
				  
				if pid ==2 or pid==-1 then
					--diff = getButton("入门2.png", 80, 220, 234, 360, 277,"入门");
					--diff= getColorButton(268,271,268,271,0xa6a6a6,"入门")
					 diffx,diffy=getColorXY(833,310,835,312,"0|0|0xffffff")
					if diffx>0 and diffy>0 then
						tap(diffx,diffy);
					end
					 
					
					--pp = getButton("匹配.png", 80, 650, 600, 800, 640,"匹配");
					pp= getColorButton(707,627,709,629,0xffffff,"匹配")
					 ppx,ppy=getColorXY(707,627,709,629,"0|0|0xffffff")
					if ppx>0 and ppy>0 then
						tap(ppx,ppy);
					end
					 
					--	enter = getButton("进入.png", 80, 570, 510, 740, 560,"进入");
					enter= getColorButton(690,626,692,628,0xffffff,"进入")
					if enter==true then 
						pid=3;
						n=1;
					end
				end  
				 
			end
			   
			if pid ==3 or pid==-1 then
				--choose = getButton("选择.png", 80, 287, 327, 332, 420,"选择");
				enter= getColorButton(690,626,692,628,0xffffff,"进入")
				choose= getColorButton(281,382,283,384,0xd4ecf6,"选择")
				
				if choose==true then 
					tapBtoT(3);
					pid=4;
					n=1;
				end
			end 
			 
			if pid ==4 then 
				yxok=false; 
				while heroy> 110
				do 
					while herox>50
					do 
						 --yxok = getButton("英雄确认.png", 80, 1147, 680, 1283, 727,"英雄确认");
						 yxok = getColorButton(1235,715,1237,717,0x826338,"英雄确认")
						 if yxok==true then 
							 pid=5; 
							herox=herox+120;
							 break; 
						 end
						 --sysLog(herox);
						 mSleep(1000);
						 tapNumber(herox,heroy);
						 mSleep(500);
						 --tycancel = getButton("体验取消.png", 80, 483, 483, 590, 530,"体验取消");
						 tycancel = getColorButton(543,529,545,531,0xddeffb,"体验取消")
						 mSleep(200); 
						 herox=herox-120; 
					end
					if yxok==true then 
						pid=5; 
						n=1;
						break; 
					end
					if herox<50 then herox =1040 end
					heroy=heroy-130;
				end
			 end
			     
			if pid==5 or pid==-1 then
				if pid==5 then
					  mSleep(15000);
				end
				--startfight = findImg("开打.png", 80, 22, 277, 76, 382,"战斗画面");
				--startfight = getColorButton(47,297,47,297,0xe3c985,"战斗画面")
				sfx,sfy=getColorXY(46,296,48,298,"0|0|0xe5cc88")
				sysLog("战斗画面") 
				--if startfight==true then
				if 	sfx>0 and sfy>0 then
					if m=="1" then 
						Fightv3()
					elseif m=="2" then
						Fightv3();
					elseif m=="3" then
						fight3v3();
					end
					sysLog("战斗结束");
					pid=6;
					n=1;
					mSleep(2000);
				end
			end
			 
			if pid==6   or pid==-1 then 
				--rjjx = getButton("人机继续2.png", 80, 580, 670, 750, 720,"人机继续2");
				--rjjx =getColorButton(639,689,639,689,0xd5dfe4,"人机继续2")
				
				
				otherx,othery =getColorXY(651,677,653,679,"0|0|0xffffff")
				if otherx>0 and othery>0 then
					tap(otherx,othery);
				end
				sysLog(111)
				
				rjjxx,rjjxy=getColorXY(658,686,660,688,"0|0|0xddeffb")
				if rjjxx>0 and rjjxy>0 then
					tap(rjjxx,rjjxy);
				end
				
				--rjjx3 = getButton("人机再来.png", 80, 680, 680, 800, 720,"人机再来");
				rjjx3 =getColorButton(801,676,803,678,0xfaf5e5,"人机再来")
				rjjx4 =getColorButton(801,676,803,678,0xcdbda0,"人机再来")
				if rjjx3==true or rjjx4==true then
					pid=-1;
					n=1;
				end
			end    
			--HUD(pid)
			mSleep(300);
			n=n+1
			if n>50 then
				pid=-1
			end
		end
	end
end