require "common"

function HighMoney2()
	j= 0;
	time1=os.time()
	while(1)
	do
		appid = frontAppName()
		if appid=="com.tencent.smoba" or appid=="com.tencent.tmgp.sgame" then
			
			
			cg = getColorButton(1019,631,1022,632,0xaf8846,"闯关")
			tg= getColorButton(1259,30,1261,32,0xdbedf9,"跳过") 
			zdx,zdy = getColorXY(1247,38,1247,38, "0|0|0x29b4e3" )
			tgx,tgy = getColorXY(1230,23,1230,23, "0|0|0x63d9f3" )
			if zdx>0 and zdy>0 then
				--tap(zdx,zdy)
				mSleep(1000);
			end
			if tgx>0 and tgy>0 then
				tap(tgx,tgy)
				mSleep(1000);
			end
			
			jx = getColorButton(714,666,716,668 ,0xffffff ,"继续")
			
			
			tgx,tgy = getColorXY(1230,23,1230,23, "0|0|0x63d9f3" )
			if tgx>0 and tgy>0 then
				tap(tgx,tgy)
				mSleep(1000);
			end
			jxx,jxy = getColorXY(714,666,716,668, "0|0|0xffffff" )
			if jxx>0 and jxy>0 then
				tap(jxx,jxy)
				mSleep(1000);
			end
			
			
			zc =  getColorButton(1052,673,1054,675,0x644d2b,"再次")
			if zc then
			    j=j+1;
				mSleep(1000);
			end
			
			
			time2=os.time()
			text= tostring(timediff(time2,time1))..",已刷次数:"..(j);
			--HUD(text,0);
			mSleep(1000);
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