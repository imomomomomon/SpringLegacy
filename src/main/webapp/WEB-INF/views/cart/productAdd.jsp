<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

<title>관리자</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=10" />
<meta http-equiv="imagetoolbar" content="no" />
 <link href="${pageContext.request.contextPath}/resources/css/contents.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css" />
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript">
		let state;
		$(function () {
			changeInsertInfo();
			getList();
		})
		function changeInsertInfo(){
			$('li#li_insert').attr("class","over");
			$('li#li_update').attr("class","");
			$('tr#tr_search').hide();
			$('form#form_insert')[0].reset();
			state = "insert";
		}
		function changeUpdateInfo(){
			$('li#li_update').attr("class","over");
			$('li#li_insert').attr("class","");
			$('tr#tr_search').show();
			$('form#form_insert')[0].reset();
			state = "update";
		}
		function btn_confirm() {
			switch (state) {
				case "insert":
					insertInfo();
					break;
				case "update":
					updateInfo();
					break;
			}
		}
		function getList() {
			$.ajax({
				url:'${pageContext.request.contextPath}/product/getList',
				type:'GET',
				data:{'id':'${sessionScope.id}'},
				success:function (data) {
					printList(data);
					getCategory();
				},error:function () {
					console.log('error');
				}
			});
		}
		function getCategory() {
			$.ajax({
				url:'${pageContext.request.contextPath}/product/getCategory',
				type:'GET',
				success:function (data) {
					{
						for (let i = 0; i < data.length; i++) {
							let option = $('<option value="'+data[i]+'">' + data[i] + '</option>');
							$('select#select_product_category').append(option);
						}
					}
				},error:function () {
					console.log('error');
				}
			});
		}
		function searchToNo() {
			let url = "${pageContext.request.contextPath}/product/getOne/"
					+ $('input#input_searchToNo').val()
					+ "/" + '${sessionScope.id}';
			$.ajax({
				url: url,
				type:'GET',
				success:function (data) {
					if(data == '')
						alert("검색 결과가 존재하지 않습니다.");
					else{
						{
							$('select#select_product_category').val(data.product_category).prop("selected",true);
							let form = $('form#form_insert')[0];
							form.product_no.value = data.product_no;
							form.product_name.value = data.product_name;
							form.product_location.value = data.product_location;
							form.product_price.value = data.product_price;
						}
					}
				},error:function () {
					console.log('error');
				}
			});
		}
		function insertInfo() {
			let formData = new FormData($('form#form_insert')[0]);

			$.ajax({
				url:'${pageContext.request.contextPath}/product/insert',
				type:'POST',
				enctype:'multipart/form-data',
				data:formData,
				processData:false,
				contentType:false,
				success:function(data){
					if(data == '1') {
						$('form#form_insert')[0].reset();
						alert("등록 성공");
						getList();
					}
				},error:function(){
					console.log('error insert Info');
				}
			});
		}
		function updateInfo() {
			let formData = new FormData($('form#form_insert')[0]);

			$.ajax({
				url:'${pageContext.request.contextPath}/product/update',
				type:'POST',
				enctype:'multipart/form-data',
				data:formData,
				processData:false,
				contentType:false,
				success:function(data){
					if(data == '1') {
						$('form#form_insert')[0].reset();
						alert("등록 성공");
						getList();
					}
				},error:function(){
					console.log('error insert Info');
				}
			});
		}
		function printList(array) {
			$('#tbody_list').children().remove();
			for(let i = 0; i < array.length; i++){
				let tr = $('<tr></tr>');
				tr.append($('<td>'+ array[i].product_no +'</td>'));
				tr.append($('<td>'+ array[i].product_name +'</td>'));
				if(array[i].product_imgname != null)
					tr.append($('<td><img src="${pageContext.request.contextPath}/resources/upload/'+array[i].product_imgname
							+'" width = "50" height = "50"></td>'));
				else
					tr.append($('<td>이미지없음</td>'));
				tr.append($('<td>'+ array[i].product_price +'</td>'));
				tr.append($('<td>'+ array[i].product_location +'</td>'));
				$('#tbody_list').append(tr);
			}
		}
	</script>
</head>
<body> 
	<div id="wrap">
	

		<div id="sub_container">
			<div id="contentsWrap" class="sub_con5">
				<div class="board_form">   
		            <div class="con_title">
		               <p>상품등록/보기/수정</p>   
		            </div>
			
			
			
				<div class="contents">
					<div class="btnSet clfix mgb15">
						<span class="fr"> <span class="button"><a href="#">목록</a></span>
						</span>
					</div>

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
								</select></td>
								<th>상품명</th>
								<td><input type="text" name="" style="border:1px solid #ddd; height:20px;" class="inputText" size="30" />
									<span class="button"><a href="#">검색</a></span></td>
							</tr>
						</tbody>
					</table>

					<div class="clfix">
						<div class="tbWrapLt">
							<table class="bbsList">
								<colgroup>
									<col width="30" />
									<col width="100" />
									<col width="100" />
									<col width="100" />
									<col width="100" />
								</colgroup>
								<thead>								
									<tr>
										<th scope="col">NO.</th>
										<th scope="col">상품명</th>
										<th scope="col">모델</th>
										<th scope="col">가격</th>
										<th scope="col">원산지</th>
										
									</tr>
								</thead>

								<tbody id="tbody_list">
								</tbody>
							</table>
						</div>

						<div class="tbWrapRt">
							<ul class="tabA clfix mgb15">
								<li id="li_insert" class="over"><a href="javascript:changeInsertInfo()">01. 상품등록</a></li>
								<li id="li_update" ><a href="javascript:changeUpdateInfo()">02. 상품수정</a></li>
							</ul>
 		              	<form action="" id="form_insert" method="post"  enctype="multipart/form-data">
							<div id="info1" class="tbWrapCnt" style="display: block;">
								<table class="bbsWrite mgb10">
									<caption></caption>
									<colgroup>
										<col width="95" />
										<col />
									</colgroup>
									<tbody>
										<tr id="tr_search">
											<th>수정번호</th>
											<td>
												<input type="number" id="input_searchToNo" style="border:1px solid #ddd; height:20px;" class="inputText"/>
												<span class="buttonFuc"><a href="javascript:searchToNo()">검색</a></span>
											</td>
										</tr>
										<tr>
											<th>상품명</th>
											<td><input type="text" style="border:1px solid #ddd; height:20px;" name="product_name" class="inputText"
												size="50" /></td>
										</tr>
										<tr>
											<th>원산지</th>
											<td><input type="text" style="border:1px solid #ddd; height:20px;" name="product_location" class="inputText"
												size="50" /></td>
										</tr>
										<tr>
											<th>상품가격</th>
											<td><input type="number" style="border:1px solid #ddd; height:20px;" name="product_price" class="inputText"
												size="50" />
												<input type="hidden" name="product_no" value="0"/>
												</td>
										</tr>
										<tr>
											<th>카테고리</th>
											<td>
											<select style="width: 200px;" name="product_category" id="select_product_category">
												<option value="" selected="selected">선택하세요</option>
											</select>
											</td>
										</tr>
										<tr>
											<th>상품이미지1</th>
											<td class="alignM"><input type="file" name="imgfile"
												class="inputText" size="10" /></td>
										</tr>
									</tbody>
								</table>
							</div>
							</form>
						</div>

						<p class="agr">
							<span class="button"><a href="javascript:btn_confirm()">저장</a></span>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
  <!--Footer-->
     
   <!--END Footer-->	
   	</div>
	
</body>
</html>