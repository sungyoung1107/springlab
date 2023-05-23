<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let cfr2 = {}

    // 화면 로딩
    $(function () {
        cfr2.init();
    });

</script>
<div class="col-sm-8 text-left">
    <div class="container">
        <div class="row content">
            <div class="col-sm-6 text-left">
                <div>
                    <h2 style="text-align: center">CFR2</h2>
                    <h2 style="text-align: center">
                        <h1>${result.emotion}</h1>
                        <h1>${result.gender}</h1>
                        <h1>${result.pose}</h1>
                        <h1>${result.age}</h1>
                    </h2>
                </div>
                <br><br><br>
                <form id="cfr2_form" class="form-horizontal" action="/cfr2imp1" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="img">Image: </label>
                        <div class="col-sm-10">
                            <input type="file" class="form-control" id="id" placeholder="Input Image" name="img">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" id="cfr2_button" class="btn btn-primary">업로드</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
