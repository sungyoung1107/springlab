<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let product_detail = {
        init:function(){
            $('#register_btn').click(function(){
                product_detail.send();
            })
            $('#delete_btn').click(function(){
                var c = confirm("삭제 하시겠습니까?");
                if(c == true){
                    location.href="/product/deleteimpl?id=${gitem.product_id}";
                }
            });
        },
        send:function(){
            $('#register_form').attr({
                method: 'post',
                action: '/product/updateimpl',
                enctype: 'multipart/form-data'
            });
            $('#register_form').submit();
        }
    };

    $(function(){
        product_detail.init();
    })

</script>

<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Product Detail</h1>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">${gitem.product_id}</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <form id="register_form" class="form-horizontal well">
                    <input type="hidden" name="product_id" value="${gitem.product_id}">
                    <input type="hidden" name="product_imgname" value="${gitem.product_imgname}">

                    <div class="form-group">
                        <div class="col-sm-10">
                            <img src="/uimg/${gitem.product_imgname}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="product_name">Name: </label>
                        <div class="col-sm-10"> <!--name 은 서버로 보내는 이름을 의미-->
                            <input type="text" name="product_name" class="form-control" id="product_name" value="${gitem.product_name}" placeholder="${gitem.product_name}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="product_price">Price:</label>
                        <div class="col-sm-10">
                            <input type="number" name="product_price" class="form-control" id="product_price" value="${gitem.product_price}" placeholder="${gitem.product_price}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="img">Image:</label>
                        <div class="col-sm-10">
                            <input type="file" name="img" class="form-control" id="img" placeholder="Input Image">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="category_id">Category ID:</label>
                        <div class="col-sm-10">
                            <input type="number" name="category_id" class="form-control" id="category_id" value="${gitem.category_id}" placeholder="${gitem.category_id}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button id="register_btn" type="button" class="btn btn-info">Update</button>
                            <button id="delete_btn" type="button" class="btn btn-info">Delete</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
