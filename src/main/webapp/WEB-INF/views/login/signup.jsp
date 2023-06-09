<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Start Simple Web</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <!-- <link href="css/login.css" rel="stylesheet"> -->
    <link href="${pageContext.request.contextPath}/resources/css/clean-blog.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link
            href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
            rel="stylesheet" type="text/css">
    <link
            href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
            rel='stylesheet' type='text/css'>
    <link
            href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
            rel='stylesheet' type='text/css'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/ajax.js"></script>
    <!-- 모델1 모델2 -->
    <script type="text/javascript">
        function registerAccount() {
            if (checkInputNull() && checkPassword()) {
                let data = $('form#form_signUp').serialize();
                ajax_InsertParamWithUrl(
                    data,
                    '${pageContext.request.contextPath}/login/register',
                    function (data) {
                        if(data === -1)
                            alert("아이디가 중복입니다.");
                        else if(data === 1){
                            location.href = "${pageContext.request.contextPath}/page/login";
                        }
                    },
                    'POST'
                );
            }
        }

        function checkInputNull() {
            if ($('input#input_id').val() === '') {
                alert("아이디를 입력하지 않으셨습니다!");
                return false;
            }
            if ($('input#input_pass').val() === '') {
                alert("비밀번호를 입력하지 않으셨습니다!");
                return false;
            }
            if ($('input#input_passC').val() === '') {
                alert("비밀번호 재확인을 입력하지 않으셨습니다!");
                return false;
            }
            return true;
        }

        function checkPassword() {
            if ($('input#input_pass').val() === $('input#input_passC').val())
                return true;
            alert("비밀번호가 일치하지 않습니다!");
            return false;
        }
    </script>
</head>
<body>
<div class="container" style="margin-top: 120px">
    <div class="row">
        <div class="main">
            <h3>
                <a href="login"> SIGN UP</a>
            </h3>

            <form id="form_signUp" method="POST">
                <div class="form-group">
                    <input type="text" placeholder="아이디 또는 이메일" class="form-control"
                           id="input_id" name="user_id"/>

                </div>
                <div class="form-group">
                    <input type="password" placeholder="비밀번호" class="form-control"
                           id="input_pass" name="user_passwd"/>

                </div>
                <div class="form-group">
                    <!--<a class="pull-right" href="#">Esqueci a senha</a>-->
                    <input type="password" placeholder="비밀번호 확인" class="form-control"
                           id="input_passC"/>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <a href="javascript:registerAccount()" class="btn btn-sm btn-info btn-block">SIGN
                            UP</a>
                    </div>
                </div>
        </div>
        </form>
    </div>
</div>
</div>

</body>

</html>