<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.dateitem.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.restaurant.model.*" %>
<%@ page isELIgnored="false" %>

<%@ include file="header.file"%>

<%
DateItemVO dateItemVO = (DateItemVO) request.getAttribute("dateItemVO");
Long now = System.currentTimeMillis();
Long candatetimemin = now + 3600000;
Long candatetimemax = candatetimemin +5184000000L;
SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd'T'HH:00");
SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
Timestamp timemin = new Timestamp(candatetimemin);
Timestamp timemax = new Timestamp(candatetimemax);
String tmin = sdf1.format(timemin);
String tmax = sdf2.format(timemax);

%>





<head>
<title>約會商品上架</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>



<%@ include file="nav.file"%>
<%@ include file="sidelist.file"%>


<div class="col-md-offset-1 col-md-8 main-page-show">

<h4>選擇商品內容:<font color=red><b>*</b></font>為必填欄位</h4>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>	
	</font>
</c:if>

<form action="dateitem.do" method=post enctype="multipart/form-data">
<table class="table">
<!-- 	<tr> -->
<!-- 		<td>賣家會員編號:<font color=red><b>*</b></font></td> -->
<!-- 		<td><input type="TEXT" name="sellerNo" size="45"  -->
<%-- 			 value="${param.sellerno}"/></td> --%>
<!-- 	</tr> -->
	
	<tr>
		<jsp:useBean id="restSvc" scope="page" class="com.restaurant.model.RestaurantService" />
		<td>選擇餐廳:<font color=red><b>*</b></font></td>
		<td><select size="1" name="restListNo">
			<c:forEach var="rest" items="${restSvc.all}">
				<option value="${rest.restNo}" ${(rest.restNo==dateItemVO.restListNo)? 'selected':'' } >${rest.restName}
			</c:forEach>
			
		</select></td></tr>
		
		

	
	<tr>
		<td>選擇你的寵物:<font color=red><b>*</b></font></td>
		<td><select size="1" name="petNo">
			<c:forEach var="pet" items="${myPetList}">
				<option value="${pet.petNo}" ${(pet.petNo==dateItemVO.petNo)? 'selected':'' } >${pet.petName}
			</c:forEach>
		</select></td>
	</tr>
	
		<tr>
		<td>約會價格:</td>
		<td><input type="TEXT" name="dateItemPrice" size="45"
			value="<%= (dateItemVO==null)? "" : dateItemVO.getDateItemPrice()%>" /></td>
	</tr>
	
	<tr>
		<td>約會商品標題:</td>
		<td><input type="TEXT" name="dateItemTitle" size="45"
			value="<%= (dateItemVO==null)? "" : dateItemVO.getDateItemTitle()%>" /></td>
	</tr>
	
		<tr>
		<td>約會商品描述:</td>
		
	<td><input type="text" name="dateItemText" size="45"
			value="<%= (dateItemVO==null)? "" : dateItemVO.getDateItemText()%>" /></td>
	</tr>
	
	<tr><td>約會時間(60天內):</td><td><input type="datetime-local" max=<%=tmax%> min=<%=tmin%> step="1800" name="time"></td></tr>
	
	
	
	<tr><td>買方人數限制:<font color=red><b>*</b></font></td>
	<td>
	<select name="dateItemPeople">
  	<option value="1" selected>1人</option>
 	 <option value="2">2人</option>
	</select>
	</tr>
	
	<tr><td>賣方友人參與:<font color=red><b>*</b></font></td>
	<td>
	<select name="hasMate">
  	<option value="false" selected>沒有</option>
 	 <option value="true">有</option>
	</select>
	</tr>
	
	<label class="control-label">上傳約會圖片</label>
	<input id="input-1" type="file" class="file" name="dateItemImg" data-show-upload="false" data-show-caption="true">
	
<!-- 	<input type="file" class="file" name="dateItemImg" > -->
	<tr><td><input type="hidden" name="action" value="insert" ></td></tr>
	<tr><td><input type="submit" value="上架商品" ></td></tr>
	
</table>
</FORM>

</div>
<BR>
<BR>
<BR>

<%@ include file="footer.file"%>

