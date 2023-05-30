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
        let inputNo = 0;
        $(function () {
            getInfo(${no});
            getReplyList(${no});
        })
        function getInfo(no) {
            const url = '${pageContext.request.contextPath}/product/getProduct/' + no;
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
        function getReplyList(board_no) {
            const url = '${pageContext.request.contextPath}/reply/getReplyList/' + board_no;
            $.ajax({
                url:url,
                type:'GET',
                success:function (data) {
                    $('div#div_reply_list').children().remove();
                    for (let i = 0; i < data.length; i++) {
                        setReply(data[i]);
                    }
                },error:function () {
                    console.log('error');
                }
            });
        }
        function getReplyContents(no,callback) {
            const url = '${pageContext.request.contextPath}/reply/getReply/' + no;
            $.ajax({
                url:url,
                type:'GET',
                success:function (data) {
                    callback(no,data);
                },error:function () {
                    console.log('error');
                }
            });
        }
        function insertReply() {
            const url = '${pageContext.request.contextPath}/reply/insertReply';
            $.ajax({
                url:url,
                type:'POST',
                data:{'board_no':${no},'contents':$('#textarea_insertReply').val()},
                success:function (data) {
                    getReplyList(${no});
                    $('#textarea_insertReply').val("");
                },error:function () {
                    console.log('error');
                }
            });
        }
        function updateReply(reply_no) {
            const url = '${pageContext.request.contextPath}/reply/updateReplyContents';
            $.ajax({
                url:url,
                type:'POST',
                data:{'reply_no':reply_no,'contents':$('#textarea_updateReply').val()},
                success:function (data) {
                    getReplyList(${no});
                    rollbackUpdateReplyForm(inputNo);
                },error:function () {
                    console.log('error');
                }
            });
        }
        function deleteReply(reply_no) {
            const url = '${pageContext.request.contextPath}/reply/deleteReply/' + reply_no;
            $.ajax({
                url:url,
                type:'GET',
                success:function (data) {
                    getReplyList(${no});
                    // rollbackUpdateReplyForm(inputNo);
                },error:function () {
                    console.log('error');
                }
            });
        }
        function setValue(data) {
            $('td#td_no').text(data.product_no);
            $('td#td_name').text(data.product_name);
            $('td#td_category').text(data.product_category);
            $('td#td_location').text(data.product_location);
            $('td#td_price').text(data.product_price);
            $('td#td_date').text(data.product_date);
            $('td#td_seller').text(data.product_seller);
            $('img#img_product').attr("src",
                "${pageContext.request.contextPath}/resources/upload/"+data.product_imgname)
        }
        function setReply(data) {
            let div_identifier = $('<div id="div_identifier_'+ data.reply_no +
                '" class="contents"></div>');
            let div_contents = $('<div id="div_contents" class="contents"></div>');
            {
                let div_letter_top = $('<div class="letter_top"></div>');
                {
                    let ul = $('<ul></ul>');
                    {
                        let li_letter_f = $('<li class="letter_f"><strong>'+data.reply_writer+'</strong></li>');
                        let li = $('<li><span>|</span></li>');
                        let li_letter_time = $('<li class="letter_f01">'+data.reply_regdate+'</li>');
                        let li2 = $('<li><span>|</span></li>');
                        let li_letter_f02 = $('<li class="letter_f02"><img alt="" ' +
                            'src="${pageContext.request.contextPath}/resources/img/re.jpg" style="width:10px;height:10px;">&nbsp;답글</li>');
                        let li_letter_cl = $('<li class="letter_cl">'+data.reply_contents+'</div>');

                        ul.append(li_letter_f)
                        .append(li)
                        .append(li_letter_time)
                        .append(li2)
                        .append(li_letter_f02)
                        .append(li_letter_cl);
                    }
                    div_letter_top.append(ul);
                    let ul2 = $('<ul class="letter_r"></ul>');
                    {
                        let li_update = $('<li><span>' +
                            '<a href="javascript:changeReplyForUpdate('+
                            data.reply_no +
                            ')">수정</a>' +
                            '</span></li>');
                        let li = $('<li><span>|</span></li>');
                        let li_delete = $('<li><span>' +
                            '<a href="javascript:deleteReply(' +
                            data.reply_no +
                            ')">삭제</a>' +
                            '</span></li>');
                        ul2.append(li_update).append(li).append(li_delete);
                    }
                    div_letter_top.append(ul2);
                }
                div_contents.append(div_letter_top);
                let div_letter_bottom = $('<div class="letter_bottom"></div>');
                {
                    let ul = $('<ul><li></li></ul>')
                }
                div_contents.append(div_letter_bottom);
            }
            div_identifier.append(div_contents);
            $('div#div_reply_list').append(div_identifier);
        }
        function changeReplyForUpdate(no) {
            getReplyContents(no,changeReplyFormToInput);
        }
        function changeReplyFormToInput(no,data) {
            const format_contents = data.reply_contents.replace('<br>','\r\n');
            if(inputNo != 0)
                rollbackUpdateReplyForm(inputNo);
            inputNo = no;

            $('div#div_identifier_'+no).children("div#div_contents").hide();
            let div_board_writer03 = $('<div id="div_update_'+ no +'" class="board_writer03"></div>');
            {
                let ul = $('<ul></ul>');
                {
                    let div = $('<div class="letter_top"></div>');
                    let ul2 = $('<ul></ul>');
                    {
                        let li_letter_f = $('<li class="letter_f"><strong>'+data.reply_writer+'</strong></li>');
                        let li = $('<li><span>|</span></li>');
                        let li_letter_time = $('<li class="letter_f01">'+data.reply_regdate+'</li>');
                        ul2.append(li_letter_f).append(li).append(li_letter_time);
                        div.append(ul2);
                    }
                    let li = $('<li></li>');
                    {
                        let textarea = $('<textarea id="textarea_updateReply" rows="" cols=""></textarea>&nbsp;');
                        textarea.val(format_contents);
                        let input_confirm = $('<input type="button" value="등록" onclick="' +
                            'javascript:updateReply('+no+')"/>');
                        let input_cancel = $('<input type="button" value="취소" onclick="' +
                            'javascript:rollbackUpdateReplyForm('+ no +')"/>');
                        li.append(textarea).append(input_confirm).append(input_cancel);
                    }
                    ul.append(div).append(li);
                }
                div_board_writer03.append(ul);
            }
            $('div#div_identifier_'+no).append(div_board_writer03);
        }
        function rollbackUpdateReplyForm(no) {
            inputNo = 0;
            $('div#div_identifier_'+no).children("div#div_contents").show();
            $('div#div_identifier_'+no).children("div#div_update_"+ no).remove();
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
                          <td id="td_category"></td>
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
                    <li>
                        <textarea id="textarea_insertReply" rows="" cols=""></textarea>
                        <input type="button" value="등록" onclick="insertReply()"/>
                    </li>
                </ul>
            </div>
            <div id="div_reply_list">
            </div>
<%--            <div class="contents">--%>
<%--                <div class="letter_top">--%>
<%--                    <ul>--%>
<%--                        <li class="letter_f"><strong>작성자</strong></li>--%>
<%--                        <li><span>|</span></li>--%>
<%--                        <li class="letter_f02"><img alt="" src="${pageContext.request.contextPath}/resources/img/re.jpg"--%>
<%--                                                    style="width:10px;height:10px;">&nbsp;답글--%>
<%--                        </li>--%>
<%--                        <li class="letter_cl">내용이들어갑니다.</li>--%>
<%--                    </ul>--%>
<%--                    <!-- 내가 작성한 부분만 수정 삭제 가능 -->--%>
<%--                    <ul class="letter_r">--%>
<%--                        <li><span>수정 </span></li>--%>
<%--                        <li><span>|</span></li>--%>
<%--                        <li><span>삭제</span></li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--                <div class="letter_bottom">--%>
<%--                    <ul>--%>
<%--                        <li></li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>

            <div class="board_writer03" style="display: none;">
                <ul>
                    <li><textarea rows="" cols=""></textarea>&nbsp;&nbsp;
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






