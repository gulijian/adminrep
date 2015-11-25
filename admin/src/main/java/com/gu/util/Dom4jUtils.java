package com.gu.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

/**
 * @author baojian.xin
 * @version 1.0
 * @date 2013-5-15
 */
public class Dom4jUtils {
	
	public static void main(String[] args) {
		Dom4jUtils.createXml();
	}

	/**
	 * 创建一个新的Element
	 * 
	 * @param document
	 *            创建Element的Document
	 * @param eleName
	 *            Element的名称
	 * @param attributes
	 * 			为Element添加属性，以Map形式存储，key为name,map.value为attribute.value
	 * @return Element
	 */
	public static Element addElementAndAttribute(Document document,String eleName,String ... attributes) {
		return addAttribute(addElement(document, eleName), attributes);
	}
	/**
	 * 创建一个新的Element
	 * 
	 * @param document
	 *            创建Element的Document
	 * @param eleName
	 *            Element的名称
	 * @param attributes
	 * 			为Element添加属性，以Map形式存储，key为name,map.value为attribute.value
	 * @return Element
	 */
	public static Element addElement(Document document,String eleName) {
		return document.addElement(eleName);
	}
	/**
	 * 为某个Element添加属性
	 * @param element 要添加属性的Element
	 * @param attributes 属性列表，以key,value,key,value...顺序
	 * @return Element
	 */
	public static Element addAttribute(Element element,String... attributes){
		for (int i = 0; i < attributes.length;) {
			if ((i+1) < attributes.length) {
				element.addAttribute(attributes[i++], attributes[i++]);
			}
		}
		return element;
	}
	/**
	 * 添加子级的Element及属性
	 * 
	 * @param parentElement
	 *            创建Element的Document
	 * @param eleName
	 *            Element的名称
	 * @param attributes
	 * 			 为Element添加属性，长度是偶数，如果是奇数，最后一个废弃,以key,value,key,value格式存储
	 * @return Element
	 */
	public static Element addChildrenAndAttribute (Element parentElement, String eleName,String ...attributes) {
		return addAttribute(addChildren(parentElement, eleName), attributes);
	}
	/**
	 * 添加子级的Element
	 * 
	 * @param parentElement
	 *            创建Element的Document
	 * @param eleName
	 *            Element的名称
	 * @return Element
	 */
	public static Element addChildren (Element parentElement, String eleName) {
		return parentElement.addElement(eleName);
	}
	

	public static void createXml() {
		Document document = DocumentHelper.createDocument();

		createXml(document, "D:/user.xml");
		
	}

	/**
	 * 根据Document生成xml
	 * 
	 * @param document
	 *            xml文档对象
	 * 
	 * @param path
	 *            生成xml文件的路径
	 */
	public static void createXml(Document document, String path) {
		XMLWriter out = null;
		BufferedWriter bw = null;
		OutputStreamWriter osw = null;
		FileOutputStream fos = null;
		try {
			File xmlFile = new File(path);// 输出xml的路径
			fos = new FileOutputStream(xmlFile);
			osw = new OutputStreamWriter(fos, "UTF-8");// 指定编码，防止写中文乱码
			bw = new BufferedWriter(osw);

			// 对xml输出格式化
			OutputFormat format = OutputFormat.createPrettyPrint();
			format.setEncoding("UTF-8");
			out = new XMLWriter(bw, format);
			out.write(document);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (bw != null) {
					bw.close();
				}
				if (osw != null) {
					osw.close();
				}
				if (fos != null) {
					fos.close();
				}

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 解析xml字符串
	 * @param xml
	 * @return
	 */
	public static Document getDocument(String xml){
		try {
			return DocumentHelper.parseText(xml);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
