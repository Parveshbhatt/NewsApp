<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>home.jsp</title>
<link rel="stylesheet" href="CSS/indexjsp.css">
  <meta charset="utf-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<style>
		.side-nav{
			border: 3px solid black;
			padding: 5px, 5px;
		}
		
		h1{
			margin-left:300px;
		}
	</style>
</head>
<body>

<div class="jumbotron text-center text-white" style="margin-bottom:0;">
  <h2 style="font-size:50px;">NewsApp</h2>
  <p>Brings you the live latest news</p> 
</div>

	
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="index.jsp">NewsApp</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="index.jsp">Home</a>
      </li>	
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


	<%
	String apiKey = "f7bc091ce9ae4c3389cc705337b177be";
    String headlineNewsAPIEndpoint = "https://newsapi.org/v2/top-headlines?country=in&apiKey="+apiKey;
	String entertainmentNewsAPIEndpoint = "https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey="+apiKey;
	String healthNewsAPIEndpoint = "https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey="+apiKey;
	String technologyNewsAPIEndpoint = "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey="+apiKey;
	String scienceNewsAPIEndpoint = "https://newsapi.org/v2/top-headlines?country=in&category=science&apiKey="+apiKey;
	String sportsNewsAPIEndpoint = "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey="+apiKey;
	String businessNewsAPIEndpoint = "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey="+apiKey;

    try {
    	
    	// 1. Create URL
    	URL headlineUrl = new URL(headlineNewsAPIEndpoint);
    	
    	// 2. Create URLConnection
    	URLConnection headlineConnection =  headlineUrl.openConnection(); // Hit the Endpoint
    	
    	// 3. Read JSON Data as Bytes
    	InputStream headlineStream = headlineConnection.getInputStream();
    	BufferedInputStream headlineBuffer = new BufferedInputStream(headlineStream);
    	
    	// 4. Convert Byte data into String
    	byte[] headlineBytes = headlineBuffer.readAllBytes();
    	String headlineResponse = new String(headlineBytes);
    	
    	// The String response is a Structured response. Here it is JSON 
    	// Java Script Object Notation
    	System.out.println(headlineResponse);
		
    	
    	// Next Step: WE need to represent String as JSON
    	// For this we need to use .jar file json
    	
    	JSONObject headlineObject = new JSONObject(headlineResponse);
    	
    	System.out.println(headlineObject.getString("status"));
    	System.out.println(headlineObject.getInt("totalResults"));
    	%>
    	
    	<div class="container-fluid   pt-3  border" style="margin-top:3px;">
    	<div class="row">
    	<div class="col-sm-3 bg-dark text-white text-center side-nav">
    	<h2>Categories</h2>
    	<ul class="nav nav-tabs flex-column " role="tablist">
		    <li class="nav-item">
		      <a class="nav-link active" data-toggle="tab" href="#home">Top Headlines</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="tab" href="#entertainment">Entertainment</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="tab" href="#health">Health</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link " data-toggle="tab" href="#technology">Technology</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link " data-toggle="tab" href="#science">Science</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link " data-toggle="tab" href="#sports">Sports</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link " data-toggle="tab" href="#business">Business</a>
		    </li>
		 </ul>
    	</div>
    	<div class="col-sm-9" >
    	
    	<div class="tab-content" style="border:2px solid black; padding:3px 8px;;">
    	<div id="home" class="tab-pane active"><br>
    	<h1>Headlines from India</h1>
    
    	<br>
    	
 		<% 
    	JSONArray headlineArray = headlineObject.getJSONArray("articles");
    	
    	for(int i=0; i<headlineArray.length(); i++) {
    		JSONObject obj = headlineArray.getJSONObject(i);
    
    		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    		System.out.println(obj.getJSONObject("source").getString("name"));
    		System.out.println(obj.getString("title"));
    		System.out.println(obj.get("content"));
    		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    	%>
    	
    	
    	<h2><%=obj.getString("title")%></h2>
    	<p style="font-size: 16px;">(<%=obj.get("description") %>)</p>
    	
    	<p><strong>Source Name:</strong><%=obj.getJSONObject("source").getString("name") %></p>
    	<p><strong>PublishedAt:</strong><%=obj.getString("publishedAt") %></p>
    	
    	<img src="<%=obj.get("urlToImage") %>" alt="imageOfNews" style="width:500px; height:300px; margin-left:50px;">
    	<p style="font-size: 17px;"><%=obj.get("content")%></p>
    	
    	<h4><a href="<%=obj.getString("url") %>">Read more.....</a></h4>
    	
    	<hr><hr>
    	
    	<%
    	}
    	%>
    	</div>
    	
    	<div id="entertainment" class="tab-pane fade"><br>
    	<h1>Entertainment Headlines</h1>
    
    	<br>
    	
 		<% 
 		
 		URL entertainmentUrl = new URL(entertainmentNewsAPIEndpoint);
 		
 		URLConnection entertainmentConnection = entertainmentUrl.openConnection();
 		
 		InputStream entertainmentStream = entertainmentConnection.getInputStream();
 		BufferedInputStream entertainmentBuffer = new BufferedInputStream(entertainmentStream);
 		
 		byte[] entertainmentBytes = entertainmentBuffer.readAllBytes();
 		String entertainmentString = new String(entertainmentBytes);
 		
 		JSONObject entertainmentObject = new JSONObject(entertainmentString);
 		
 		
 		
    	JSONArray entertainmentArray = entertainmentObject.getJSONArray("articles");
    	
    	for(int i=0; i<entertainmentArray.length(); i++) {
    		JSONObject obj = entertainmentArray.getJSONObject(i);
    
    		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    		System.out.println(obj.getJSONObject("source").getString("name"));
    		System.out.println(obj.getString("title"));
    		System.out.println(obj.get("content"));
    		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    	%>
    	
    	
    	<h2><%=obj.getString("title")%></h2>
    	<p style="font-size: 16px;">(<%=obj.get("description") %>)</p>
    	
    	<p><strong>Source Name:</strong><%=obj.getJSONObject("source").getString("name") %></p>
    	<p><strong>PublishedAt:</strong><%=obj.getString("publishedAt") %></p>
    	
    	<img src="<%=obj.get("urlToImage") %>" alt="imageOfNews" style="width:500px; height:300px; margin-left:50px;">
    	<p style="font-size: 17px;"><%=obj.get("content")%></p>
    	
    	<h4><a href="<%=obj.getString("url") %>">Read more.....</a></h4>
    	
    	<hr><hr>
    	
    	<%
    	}
    	%>
    	</div>
    	
    <div id="health" class="tab-pane fade"><br>
    	<h1>Health Headlines</h1>
    
    	<br>
    	
 		<% 
 		
 		URL healthUrl = new URL(healthNewsAPIEndpoint);
 		
 		URLConnection healthConnection = healthUrl.openConnection();
 		
 		InputStream healthStream = healthConnection.getInputStream();
 		BufferedInputStream healthBuffer = new BufferedInputStream(healthStream);
 		
 		byte[] healthBytes = healthBuffer.readAllBytes();
 		String healthString = new String(healthBytes);
 		
 		JSONObject healthObject = new JSONObject(healthString);
 		
 		
 		
    	JSONArray healthArray = healthObject.getJSONArray("articles");
    	
    	for(int i=0; i<healthArray.length(); i++) {
    		JSONObject obj = healthArray.getJSONObject(i);
    
    		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    		System.out.println(obj.getJSONObject("source").getString("name"));
    		System.out.println(obj.getString("title"));
    		System.out.println(obj.get("content"));
    		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    	%>
    	
    	
    	<h2><%=obj.getString("title")%></h2>
    	<p style="font-size: 16px;">(<%=obj.get("description") %>)</p>
    	
    	<p><strong>Source Name:</strong><%=obj.getJSONObject("source").getString("name") %></p>
    	<p><strong>PublishedAt:</strong><%=obj.getString("publishedAt") %></p>
    	
    	<img src="<%=obj.get("urlToImage") %>" alt="imageOfNews" style="width:500px; height:300px; margin-left:50px;">
    	<p style="font-size: 17px;"><%=obj.get("content")%></p>
    	
    	<h4><a href="<%=obj.getString("url") %>">Read more.....</a></h4>
    	
    	<hr><hr>
    	
    	<%
    	}
    	%>
    	</div>
    	
    <div id="technology" class="tab-pane fade"><br>
    	<h1>Technology Headlines</h1>
    
    	<br>
    	
 		<% 
 		
 		URL techUrl = new URL(technologyNewsAPIEndpoint);
 		
 		URLConnection techConnection = techUrl.openConnection();
 		
 		InputStream techStream = techConnection.getInputStream();
 		BufferedInputStream techBuffer = new BufferedInputStream(techStream);
 		
 		byte[] techBytes = techBuffer.readAllBytes();
 		String techString = new String(techBytes);
 		
 		JSONObject techObject = new JSONObject(techString);
 		
 		
 		
    	JSONArray techArray = techObject.getJSONArray("articles");
    	
    	for(int i=0; i<techArray.length(); i++) {
    		JSONObject obj = techArray.getJSONObject(i);
    
    		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    		System.out.println(obj.getJSONObject("source").getString("name"));
    		System.out.println(obj.getString("title"));
    		System.out.println(obj.get("content"));
    		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    	%>
    	
    	
    	<h2><%=obj.getString("title")%></h2>
    	<p style="font-size: 16px;">(<%=obj.get("description") %>)</p>
    	
    	<p><strong>Source Name:</strong><%=obj.getJSONObject("source").getString("name") %></p>
    	<p><strong>PublishedAt:</strong><%=obj.getString("publishedAt") %></p>
    	
    	<img src="<%=obj.get("urlToImage") %>" alt="imageOfNews" style="width:500px; height:300px; margin-left:50px;">
    	<p style="font-size: 17px;"><%=obj.get("content")%></p>
    	
    	<h4><a href="<%=obj.getString("url") %>">Read more.....</a></h4>
    	
    	<hr><hr>
    	
    	<%
    	}
    	%>
    	</div>
    	
    	
    	<div id="science" class="tab-pane fade"><br>
    	<h1>Science Headlines</h1>
    
    	<br>
    	
 		<% 
 		
 		URL scienceUrl = new URL(scienceNewsAPIEndpoint);
 		
 		URLConnection scienceConnection = scienceUrl.openConnection();
 		
 		InputStream scienceStream = scienceConnection.getInputStream();
 		BufferedInputStream scienceBuffer = new BufferedInputStream(scienceStream);
 		
 		byte[] scienceBytes = scienceBuffer.readAllBytes();
 		String scienceString = new String(scienceBytes);
 		
 		JSONObject scienceObject = new JSONObject(scienceString);
 		
 		
 		
    	JSONArray scienceArray = scienceObject.getJSONArray("articles");
    	
    	for(int i=0; i<scienceArray.length(); i++) {
    		JSONObject obj = scienceArray.getJSONObject(i);
    
    		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    		System.out.println(obj.getJSONObject("source").getString("name"));
    		System.out.println(obj.getString("title"));
    		System.out.println(obj.get("content"));
    		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    	%>
    	
    	
    	<h2><%=obj.getString("title")%></h2>
    	<p style="font-size: 16px;">(<%=obj.get("description") %>)</p>
    	
    	<p><strong>Source Name:</strong><%=obj.getJSONObject("source").getString("name") %></p>
    	<p><strong>PublishedAt:</strong><%=obj.getString("publishedAt") %></p>
    	
    	<img src="<%=obj.get("urlToImage") %>" alt="imageOfNews" style="width:500px; height:300px; margin-left:50px;">
    	<p style="font-size: 17px;"><%=obj.get("content")%></p>
    	
    	<h4><a href="<%=obj.getString("url") %>">Read more.....</a></h4>
    	
    	<hr><hr>
    	
    	<%
    	}
    	%>
    	</div>
    	
    	<div id="sports" class="tab-pane fade"><br>
    	<h1>Sports Headlines</h1>
    
    	<br>
    	
 		<% 
 		
 		URL sportsUrl = new URL(sportsNewsAPIEndpoint);
 		
 		URLConnection sportsConnection = sportsUrl.openConnection();
 		
 		InputStream sportsStream = sportsConnection.getInputStream();
 		BufferedInputStream sportsBuffer = new BufferedInputStream(sportsStream);
 		
 		byte[] sportsBytes = sportsBuffer.readAllBytes();
 		String sportsString = new String(sportsBytes);
 		
 		JSONObject sportsObject = new JSONObject(sportsString);
 		
 		
 		
    	JSONArray sportsArray = sportsObject.getJSONArray("articles");
    	
    	for(int i=0; i<sportsArray.length(); i++) {
    		JSONObject obj = sportsArray.getJSONObject(i);
    
    		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    		System.out.println(obj.getJSONObject("source").getString("name"));
    		System.out.println(obj.getString("title"));
    		System.out.println(obj.get("content"));
    		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    	%>
    	
    	
    	<h2><%=obj.getString("title")%></h2>
    	<p style="font-size: 16px;">(<%=obj.get("description") %>)</p>
    	
    	<p><strong>Source Name:</strong><%=obj.getJSONObject("source").getString("name") %></p>
    	<p><strong>PublishedAt:</strong><%=obj.getString("publishedAt") %></p>
    	
    	<img src="<%=obj.get("urlToImage") %>" alt="imageOfNews" style="width:500px; height:300px; margin-left:50px;">
    	<p style="font-size: 17px;"><%=obj.get("content")%></p>
    	
    	<h4><a href="<%=obj.getString("url") %>">Read more.....</a></h4>
    	
    	<hr><hr>
    	
    	<%
    	}
    	%>
    	</div>
    	
    	
    	<div id="business" class="tab-pane fade"><br>
    	<h1>Business Headlines</h1>
    
    	<br>
    	
 		<% 
 		
 		URL businessUrl = new URL(businessNewsAPIEndpoint);
 		
 		URLConnection businessConnection = businessUrl.openConnection();
 		
 		InputStream businessStream = businessConnection.getInputStream();
 		BufferedInputStream businessBuffer = new BufferedInputStream(businessStream);
 		
 		byte[] businessBytes = businessBuffer.readAllBytes();
 		String businessString = new String(businessBytes);
 		
 		JSONObject businessObject = new JSONObject(businessString);
 		
 		
 		
    	JSONArray businessArray = businessObject.getJSONArray("articles");
    	
    	for(int i=0; i<businessArray.length(); i++) {
    		JSONObject obj = businessArray.getJSONObject(i);
    
    		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    		System.out.println(obj.getJSONObject("source").getString("name"));
    		System.out.println(obj.getString("title"));
    		System.out.println(obj.get("content"));
    		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    	%>
    	
    	
    	<h2><%=obj.getString("title")%></h2>
    	<p style="font-size: 16px;">(<%=obj.get("description") %>)</p>
    	
    	<p><strong>Source Name:</strong><%=obj.getJSONObject("source").getString("name") %></p>
    	<p><strong>PublishedAt:</strong><%=obj.getString("publishedAt") %></p>
    	
    	<img src="<%=obj.get("urlToImage") %>" alt="imageOfNews" style="width:500px; height:300px; margin-left:50px;">
    	<p style="font-size: 17px;"><%=obj.get("content")%></p>
    	
    	<h4><a href="<%=obj.getString("url") %>">Read more.....</a></h4>
    	
    	<hr><hr>
    	
    	<%
    	}
    	%>
    	</div>
    	
  
    	<%
    	
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