local id = createHUD()     --创建一个HUD
width,height = getScreenSize()
wX=width/750;
hX=height/1334;

ver = getOSType()
if ver == "android" then
	sysLog("安卓系统")
elseif ver == "iOS" then
	sysLog("苹果系统")
end


function tap(x, y)
	touchDown(2, x, y);
	mSleep(100);
	touchUp(2, x, y);
end
function tapNumber(x,y)
	tap(x*wX,y*hX);
	mSleep(50);
end 
function touchDownFix(i,x,y)
	touchDown(i,x*wX,y*hX)
end
function touchMoveFix(i,x,y)
	touchMove(i,x*wX,y*hX)
end
function touchUpFix(i,x,y)
	touchUp(i,x*wX,y*hX)
end

function swip(x1,y1,x2,y2)
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
	mSleep(30)
	touchUpFix(1,x2,y2)
end

function swipMove(x1,y1,x2,y2,time)
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
	mSleep(time)
	touchUpFix(1,x2,y2)
end


function tapBtoT(i)   
	w=height/2;
	h=width-200
	tap(0,0);
	while i>0
	do
		swip(w,  h,  w,  200);
		i=i-1;
	end
	 
end

function getButton(img,d,x1,y1,x2,y2,text) 
	 img2 = ver.."_"..img;
	i=100;
	while i>0
	do 
		x, y = findImageInRegionFuzzy(img2,d,x1*wX,y1*wX,x2*hX,y2*hX, 0xffffff);
		if x ~= -1 and y ~= -1 then        --如果在指定区域找到某图片符合条件
			mSleep(100);
			tap( x, y);            --那么单击该图片 
			-- HUD(text , 0); 
			sysLog(text);
			i=0;
			
			fi= findImg(img,d,x1,y1,x2,y2,text) 
			return not fi
			
			--return true;
		else                               --如果找不到符合条件的图片
			i=i-1;
		end
	end
	return false;
end


function findImg(img,d,x1,y1,x2,y2,text)
	x1=x1*wX;
	 x2=x2*wX;
	 y1=y1*hX;
	 y2=y2*hX;
	 img = ver.."_"..img;
	 
	i=20;
	while i>0
	do 
		x, y = findImageInRegionFuzzy(img,d,x1,y1,x2,y2, 0xffffff);
		if x ~= -1 and y ~= -1 then        --如果在指定区域找到某图片符合条件 
			--HUD(text , 0); 
			sysLog(text);
			i=0;
			return true;
		else                               --如果找不到符合条件的图片
			i=i-1;
		end
	end
	return false;
end
function getColorButton(x1,y1,x2,y2,color,text)
	x, y = findColor(
		{x1*wX, y1*wX, x2*hX, y2*hX},
		color,
		90,0,0,0)  
	if x ~= -1 and y ~= -1 then        --如果在指定区域找到某图片符合条件
		mSleep(100);
		tap( x, y);            --那么单击该图片 
		-- HUD(text , 0); 
		sysLog(text);
		mSleep(500);
		fc= findColor2(x1,y1,x2,y2,color)
		if fc then
			 return getColorButton(x1,y1,x2,y2,color,text); 
		else
		  return true
		end
	else
		return false
	end 
end


function findColor2(x1,y1,x2,y2,color)
	x1=x1*wX;
	 x2=x2*wX;
	 y1=y1*hX;
	 y2=y2*hX; 
	 i=20;
	while i>0
	do 
		x, y = findColor(
			{x1, y1, x2, y2},
			color,
			90,0,0,0)  
		if x ~= -1 and y ~= -1 then   
			return true;
		else
			i=i-1;
		end
	 end
	 return false;
end

function getColorXY(x1,y1,x2,y2,color)
	x1=x1*wX;
	 x2=x2*wX;
	 y1=y1*hX;
	 y2=y2*hX; 
	 i=20;
	while i>0
	do  
		x, y = findColor(
			{x1, y1, x2, y2},
			color,
			90,0,0,0)  
		if x>0 then 
			return x,y;
		else
			i=i-1;
		end
	 end
	 return -1,-1;
end

function HUD(msg)
	showHUD(id,msg,16,"0xffff0000","0xffffffff",0,0,0,400,30)      --显示HUD内容 
end

function timediff(long_time,short_time)
	local n_short_time,n_long_time,carry,diff = os.date('*t',short_time),os.date('*t',long_time),false,{}
	local colMax = {60,60,24,os.date('*t',os.time{year=n_short_time.year,month=n_short_time.month+1,day=0}).day,12,0}
	n_long_time.hour = n_long_time.hour - (n_long_time.isdst and 1 or 0) + (n_short_time.isdst and 1 or 0) -- handle dst
	for i,v in ipairs({'sec','min','hour','day','month','year'}) do
		diff[v] = n_long_time[v] - n_short_time[v] + (carry and -1 or 0)
		carry = diff[v] < 0
		if carry then
			diff[v] = diff[v] + colMax[i]
		end
	end
	local time_txt =   string.format("%02d", diff.hour)..":"..string.format("%02d", diff.min)..":"..string.format("%02d", diff.sec);
	return time_txt
end