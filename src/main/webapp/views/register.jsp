<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

    let register_form = {
        init: function () {
            $('#register_btn').addClass("disabled");
            $("#register_btn").click(function () {
                register_form.send(); // this.send() 안됨! 유의
            });
            $('#name').keyup(function(){
                var id = $('#id').val();
                var pwd = $('#pwd').val();
                var name = $('#name').val();
                if(id !='' && pwd !='' && name!=''){
                    $('#register_btn').removeClass("disabled");
                }
            });
            $('#id').keyup(function(){
               var txt_id = $('#id').val();
               if(txt_id.length<=3){
                   return;
               }
                $.ajax({
                    url:'/checkid',
                    data: {'id':txt_id},
                    success: function(result){
                        if(result == 0){
                            $('#check_id').text('사용가능합니다.');
                            $('#pwd').focus(); // 비밀번호 창으로 이동
                        }else {
                            $('#check_id').text('사용불가능합니다.');
                        }
                    }
                });
            });
        },
        // 서버로 보내기
        send: function () {
            var id = $('#id').val();
            var pwd = $('#pwd').val();
            var name = $('#name').val();

            if(id <= 3){
                $('#check_id').text('3자리 이상이여야 합니다.');
                $('#id').focus();
                return;
            }
            if(pwd == ''){
                $('#pwd').focus();
                return;
            }
            if(name == ''){
                $('#name').focus();
                return;
            }
            $("#register_form").attr({
                'action': '/registerimpl',
                'method': 'post'
            });
            $("#register_form").submit();
        }
    };
    // 화면 로딩
    $(function () {
        register_form.init();
    });

</script>
<div class="col-sm-8 text-left">
    <div class="container">
        <div class="row content">
            <div class="col-sm-6 text-left">
                <div>
                    <h2 style="text-align: center">회원가입</h2>
                </div>
                <br><br><br>
                <form class="form-horizontal" id="register_form" action="">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="id">아이디</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
                        </div>
                        <div class="col-sm-10">
                            <span id="check_id" class="bg-danger"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pwd">패스워드</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="pwd" placeholder="Enter password"
                                   name="pwd">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="name">이름</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="name" placeholder="Enter name"
                                   name="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" id="register_btn" class="btn btn-primary">회원가입</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%--</html>--%>