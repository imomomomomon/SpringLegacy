<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>관리자</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=10" />
<meta http-equiv="imagetoolbar" content="no" />

<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script type="text/javascript">
        $(function () {
            getInfo(${no});
        })
        function getInfo(no) {
            const url = '${pageContext.request.contextPath}/product/getOne/' + no;
            console.log(url);
            $.ajax({
                url:url,
                type:'GET',
                success:function (data) {
                    setValue(data);
                },error:function () {
                    console.log('error');
                }
            });
        }
        function setValue(obj) {
            $('td#td_no').text(obj.product_no);
            $('td#td_name').text(obj.product_name);
            $('td#td_kind').text(obj.product_kind);
            $('td#td_location').text(obj.product_location);
            $('td#td_price').text(obj.product_price);
            $('td#td_date').text(obj.product_date);
            $('td#td_seller').text(obj.product_seller);
            $('img#img_product').attr("src",
                "${pageContext.request.contextPath}/resources/upload/"+obj.product_imgname)
        }
    </script>
</head>
<body >

	<div id="wrap">
		<!-- header -->
		
		<!--// header -->

		<div id="sub_container">
			<div id="contentsWrap" class="sub_con5">
				<div class="board_form">   
		            <div class="con_title">
		               <p>게시판 상세보기</p>   
		            </div>
				<div class="contents">
					<div class="btnSet clfix mgb15">
						<span class="fr">
						
                            <span class="button"><a href="#">물품구매</a></span>
							<span class="button"> <a href="#">장바구니</a></span>						
							<span class="button"><a href="#">목록</a></span>
						</span>
					</div>
					<table class="bbsList">
						<colgroup>
							<col width="400" />
                            <col width="100" />
                            <col width="" />
						</colgroup>
						<tr>
							<th scope="col" class="fir">이미지</th>
                             <th scope="col">글번호</th>
                             <td id="td_no"></td>
                        </tr>
                        <tr>
                        
                          <td class="fir" rowspan="7"><img id="img_product" src="#" width="400" height="300"/></td>
                          <th scope="col">아이디</th>
                          <td id="td_seller"></td>
                        </tr>
                        <tr>
                          <th scope="col">상품이름</th>
                          <td id="td_name"></td>
                        </tr>
                        <tr>
                          <th scope="col">가격</th>
                          <td id="td_price"></td>
                        </tr>
                        <tr>
                          <th scope="col">원산지</th>
                          <td id="td_location"></td>
                        </tr>
                        <tr>
                          <th scope="col">카테고리</th>
                          <td id="td_kind"></td>
                        </tr>
                        <tr>
                          <th scope="col">등록일</th>
                          <td id="td_date"></td>
                        </tr>                        
					</table>
					
				</div>
			</div>
		</div>
		</div>
		<div class="board_form">
                          <div class="board_writer03">
                             <ul>
                                <li><textarea rows="" cols="" ></textarea>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="등록" onclick="location.href='.jsp'"/></li>
                             </ul>
                          </div>
                           <div class="contents">
                             <div class="letter_top">
                                <ul>
                               <li class="letter_f"><strong>작성자</strong> </li>
                               <li><span>|</span></li>
                               <li class="letter_f02"><img alt="" src="${pageContext.request.contextPath}/resources/img/re.jpg" style="width:10px;height:10px;">&nbsp;답글</li>
                               <li class="letter_cl">내용이들어갑니다.</li>
                           </ul>
                           
                           <!-- 내가 작성한 부분만 수정 삭제 가능 -->
                            <ul class="letter_r">
                               <li><span>수정 </span></li>
                               <li><span>|</span></li>
                               <li><span>삭제</span></li>
                           </ul> 
                        </div>
                     <div class="letter_bottom">
                                <ul>
                                   <li></li>
                                </ul>
                          </div>
                          </div>            
                          
                          <div class="board_writer03" style="display: none;">
                             <ul>
                                <li ><textarea rows="" cols="" ></textarea>&nbsp;&nbsp;
                                    <input type="button" value="등록"
                                           onclick="location.href='${pageContext.request.contextPath}/page/list'"/></li>
                             </ul>
                          </div>
                       </div>
      </div>
		
	<!--Footer-->
     
   <!--END Footer-->	
	</div>
</body>

</html>






