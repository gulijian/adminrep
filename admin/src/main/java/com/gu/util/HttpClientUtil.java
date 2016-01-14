package com.gu.util;

import java.io.IOException;
import java.net.URI;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class HttpClientUtil {
	
	//创建HttpClientBuilder
    public static HttpClientBuilder httpClientBuilder = HttpClientBuilder.create();
    //HttpClient
    public static  CloseableHttpClient closeableHttpClient = httpClientBuilder.build();
	
	/**
	 * 
	 * get请求获取网页源代码
	 * 方法名：getHtmlResource
	 * 创建人：gulj
	 * 时间：2016年1月12日-下午3:21:08 
	 * @param url
	 * 			请求url
	 * @param params
	 * 			url参数
	 * @param encode
	 * 			网页编码
	 * @return String
	 * 			返回网页源代码
	 * @exception 
	 * @since  1.0.0
	 */
	public static String sendGet(String url, List<NameValuePair> params,String encode){
        //HttpGet
        HttpGet httpGet = new HttpGet(url);
        System.out.println(httpGet.getRequestLine());
        try {
        	
        	httpGet.addHeader("Content-Type", "text/html;charset="+encode);
        	
			//设置参数(设置参数编码为GB2312)
        	if(params != null && params.size() > 0){
        		httpGet.setURI(new URI(url+"?"+EntityUtils.toString(new UrlEncodedFormEntity(params,encode))));
        	}
        	
            //执行get请求
            HttpResponse httpResponse = closeableHttpClient.execute(httpGet);
            //获取响应消息实体
            HttpEntity entity = httpResponse.getEntity();
            //响应状态
            System.out.println("status:" + httpResponse.getStatusLine());
            //判断响应实体是否为空
            if (entity != null) {
                System.out.println("contentEncoding:" + entity.getContentEncoding());
                return  EntityUtils.toString(entity,encode);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
        	try {
				closeableHttpClient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
        	
        }
        return null;
	}
	
	/**
	 * 
	 * post请求获取网页源代码
	 * 方法名：getHtmlResource
	 * 创建人：gulj
	 * 时间：2016年1月12日-下午3:21:08 
	 * @param url
	 * 			请求url
	 * @param params
	 * 			url参数
	 * @param encode
	 * 			网页编码
	 * @return String
	 * 			返回网页源代码
	 * @exception 
	 * @since  1.0.0
	 */
	public static String sendPost(String url, List<NameValuePair> params,String encode){
	        try {
	        	HttpPost httpPost = new HttpPost(url);
				//配置请求的超时设置  
		        RequestConfig requestConfig = RequestConfig.custom()    
		                								   .setConnectionRequestTimeout(50)  
		                								   .setConnectTimeout(50)    
		                								   .setSocketTimeout(50).build();    
		        httpPost.setConfig(requestConfig);
		        //设置编码格式
		        httpPost.setHeader("Content-Type", "application/x-www-form-urlencoded;charset="+encode);
		        //设置参数
		        if(params != null && params.size() > 0){
		        	UrlEncodedFormEntity entity = new UrlEncodedFormEntity(params, encode);
		            httpPost.setEntity(entity);
		        }
	            //post请求
	            HttpResponse  httpResponse = closeableHttpClient.execute(httpPost);
	            //getEntity()
	            HttpEntity httpEntity = httpResponse.getEntity();
	            if (httpEntity != null) {
	                //打印响应内容
	                return  EntityUtils.toString(httpEntity, encode);
	            }
	            //释放资源
	            closeableHttpClient.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return null;

	}
	
	public static void main(String[] args) {
		//设置参数
//        List<NameValuePair> params = new ArrayList<NameValuePair>();
//        params.add(new BasicNameValuePair("searchText", "英语"));
		String content = HttpClientUtil.sendPost("http://www.gxnu.edu.cn/default.html", null, "GBK");
		Document document = Jsoup.parse(content);//java.net下面api
		System.out.println(content);
		
	}
	


}
