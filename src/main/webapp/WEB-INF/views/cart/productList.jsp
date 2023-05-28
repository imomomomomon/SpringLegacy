<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<!--  관리자페이지 구현 X  -->
<title>관리자</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="imagetoolbar" content="no" />
<!-- <link href="../css/contents.css" rel="stylesheet" type="text/css" /> -->
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css" />
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript">
		$(function () {
			getList();

			let session_id = '${sessionScope.id}';
			if(session_id == ''){
				$('span#span_admin_logout').hide();
				$('span#span_admin_add').hide();
			} else {
				$('span#span_admin_login').hide();
			}
		})
		function goInfo(no) {
			location.href="${pageContext.request.contextPath}/page/info/"+no;
		}
		function getList() {
			$.ajax({
				url:'${pageContext.request.contextPath}/product/getProductList',
				type:'GET',
				success:function (data) {
					printList(data);
				},error:function () {
					console.log('error');
				}
			});
		}
		function printList(array) {
			for (let i = 0; i < array.length; i++) {
				let tr = $('<tr onclick="goInfo('+array[i].product_no+')">' + '</tr>');
				tr.append($('<td>'+ array[i].product_no +'</td>'));
				tr.append($('<td>'+ array[i].product_name+'</td>'));
				if(array[i].product_imgname != null)
					tr.append($('<td><img src="${pageContext.request.contextPath}/resources/upload/'+array[i].product_imgname
							+'" width = "50" height = "50"></td>'));
				else
					tr.append($('<td>이미지없음</td>'));
				tr.append($('<td>'+ array[i].product_location +'</td>'));
				tr.append($('<td>'+ array[i].product_price +'</td>'));
				tr.append($('<td>'+ array[i].product_category +'</td>'));
				tr.append($('<td>'+ array[i].product_date +'</td>'));
				tr.append($('<td>'+ array[i].product_seller +'</td>'));
				$('#tbody_list').append(tr);
			}
		}

	</script>
</head>
<body>	
	<div id="wrap">
		<!-- header -->
		
		<!--// header -->

		<div id="sub_container">
			<div id="contentsWrap" class="sub_con5">
				<div class="board_form">   
		            <div class="con_title">
		               <p>상품 등록/보기/수정</p>   
		            </div>
	
				<div class="contents">
					<div class="btnSet clfix mgb15">
						<span class="fr">
							<span id="span_admin_login" class="button"><a href="${pageContext.request.contextPath}/page/login">로그인</a></span>
							<span id="span_admin_logout" class="button"><a href="${pageContext.request.contextPath}/page/logout">로그아웃</a></span>
							<span id="span_admin_add" class="button"><a href="${pageContext.request.contextPath}/page/add">추가</a></span>
							<span class="button"><a href="#">목록</a></span>
						</span>
					</div>
                   <form action="clientList.do" method="post">
					<table class="bbsWrite mgb35">
						<caption></caption>
						<colgroup>
							<col width="95" />
							<col width="395" />
							<col width="95" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>업체명</th>
								<td><select style="width: 200px;">
										<option>선택하세요</option>
								</select></td>
								<th>
								<select id="query" name="query">
								  <option selected="selected">선택하세요</option>
								  <option value="productName">상품명</option>
								  <option value="productOrigin">원산지</option>
								  <option value="productCategory">카테고리</option>
								</select>
								</th>
								<td><input type="text" name="data" style="border:1px solid #ddd; height:20px;" class="inputText" size="30" />
									<span class="button"><a href="#" id="search">검색</a></span>
<%--									<span class="button"><a href="clientList.do">새로고침</a></span>--%>
									</td>
							</tr>
						</tbody>
					</table>
					</form>
							<table class="bbsList">
								<colgroup>
									<col width="80" />
									<col width="170" />
									<col width="170" />
									<col width="170" />
									<col width="170" />
									<col width="170" />
									<col width="170" />
									<col width="170" />
								</colgroup>
								<thead>								
								
									<tr>
										<th scope="col">NO.</th>																				
										<th scope="col">상품명</th>
										<th scope="col">이미지</th>
										<th scope="col">원산지</th>
										<th scope="col">가격</th>
										<th scope="col">종류</th>
										<th scope="col">날짜</th>
										<th scope="col">판매자</th>
									</tr>
								</thead>

								<tbody id="tbody_list">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
	
  <!--Footer-->
     
   <!--END Footer-->	
	</div>
</body>
</html>