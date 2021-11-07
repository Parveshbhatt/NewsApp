<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>index.html</title>
   <link rel="stylesheet" href="CSS/indexjsp.css">
  <meta charset="utf-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  .carousel-item{
  	margin-left:30px;
  }
  .carousel-inner>.item>img, .carousel-inner>.item>a>img {
        display: block;
        height: auto;
        max-width: 100%;
        line-height: 1;
        margin:auto;
        width: 100%; 
        }
    
    .tech{
    	margin-left:80px;
    }

  </style>
</head>
<body>

	<%
 	String apiKey = "f7bc091ce9ae4c3389cc705337b177be";
    String newsAPIEndpoint = "https://newsapi.org/v2/top-headlines?country=in&apiKey="+apiKey;
    
    String newsAPIEndpointSports = "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey="+apiKey;
    try {
    	
    	// 1. Create URL
    	URL url = new URL(newsAPIEndpoint);
    	URL url2 = new URL(newsAPIEndpointSports);
    	
    	// 2. Create URLConnection
    	URLConnection connection =  url.openConnection(); // Hit the Endpoint
    	URLConnection connection2 =  url2.openConnection(); // Hit the Endpoint
    	
    	// 3. Read JSON Data as Bytes
    	InputStream stream = connection.getInputStream();
    	BufferedInputStream buffer = new BufferedInputStream(stream);
    	
    	InputStream stream2 = connection2.getInputStream();
    	BufferedInputStream buffer2 = new BufferedInputStream(stream2);
    	
    	// 4. Convert Byte data into String
    	byte[] bytes = buffer.readAllBytes();
    	String response1 = new String(bytes);
    	
    	byte[] bytes2 = buffer2.readAllBytes();
    	String response2 = new String(bytes2);
    	// The String response is a Structured response. Here it is JSON 
    	// Java Script Object Notation
    	System.out.println(response1);
    	System.out.println(response2);
		
    	
    	// Next Step: WE need to represent String as JSON
    	// For this we need to use .jar file json
    	
    	JSONObject object = new JSONObject(response1);
    	
    	JSONObject object2 = new JSONObject(response2);
    	
    	
    	
    	System.out.println(object.getString("status"));
    	System.out.println(object.getInt("totalResults"));
    	
    	JSONArray array = object.getJSONArray("articles");
    	
    	JSONArray array2 = object2.getJSONArray("articles");
    	
    	%>
  
	
	

<div class="jumbotron text-center text-white" style="margin-bottom:0;">
  <h2 style="font-size:50px;">NewsApp</h2>
  <p>Brings you the live latest news</p> 
</div>


<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="#">NewsApp</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="home.jsp">India</a>
      </li>  
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
		<a class="nav-link fa fa-google" href="mailto:parvesh1921078@gndec.ac.in"></a>
      </li>   
        <li class="nav-item">
         <a class="nav-link fa fa-linkedin" href="https://www.linkedin.com/in/parvesh-bhatt-5b24b7202/"></a>
      </li>   
        <li class="nav-item">
        <a class="nav-link fa fa-twitter" href="https://twitter.com/?lang=en"></a>
      </li>   
        <li class="nav-item">
        <a class="nav-link fa fa-instagram" href="https://www.instagram.com/parveshbhatt_/"></a>
      </li>   
    </ul>
  </div>  
</nav>

<div class="container" style="margin-top:30px;">
  <div class="row">
    <div class="col-sm-4">
      <h2>SPORTS</h2>
      <h5>Sports Headlines:</h5>
          	<% 
    	for(int i=0; i<4; i++) {
    		JSONObject obj2 = array2.getJSONObject(i);
    
    		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    		System.out.println(obj2.getString("title"));
    		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    	%>
    	<div class="row">
    	<img src="<%=obj2.get("urlToImage") %>" alt="imageOfNews" class="fakeimg " style="border-radius:25px;">
    	</div>
    	<div class="row">
    	<a href="<%=obj2.getString("url") %>">
    	   <%=obj2.getString("title")%></a>
    	   </div>
     <% 
    	}
    %>
    <br><br>
     <h3 class="bg-primary text-white">Contact Us</h3>
      <ul class="nav nav-pills flex-column">
        <li class="nav-item">
          <a class="nav-link fa fa-instagram" href="https://www.instagram.com/parveshbhatt_/"></a>
        </li>
        <li class="nav-item">
          <a class="nav-link fa fa-linkedin" href="https://www.linkedin.com/in/parvesh-bhatt-5b24b7202/"></a>
        </li>
        <li class="nav-item">
          <a class="nav-link fa fa-google" href="mailto:parvesh1921078@gndec.ac.in"></a>
        </li>
        <li class="nav-item">
          <a class="nav-link fa fa-twitter" href="https://twitter.com/?lang=en"></a>
        </li>
      </ul>
      <hr class="d-sm-none">
      <br>
    </div>
    
    <div class="col-sm-8">
      <h2>Top Headlines</h2>
      <h5>Here are some top news from world</h5>
      
      <div id="demo" class="carousel slide carousel-fade" data-ride="carousel">
  <ul class="carousel-indicators">
      <li data-target="#demo" data-slide-to="0" class="active"></li>
  
  		<%
  			for(int i=1; i<10; i++){
  		%>	
  	      <li data-target="#demo" data-slide-to="<%=i %>"></li>

  		<% 
  			}
  		%>
  </ul>
  <div class="carousel-inner">
   <div class="carousel-item active">
      <img src="img/jumbotronBg.jpg" alt="TheNews" width="100%" height="400">
      <div class="carousel-caption">
        <h1>The NewsApp Headlines</h1>
      </div>   
    </div>
    	<% 
    	
    	for(int i=0; i<10; i++) {
    		JSONObject obj = array.getJSONObject(i);
    
    		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    		System.out.println(obj.getString("title"));
    		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    	%>
    	<div class="carousel-item ">
    	 <a href="<%=obj.getString("url") %>">
    	<img src="<%=obj.get("urlToImage") %>" alt="imageOfNews" width="100%" height="400">
    	</a>
      <div class="carousel-caption left-align" style="color:white;">
     
        <h3><%=obj.getString("title")%></h3>
        
      </div>   
    </div>
    <%
    	}
    %>
 
  </div>
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
  </div>
  <br><br>
  <div class = "tech">
  <h2>Technology</h2>
  
  <%
  String newsAPIEndpointTech = "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey="+apiKey;
 
  	
  	// 1. Create URL
  	URL techurl = new URL(newsAPIEndpointTech);
  	
  	// 2. Create URLConnection
  	URLConnection connection3 =  techurl.openConnection(); // Hit the Endpoint
  	
  	// 3. Read JSON Data as Bytes
  	InputStream stream3 = connection3.getInputStream();
  	BufferedInputStream buffer3 = new BufferedInputStream(stream3);
  	
  	// 4. Convert Byte data into String
  	byte[] bytes3 = buffer3.readAllBytes();
  	String response3 = new String(bytes3);
  	
  	// The String response is a Structured response. Here it is JSON 
  	// Java Script Object Notation
  	System.out.println(response3);
		
  	
  	// Next Step: WE need to represent String as JSON
  	// For this we need to use .jar file json
  	
  	JSONObject object3 = new JSONObject(response3);
  	
  	System.out.println(object3.getString("status"));
  	System.out.println(object3.getInt("totalResults"));
  	
  	JSONArray array3 = object3.getJSONArray("articles");
  	
  	for(int i=0; i<4; i++) {
  		JSONObject obj3 = array3.getJSONObject(i);
  
  		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
  		System.out.println(obj3.getString("title"));
  		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
  	%>
  	
  	<div class="row">
  <div class="col-sm"> 
  	<img src="<%=obj3.get("urlToImage") %>" alt="imageOfNews" style="height:200px; border:solid 3px black;">
  </div>
  <div class="col-sm">
  	<h4><%=obj3.getString("title")%></h4>
  	<p> <%=obj3.get("description")%> <a href="<%=obj3.getString("url") %>">Read More...</a></p>
  </div>
	</div>
	<hr>
        
  	<% 
    	}
    	
	} catch (Exception e) {
		e.printStackTrace();
	}	
	
	%>
  </div>
  
  
  </div>
</div>
</div>

<div class="fluid-jumbotron text-center text-white bg-dark" style="margin-bottom:0; height:50px; padding:10px;">
  <p>&copy; NewsApp - All rights reserved</p>
</div>

</body>
</html>
