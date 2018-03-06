require "common"
require "money"
require "computer"
require "fightv1"
require "fightv2" 
require "fightv3" 
require "highmoney"

init("0",1)


mainbtn,result = showUI("main.json")
cbvalue = result["ComboBox1"];
if mainbtn==1 then 
	if cbvalue== "0" then
		uibtn,result=showUI("money.json");
		if uibtn==1 then
			goMoney();
			
		end 
	elseif cbvalue== "1" then  
		uibtn2,result2=showUI("computer.json");
		if uibtn2==1 then
			--MoveAndSearch();
			goComputer(cbvalue);
		end  
	elseif cbvalue== "2" then  
		uibtn2,result2=showUI("computer.json");
		if uibtn2==1 then 
			goComputer(cbvalue);
		end   	
	else
		uibtn3,result3=showUI("highmoney.json");
		if uibtn3==1 then 
			HighMoney();
			
		end 
	end 
end