<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let product_add = {
        init:function(){
            $('#register_btn').click(function(){
                product_add.send();
            });
        },
        send:function(){
            $('#register_form').attr({
                method:'post',
                action:'/product/addimpl',
                enctype: 'multipart/form-data'
            });
            $('#register_form').submit();
        }
    };

    $(function(){
        product_add.init();
    })
</script>

<div class="container-fluid px-4">
    <h1 class="mt-4">Product Add</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Product Add</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <!--Register Form start -->
                <form id="register_form" class="form-horizontal well">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="product_name">Name: </label><br/>
                        <div class="col-sm-6"> <!--name 은 서버로 보내는 이름을 의미-->
                            <input type="text" name="product_name" class="form-control" id="product_name" placeholder="Enter Name">
                        </div>
                    </div><br/>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="product_price">Price:</label><br/>
                        <div class="col-sm-6">
                            <input type="number" name="product_price" class="form-control" id="product_price" placeholder="Enter Price">
                        </div>
                    </div><br/>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="img">Image:</label><br/>
                        <div class="col-sm-6">
                            <input type="file" name="img" class="form-control" id="img" placeholder="Input Image">
                        </div>
                    </div><br/>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="category_id">Category_ID:</label><br/>
                        <div class="col-sm-6">
                            <input type="number" name="category_id" class="form-control" id="category_id" placeholder="Input Category_id">
                        </div>
                    </div><br/>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="category_sub_id"> SUB ID: </label>
                        <div class="col-sm-4"> <!--name 은 서버로 보내는 이름을 의미-->
                            <select class="form-control" id="category_sub_id" name="category_sub_id" >
                                <option value=""> 선택 </option>
                                <option value="0"> 구분 없음 </option>
                                <option value="1" > 캐주얼 </option>
                                <option value="2" > 기프트 </option>
                                <option value="3" > 웨딩 </option>
                            </select>
                        </div>
                    </div><br/>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button id="register_btn" type="button" class="btn btn-info">Register</button>
                        </div>
                    </div>
                </form>
                <!--Register Form end -->
            </div>
        </div>
    </div>
</div>


