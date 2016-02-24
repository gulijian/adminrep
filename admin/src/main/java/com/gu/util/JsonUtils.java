package com.gu.util;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Type;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.PropertyUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonParseException;

/**
 * 
* <p>Title: JsonUtils.java</p>
 */
public class JsonUtils {

	public static boolean JSON_ENABLE = false;
	
	public static String stringToJson(String s) {
		if (s == null) {
			return nullTOJson();
		}
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < s.length(); i++) {
			char ch = s.charAt(i);
			switch (ch) {
			case '"':
				sb.append("\\\"");
				break;
			case '\\':
				sb.append("\\\\");
				break;
			case '\b':
				sb.append("\\b");
				break;
			case '\f':
				sb.append("\\f");
				break;
			case '\n':
				sb.append("\\n");
				break;
			case '\r':
				sb.append("\\r");
				break;
			case '\t':
				sb.append("\\t");
				break;
			case '/':
				sb.append("\\/");
				break;
			default:
				if (ch >= '\u0000' && ch <= '\u001F') {
					String ss = Integer.toHexString(ch);
					sb.append("\\u");
					for (int k = 0; k < 4 - ss.length(); k++) {
						sb.append('0');
					}
					sb.append(ss.toUpperCase());
				} else {
					sb.append(ch);
				}
			}
		}
		return sb.toString();
	}

	/***
	 * 对象转换成为json 这里是描述这个方法的作用
	 * 
	 * @return
	 * @author Java
	 * @date 2011-7-22 下午02:59:13
	 */
	public static String objectToJson(Object obj) {
		StringBuffer json = new StringBuffer();
		if (obj == null) {
			json.append("\"\"");
		} else if (obj instanceof Integer) {
			json.append("\"").append(numberToJson((Integer) obj)).append("\"");
		} else if (obj instanceof Boolean) {
			json.append("\"").append(booleanToJson((Boolean) obj)).append("\"");
		} else if (obj instanceof String) {
			json.append("\"").append(stringToJson(obj.toString())).append("\"");
		} else if (obj instanceof Object[]) {
			json.append("\"").append(arrayToJson((Object[]) obj)).append("\"");
		} else if (obj instanceof List) {
			json.append("\"").append(listToJson((List<?>) obj)).append("\"");
		} else if (obj instanceof Map) {
			json.append("\"").append(mapToJson((Map<?, ?>) obj)).append("\"");
		} else if (obj instanceof java.sql.Date) {
			json.append("\"").append(dateToJson((Date) obj)).append("\"");
		} else if (obj instanceof java.util.Date) {
			json.append("\"").append(dateUtilToJson((java.util.Date) obj))
					.append("\"");
		} else {
			json.append("\"").append(stringToJson(obj.toString())).append("\"");
		}
		return json.toString();
	}

	/**
	 * 这里是描述这个方法的作用
	 * 
	 * @param obj
	 * @return {["pname":"val"],["pname":"val"]...}
	 * @author Java
	 * @date 2011-7-22 下午03:02:49
	 */
	public static String beanToJson(Object obj) {
		StringBuffer json = new StringBuffer("{");
		try {
			PropertyDescriptor[] pds = PropertyUtils
					.getPropertyDescriptors(obj);
			if (pds != null && pds.length > 0) {
				for (PropertyDescriptor pd : pds) {
					if (pd.getName().equals("class"))
						continue;
					String pname = objectToJson(pd.getName());
					String val = objectToJson(pd.getReadMethod().invoke(obj));
					json.append(pname);
					json.append(":");
					json.append(val);
					json.append(",");
				}
				json.setCharAt(json.length() - 1, '}');
			} else {
				json.append("}");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json.toString();
	}

	public static String beanToJson(Object obj, String params) {
		StringBuffer json = new StringBuffer("{");
		try {
			PropertyDescriptor[] pds = PropertyUtils
					.getPropertyDescriptors(obj);
			if (pds != null && pds.length > 0) {
				for (PropertyDescriptor pd : pds) {
					String pname = pd.getName();
					if (pname.equals("class"))
						continue;
					if (params.indexOf(pname) == -1)
						continue;
					pname = objectToJson(pname);
					String val = objectToJson(pd.getReadMethod().invoke(obj));
					json.append(pname);
					json.append(":");
					json.append(val);
					json.append(",");
				}
				json.setCharAt(json.length() - 1, '}');
			} else {
				json.append("}");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json.toString();
	}

	/**
	 * 这里是描述这个方法的作用
	 * 
	 * @param obj
	 * @return
	 * @see
	 * @author Java
	 * @date 2011-7-22 下午03:02:27
	 */
	public static String mapToJson(Map<?, ?> map) {
		StringBuilder json = new StringBuilder();
		json.append("{");
		if (map != null && map.size() > 0) {
			for (Object key : map.keySet()) {
				json.append("" + objectToJson(key) + "");
				json.append(":");
				json.append("" + objectToJson(map.get(key)) + "");
				json.append(",");
			}
			json.setCharAt(json.length() - 1, '}');
		} else {
			json.append("}");
		}
		return json.toString();
	}

	/**
	 * 这里是描述这个方法的作用
	 * 
	 * @param obj
	 * @return
	 * @author Java
	 * @date 2011-7-22 下午03:02:15
	 */
	public static String listToJson(List<?> list) {
		StringBuffer json = new StringBuffer();
		json.append("[");
		if (list != null && list.size() > 0) {
			for (Object obj : list) {
				json.append(beanToJson(obj));
				json.append(",");
			}
			json.setCharAt(json.length() - 1, ']');
		} else {
			json.append("]");
		}
		return json.toString();
	}

	public static String listToJson(List<?> list, String params) {
		StringBuffer json = new StringBuffer();
		json.append("[");
		if (list != null && list.size() > 0) {
			for (Object obj : list) {
				json.append(beanToJson(obj, params));
				json.append(",");
			}
			json.setCharAt(json.length() - 1, ']');
		} else {
			json.append("]");
		}
		return json.toString();
	}

	/**
	 * 这里是描述这个方法的作用
	 * 
	 * @param obj
	 * @return
	 * @see
	 * @author Java
	 * @date 2011-7-22 下午03:02:05
	 */
	private static String arrayToJson(Object[] array) {
		StringBuilder json = new StringBuilder();
		json.append("{");
		if (array != null && array.length > 0) {
			for (Object obj : array) {
				json.append(objectToJson(obj));
				json.append(",");
			}
			json.setCharAt(json.length() - 1, '}');
		} else {
			json.append("}");
		}
		return json.toString();
	}

	public static String dateToJson(Date date) {
		return date.toString();
	}

	public static String dateUtilToJson(java.util.Date date) {
		return date.toString();
	}

	public static String numberToJson(Number number) {
		return number.toString();
	}

	public static String booleanToJson(Boolean bool) {
		return bool.toString();
	}

	public static String nullTOJson() {
		return "";
	}
	
	/**
	 * 非空验证 这里是描述这个方法的作用
	 * 
	 * @param arg0
	 * @return
	 * @author Java
	 * @date 2011-7-22 下午02:51:43
	 */
	public static Boolean isNull(Object arg0) {
		if (arg0 == null)
			return true;
		String arg = (String) arg0;
		return ("".equals(arg.trim()) || "null".equals(arg)) ? true : false;
	}
	
	/**
	 * 根据对象生成json
	 * 
	 * @param list
	 *            区域关系对象
	 * @return json数据
	 */
	public static String objParseFromDto(Object obj, Type type) {
		try {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
			return gson.toJson(obj, type);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * json生成Object
	 * 
	 * @param json
	 * @param type
	 * @return
	 */
	public static List<Object> objParseFromJson(String json, Type type) {
		try {
			Gson gson = new GsonBuilder().create();
			List<Object> fromJson = gson.fromJson(json, type);
			return fromJson;
		} catch (JsonParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 把List<Integer> 中存贮的正整数按连续的数字分组
	 * @param list 正整数数字集合
	 * @return 份组后的字符串 [0, 1, 2, 4, 15]  0-2,4-4,15-
	 */
	public static String cutGroup(List<Double> list){
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < list.size(); i++) {
			if (i == 0) {
				sb.append(list.get(i));
				sb.append("-");
			}else{
				double add = 0;
				Integer pastNum = Integer.parseInt(list.get(i - 1).toString().substring(list.get(i - 1).toString().lastIndexOf(".") + 1));
				Integer nextNum = Integer.parseInt(list.get(i).toString().substring(list.get(i).toString().lastIndexOf(".") + 1));
				if ((pastNum > 0 && nextNum > 0) || (pastNum == 0 && nextNum == 0)) {
					add = 1d;
				}else if (pastNum == 0 && nextNum > 0) {
					add = 1.5;
				}else if (pastNum > 0 && nextNum == 0) {
					add = 0.5;
				}
				if (list.get(i - 1)+add < list.get(i)) {
					sb.append(list.get(i-1));
					sb.append(",");
					sb.append(list.get(i));
					sb.append("-");
				}else{
					if (i+1 == list.size()) {
						sb.append(list.get(i));
					}
				}
			}
			
		}
		return sb.toString();
	}
	
	
	/**
	 * json字符串数据转换List<Object>对象
	 * @param JsonStr
	 * 			json字符串 ;
	 *        只能控制到二级{properties：value,data:[{properties:value...},{properties:value...},properties:value],properties:value}
	 * @return
	 */
	public static <T> List<T> jsonStrToBeanLst(String JsonStr,Class<T> c){
		JSONArray array = JSONArray.parseArray(JsonStr);
		List<T> objList = new ArrayList<T>();
		for(int i = 0; i < array.size();i++){
			JSONObject jobj = (JSONObject)array.get(i);
			T objbean = JSON.toJavaObject(jobj,c);
			objList.add(objbean);
		}
		if(null !=objList && objList.size()>0){
			return objList;
		}
		return null;
	}
	
	/**
	 * json字符串数据转换bean对象
	 * @param JsonStr
	 * 			json字符串 ;
	 *        只能控制到二级{properties：value,data:{properties:value...},properties:value}
	 * @return
	 */
	public static <T> T jsonStrToBean(String JsonStr,Class<T> c){
		JSONArray array = JSONArray.parseArray(JsonStr);
		List<T> objList = new ArrayList<T>();
		for(int i = 0; i < array.size();i++){
			JSONObject jobj = (JSONObject)array.get(i);
			T objbean = JSON.toJavaObject(jobj,c);
			objList.add(objbean);
		}
		return null;
	}
	
}
