local util = require "cjson.util"
json = cjson
local env = {
    json = { null = json.null },
    null = json.null
}

require "tests.test"

function string2time( timeString )
	local Y = string.sub(timeString , 1, 4)
	local M = string.sub(timeString , 6, 7)
	local D = string.sub(timeString , 9, 10)
	local h = string.sub(timeString , 14, 15)
	local m = string.sub(timeString , 17, 18)
	local s = string.sub(timeString , 20, 21)
	
	return os.time({year=Y, month=M, day=D, hour=h,min=m,sec=s})
end
function sum(a, b)
	return a+b
end

--调用C代码中的函数csum实现
function mysum(a, b)	
	return csum(a, b)
end

function mystrcat( str1,str2 )
	local result=nil;
	
	if  str1~=nil and str2~=nil then
		result=str1..str2;
	else
		if str1~=nil then
			result=str1;
		end
		if str2~=nil then
			result=str2;
		end
	end
	return result
end

width=1920;
height=1080;

--lua脚本的入口，C代码会调用该函数启动脚本执行
function main_start(arg1,arg2)
    print(string2time('2016-11-14%2019:23:03%20257'))
	return mysum(arg1,arg2)
end

print("dddd")