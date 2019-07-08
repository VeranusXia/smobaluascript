require "common"
require "money"
require "computer"
require "fightv1"
require "fightv2" 
require "fightv3" 
require "highmoney"
require "highmoney2"
local bb = require("badboy") 

init("0",1)
 

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
	return r;
end
 

loginbtn,loginr=showUI("login.json")
if loginbtn==1 then
	
	inputR = loginr["inputR"] ; 
	r=PostToken(inputR); 
	 
	local json = bb.getJSON()
	
	local value = json.decode(r);
	
	
	if value.code==0 then --value.code==0
		
		--dialog("激活码验证成功")
		
		mainbtn,result = showUI("main.json")
		cbvalue = result["ComboBox1"];
		if mainbtn==1 then 
--			if cbvalue== "0" then
--				uibtn,result=showUI("money.json");
--				if uibtn==1 then
--					goMoney();
					
--				end 
--			elseif cbvalue== "1" then  
--				uibtn2,result2=showUI("computer.json");
--				if uibtn2==1 then
--					--MoveAndSearch();
--					goComputer("1");
--				end  
--			else
			if cbvalue== "0" then  
				uibtn2,result2=showUI("computer.json");
				if uibtn2==1 then 
					goComputer("3");
				end   
--			elseif cbvalue=="1" then
--				uibtn2,result2=showUI("computer.json");
--				if uibtn2==1 then 
--					goComputer("2");
--				end   	
		--	elseif cbvalue=="2" then
		--		uibtn3,result3=showUI("highmoney.json");
		--		if uibtn3==1 then 
		--			HighMoney();
		--			
		--		end 
			else
			uibtn4,result4=showUI("highmoney2.json");
				if uibtn4==1 then 
				HighMoney2();
				end 
			end 
		end
		
	else
		dialog("激活码验证失败"); 
	end
end

