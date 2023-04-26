<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%> <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Verified</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-georgia.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style1 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="searchform"></div>
      <div class="menu_nav">
        <ul>
          <li ><a href="index.html"><span>Home Page</span></a></li>
          <li class="active"><a href="support.html"><span>Data User </span></a></li>
          <li><a href="about.html"><span>Cloud Servers </span></a></li>
          <li><a href="blog.html"><span>END users </span></a></li>
          <li></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="logo">
        <h1><a href="#">CDStore</a></h1>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> 
          <p><a href="#"><img src="images/slide1.jpg" width="920" height="320" alt="" /><span><big>Sed An Efficient Multi-User Searchable Encryption Scheme without Query Transformation Over Outsourced Encrypted Data
</big></span></a> <a href="#"><img src="images/slide2.jpg" width="920" height="320" alt="" /></a><a href="#"><span><big>The An Efficient Multi-User Searchable Encryption Scheme without Query Transformation Over Outsourced Encrypted Data
</big></span></a> <a href="#"><img src="images/slide3.jpg" width="920" height="320" alt="" /><span><big>An Efficient Multi-User Searchable Encryption Scheme without Query Transformation Over Outsourced Encrypted Data
</big></span></a> </p>
        </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2 class="style1"> Secret Key Verification Details </h2>
          <p>&nbsp;</p>
		  <%
	 	
	 	String cssk=null, ownersk=null;
		
			
				String osk="",on1="";

	 	try {
		
		    String keys = "ef50a0ef2c3e3a5f";
	
	 		String file = request.getParameter("fname");
	
	 		Statement st = connection.createStatement();

	 		String on=(String)application.getAttribute("oname");

          	    byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE, key);

	 		String strQuery2 = "select * from cloudserver where fname='"+ file + "' ";
	 	

	 		ResultSet rs = st.executeQuery(strQuery2);
	 		if (rs.next()) {
                 
				 on1=rs.getString("Oname");
				String oname = new String(Base64.decode(on1.getBytes()));
				
				if(oname.equals(on))
				{
				 cssk= rs.getString("sk");
				}
	 			}
				
      			String cssk1 = new String(Base64.decode(cssk.getBytes()));
				
			    String strQuery3 = "Select * FROM ownerfiles where fname='"+ file + "' and Oname='" + on + "' ";

							ResultSet rss = st.executeQuery(strQuery3);
							if (rss.next()) {
								
								ownersk = rss.getString("sk");
								
								}

							if(cssk1.equals(ownersk) )
							{
							%>
							<p>
								<h1><%=cssk1 %>  is Secured !!!</h1>
							</p>

							<%
							}	
							
							else {
									
								%>
							<p>
							<h2><%=cssk1 %>  is Attacked by Attacker !!! </h2>  <br />

							</p>
						   <%				


					 		}
							 						
		  	connection.close();

		  	}
			
			catch (Exception e) {
		  		out.println(e.getMessage());
		  		e.printStackTrace();
		  	} %>
        



         
		  
		  
          <div class="clr"></div>
          <div class="post_content"><div class="post_content"><p align="justify" class="style1">&nbsp;</p>
            </div>
            <p class="spec"><a href="DataOwnerMain1.jsp" class="rm">Back &raquo;</a></p>
          </div>
          <div class="clr"></div>
        </div>
        </div>
      <div class="sidebar">
        
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

