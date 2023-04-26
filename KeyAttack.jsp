
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Key Attack</title>
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
.style8 {font-size: 18; color: #FF0000; }
.style9 {color: #FF0000}
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
          <li class="active"><a href="index.html"><span>Home</span> Page </a></li>
          <li><a href="DataOwnerLogin.html">Data Owner </a></li>
          <li><a href="EndUserLogin.html">End User</a></li>
          <li><a href="CloudServerLogin.html">Cloud Server</a>
          
        
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
      <div class="mainbar">
        <div class="article">
          <h2><span>WELCOME TO HOME PAGE </span></h2>
          <p class="infopost"><a href="#" class="com"><span>11</span></a></p>
          <div class="clr"></div>
          <div class="clr"></div>
        </div>
        <div class="article">
          <h2><span></span><form action="KeyAttack.jsp" method="post" name="form1" id="form1">
<table width="616" border="0" align="left">
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
       	<tr>
		<td width="333"><span class="style8">Enter File Name :-</span></td>
		<td width="273"><label> <input required name="t1"
			type="text"  size="40" /> </label></td>
	</tr>
	<tr>
		<td><span class="style9"></span></td>
		<td>&nbsp;</td>
	</tr>

	<tr>
		<td><span class="style8">Enter Key Name :-</span></td>
		<td><input name="t2" type="text" size="40" /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
		
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
		<div align="right"><input type="submit" name="Submit"
			value="Attack" /></div>		</td>
	</tr>
          </table>
            </form></h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
        </div>
        </div>
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


 <%
	
	
	try {
	
			
			String file = request.getParameter("t1");
			String on = request.getParameter("t2");
				

            String type="Key Attacker";
			SimpleDateFormat sdfDate = new SimpleDateFormat(
					"dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			

			
				
				String strQuery2 = "update  cloudserver set sk='" + on
						+ "' where fname='" + file + "' ";
				connection.createStatement().executeUpdate(strQuery2);
			

			String strQuery25 = "insert into keyattacker(fname,sk,type,dt) values('"
					+ file
					+ "','"
					+ on
					+ "','"
					+ type
					+ "','" + dt + "') ";
			connection.createStatement().executeUpdate(strQuery25);
			
			%>
			

<div align="centre"><h1 >Attacked Success Fully!!!</h1></div>
			
			
			<%}
			
			catch(Exception ex)
			{
			out.println(ex);
			}
			
			
			
%>







					