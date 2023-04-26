<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>End User Main</title>
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
.style2 {color: #6d6d6d}
.style3 {
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
      <div class="logo">
        <h1><a href="index.html" class="style1">Privacy Preserving Searchable Encryption with Fine Grained Access Control
</a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li><a href="index.html"><span>Home Page</span></a></li>
          <li><a href="DataOwnerLogin.html">Data Owner </a></li>
          <li class="active"><a href="EndUserLogin.html">End User</a></li>
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
      <div class="mainbar">
        <div class="article">
          <h2><span> WELCOME TO END USER :: </span><%=application.getAttribute("uname") %></span></h2>
          
          <div class="clr"></div>
        </div>
        <div class="article">
          <h2><span></span>Multi Keyword Search </h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
          <div class="img"><img src="images/img2.jpg" width="171" height="207" alt="" class="fl" /></div>
          <div class="post_content">
            <p align="justify" class="style3">Searchable Encryption (SE) schemes provide security and privacy to the cloud data. The existing SE approaches enable multiple users to perform search operation by using various schemes like Broadcast Encryption (BE), Attribute-Based Encryption (ABE), etc. However, these schemes do not allow<br />
multiple users o perform the search operation over the encrypted data of multiple owners. Some SE schemes involve a Proxy Server (PS) that allow multiple users to perform the search operation. However, these approaches incur huge computational burden on PS due to the repeated encryption of the user queries for transformation purpose so as to ensure that users’ query is searchable over the encrypted data of multiple owners. Hence, to eliminate this computational burden on PS, this paper proposes a secure proxy server approach that performs the search operation without transforming the user queries. This approach also returns the top-k relevant documents to the user queries by using Euclidean distance similarity approach. Based on the experimental study, this approach is efficient with respect to search time and accuracy.</p>
          </div>
        </div>
        </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            <span>
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
            </span>
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
        </div>
        <div class="clr"></div>
        <div class="gadget">
          <h2 class="star"><span>Home</span> Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
             <li><a href="EndUserMainjsp.jsp">Home</a></li>
			 <li><a href="RequestFileSearch.jsp">Request File Search</a></li>
			 <li><a href="ViewAllSearchResponse.jsp">File Search Response</a></li>
			  <li><a href="Search.jsp">Search</a></li>
			  <li><a href="Download.jsp">Download</a></li>
            <li><a href="index.html">Log Out</a></li>
          </ul>
        </div>
        <div class="gadget">
          <h2 class="star">&nbsp;</h2>
          <ul class="ex_menu"><li class="style2"></li>
            <li></li>
          </ul>
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
