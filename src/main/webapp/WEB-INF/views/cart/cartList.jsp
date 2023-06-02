<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

<title>관리자</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=10" />
<meta http-equiv="imagetoolbar" content="no" />
<!-- <link href="../css/contents.css" rel="stylesheet" type="text/css" /> -->
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css" />
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/ajax.js"></script>
	<script type="text/javascript">
		let arrLength = 0;
		$(function () {
			getCartList();
			//button
			{
				$('input#checkbox_all').click(selectCheckboxAll);
			}
		});
		$(window).on("beforeunload", function() {
			console.log("asd");
			return '';
		});
		function getCartList() {
			ajax_UrlPlusParam(
					'${pageContext.request.contextPath}/product/getProductInCart',
					printCartList,
					'GET'
			);
		}
		function deleteProduct(product_no) {
			if(confirm("정말로 삭제하시겠습니까?")) {
				ajax_UrlPlusParam(
						'${pageContext.request.contextPath}/product/deleteProductInCart/'+ product_no,
						getCartList,
						'GET'
				);
			}
		}
		function printCartList(array) {
			$('tbody#tbody_cart_list').children().remove();

			arrLength = array.length;
			for(let i = 0; i < array.length; i++ ) {
				let tr = $('<tr id="tr_product_'+ i +'"></tr>');
				{
					tr.append($('<td><input type="checkbox" value="'+array[i].product_no +
							'" name="checkToDo" onclick="calculatePrice()"/></td>'));
					tr.append($('<td>'+array[i].product_no+'</td>'));
					tr.append($('<td>'+array[i].product_name+'</td>'));
					if(array[i].product_imgname != null)
						tr.append($('<td><img src="/resources/upload/'+array[i].product_imgname
								+'" width = "50" height = "50"></td>'));
					else
						tr.append($('<td>이미지없음</td>'));
					tr.append($('<td>'+array[i].product_location+'</td>'));
					tr.append($('<td name="price">'+array[i].product_price+'</td>'));
					tr.append($('<td>'+array[i].product_category+'</td>'));
					tr.append($('<td>'+array[i].product_date+'</td>'));
					tr.append($('<td><span class="buttonFuc"><a href="javascript:deleteProduct('+
							array[i].product_no+')">삭제</a></span></td>'));
				}
				$('tbody#tbody_cart_list').append(tr);
			}
		}
		function calculatePrice() {
			let sum = 0;
			for (let i = 0; i < arrLength; i++) {
				let tr = $('#tr_product_'+i);
				if(tr.find("[name=checkToDo]").is(':checked')) {
					sum += Number(tr.find("[name=price]").text());
				}
			}
			$('input#input_total').val(sum);
		}
		function selectCheckboxAll() {
			if($('input#checkbox_all').is(':checked')){
				$('input[name=checkToDo]').prop('checked',true);
			} else{
				$('input[name=checkToDo]').prop('checked',false);
			}
			calculatePrice();
		}
		function deleteSelected() {
			let array = [];
			$('input[name=checkToDo]:checked').each(function(){//체크된 리스트 저장
				array.push($(this).val());
			});
			let params = {"deleteArr" : array};
			ajax_InsertParamWithUrl(
					params,
					'${pageContext.request.contextPath}/product/deleteArrayInCart',
					getCartList,
					'GET'
			);
		}
	</script>

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
		               <p>장바구니 리스트</p>   
		            </div>
					<div class="contents">
					
					<div class="btnSet clfix mgb15">
						<span class="fr"> <span class="button"><a href="${pageContext.request.contextPath}/page/list">목록</a></span>
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
								<td><select style="border:1px solid #ddd; height:20px; width:200px;">
										<option>선택하세요</option>
								</select></td>
								<th>상품명</th>
								<td><input type="text" name="" class="" size="30" style="border:1px solid #ddd; height:20px;"/>
									<span class="button"><a href="#">검색</a></span></td>
							</tr>
						</tbody>
					</table>
							<table class="bbsList">
								<colgroup>
									<col width="60"/>
									<col width="80" />
									<col width="170" />
									<col width="170" />
									<col width="170" />
									<col width="170" />
									<col width="170" />
									<col width="170" />
									<col width="110" />
								</colgroup>
								<thead>								
								
									<tr>
										<th scope="col"><input id="checkbox_all" type="checkbox"/></th>
										<th scope="col">NO.</th>																				
										<th scope="col">상품명</th>
										<th scope="col">이미지</th>
										<th scope="col">원산지</th>
										<th scope="col">가격</th>
										<th scope="col">종류</th>
										<th scope="col">날짜</th>
										<th scope="col">상태</th>									
									</tr>
								</thead>
								<tbody id="tbody_cart_list">
								</tbody>
							</table>
							<table class="bbsList" align="right">
								<tr align="right">
									<th align="right"><span class="button"><a href="javascript:deleteSelected()">선택 삭제</a></span></th>
								</tr>
							<tr align="right">
								<th align="right">총합계 &nbsp; <input type="text" readonly name="total" id="input_total" class="inputText" size="30"  align="right" value="0"/></th>
								</tr>
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