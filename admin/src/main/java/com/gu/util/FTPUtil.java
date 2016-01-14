package com.gu.util;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import sun.net.TelnetInputStream;
import sun.net.TelnetOutputStream;
import sun.net.ftp.FtpClient;

/**
 * ftp连接，上传
 * @author tr
 * 2012-06-20
 */
@SuppressWarnings("all")
public class FTPUtil {

	//创建ftp服务器  
	FtpClient ftpClient; 

	/**  
	 * connectServer  
	 * 连接ftp服务器  
	 * @throws java.io.IOException  
	 * @param path 文件夹，空代表根目录  
	 * @param password 密码  
	 * @param user    登陆用户  
	 * @param server 服务器地址  
	 */   
	public void connectServer(String server, String user, String password, String path)   
	{   
		try {
			// server：FTP服务器的IP地址；user:登录FTP服务器的用户名   
			// password：登录FTP服务器的用户名的口令；path：FTP服务器上的路径   
			ftpClient = new FtpClient();   
			//开启服务  
			ftpClient.openServer(server);  
			//登录  
			ftpClient.login(user, password);   
			//path是ftp服务下主目录的子目录   
			if (path.length() != 0) 
				ftpClient.cd(path);
			//用2进制上传、下载   
			ftpClient.binary();
		} catch (Exception e) {
			e.printStackTrace();
		}        
	}   


	/**  
	 * upload  
	 * 上传文件  
	 * @throws java.lang.Exception  
	 * @return -1 文件不存在  
	 *           -2 文件内容为空  
	 *           >0 成功上传，返回文件的大小  
	 * @param newname 上传后的新文件名  
	 * @param filename 上传的文件  
	 */   
	public long upload(String newname,File uploadFile) throws Exception   
	{   
		long result = 0;   
		//ftp输出流  
		TelnetOutputStream os = null;  
		FileInputStream is = null;
		try {            
			//ftpclient的put方法 调用后将路径传进去 返回TelnetOutputStream 就可以进行文件上传操作了  
			os = ftpClient.put(newname);   
			is = new FileInputStream(uploadFile);  
			byte[] bytes = new byte[1024];  
			int c;   
			while ((c = is.read(bytes)) != -1) {   
				os.write(bytes, 0, c);   
			} 
		}catch (Exception e) {
			e.printStackTrace();
		} finally {   
			if (is != null) {   
				is.close();   
			}   
			if (os != null) {   
				os.close();   
			}   
		}   
		return result;   
	}   

	/**
	 *  判断Ftp目录是否存在,如果不存在则创建目录 
	 *  
	 */
	public boolean createDir(String dirPath,String[] names) throws Exception{  


		//		String fullDir = dirPath.substring(0, dirPath.lastIndexOf("/"));  ;  
		String[] dirs = dirPath.split("/");  
		String curDir = "";  
		for (int i = 0; i < dirs.length; i++)  
		{  
			String dir = dirs[i];  
			//如果是以/开始的路径,第一个为空  
			if (dir != null && dir.length() > 0)  
			{  
				try
				{
					curDir += dir+"/";  
					for (int j = 0; j < names.length; j++) {
						if (dir.equals(names[j])) {
							ftpClient.cd(names[j]);  
						}
					}
					if (dir.equals("menu")) {
					}else if (dir.equals(new SimpleDateFormat("yyyy").format(new Date()))) {
						ftpClient.cd(curDir);
					}else if(dir.equals(new SimpleDateFormat("MM").format(new Date()))){
						ftpClient.cd(curDir);
					}
				} catch (Exception e1)
				{
					//通过远程命令 创建一个files文件夹  
					ftpClient.sendServer("MKD " + curDir + "\r\n");
					createDir(dirPath, names);
					try
					{
						//创建远程文件夹   
						//远程命令包括  
						//USER    PORT    RETR    ALLO    DELE    SITE    XMKD    CDUP    FEAT<br>  
						//      PASS    PASV    STOR    REST    CWD     STAT    RMD     XCUP    OPTS<br>  
						//      ACCT    TYPE    APPE    RNFR    XCWD    HELP    XRMD    STOU    AUTH<br>  
						//      REIN    STRU    SMNT    RNTO    LIST    NOOP    PWD     SIZE    PBSZ<br>  
						//      QUIT    MODE    SYST    ABOR    NLST    MKD     XPWD    MDTM    PROT<br>  
						//           在服务器上执行命令,如果用sendServer来执行远程命令(不能执行本地FTP命令)的话，所有FTP命令都要加上/r/n<br>  
						//                ftpclient.sendServer("XMKD /test/bb/r/n"); //执行服务器上的FTP命令<br>  
						//                ftpclient.readServerResponse一定要在sendServer后调用<br>  
						//                nameList("/test")获取指目录下的文件列表<br>  
						//                XMKD建立目录，当目录存在的情况下再次创建目录时报错<br>  
						//                XRMD删除目录<br>  
						//                DELE删除文件<br>  
						//这个方法必须在 这两个方法中间调用 否则 命令不管用  
						//ftpClient.binary(); 
						ftpClient.readServerResponse();
					} catch (Exception e)
					{
						e.printStackTrace();
						return false;
					}
					return true;  
				}
			}  
		} 
		return true;
	}  

	/** 
	 * 获取当前目录 
	 *  
	 * @param fc FTP连接对象 
	 * @return 
	 */  
	public String ftpPWD(){  
		try {  
			return ftpClient.pwd();  
		} catch (Exception e) {  
			return null;  
		}  
	}  

	/**
	 * 返回FTP目录下的文件列表
	 * @param ftpDirectory
	 * @return
	 */
	public List<String> getFileNameList(String ftpDirectory) 
	{ 
		List<String> list = new ArrayList<String>(); 
		try  
		{ 
			DataInputStream dis = new  DataInputStream(ftpClient.nameList(ftpDirectory)); 
			String filename = ""; 
			while((filename=dis.readLine())!=null)   
			{
				list.add(filename);         
			}   
		} catch (Exception e)  
		{ 
			e.printStackTrace(); 
		} 
		return list; 
	}

	/**
	 * 取得指定目录下的所有文件名，不包括目录名称
	 * 分析nameList得到的输入流中的数，得到指定目录下的所有文件名
	 *  @param  fullPath String
	 *  @return  ArrayList
	 *  @throws  Exception
	 */
	public  ArrayList fileNames(String fullPath)  throws  Exception  {
		ftpClient.ascii();  // 注意，使用字符模式
		TelnetInputStream list  =  ftpClient.nameList(fullPath);
		byte [] names  =   new   byte [ 2048 ];
		int  bufsize  =   0 ;
		bufsize  =  list.read(names,0,names.length);  // 从流中读取
		list.close();
		ArrayList namesList  =   new  ArrayList();
		int  i  =   0 ;
		int  j  =   0 ;
		while  (i  <  bufsize)  {
			if  (names[i]  ==   10 )  {  
				String tempName  =   new  String(names, j, i  -  j);
				namesList.add(tempName);
				j  =  i  +   1 ;  // 上一次位置字符模式
			}
			i  =  i  +   1 ;
		}
		return  namesList;
	}

	/** 
	 * 删除文件 
	 *  
	 * @param fc FTP连接对象 
	 * @param filename 删除的文件名称 
	 * @return 
	 */  
	public boolean ftpDelete(String filename,String path) {  
		try {
			ftpClient.cd(ftpPWD());  //进入目录
			ftpClient.sendServer("dele " + filename + "\r\n");   //删除文件
			/*	//判断该目录下是否还存在文件
			String[] paths = path.split("/");
			for (int i = paths.length-1; i >0 ; i--) {
				System.out.println(paths[i]);
				if (paths[i].equals("pub")) {
					continue;
				}
				System.out.println(ftpClient.nameList("/").read());
				if (ftpClient.nameList("/"+paths[i])== null) {
					ftpClient.sendServer("XRMD"+paths[i]+"\r\n");
				}
			}*/
			ftpClient.readServerResponse();  
			return true;  
		} catch (Exception e) { 
			e.printStackTrace();
			return false;  
		}   
	}  


	public DataInputStream downloadfile(String rwfiledir,String filepathname){ 
		DataInputStream puts = null;
		String message = ""; 
		if (ftpClient != null) 
		{ 
			System.out.println("正在下载文件"+filepathname+",请等待...."); 
			try{ 
				int ch; 
				File fi = new File(filepathname); 
				
				if (!fi.exists()) {
					fi.mkdirs();
				}
				
				RandomAccessFile getfile = new RandomAccessFile(fi,"rw"); 
				getfile.seek(0); 
				TelnetInputStream fget=ftpClient.get(rwfiledir); 
				puts = new DataInputStream(fget); 
				while ((ch = puts.read()) >= 0) { 
					getfile.write(ch); 
				} 
				fget.close(); 
				getfile.close(); 
				message = "下载"+rwfiledir+"文件到"+filepathname +"目录成功!"; 
				System.out.println(message); 
			} 
			catch(IOException e){ 
				e.printStackTrace();
				message = "下载"+rwfiledir+"文件到"+filepathname +"目录失败!"+e; 
				System.out.println(message); 
				//result = false ; 
			}
		} 
		/*else{ 
			result = false; 
		} */
		return puts; 
	} 
	
	
	public InputStream downloadfile1(String fileName){ 
		TelnetInputStream tis=null;
		if (ftpClient != null) {
			try {
				tis = ftpClient.get(fileName);
			} catch (IOException e) {
				e.printStackTrace();
				return null;
			}

		}
		return tis; 
	} 

	/**  
	 * closeServer  
	 * 断开与ftp服务器的链接  
	 * @throws java.io.IOException  
	 */   
	public void closeServer()   
	{      
		try   
		{   
			if (ftpClient != null)   
			{   
				ftpClient.closeServer();        
			}   
		} catch (Exception e) {   
			e.printStackTrace();   
		}   
	}

	public static void main(String[] args) throws Exception {
		//		FTPUtil ftp = new FTPUtil();
		//		//连接ftp服务器   
		//		ftp.connectServer("192.168.1.115", "jr", "jinrun", "/pub");   
		//
		//		String[] names = new String[]{"file",new SimpleDateFormat("yyyy").format(new Date()),new SimpleDateFormat("MM").format(new Date())};
		//		//创建一个目录
		//		ftp.createDir("/pub/file",names);
		//		//创建一个以年份为名的目录
		//		ftp.createDir("/pub/file/"+new SimpleDateFormat("yyyy").format(new Date())+"/",names);
		//		//创建一个也月份为名的目录
		//		ftp.createDir("/pub/file/"+new SimpleDateFormat("yyyy").format(new Date())+"/"+
		//				new SimpleDateFormat("MM").format(new Date())+"/",names);  
		//		/**   上传彩铃 */   
		//		ftp.upload("C:/Users/Administrator/Desktop/excel.xlsx","excel.xlsx");   
//		http://121.41.57.4/images/userAccount/idphoto/2015a/01a/20150102150114542.jpg

		// 从配置文件中读取上传的服务器相关信息
//		
//		String filePath = PropertiesUtil.getFilePath();
//		FTP.NA.ip=121.41.57.4
//				FTP.NA.username=upload
//				FTP.NA.password=2014*upload
//		String ip = PropertiesUtil.readValue(filePath, "FTP.NA.ip");// 主账户Id
//		String username = PropertiesUtil.readValue(filePath,
//				"FTP.NA.username");
//		String password = PropertiesUtil.readValue(filePath,
//				"FTP.NA.password");
				
//		String ip = "121.41.57.4";// 主账户Id
//		String username = "upload";
//		String password = "2014*upload";
//				
//		String pathfull= "http://121.41.57.4/images/userAccount/idphoto/2015a/01a/20150102150114542.jpg";// /upload/userAccount
//		String p = "/upload/"+pathfull.substring(pathfull.indexOf("userAccount"));
//		String path = p.substring(0, p.lastIndexOf("/"));
//		String pname = p.substring(p.lastIndexOf("/")+1);
//		System.out.println(path);
//		System.out.println(pname);
//		
//		FTPUtil ftp = new FTPUtil();
//		ftp.connectServer(ip, username, password, path);
//		ftp.downloadfile1(pname);
	}
}
