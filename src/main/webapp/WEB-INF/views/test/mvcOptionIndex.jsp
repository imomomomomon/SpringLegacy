<%--
  Created by IntelliJ IDEA.
  User: jaeungyun
  Date: 2023/05/30
  Time: 10:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript">
        function ajaxProcess(url,type,contentType,dataType,data){
            $.ajax({
                url:url,
                type:type,
                contentType:contentType,
                dataType:dataType,
                data:data,
                success:function(val){
                    console.log(val);
                },
                error: function (request, status, error) {
                    console.log("code: " + request.status)
                    console.log("message: " + request.responseText)
                    console.log("error: " + error);
                }
            })
        }
        $(function(){
           $("input[type='button']").click(function(){
               switch(this.id){
                   case 'ajax1':
                        ajaxProcess('${pageContext.request.contextPath}/ajaxTest1','POST',null,'html',null);
                       break;
                   case 'ajax2':
                       var jsonValue={"id":"blue","name":"abc","weight":55.7,"height":189.9};
                       ajaxProcess('${pageContext.request.contextPath}/ajaxTest2','POST',"application/json",'text',JSON.stringify(jsonValue));
                       break;
                   case 'ajax3':
                       var jsonValue={"name":"oop","since":4980,"message":"hi"};
                       ajaxProcess('${pageContext.request.contextPath}/ajaxTest3','POST',"application/json",'json',JSON.stringify(jsonValue));
                       break;
                   case 'ajax4':
                       var jsonValue={"name":"oop","since":4980,"message":"hi"};
                       ajaxProcess('${pageContext.request.contextPath}/ajaxTest4','POST',"application/json",'json',null);
                       break;
                   default:
                       break;
               }
            });
        });
    </script>
</head>

<body>
  <input type="button" href="${pageContext.request.contextPath}/pathParam/empSelect/SMITH/SALESMAN" id= "ajax1" value="apple">
  <input type="button" href="${pageContext.request.contextPath}/pathParam/empSelect/SMITH/SALESMAN" id= "ajax2" value="SAMSUNG">
  <input type="button" href="${pageContext.request.contextPath}/pathParam/empSelect" id= "ajax3" value="LG">
  <input type="button" href="${pageContext.request.contextPath}/pathParam/empSelect/KING" id= "ajax4" value="SK">
</body>
</html>
