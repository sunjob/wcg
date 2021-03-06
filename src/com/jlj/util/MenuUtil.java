package com.jlj.util;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jlj.menu.Menu;

/**
 * 自定义菜单工具类
 * @author John
 *
 */
public class MenuUtil {
	private static Logger log = LoggerFactory.getLogger(MenuUtil.class);
	
	//菜单创建（POST）
	public final static String menu_create_url = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";

	//菜单查询（GET）
	public final static String menu_get_url = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=ACCESS_TOKEN";
	
	//菜单删除（GET）
	public final static String menu_delete_url = "https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=ACCESS_TOKEN";
	
	/**
	 * 创建菜单
	 * @param menu
	 * @param accessToken
	 * @return
	 */
	public static boolean createMenu(Menu menu,String accessToken){
		boolean result = false;
		String url = menu_create_url.replace("ACCESS_TOKEN", accessToken);
		//将菜单对象转换成JSON字符串
		String jsonMenu = JSONObject.fromObject(menu).toString();
		log.info("jsonMenu==="+jsonMenu);
		//发起POST请求创建菜单
		JSONObject jsonObject = CommonUtil.httpsRequest(url, "POST", jsonMenu);
		
		if(null!= jsonObject){
			int errorCode = jsonObject.getInt("errcode");
			String errorMsg = jsonObject.getString("errmsg");
			if(0 == errorCode){
				result = true;
			}else{
				result = false;
				log.error("创建菜单失败 errcode:{} errmsg:{}", errorMsg, errorMsg);
			}
		}
		
		return result;
	}
	/**
	 * 查询菜单
	 * @param accessToken
	 * @return
	 */
	public static String getMenu(String accessToken){
		String result = null;
		String requestUrl = menu_get_url.replace("ACCESS_TOKEN", accessToken);
		//发起GET请求查询菜单
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "GET", null);
		
		if(null != jsonObject){
			result = jsonObject.toString();
		}
		return result;
	}
	
	public static boolean deleteMenu(String accessToken){
		boolean result = false;
		String requestUrl = menu_delete_url.replace("ACCESS_TOKEN", accessToken);
		//发起GET请求删除菜单
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "GET", null);
		
		if(null != jsonObject){
			int errorCode = jsonObject.getInt("errcode");
			String errorMsg = jsonObject.getString("errmsg");
			if(0 == errorCode){
				result = true;
			}else{
				result = false;
				log.error("删除菜单失败 errcode:{} errmsg:{}", errorMsg, errorMsg);
			}
		}
		return result;
	}
}
