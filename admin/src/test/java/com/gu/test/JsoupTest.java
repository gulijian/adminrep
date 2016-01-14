package com.gu.test;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashSet;
import java.util.Set;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


public class JsoupTest {
	
	
	
	public static void main(String[] args) {
		String url = "http://digi.tech.qq.com/";
		String eningcode = "GBK";
		try {
			Document doc = Jsoup.connect(url).get();
			Elements links = doc.select("img");
			Set<String> imgSet = new HashSet<String>();
			for (Element element : links) {
				imgSet.add(element.attr("src"));
			}
			//下载图片
			downLoadImg(imgSet);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//下载图片
	public static void downLoadImg(Set imgSet){
		String imgSrc = "http://img1.gtimg.com/digi/pics/hv1/98/183/2002/130226813.jpg";
		try {
			File file = new File("D:\\gulj.jpg");
			if(!file.exists()){
				file.createNewFile();
			}
			URL url = new URL(imgSrc);
			URLConnection con = url.openConnection();
			InputStream ins = con.getInputStream();
			BufferedInputStream bins = new BufferedInputStream(ins);
			BufferedOutputStream outs = new BufferedOutputStream(new  FileOutputStream(file));
			byte[] b = new byte[1024];
			int length = 0;
			while((length = bins.read(b)) != -1){
				outs.write(b, 0, length);
			}
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	

}
