local id = createHUD()     --创建一个HUD
width,height = getScreenSize()
wX=width/750;
hX=height/1334;

function tap(x, y)
	touchDown(2, x, y);
	mSleep(100);
	touchUp(2, x, y);
end
function tapNumber(x,y)
	tap(x*wX,y*hX);
end


function swip(x1,y1,x2,y2)
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
	mSleep(30)
	touchUp(1,x2,y2)
end

function swipMove(x1,y1,x2,y2,time)
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
	mSleep(time)
	touchUp(1,x2,y2)
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
	x1=x1*wX;
	 x2=x2*wX;
	 y1=y1*hX;
	 y2=y2*hX;
	 
	i=100;
	while i>0
	do 
		x, y = findImageInRegionFuzzy(img,d,x1,y1,x2,y2, 0xffffff);
		if x ~= -1 and y ~= -1 then        --如果在指定区域找到某图片符合条件
			tap( x, y);            --那么单击该图片 
			-- HUD(text , 0); 
			sysLog(text);
			i=0;
			return true;
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


function HUD(msg)
	showHUD(id,msg,16,"0xffff0000","0xffffffff",0,0,0,120,20)      --显示HUD内容 
end