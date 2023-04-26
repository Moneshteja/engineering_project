<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%> <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Cloud Server</title>
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
          <li ><a href="CloudServerLogin.html">Cloud Server</a></li>
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
    
          <h2><span class="style4 style5">View All Your Data</span><span class="style4"> File Name</span> <span class="style5">-----  </span><a href="DataOwnerMain1.jsp">Back</a></h2>
         
          <table width="965" border="1" align="center">
  <tr>
    <td width="140" height="32" bgcolor="#FFFF00"><div align="center" class="style5"><span class="style3">File Name </span></div></td>
      <td width="293" bgcolor="#FFFF00"><div align="center" class="style5"><span class="style3">Trapdoor </span></div></td>
    <td width="178" bgcolor="#FFFF00"><div align="center" class="style5"><span class="style3">Secret Key </span></div></td>
    <td width="115" bgcolor="#FFFF00"><div align="center" class="style5"><span class="style3">Rank </span></div></td>
    <td width="205" bgcolor="#FFFF00"><div align="center" class="style5"><span class="style3">Date & Time</span></div></td>
  </tr>

<%
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
	String Dvalue="",Dvalue1="",Dvalue2="";
	
     try 
	{
        
          String keys = "ef50a0ef2c3e3a5f";
      	  String oname=(String)application.getAttribute("oname");
			
      		
      	   String query="select * from cloudserver "; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		i=rs.getInt(1);
		s2=rs.getString(2);
		s3=rs.getString(4);
		s4=rs.getString(5);
		s5=rs.getString(6);
		s6=rs.getString(7);
		s7=rs.getString(8);
		
				byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.DECRYPT_MODE, key);
      			 Dvalue = new String(Base64.decode(s7.getBytes()));
				 Dvalue1 = new String(Base64.decode(s3.getBytes()));
				 Dvalue2 = new String(Base64.decode(s4.getBytes()));
				
				
				if(oname.equals(Dvalue))
				{
	
		%>

  <tr>
    <td height="29"><div align="center"><%=s2%></div></td>
    <td><div align="center"><%=Dvalue1%></div></td>
    <td><div align="center"><%=Dvalue2%></div></td>
	 <td><div align="center"><%=s5%></div></td>
	  <td><div align="center"><%=s6%></div></td>
  </tr>

<%
		}
	 	  }
	  
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
</table>
        
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
