<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    // 화면 로딩
    $(function () {

    });

</script>
<div class="col-sm-8 text-left">
    <div class="container">
        <div class="row content">
            <div class="col-sm-6 text-left">
                <div>
                    <h2 style="text-align: center">OCR1</h2>
                    <h2 style="text-align: center">사업자번호 : ${result.biznum}</h2>
                    <h2 style="text-align: center">사업자이름 : ${result.bizname}</h2>
                    <h2 style="text-align: center">대표자이름: ${result.bizowner}</h2>
                    <h2 style="text-align: center">개업년월일: ${result.bizdate}</h2>
                    <h2 style="text-align: center">사업자주소: ${result.bizadd}</h2>
                </div>
                <br><br><br>
                <form id="cfr1_form" class="form-horizontal" action="/ocr1impl" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="img">Image: </label>
                        <div class="col-sm-10">
                            <input type="file" class="form-control" id="id" placeholder="Input Image" name="img">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" id="ocr1_button" class="btn btn-primary">업로드</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
