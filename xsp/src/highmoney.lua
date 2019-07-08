require "common"

function HighMoney()
	pid = -1;
	j=1;	
	m = 1
	while(1)
	do
		appid = frontAppName() 
		if appid=="com.tencent.smoba" or appid=="com.tencent.tmgp.sgame" then 
			if pid <1 or pid==-1 then
--				cgx,cgy = getColorXY( 1019,631,1022,632, "0|0|0xdc9126" )  
--				if cgx>0 and cgy>0 then
--				   tap(cgx,cgy)
--				   pid=1;
--				end
				cg = getColorButton(1019,631,1022,632,0xdc9126,"闯关")
				if cg then
					pid=1
					m=1
				end
				
			end 
			   
			if pid==1 or pid==-1 then
--				tgx,tgy = getColorXY(1223,23,1230,22, "0|0|0x69e0ef" )  
--				if tgx>0 and tgy>0 then 
--					tap(tgx,tgy);
--					mSleep(500);
--					pid=2;
--				end
				
				tg= getColorButton(1223,23,1230,22,0x69e0ef,"跳过")
				if tg then 
					pid=2
					m=1
				end
			end
			
			if pid==2 then 
				mSleep(50);
				x1,y1=175,595;
				d=4000;
				x2,y2=115,490;
				swipMoveHM(x1,y1,x2,y2,d);   
				
				mSleep(50);
				x2,y2=115,482;
				swipMoveHM(x1,y1,x2,y2,d);   
				
				mSleep(50);
				x2,y2=115,474;
				swipMoveHM(x1,y1,x2,y2,d); 
				
				mSleep(50);
				x2,y2=115,458;  
				swipMoveHM(x1,y1,x2,y2,d);  
				
				
				pid=3;
					m=1
			end
			   
			if pid==3 or pid==-1 then
--				zdx,zdy = getColorXY(1230,17,1230,17, "0|0|0x0d4f6b" )  
--				tgx,tgy = getColorXY(1223,23,1230,22, "0|0|0x69e0ef" )  
--				jxx,jxy = getColorXY(672,703,674,705, "0|0|0xffffff" )  
--				if zdx>0 and zdy>0 then
--					   tap(zdx,zdy) 
--				end
--				if tgx>0 and tgy>0 then
--					   tap(tgx,tgy) 
--				end
--				if jxx>0 and jxy>0 then
--					   tap(jxx,jxy)
--					   pid=4; 
--				end
				zdx,zdy = getColorXY(1230,17,1230,17, "0|0|0x0d4f6b" )  
 				tgx,tgy = getColorXY(1230,23,1230,23, "0|0|0x63d9f3" )  
				if zdx>0 and zdy>0 then
					   tap(zdx,zdy) 
				end
				if tgx>0 and tgy>0 then
					   tap(tgx,tgy) 
				end
				--zd = getColorButton(1230,17,1230,17,0x0d4f6b,"自动")
				--tg= getColorButton(1230,23,1230,23,0x63d9f3,"跳过")
				jx = getColorButton(754,714,754,714 ,0xffffff ,"继续")
				if jx then 
					pid=4
					m=1
				end
			end
			 
			
			 if pid ==4 or pid==-1 then 
--				zcx,zcy = getColorXY(1053,674,1062,674, "0|0|0xffffff" )  
--				if zcx>0 and zcy>0 then 
--					tap(zcx,zcy);
--					text= "已刷次数:"..j;
--					HUD(text , 0); 
--					j=j+1;
--					pid=0;
--				end
				tgx,tgy = getColorXY(1230,23,1230,23, "0|0|0x63d9f3" )  
				if tgx>0 and tgy>0 then
					   tap(tgx,tgy) 
				end
  				jxx,jxy = getColorXY(754,714,754,714, "0|0|0xffffff" )  
				if jxx>0 and jxy>0 then
					   tap(jxx,jxy) 
				end
			
				
				zc =  getColorButton(1053,674,1062,674,0xffffff,"再次")
				if zc then
				text= "已刷金币:"..(j*29);
					HUD(text , 0); 
					j=j+1;
					pid=0;
					m=1
				end
				
			end 
			
			mSleep(300);
			sysLog(pid);
			m=m+1
			if m>50 then
				pid=-1
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