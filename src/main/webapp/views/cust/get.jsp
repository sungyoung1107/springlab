<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

</script>
<div class="col-sm-8 text-left">
  <div class="container">
    <div class="row content">
      <div class="col-sm-6 text-left">
        <div>
          <h2 style="text-align: center">Detail Page</h2>
        </div>
        <br><br><br>
        <form class="form-horizontal" id="update_form" action="">
          <div class="form-group">
            <label class="control-label col-sm-2" for="id">아이디</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="id" value="${gcust.id}" name="id" readonly>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-sm-2" for="pwd">패스워드</label>
            <div class="col-sm-10">
              <input type="password" class="form-control" id="pwd" value="${gcust.pwd}"
                     name="pwd">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-sm-2" for="pwd">이름</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="name" value="${gcust.name}"
                     name="name">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <button type="button" id="update_btn" class="btn btn-primary">update</button>
            </div>
            <div class="col-sm-offset-2 col-sm-10">
              <button type="button" id="remove_btn" class="btn btn-primary">remove</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<%--</html>--%>