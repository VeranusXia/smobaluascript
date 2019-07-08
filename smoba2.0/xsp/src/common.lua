
local bb = require("badboy") 

local ps = screen.getSize() 
local xX=(ps.width )/1334
local yX=(ps.height )/750
 

 
function HUD(msg)
local context = UI.createContext('hud.json')
local msghud =context:findView("msg");
	msghud:setAttr("value",msg)
	context:show() 
	sleep(1000)
	context:close()
end


function tap(i, p)
	touch.down(i,p.x,p.y)
	sleep(50)
	touch.up(i,p.x,p.y)
end
function touchDownFix(i,x,y)
	touch.down(i,x*xX,y*yX)
end
function touchMoveFix(i,x,y)
	touch.move(i,x*xX,y*yX)
end
function touchUpFix(i,x,y)
	touch.up(i,x*xX,y*yX)
end
function tapNumber(x,y)
	tap(1,Point(x*xX,y*yX))
end
function tapBtoT(i)   
	w=ps.width/2;
	h=ps.height-200
	tap(1,Point(0,0));
	while i>0
	do
		swip(w,  h,  w,  200,30);
		i=i-1;
	end
end
function tapTtoB(i)   
	w=ps.width/2;
	h=ps.height-100
	tap(1,Point(ps.width,ps.height));
	while i>0
	do
		swip(w, 100,w,  h,  30);
		i=i-1;
	end
end

function tapLtoR() 
	swip(175,  595,  300,  605,2000);
end
function tapLtoR2() 
	swip(175,  595,  175,  440,2000);
end

function swip(x1,y1,x2,y2,time)
	local Step,x,y = 20,x1,y1
	touchDownFix(1,x,y)
	local function v(z,c) if z > c then return (-1 * Step) else return Step end end
	while (math.abs(x-x2)>=Step) or (math.abs(y-y2)>=Step) do
		if math.abs(x-x2)>=Step then x = x + v(x1,x2) end
		if math.abs(y-y2)>=Step then y = y + v(y1,y2) end
		touchMoveFix(1, x, y)
		sleep(20)
	end
	touchMoveFix(1, x2, y2)
	sleep(time)
	touchUpFix(1,x2,y2)
end


function findcolorandtap(pointObj ,fuzz)
	local rec = setRec(pointObj.point)
	local tapp = screen.findColor(rec ,pointObj.color , fuzz)
	if tapp ~= Point.INVALID  then
		tap(1,tapp)
		HUD(pointObj.name)
		sleep(500)
		return true
	end
	return false
end
function findcolor(pointObj ,fuzz)
	local rec = setRec(pointObj.point)
	local tapp = screen.findColor(rec ,pointObj.color , fuzz)
	if tapp ~= Point.INVALID  then
		HUD(pointObj.name)
		sleep(1000)
		return true
	end
	return false
end

function setRec(p) 
	local x =  p.x*xX
	local y = p.y*yX 
	local rec = Rect(x-2,y+2 ,4 ,4)
	return rec
end

function getTime()

local currentTime = os.netTime() 
return os.date('%Y-%m-%d', currentTime)
 
end



function PostToken(token)  
	bb.loadluasocket();
	local socket = bb.socket
	local http = bb.http
	local ltn12 = bb.ltn12
	local response_body = {}
	local post_data = ''; 
	  
	http.request{  
		url = 'http://www.opcd.com.cn/api/user/detail' ,  
		method = "POST",  
		headers =   
		{  
			['Content-Type'] = 'application/json; charset=utf-8',  
			['Content-Length'] = #post_data,
			['token'] = token
		},  
		source = ltn12.source.string('data=' .. post_data),  
		sink = ltn12.sink.table(response_body)  
	}     
	r = table.concat(response_body)     
		local json = bb.getJSON()
	
	local value = json.decode(r);
	return value
end