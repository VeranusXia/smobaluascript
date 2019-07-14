screen.init(screen.LANDSCAPE_RIGHT)
local wui = require('wui.wui')
local money = require('money')
local money = require('computer')
local common = require('common')
local login =require('login')
local codeurl_ios = "http://www.opcd.com.cn/integralShop/entityDetails?productId=48&channel=51"
local codeurl_android = "http://www.opcd.com.cn/integralShop/entityDetails?productId=47&channel=51"
 

local showing = true

local selectradio =1


local context = UI.createContext('mainPage.json')

local menu =context:findView("menu");
local radioList = {
	{ title = '冒险金币', value = 1, checked = true},
	{ title = '人机(3V3)', value = 2 },
	{ title = '人机(5V5)', value = 3 }
}
local radio = wui.Radio.createView(context, { list = radioList })
wui.Radio.setOnCheckedCallback(radio, function(id, title, value, index, lastIndex)
		selectradio=value
	end)
menu:addSubview(radio)



local btn_ok =context:findView("btn_ok");

btn_ok:setActionCallback(UI.ACTION.CLICK, function()
		-- 注册root view被点击时关闭UI显示
		
		context:close()
		if selectradio ==1 then
			--HUD("请在冒险模式闯关页面启动脚本,5秒后运行")
			--sleep(5000)
			startMoney()
		elseif  selectradio ==2 then
			startComputer(3)
		else
			startComputer(5)
		end
		
		showing = false
	end)


local btn_getcode =context:findView("btn_getcode");

btn_getcode:setActionCallback(UI.ACTION.CLICK, function()
		-- 注册root view被点击时关闭UI显示
		HUD(xmod.PLATFORM)
		context:close()
		if xmod.PLATFORM == "iOS" then
			runtime.openURL(codeurl_ios)
		else
			runtime.openURL(codeurl_android)
		end
		showing = false
	end)
	
	
local btn_close =context:findView("btn_close");

btn_close:setActionCallback(UI.ACTION.CLICK, function()
		-- 注册root view被点击时关闭UI显示
		
		context:close()
		showing = false
	end)
context:show()


-- 循环直到root view被点击出发关闭
while showing do
	sleep(1000)
end