<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

    let custinfo_form = {
        init: function () {
            $("#custinfo_btn").click(function () {
                custinfo_form.send(); // this.send() 안됨! 유의
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
            $("#custinfo_form").attr({
                'action': '/custinfoimpl',
                'method': 'post'
            });
            $("#custinfo_form").submit();
        }
    };
    // 화면 로딩
    $(function () {
        custinfo_form.init();
    });

</script>
<div class="col-sm-8 text-left">
    <div class="container">
        <div class="row content">
            <div class="col-sm-6 text-left">
                <div>
                    <h2 style="text-align: center">Cust Info Page</h2>
                </div>
                <br><br><br>
                <form class="form-horizontal" id="custinfo_form" action="">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="id">아이디</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="id" name="id"
                            value="${custinfo.id}" readonly>
                        </div>
                        <div class="col-sm-10">
                            <span id="check_id" class="bg-danger"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pwd">패스워드</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="pwd" name="pwd">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="name">이름</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="name" name="name"
                            value = "${custinfo.name}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" id="custinfo_btn" class="btn btn-primary">업데이트</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%--</html>--%>