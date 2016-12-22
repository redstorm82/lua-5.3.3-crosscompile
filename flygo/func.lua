--local util = require "cjson.util"
-- change here to the host an port you want to contact
local host, port = "localhost", 13
-- load namespace
local socket = require("socket")
-- convert host name to ip address
local ip = assert(socket.dns.toip(host))
-- create a new UDP object
local udp = assert(socket.udp())
-- contact daytime host
--assert(udp:sendto("anything", ip, port))
--retrieve the answer and print results
--io.write(assert(udp:receive()))

json = cjson
local env = {
    json = { null = json.null },
    null = json.null
}
---
-- @function: ��ӡtable�����ݣ��ݹ�
-- @param: tbl Ҫ��ӡ��table
-- @param: level �ݹ�Ĳ�����Ĭ�ϲ��ô�ֵ����
-- @param: filteDefault �Ƿ���˴�ӡ���캯����Ĭ��Ϊ��
-- @return: return
function PrintTable( tbl , level, filteDefault)
  local msg = ""
  filteDefault = filteDefault or true --Ĭ�Ϲ��˹ؼ��֣�DeleteMe, _class_type��
  level = level or 1
  local indent_str = ""
  for i = 1, level do
    indent_str = indent_str.."  "
  end

  print(indent_str .. "{")
  for k,v in pairs(tbl) do
    if filteDefault then
      if k ~= "_class_type" and k ~= "DeleteMe" then
        local item_str = string.format("%s%s = %s", indent_str .. " ",tostring(k), tostring(v))
        print(item_str)
        if type(v) == "table" then
          PrintTable(v, level + 1)
        end
      end
    else
      local item_str = string.format("%s%s = %s", indent_str .. " ",tostring(k), tostring(v))
      print(item_str)
      if type(v) == "table" then
        PrintTable(v, level + 1)
      end
    end
  end
  print(indent_str .. "}")
end

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

--����C�����еĺ���csumʵ��
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

--lua�ű�����ڣ�C�������øú��������ű�ִ��
function main_start(arg1,arg2)
	test_decode_cycle();
    return mysum(arg1,arg2)
end

function test_decode_cycle()
	print(string2time('2016-11-14%2019:23:03%20257'))
	local url ='{"adList":{"IsNeedTime":"0","item":[{"order_id":"3065941","type":"LD","display_code":"","cover_id":"","url":"http://bla.gtimg.com/qqlive/201612/BRDS_20161206103359233.mp4","urlsmall":"http://bla.gtimg.com/qqlive/201612/BRDS_20161206103359233.mp4","duration":"15000","ReportTime":"0","no_click":"N","inner_jump":"N","link":"https://imc.l.qq.com/click?oid=3065941&cid=1698309&adtype=LD&soid=B7100BE300435853461581305800&aver=0&ev=233&refluence=4001&requestl=4001&aver_flag=0&tagid=&si=1768009482&target=4001&isfloatindex=0&pf=in&loc=LV_1001_LDVi_LD&vptag=bl.zy.movie_ilcxi3gxzj12ksm.20161209&click_data=dXNlcl9pbmZvPXZRRGpnVGs3RmhTMQ==&chid=0&live=0&aid_tpid=1&aid_tpid2=1037&aid_tpid3=10139&aid_dura=5882&aid_vid_drm=0&aid_cid_drm=0&aid_copyright=197&aid_cover=ilcxi3gxzj12ksm&aid_subtype=16_4","reportUrl":"https://livep.l.qq.com/livemsg?o=3065941&cid=1698309&adtype=LD&mt=15000&soid=B7100BE300435853461581305800&aver=0&ev=233&refluence=4001&requestl=4001&aver_flag=0&tagid=&si=1768009482&l=4001&isfloatindex=0&chid=0&imagelog=1&imagemd5=d33346368737f4c7ee8499cbc5941879&iptype=0&cip=183.16.11.227&isthirdip=0&fl=1&gf=1&ip_filter=0&ufc_filter=0&urlchid=0&use_axp=0&axpheader=1&ping_data=dXNlcl9pbmZvPXZRRGpnVGs3RmhTMQ==&vid=8kO1XKH8Qfm&pid=655q1dr6ky89sd52w76239fa060dgx5l&live=0&aid_tpid=1&aid_tpid2=1037&aid_tpid3=10139&aid_dura=5882&aid_vid_drm=0&aid_cid_drm=0&aid_copyright=197&aid_cover=ilcxi3gxzj12ksm&aid_subtype=16_4","params":"oid=3065941&loc=LV_1001_LDVi_LD&orderfile=http%3A%2F%2Fbla.gtimg.com%2Fqqlive%2F&vid=&get_type=1&c_type=0&button_name=Come+On!&richdata=%7B%22loc%22%3A%22LV_1001_LDVi_LD%22%2C%22oid%22%3A%223065941%22%2C%22orderfile%22%3A%22http%3A%2F%2Fbla.gtimg.com%2Fqqlive%2F%22%2C%22plugins%22%3A%7B%22click_text_desc%22%3A%22%22%2C%22trueview%22%3A%22Y%22%7D%2C%22vid%22%3A%22%22%7D","image":[{"index":"0","url":"http://183.61.62.140/vmind.qqvideo.tc.qq.com/a0200ybhnd2.p202.1.mp4?vkey=AD8F4568DF338BF2D7BD715A98BDAC4C7CF020BFC56233BEB8EB279B233AA4C1E9457C3EF87134C3324363E369F85A463FA9794E37CE7BF2EE0291C46FA5419FFAC0824B89C42B8B95D744BD45AB35AE272C2CEAC7328256&platform=&sdtfrom=&fmt=hd&level=0","md5":"989545351d9f97865efa71afac454db4","cs":"1131835","ds":"15","width":"640","height":"360","vid":"a0200ybhnd2"},{"index":"1","url":"http://183.61.62.140/vmind.qqvideo.tc.qq.com/a0200ybhnd2.p202.1.mp4?vkey=AD8F4568DF338BF2D7BD715A98BDAC4C7CF020BFC56233BEB8EB279B233AA4C1E9457C3EF87134C3324363E369F85A463FA9794E37CE7BF2EE0291C46FA5419FFAC0824B89C42B8B95D744BD45AB35AE272C2CEAC7328256&platform=&sdtfrom=&fmt=hd&level=0","md5":"989545351d9f97865efa71afac454db4","cs":"1131835","ds":"15","width":"640","height":"360","vid":"a0200ybhnd2"}],"reportUrlOther":{"reportitem":[{"url":"http://cm.l.qq.com/?Bid=f4d5696444ef1184acc67176ebe9026c","reporttime":"0"},{"url":"http://cm.l.qq.com/?Bid=dca6ea17cca2289887e097157db2998a ","reporttime":"0"},{"url":"http://tytx.m.cn.miaozhen.com/x/k=2034930&p=74DK7&dx=&rt=2&ns=183.16.11.227&ni=PUB_3065941&v=__LOC__&xa=__ADPLATFORM__&vo=36496f870&vr=2&o=http%3A%2F%2Fcn-gmtdmp.mookie1.com%2Ft%2Fv2%2Fimp%3Ftagid%3DV2_4832%26src.id%3DMiaoZhen%26src.rand%3D__M-TS__","reporttime":"0"},{"url":"http://sd.cn.miaozhen.com/m.gif?pid=2&tid=5311&m0=&m0a=[DUID]&m1=[ANDROIDID1]&m1a=&m2=&m4=__AAID__&m5=&m6=[MAC1]&m6a=&cid=16129902&o=","reporttime":"0"},{"url":"http://p.tencentmind.com/p?oid=PUB_3065941&soid=B7100BE3004358534615813058&soidip=183.16.11.227&loc=LV_1001_LDVi_LD&lkey=4001&OpenUDID=&MAC=&IDFA=&IP=183.16.11.227&IMEI=&AndroidID=","reporttime":"0"},{"url":"http://qq.irs01.com/irt?_iwt_UA=UA-qq-120001&jsonp=SetIDA0&_iwt_vid=ilcxi3gxzj12ksm&_iwt_muid=5398B912C3EF4E17&_iwt_reqid=B7100BE3004358534615813058&_iwt_vid1=8kO1XKH8Qfm","reporttime":"0"}]},"reportUrlSDK":{"reportitem":[]},"clickReportUrlOther":{"reportitem":[]}},{"order_id":"3039703","type":"LD","display_code":"","cover_id":"","url":"http://bla.gtimg.com/qqlive/201611/BRDS_20161130095652140.mp4","urlsmall":"http://bla.gtimg.com/qqlive/201611/BRDS_20161130095652140.mp4","duration":"15000","ReportTime":"0","no_click":"N","inner_jump":"N","link":"https://imc.l.qq.com/click?oid=3039703&cid=1676339&adtype=LD&soid=B7100BE300435853461581305800&aver=0&ev=233&refluence=4001&requestl=4001&aver_flag=1&tagid=&si=1768009482&target=4001&isfloatindex=0&pf=in&loc=LV_1001_LDVi_LD&vptag=bl.zy.movie_ilcxi3gxzj12ksm.20161209&click_data=dXNlcl9pbmZvPXZRRGpnVGs3RmhTMQ==&chid=0&live=0&aid_tpid=1&aid_tpid2=1037&aid_tpid3=10139&aid_dura=5882&aid_vid_drm=0&aid_cid_drm=0&aid_copyright=197&aid_cover=ilcxi3gxzj12ksm&aid_subtype=16_4","reportUrl":"https://livep.l.qq.com/livemsg?o=3039703&cid=1676339&adtype=LD&mt=15000&soid=B7100BE300435853461581305800&aver=0&ev=233&refluence=4001&requestl=4001&aver_flag=1&tagid=&si=1768009482&l=4001&isfloatindex=0&chid=0&acpm=2&imagelog=1&imagemd5=112f7a6505f40122808207d3a3ceaaaf&iptype=0&cip=183.16.11.227&isthirdip=0&fl=1&gf=1&ip_filter=0&ufc_filter=0&urlchid=0&use_axp=0&axpheader=1&ping_data=dXNlcl9pbmZvPXZRRGpnVGs3RmhTMQ==&vid=8kO1XKH8Qfm&pid=655q1dr6ky89sd52w76239fa060dgx5l&live=0&aid_tpid=1&aid_tpid2=1037&aid_tpid3=10139&aid_dura=5882&aid_vid_drm=0&aid_cid_drm=0&aid_copyright=197&aid_cover=ilcxi3gxzj12ksm&aid_subtype=16_4","params":"oid=3039703&loc=LV_1001_LDVi_LD&orderfile=http%3A%2F%2Fbla.gtimg.com%2Fqqlive%2F&vid=&get_type=1&c_type=0&button_name=Come+On!&richdata=%7B%22loc%22%3A%22LV_1001_LDVi_LD%22%2C%22oid%22%3A%223039703%22%2C%22orderfile%22%3A%22http%3A%2F%2Fbla.gtimg.com%2Fqqlive%2F%22%2C%22plugins%22%3A%7B%22click_text_desc%22%3A%22%22%2C%22trueview%22%3A%22Y%22%7D%2C%22vid%22%3A%22%22%7D","image":[{"index":"0","url":"http://183.61.62.147/vmind.qqvideo.tc.qq.com/y0200ltrftm.p202.1.mp4?vkey=187E4391E0AF98D5C4AA8C8A8BD0BB611ECAB318D54E123C3879B4B5D103E4520C6B79B0F4F4A7A675AB461ECDC9F4FBC7443D868111A3675FB3C155A970E6D957F833448261F4924F44F7CEFF0E123E3528F3428A241147&platform=&sdtfrom=&fmt=hd&level=0","md5":"927f1e6d96fda95b01d2ec988890d4c6","cs":"1125504","ds":"15","width":"640","height":"360","vid":"y0200ltrftm"},{"index":"1","url":"http://183.61.62.147/vmind.qqvideo.tc.qq.com/y0200ltrftm.p202.1.mp4?vkey=187E4391E0AF98D5C4AA8C8A8BD0BB611ECAB318D54E123C3879B4B5D103E4520C6B79B0F4F4A7A675AB461ECDC9F4FBC7443D868111A3675FB3C155A970E6D957F833448261F4924F44F7CEFF0E123E3528F3428A241147&platform=&sdtfrom=&fmt=hd&level=0","md5":"927f1e6d96fda95b01d2ec988890d4c6","cs":"1125504","ds":"15","width":"640","height":"360","vid":"y0200ltrftm"}],"reportUrlOther":{"reportitem":[{"url":"http://cm.l.qq.com/?Bid=f4d5696444ef1184acc67176ebe9026c","reporttime":"0"},{"url":"http://cm.l.qq.com/?Bid=dca6ea17cca2289887e097157db2998a ","reporttime":"0"},{"url":"https://vqq.admaster.com.cn/i/a79013,b1434363,c2083,i0,m202,8a1,8b1,0iPUB_3039703,h","reporttime":"0"},{"url":"https://secure-chn.imrworldwide.com/cgi-bin/gn?prd=chn&ci=ent578649&am=50&at=view&rt=banner&st=image&ca=cmp118151&cr=crv437409&pc=plc3358657&r=1481881237","reporttime":"0"},{"url":"http://sd.cn.miaozhen.com/m.gif?pid=2&tid=5311&m0=&m0a=[DUID]&m1=[ANDROIDID1]&m1a=&m2=&m4=__AAID__&m5=&m6=[MAC1]&m6a=&cid=161223014&o=","reporttime":"0"},{"url":"http://p.tencentmind.com/p?oid=PUB_3039703&soid=B7100BE3004358534615813058&soidip=183.16.11.227&loc=LV_1001_LDVi_LD&lkey=4001&OpenUDID=&MAC=&IDFA=&IP=183.16.11.227&IMEI=&AndroidID=","reporttime":"0"}]},"reportUrlSDK":{"reportitem":[]},"clickReportUrlOther":{"reportitem":[]}},{"order_id":"1803612424","type":"LD","display_code":"","privacy_type":"1","privacy_url":"https://c.l.qq.com/dsp?dspid=110065","dsp_name":"ReachMax","url":"https://wa.gtimg.com/201612/09/dsp/110065/703851/2016/b501d35b1b60070d3db5a41419cc9b20.flv","urlsmall":"https://wa.gtimg.com/201612/09/dsp/110065/703851/2016/b501d35b1b60070d3db5a41419cc9b20.flv","duration":"15000","ReportTime":"0","no_click":"N","link":"https://c.l.qq.com/lclick?oid=1803612424&loc=LV_1001_LDVi_LD&adtype=LD&soid=B7100BE300435853461581305800&adx_ext=YT00ZFpBcGtkaXViJm11aWQ9QVFFQmg2eDV2U0x3azk0UzY0aHNITXJnZjczSi1kMDJmY0xuJnZlcj0wJmNwaWQ9MTEyNjUmcHViPTYmYmM9ZFpBMHd4RzUmbD0yMzk0NzEmY2lkPTEyNDY4OTUmcGxhdD0xJnM9MQ==&gpbid=3058917&dtype=7&CEQPS=Jio+ApNGL03bHODIju7DpGh9zNqJoVg8j4rjOqaGI/FSPwS+ddPl+DQ=&MCESS=Ji2hyS+KyEEqqslhAxpYQIqdL+hd4BdT15fUSh/rPhPZfKObufIVHg8=&pri=+fritokYssI7U2LIfEcnZLRFYP6uWW/Y&si=1768009482&ev=233&pf=in&target=4001&refluence=4001&requestl=4001&vptag=bl.zy.movie_ilcxi3gxzj12ksm.20161209&aver_flag=1&click_data=dXNlcl9pbmZvPXZRRGpnVGs3RmhTMQ==&click_exts=RVhUPVlUMDBaRnBCY0d0a2FYVmlKbTExYVdROVFWRkZRbWcyZURWMlUweDNhemswVXpZMGFITklUWEpuWmpjelNpMWtNREptWTB4dUpuWmxjajB3Sm1Od2FXUTlNVEV5TmpVbWNIVmlQVFltWW1NOVpGcEJNSGQ0UnpVbWJEMHlNemswTnpFbVkybGtQVEV5TkRZNE9UVW1jR3hoZEQweEpuTTlNUT09&chid=0&live=0&aid_tpid=1&aid_tpid2=1037&aid_tpid3=10139&aid_dura=5882&aid_vid_drm=0&aid_cid_drm=0&aid_copyright=197&aid_cover=ilcxi3gxzj12ksm&aid_subtype=16_4","reportUrl":"https://livep.l.qq.com/livemsg?o=3058917&cid=1803612424&adtype=LD&l=4001&reporttime=0&soid=B7100BE300435853461581305800&pri=+fritokYssI7U2LIfEcnZLRFYP6uWW/Y&btpri=&pctr=&btoid=1803612424&si=1768009482&ev=233&refluence=4001&requestl=4001&mt=15000&ip_filter=0&use_axp=0&axpheader=1&ping_data=dXNlcl9pbmZvPXZRRGpnVGs3RmhTMQ==&vid=8kO1XKH8Qfm&pid=655q1dr6ky89sd52w76239fa060dgx5l&live=0&aid_tpid=1&aid_tpid2=1037&aid_tpid3=10139&aid_dura=5882&aid_vid_drm=0&aid_cid_drm=0&aid_copyright=197&aid_cover=ilcxi3gxzj12ksm&aid_subtype=16_4","params":"richdata=%7B%22plugins%22%3A%7B%22click_text_desc%22%3A%22%22%2C%22trueview%22%3A%22Y%22%7D%7D","image":[{"index":"0","url":"http://183.61.62.145/vmind.qqvideo.tc.qq.com/i0200u8xxf2.p202.1.mp4?vkey=A6C68C0AF9F0750E27B3AB679CE46B8896299170843DEF077CA4C9F8FC304ACF67ACE7D8954A0AA658815ECDE10EF5541FC83DDE35F28F44FA778703B8A2782590E342C0126059E1C0C06290542695DA518B83AB36D16CF9&platform=&sdtfrom=&fmt=hd&level=0","md5":"b0caf9f0eca7ca475d8bdba9c1e0f1c1","cs":"1063970","ds":"14","width":"640","height":"360","vid":"i0200u8xxf2"}],"reportUrlOther":{"reportitem":[{"url":"http://tytx.m.cn.miaozhen.com/x/k=2035107&p=74EPh&dx=&rt=2&ns=183.16.11.227&ni=PUB_3058917&v=__LOC__&xa=__ADPLATFORM__&o=","reporttime":"0"},{"url":"https://secure-chn.imrworldwide.com/cgi-bin/gn?prd=chn&ci=ent578929&am=3&at=view&rt=banner&st=image&ca=cmp118365&cr=crv438419&pc=plc3359789&r=[timestamp]","reporttime":"0"},{"url":"http://v2.reachmax.cn/count/run.php?var=YT00ZFpBcGtkaXViJm11aWQ9QVFFQmg2eDV2U0x3azk0UzY0aHNITXJnZjczSi1kMDJmY0xuJnZlcj0wJmNwaWQ9MTEyNjUmcHViPTYmYmM9ZFpBMHd4RzUmbD0yMzk0NzEmY2lkPTEyNDY4OTUmcGxhdD0xJnM9MQ==","reporttime":"0"},{"url":"http://cm.l.qq.com/?Bid=f4d5696444ef1184acc67176ebe9026c","reporttime":"0"},{"url":"http://cm.l.qq.com/?Bid=dca6ea17cca2289887e097157db2998a ","reporttime":"0"}]},"reportUrlSDK":{"reportitem":[]},"clickReportUrlOther":{"reportitem":[]}},{"order_id":"1803567281","type":"LD","display_code":"","privacy_type":"1","privacy_url":"https://c.l.qq.com/dsp?dspid=110065","dsp_name":"ReachMax","url":"https://wa.gtimg.com/201612/05/dsp/110065/157917/2016/02927b3f1fc65491dbc83cfb4f604af3.flv","urlsmall":"https://wa.gtimg.com/201612/05/dsp/110065/157917/2016/02927b3f1fc65491dbc83cfb4f604af3.flv","duration":"15000","ReportTime":"0","no_click":"N","link":"https://c.l.qq.com/lclick?oid=1803567281&loc=LV_1001_LDVi_LD&adtype=LD&soid=B7100BE300435853461581305801&adx_ext=YT00ZFpBcGtkaXViJm11aWQ9QVFFQmg2eDV2U0x3azk0UzY0aHNITXJnZjczSi1kMDJmY0xuJnZlcj0wJmNwaWQ9MTExNjYmcHViPTYmYmM9ZFpBcEZPS2gmbD0yMzI3NzYmY2lkPTEyNDM2NTgmcGxhdD0xJnM9MSZuaWQ9MQ==&gpbid=3025673&dtype=7&CEQPS=Jio+ApNGL03bHODIju7DpGh9zNqJoVg8j4rjOqaGI/FSPwS+ddPl+DQ=&MCESS=JiDoziV8URGEr2kzCf+I3iZj9B8RWH9msF7Ox4p/tAPAXQKQPblzUyc=&pri=t8WZkMf2OInTT/P1H5B+ZMGjlTgUEQ98&si=1768009482&ev=233&pf=in&target=4001&refluence=4001&requestl=4001&vptag=bl.zy.movie_ilcxi3gxzj12ksm.20161209&aver_flag=1&click_data=dXNlcl9pbmZvPXZRRGpnVGs3RmhTMQ==&click_exts=RVhUPVlUMDBaRnBCY0d0a2FYVmlKbTExYVdROVFWRkZRbWcyZURWMlUweDNhemswVXpZMGFITklUWEpuWmpjelNpMWtNREptWTB4dUpuWmxjajB3Sm1Od2FXUTlNVEV4TmpZbWNIVmlQVFltWW1NOVpGcEJjRVpQUzJnbWJEMHlNekkzTnpZbVkybGtQVEV5TkRNMk5UZ21jR3hoZEQweEpuTTlNU1p1YVdROU1RPT0=&chid=0&live=0&aid_tpid=1&aid_tpid2=1037&aid_tpid3=10139&aid_dura=5882&aid_vid_drm=0&aid_cid_drm=0&aid_copyright=197&aid_cover=ilcxi3gxzj12ksm&aid_subtype=16_4","reportUrl":"https://livep.l.qq.com/livemsg?o=3025673&cid=1803567281&adtype=LD&l=4001&reporttime=0&soid=B7100BE300435853461581305801&pri=t8WZkMf2OInTT/P1H5B+ZMGjlTgUEQ98&btpri=&pctr=&btoid=1803567281&si=1768009482&ev=233&refluence=4001&requestl=4001&tailroll=1&adlength=75000&mt=15000&ip_filter=0&use_axp=0&axpheader=1&ping_data=dXNlcl9pbmZvPXZRRGpnVGs3RmhTMQ==&vid=8kO1XKH8Qfm&pid=655q1dr6ky89sd52w76239fa060dgx5l&live=0&aid_tpid=1&aid_tpid2=1037&aid_tpid3=10139&aid_dura=5882&aid_vid_drm=0&aid_cid_drm=0&aid_copyright=197&aid_cover=ilcxi3gxzj12ksm&aid_subtype=16_4","params":"richdata=%7B%22plugins%22%3A%7B%22click_text_desc%22%3A%22%22%2C%22trueview%22%3A%22Y%22%7D%7D","image":[{"index":"0","url":"http://183.60.23.19/vmind.qqvideo.tc.qq.com/k02002qt6g4.p202.1.mp4?vkey=7C8A492D67C7664B4EEF001DE1E6D9C208E78D13CBF8D8C9266873249CEEAC128C8820911B5BFED280548EB39ECAFD86618AA2B716405855A827119622EAF775E308C9CA0E5407F4D3117332AED8E6CEC0CBC950B177B9BF&platform=&sdtfrom=&fmt=hd&level=0","md5":"5b63804f593654636c151df27f0802f4","cs":"1146785","ds":"15","width":"640","height":"360","vid":"k02002qt6g4"}],"reportUrlOther":{"reportitem":[{"url":"http://tytx.m.cn.miaozhen.com/x/k=2033909&p=740LV&dx=&rt=2&ns=183.16.11.227&ni=PUB_3025673&v=__LOC__&xa=__ADPLATFORM__&o=http://ad.doubleclick.net/ddm/trackimp/N8897.276640QQ/B10616632.141508517;dc_trk_aid=313719292;dc_trk_cid=76454257;ord=[timestamp]?http://trace.rtbasia.com/track/qq/cdml1k","reporttime":"0"},{"url":"http://m.reachmax.cn/rm.gif?ext=19","reporttime":"0"},{"url":"http://v2.reachmax.cn/count/run.php?var=YT00ZFpBcGtkaXViJm11aWQ9QVFFQmg2eDV2U0x3azk0UzY0aHNITXJnZjczSi1kMDJmY0xuJnZlcj0wJmNwaWQ9MTExNjYmcHViPTYmYmM9ZFpBcEZPS2gmbD0yMzI3NzYmY2lkPTEyNDM2NTgmcGxhdD0xJnM9MSZuaWQ9MQ==","reporttime":"0"},{"url":"http://cm.l.qq.com/?Bid=f4d5696444ef1184acc67176ebe9026c","reporttime":"0"},{"url":"http://cm.l.qq.com/?Bid=dca6ea17cca2289887e097157db2998a ","reporttime":"0"}]},"reportUrlSDK":{"reportitem":[]},"clickReportUrlOther":{"reportitem":[]}},{"order_id":"1","type":"LD","display_code":"Empty","url":"","duration":"","link":"","reportUrl":"https://livep.l.qq.com/livemsg?o=96&adtype=LD&soid=B7100BE300435853461581305800&r90=1&l=4001&reflunce=4001&requestl=4001&tagid=0&pf=in&si=1768009482&ev=233&aver_flag=1&ip_filter=0&ufc_filter=0&backfunnel=401&use_axp=0&axpheader=1&vid=8kO1XKH8Qfm&pid=655q1dr6ky89sd52w76239fa060dgx5l&live=0&aid_tpid=1&aid_tpid2=1037&aid_tpid3=10139&aid_dura=5882&aid_vid_drm=0&aid_cid_drm=0&aid_copyright=197&aid_cover=ilcxi3gxzj12ksm&aid_subtype=16_4","image":[{"index":"0","url":"","width":"0","height":"0","vid":""}],"reportUrlOther":{"reportitem":[]},"reportUrlSDK":{"reportitem":[]},"clickReportUrlOther":{"reportitem":[]}},{"order_id":"1","type":"KB","display_code":"Empty","url":"","duration":"","link":"","reportUrl":"https://livep.l.qq.com/livemsg?o=90&adtype=KB&soid=B7100BE300435853461581305800&r90=1&l=4001&reflunce=4001&requestl=4001&tagid=0&pf=in&si=1768009482&ev=233&aver_flag=0&ip_filter=0&ufc_filter=0&backfunnel=201&use_axp=0&axpheader=1&vid=8kO1XKH8Qfm&pid=655q1dr6ky89sd52w76239fa060dgx5l&live=0&aid_tpid=1&aid_tpid2=1037&aid_tpid3=10139&aid_dura=5882&aid_vid_drm=0&aid_cid_drm=0&aid_copyright=197&aid_cover=ilcxi3gxzj12ksm&aid_subtype=16_4","image":[{"index":"0","url":"","width":"0","height":"0","vid":""}],"reportUrlOther":{"reportitem":[{"url":"http://qq.irs01.com/irt?_iwt_UA=UA-qq-120001&jsonp=SetIDA0&_iwt_vid=ilcxi3gxzj12ksm&_iwt_muid=5398B912C3EF4E17&_iwt_reqid=B7100BE3004358534615813058&_iwt_vid1=8kO1XKH8Qfm","reporttime":"0"}]},"reportUrlSDK":{"reportitem":[]},"clickReportUrlOther":{"reportitem":[]}}]},"adGetv":{"merged":1,"oid2url":6,"br":235,"id":10202},"adLoc": {"adFlag":0,"add":0,"aid":"4001","breakTime":{"t":["2211.1"]},"breaks":"2211.1","duration":5882,"isvip":0,"mult":{"ivb":[{"time":600000,"type":1}]},"oaid":"4001","rfid":"9673687557476169005_1481852437","tm":1481852437,"tpid":1,"vad":null,"vid2aid": "0"}}'
	local obj = json.decode(url)
	PrintTable(obj);
end

print("load the www.baidu.com")
-- load the http module
http = require("socket.http")
r, c, h = http.request {
  method = "HEAD",
  url = "http://www.baidu.com"
}
print("res=",r)
print("c=",c)
PrintTable(h)