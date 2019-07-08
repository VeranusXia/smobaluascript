local regurl = "http://www.opcd.com.cn/register.html?channel=51&backUrl=/index"
local tokenurl ="http://www.opcd.com.cn/login.html?redirectUri=http://community.opg.cn/token.html"
local showing = true
local common = require("common")

		local time =getTime()

local context = UI.createContext('login.json')
context:show()
local txtToken =context:findView("txtToken")
txtToken:setAttr("value",storage.get(time.."token","请输入激活码"))
local btn_ok =context:findView("btn_ok");

btn_ok:setActionCallback(UI.ACTION.CLICK, function()
		-- 注册root view被点击时关闭UI显示
		 
		local inputR= txtToken:getAttr("value")
	 
		local value=PostToken(inputR)
	 
 
		if value.code==0 then --value.code==0
			storage.put(time.."token",inputR)
			storage.commit()
			showing = false		
			context:close()
		 else
			txtToken:setAttr("value","激活码错误")
			 
		end
	end)


local btn_getcode =context:findView("btn_getcode");

btn_getcode:setActionCallback(UI.ACTION.CLICK, function()
		-- 注册root view被点击时关闭UI显示 
		context:close()
		 runtime.openURL(tokenurl)
		 
		showing = false
		xmod.exit()
	end)

local btn_reg =context:findView("btn_reg");
btn_reg:setActionCallback(UI.ACTION.CLICK, function()
		-- 注册root view被点击时关闭UI显示 
		context:close()
		 runtime.openURL(regurl)
		 
		showing = false
		xmod.exit()
	end)

local btn_close =context:findView("btn_close");

btn_close:setActionCallback(UI.ACTION.CLICK, function()
		-- 注册root view被点击时关闭UI显示
		
		context:close()
		showing = false
		xmod.exit()
	end)
while showing do
	sleep(1000)
end

 