<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>관리자</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=10"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <meta name="copyright" content="Copyright 2020 @ high1 all rights reserved"/>
    <link href="${pageContext.request.contextPath}/resources/login/css/contents.css" rel="stylesheet" type="text/css"/>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('img#btnSubmit').click(checkLogin);

            {
                let id = '${cookie_id}';
                console.log("id:"+id);
                if(id !== ''){
                    $('input#user_id').val(id);
                    $('input#checker').attr("checked",true);
                }
            }
        })

        function checkLogin() {
            if ($('input#user_id').val().length == 0) {
                alert("아이디를 입력하지 않으셨습니다.");
                return;
            }
            if ($('input#user_pw').val().length == 0) {
                alert("암호를 입력하지 않으셨습니다.");
                return;
            }

            let formdata = $('form#form_login').serialize();
            $.ajax({
                url: '${pageContext.request.contextPath}/login/check',
                type: 'POST',
                data: formdata,
                success: function (data) {
                    if (data.charAt(0) !== '[')
                        location.href = "${pageContext.request.contextPath}/page/list";
                    else
                        alert(data);
                }, error: function () {
                    console.log('error');
                }
            });
        }
    </script>

</head>
<body>
<form id="form_login" name="login" method="post" action="">
    <div id="loginWrapper">
        <div class="loginForm">
            <fieldset>
                <legend>관리자 시스템 로그인</legend>
                <dl>
                    <dt><img src="${pageContext.request.contextPath}/resources/login/img/common/th_id.gif" alt="아이디"/>
                    </dt>
                    <dd><input type="text" name="user_id" class="text" id="user_id"/></dd>

                    <dt><img src="${pageContext.request.contextPath}/resources/login/img/common/th_pw.gif" alt="비밀번호"/>
                    </dt>
                    <dd><input type="password" name="user_passwd" class="text" id="user_pw"/></dd>
                </dl>
                <div class="btn">
                    <img id="btnSubmit"
                         src="${pageContext.request.contextPath}/resources/login/img/button/btn_login.gif" alt="LOGIN"
                         title="LOGIN"/>
                </div>

                <div class="saveId">
                    <input type="checkbox" id="checker" name="checker" />
                    <img src="${pageContext.request.contextPath}/resources/login/img/common/save_id.gif" alt="아이디 저장"/>
                    <input type="button" onclick="location.href='${pageContext.request.contextPath}/page/signup'" value="회원가입"/>
                </div>
            </fieldset>
        </div>
    </div>
</form>
</body>
</html>