<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.dateitem.model.*"%>
<%@ page import="com.restaurant.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="java.util.*"%>

<%@ include file="header.file"%>


<jsp:useBean id="dSvc" scope="page"
	class="com.dateitem.model.DateItemService" />
<jsp:useBean id="memSvc" scope="page"
	class="com.member.model.MemberService" />
<%
	List<DateItemVO> listEmps_ByCompositeQuery = (List<DateItemVO>) request
			.getAttribute("listEmps_ByCompositeQuery");
	if (listEmps_ByCompositeQuery != null) {
		pageContext.setAttribute("listEmps_ByCompositeQuery", listEmps_ByCompositeQuery);
	}
%>




<head>
<link href="<%=request.getContextPath() %>/front_end/css/modern-business.css" rel="stylesheet" type="text/css">
<title>���|����</title>
</head>
<body bgcolor='white'>



	<%@ include file="/front_end/frontEndNavBar.file"%>
	<%@ include file="sidelist.file"%>

	<%-- <%@ include file="page3.file"%>	 --%>

	<!-- JSP�H�@�ӥ]�t��u��div�}�l, ���O������</div>�g�bfooter�̭� -->

	<div class="col-xd-12 col-sm-10  main-page-show">
		<div class="row">
			<div class="col-xd-12 col-sm-2">
				<a href="#" class="list-group-item" data-toggle="collapse"
					data-target="#search" data-parent="#menu">���|�ӫ~�d�� <span
					class="glyphicon glyphicon-triangle-bottom pull-right"></span>
				</a>
				<div id="search" class="sublinks collapse">
					<a href="#" class="list-group-item small" data-toggle="modal"
						data-target="#searchSpec">�H����j�M </a> <a
						class="list-group-item small"
						href='<%=request.getContextPath()%>/front_end/dateitem/googleMapQuery.jsp'>�H�a�Ϸj�M</a>
				</div>
			</div>

			<div class="col-xd-12 col-sm-2">
				<button class="btn btn-lg btn-default" id="button1" value="showppl">�H�D�H��ܬ��|</button>
			</div>





			<!-- �ƦX�d��Modal content-->
			<div class="modal fade" id="searchSpec" role="dialog">
				<div class="modal-dialog">

					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">�d�߬��|�ӫ~</h4>
						</div>
						<div class="modal-body">

							<Form
								action="<%=request.getContextPath()%>/front_end/dateitem/dateitem.do"
								method="post">
								<table class="table table-user-information">
									<input type="hidden" name="action"
										value="listDItems_ByCompositeQuery">

									<tr>
										<td class="title">���|���</td>
										<td><input type="text" id="dateMeetingTime"
											name="dateMeetingTime"></td>
									</tr>


									<tr>
										<td class="title">�|���ʧO:</td>
										<td>
											<div class="select-style">
												<select class="filter" name="memGender">
													<option value="" disabled selected>�п�ܥD�H�ʧO</option>
													<option value="">�ҥi</option>
													<option value="0">�k</option>
													<option value="1">�k</option>
													<option value="2">���@�z�S</option>
												</select>
											</div>
										</td>
									</tr>

									<tr>
										<td class="title">�d���ʧO</td>
										<td>
											<div class="select-style">
												<select class="filter" name="petKind">
													<option value="" disabled selected>�п���d��</option>
													<option value="">�ҥi</option>
													<option value="��">��</option>
													<option value="��">��</option>
													<option value="��L">��L</option>
												</select>
											</div>
										</td>
									</tr>

								</table>

								<input type="submit" value="�d��" class="btn btn-primary">

							</Form>
						</div>


					</div>

				</div>
			</div>


		</div>

		<%@ include file="pages/page1_ByCompositeQuery.file"%>
		<div>
		<c:forEach var="dateitem" items="${listEmps_ByCompositeQuery}" varStatus="s"
			begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<c:if test="${s.index%3==0}"> 
				<div class="row">
			</c:if>
			<div class="col-sm-4 ">
				<div class="bg-color">
					<div class="card hovercard">
						<div class="cardheader"
							style="background-image:url('ImgReader?dateItemNo=${dateitem.dateItemNo}&action=dateImg');">

							<input type="hidden" value="${dateitem.sellerNo}"> <input
								class="no1" type="hidden" value="${dateitem.dateItemNo}">

						</div>
						<div class="avatar">
							<input type="hidden" value="${dateitem.sellerNo}"> <img
								class="img1"
								src="ImgReader?sellerNo=${dateitem.sellerNo}&action=memImg">
							<input type="hidden" value="${dateitem.dateItemNo}"> l
						</div>
						<div class="info">
							<div class="title dateDes">
								<a class="dateDes" target="_blank" href="http://scripteden.com/">${dateitem.dateItemTitle}</a>
							</div>
							<div class="desc">${memSvc.getOneMember(dateitem.sellerNo).getMemSname()}</div>
							<div class="desc">${dSvc.getTimeForItem(dateitem.dateMeetingTime)}</div>
							<div class="desc">${dateitem.dateItemLocate}</div>
						</div>
						<div class="bottom">
							<a class="btn btn-info" href=""> �Ա� </a>
						</div>
					</div>
				</div>

			</div>
		
		
			<c:if test="${s.index%3==2}"> 
				</div>
			 </c:if>
		</c:forEach>
		</div>
		<%@ include file="pages/page2_ByCompositeQuery.file"%>


		<!--   <table class="table text-align:center"> -->
		<!-- 	<tr> -->
		<!-- 		<th align="center">�Ϥ�</th> -->
		<!-- 		<th align="center">�ʺ�</th> -->
		<!-- 		<th align="center">�s��</th> -->
		<!-- 		<th align="center">�ɶ�</th> -->
		<!-- 		<th align="center">��a</th> -->
		<!-- 		<th align="center">����</th> -->
		<!-- 		<th align="center">�\�U</th> -->
		<!-- 	</tr> -->

		<%-- <c:forEach var="dateitem" items="${list}"> --%>
		<!-- 	<tr align='center' valign='middle'> -->
		<%-- 		<td><img id="allitemsimg" src="<%=request.getContextPath()%>/ImgReader?dateitemNo=${dateitem.dateItemNo}"></td> --%>
		<%-- 			<td>${memSvc.getOneMember(dateitem.sellerNo).getMemSname()}</td> --%>
		<%-- 			<td>${dateitem.dateItemNo}</td> --%>
		<%-- 			<td>${dSvc.getTimeForItem(dateitem.dateMeetingTime)}</td> --%>
		<%-- 			<td>${dateitem.sellerNo}</td> --%>
		<%-- 			<td>${dateitem.dateItemPrice}</td> --%>
		<%-- 			<td>${dateitem.restListNo}</td> --%>
		<!-- 			<td><a class="btn btn-primary checkit" data-toggle="modal" data-target="#modal-buy" >�ʶR</a></td> -->
		<%-- 			<td><input id="checkvalue" type="hidden" class="checkvalue" value="${dateitem.dateItemNo}" /></td> --%>
		<!-- 		</tr> -->


		<!-- <div id="modal-buy" class="modal fade" role="dialog"> -->
		<!--   <div class="modal-dialog"> -->
		<!--     <div class="modal-content"> -->
		<!--       <div class="modal-header"> -->
		<!--         <button type="button" class="close" data-dismiss="modal">&times;</button> -->
		<!--         <h4 class="modal-title">���|�w�w</h4> -->
		<!--       </div> -->
		<!--       <div class="modal-body"> -->
		<!--         <p>�T�w�w�����|��?</p> -->
		<!--       </div> -->
		<!--       <div class="modal-footer"> -->
		<%--         <a type="button" class="btn btn-default" href="<%=request.getContextPath() %>/front_end/dateitem/dateitem.do?action=buy_date&dateItemNo=${dateitem.dateItemNo}" >�T�{�ʶR</a> --%>
		<!--         <button type="button" class="btn btn-default" data-dismiss="modal">�^�W�@��</button> -->
		<!--       </div> -->
		<!--     </div> -->

		<!--   </div> -->
		<!-- </div> -->









		<%--   </c:forEach> --%>
		<!-- </table> -->

		<!-- <script> -->
		<!-- // function checktime(dateItemNo){ -->
		<!-- // 	e.preventDefault(); -->
		<!-- // 	alert('in'); -->
		<!-- // 	$.ajax -->
		<!-- //     ({ -->
		<!-- //         type: "POST",            -->
		<!-- //         data: 'dateItemNo='+dateItemNo+'&action=checkTime' , -->
		<!-- //         url: 'dateitem.do', -->
		<!-- //    		 success:function(content) -->
		<!-- //     { -->
		<!-- //            alert('ok');           -->
		<!-- //         }    -->

		<!-- //     }); -->
		<!-- // } -->
		<!-- // $('.checkit').on('click', function(e) { -->
		<!-- // 	alert('in'); -->
		<!-- //     $.ajax({ -->
		<!-- //         url:  'dateitem.do', -->
		<!-- //         type: 'POST', -->
		<!-- //         data: 'dateItemNo='+$(this).next('.checkvalue').val()+'&action=checkTime', -->
		<!-- //          +$(this).next('td').find('#checkvalue').val()+ -->
		<!-- //         success: function(html){ -->
		<!-- //         	alert('success'); -->
		<!-- //             $('#modal-buy .modal-body p').html('test'); -->
		<!-- //             $('#modal-buy').modal('show'); -->
		<!-- //         }, -->
		<!-- //         error: function(){ -->
		<!-- //             alert("error"); -->
		<!-- //         }   -->
		<!-- //     });   -->
		<!-- // }); -->

		<!-- </script> -->

		<%@ include file="footer.file"%>

		<script>
			$(document)
					.ready(
							function() {
								var but1 = $('#button1');
								but1
										.click(function() {
											if (this.value == 'showppl') {
												but1.val('showpet');
												but1.html('�H�d����ܬ��|')

												$
														.ajax({
															url : 'dateitem.do',
															data : {
																action : this.value,
															},
															type : 'POST',
															error : function(
																	xhr) {
																alert('Ajax request �o�Ϳ��~');
															},
															success : function(
																	result) {
																// 					alert('sucess1');
																$('.cardheader')
																		.each(
																				function(
																						index) {
																					// 						$(this).attr('style', "background-image: url("'ImgReader?sellerNo='+$(this).next('input').val()+'&action=memImg'")");
																					$(
																							this)
																							.css(
																									'background-image',
																									'url("ImgReader?sellerNo='
																											+ $(
																													this)
																													.find(
																															'input')
																													.val()
																											+ '&action=memImg")');
																				});
																$('.img1')
																		.each(
																				function(
																						index) {
																					$(
																							this)
																							.attr(
																									'src',
																									'ImgReader?dateItemNo='
																											+ $(
																													this)
																													.next(
																															'input')
																													.val()
																											+ '&action=dateImg');
																				});
																// 					$('.avatar').find('img').attr('src','ImgReader?dateItemNo=${dateitem.dateItemNo}&action=dateImg');
															}
														});
												this.value = "showpet";

											} else if (this.value == 'showpet') {
												but1.val('showppl');
												but1.html('�H�D�H��ܬ��|')
												$
														.ajax({
															url : 'dateitem.do',
															data : {
																action : this.value,
															},
															type : 'POST',
															error : function(
																	xhr) {
																alert('Ajax request �o�Ϳ��~');
															},
															success : function(
																	result) {
																// 						alert('sucess2');
																$('.cardheader')
																		.each(
																				function(
																						index) {
																					//	 						$(this).attr('style', "background-image: url("'ImgReader?sellerNo='+$(this).next('input').val()+'&action=memImg'")");
																					$(
																							this)
																							.css(
																									'background-image',
																									'url("ImgReader?dateItemNo='
																											+ $(
																													this)
																													.find(
																															'.no1')
																													.val()
																											+ '&action=dateImg")');
																				});
																$('.img1')
																		.each(
																				function(
																						index) {
																					$(
																							this)
																							.attr(
																									'src',
																									'ImgReader?sellerNo='
																											+ $(
																													this)
																													.prev(
																															'input')
																													.val()
																											+ '&action=memImg');
																				});
																//	 					$('.avatar').find('img').attr('src','ImgReader?dateItemNo=${dateitem.dateItemNo}&action=dateImg');
															}
														});
												this.value = "showppl";
											}

										});
							});
		</script>


		<script>
			$(function() {

				$("#dateMeetingTime").datetimepicker({
					format : 'Y-m-d',
					timepicker : false,
					mindate : 0,
				});

			});
		</script>
</body>

</html>