<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%> <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}

</script>

<title>Upload2</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-aller.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 24px}
.style3 {font-weight: bold}
.style4 {
	color: #FF0000;
	font-weight: bold;
}
.style5 {color: #FF0000}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style1">Privacy Preserving Searchable Encryption with Fine Grained Access Control
</a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li><a href="index.html"><span>Home Page</span></a></li>
          <li class="active"><a href="DataOwnerLogin.html">Data Owner </a></li>
          <li><a href="EndUserLogin.html">End User</a></li>
          <li><a href="CloudServerLogin.html">Cloud Server</a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="320" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="960" height="320" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="960" height="320" alt="" /> </a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
    
          <h2>&nbsp;</h2>
         
          <%

      	try 
	{
	
			long stime=System.currentTimeMillis();
	
			String keys = "ef50a0ef2c3e3a5f";
			String oname=(String)application.getAttribute("oname");
	
      		String file=request.getParameter("t42");
      		String cont=request.getParameter("text2");
      		String mac =request.getParameter("t4");
      		
			SimpleDateFormat sdfDate = new SimpleDateFormat(
					"dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat(
					"HH:mm:ss");

			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
      		KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
			Cipher encoder = Cipher.getInstance("RSA");
			KeyPair kp = kg.generateKeyPair();

				Key pubKey = kp.getPublic();

				byte[] pub = pubKey.getEncoded();
//				System.out.println("PUBLIC KEY" + pub);
		
				String pk = String.valueOf(pub);
				String rank="0";
				
				byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE, key);
      			String encryptedValue = new String(Base64.encode(cont.getBytes()));
				String mac1 = new String(Base64.encode(mac.getBytes()));
				String pk1 = new String(Base64.encode(pk.getBytes()));
				String oname1 = new String(Base64.encode(oname.getBytes()));
				
				
				
				Statement st=connection.createStatement();
	
				String user="Data Owner";
				String task="Upload";
				
				String strQuery2 = "insert into transaction(user,fname,sk,task,dt) values('"+user+"','"+file+"','"+pk+"','"+task+"','"+dt+"')";
				connection.createStatement().executeUpdate(strQuery2);
				
				st.executeUpdate("insert into  cloudserver(fname,ct,trapdoor,sk,rank,dt,Oname) values ('"+file+"','"+cont+"','"+mac1+"','"+pk1+"','"+rank+"','"+dt+"','"+oname1+"')"); 
				st.executeUpdate("insert into  ownerfiles(fname,ct,trapdoor,sk,rank,dt,Oname) values ('"+file+"','"+cont+"','"+mac+"','"+pk+"','"+rank+"','"+dt+"','"+oname+"')"); 			
				
      		
			
					long etime=System.currentTimeMillis();
					long ttime = etime-stime;
					long tpt=((cont.length())/ttime)*1024;
					
					Statement st1=connection.createStatement();
				st1.executeUpdate("insert into  results values ('"+file+"','"+ttime+"','"+tpt+"')"); 
										
			
	
%>
		  <p><h2>Data Uploaded Successfully !!!</h2></p><br />
		<p>  <a href="DataOwnerMain1.jsp">BACK</a></p>

		  <%

	   

           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
	
        
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">

     
      <div style="clear:both;"></div>
    </div>
  </div>
</div>

</html>
