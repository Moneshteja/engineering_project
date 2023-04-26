<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%> <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type='text/javascript'>

function saveTextAsFile()
{
	var textToWrite = document.getElementById("textarea").value;
	var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
	var fileNameToSaveAs = "File.txt";

	var downloadLink = document.createElement("a");
	downloadLink.download = fileNameToSaveAs;
	downloadLink.innerHTML = "Download File";
	if (window.webkitURL != null)
	{
		// Chrome allows the link to be clicked
		// without actually adding it to the DOM.
		downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
	}
	else
	{
		// Firefox requires the link to be added to the DOM
		// before it can be clicked.
		downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
		downloadLink.onclick = destroyClickedElement;
		downloadLink.style.display = "none";
		document.body.appendChild(downloadLink);
	}

	downloadLink.click();
}

function destroyClickedElement(event)
{
	document.body.removeChild(event.target);
}



</script>



<title>Download2</title>
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
          <li><a href="DataOwnerLogin.html">Data Owner </a></li>
          <li><a href="EndUserLogin.html">End User</a></li>
          <li class="active"><a href="CloudServerLogin.html">Cloud Server</a></li>
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
    
          <h2><span class="style4">Dowload Your File    </span> <span class="style5">-----  </span><a href="EndUserMainjsp.jsp">Back</a></h2>
         
            <%
		  	
		    	try 
				{
				
				
           		String ename=(String)application.getAttribute("uname");
		  		String file = request.getParameter("t1");
				String trapdoor=request.getParameter("t12");
				String sk=request.getParameter("t13");
				
				application.setAttribute("file",file);
				application.setAttribute("sk",sk);
				
				String status="Yes";
				
				String strQuery = "select * from cloudserver where fname='"+file+"' ";
				ResultSet rs = connection.createStatement().executeQuery(strQuery);
					if(rs.next()==true)
					{
						String ct=rs.getString(3);
						String td=rs.getString(4);
						String sk1=rs.getString(5);
						String rank=rs.getString(6);
						
			
						String keys = "ef50a0ef2c3e3a5f";
						byte[] keyValue1 = keys.getBytes();
      					Key key1 = new SecretKeySpec(keyValue1,"AES");
      					Cipher c1 = Cipher.getInstance("AES");
      					c1.init(Cipher.DECRYPT_MODE, key1);
      					String decryptedValue = new String(Base64.decode(ct.getBytes()));
						String td1 = new String(Base64.decode(td.getBytes()));
						String sk11 = new String(Base64.decode(sk1.getBytes()));
				
						if(td1.equalsIgnoreCase(trapdoor) & sk11.equalsIgnoreCase(sk))
						{
						
						String strQuery1 = "select * from srequest where status='"+status+"' ";
					    ResultSet rs1 = connection.createStatement().executeQuery(strQuery1);
					
					       if(rs1.next()==true)
						 {
						int updaterank = Integer.parseInt(rank)+1;
						String strQuery2 = "update cloudserver set rank='"+updaterank+"' where fname='"+file+"'";
						connection.createStatement().executeUpdate(strQuery2);	
			%>
		  </p>
		  <p align="center" class="style1">File Contents</p>
		  
		    <label>
	            <div align="center">
	              <textarea name="text" id="textarea" cols="45" rows="17"><%=decryptedValue%></textarea>
	              <br/>
	              <br/>
	              <td><button onClick="saveTextAsFile()">Download</button>
                  <p><a href="Download.jsp">Back</a></p></td>
            </div>
		    </label>
		  <p align="center">&nbsp; </p>
		  <p>
		    <%	
			}
			else
			{%>
			  
			  <p>
		  <h1 class="style1">No Search Permission !!!</h1>
		  </p>
			  
			<%}
			}
			else
			{
			%>
			<p>
		  <h1 class="style1">Trapdoor / Secret Key Mismatch !!!</h1>
		  </p><br />
						<p><a href="Download.jsp">Back</a></p>
			<%
			
			String type="Key Attacker";
			SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
						SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

						Date now = new Date();
		
						String strDate = sdfDate.format(now);
						String strTime = sdfTime.format(now);
						String dt = strDate + "   " + strTime;
				
						String user = (String) application.getAttribute("name");
						
						String strQuery22 = "insert into keyattacker(fname,sk,type,dt,Aname) values('"+file+"','"+sk+"','"+type+"','"+dt+"','"+ename+"')";
						connection.createStatement().executeUpdate(strQuery22);
			}
					
			}
					else
					{
						
		%>
	      </p>
		  <p>
		  <h1 class="style1">File Doesn't Exist !!!</h1>
		  </p><br />
						<p><a href="Download.jsp">Back</a></p>
	<%
					}
				
	 			
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
