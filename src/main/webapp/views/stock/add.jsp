<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">Stock Add(Update)</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="/">Dashboard</a></li>
        </ol>
        <div class="card mb-4">
            <div class="card-body">
                재고 등록(변경)
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                Stock Add(Update)
            </div>
            <div class="card-body">
                <form id="stock_add" class="form-horizontal well" action="/stock/addimpl" method="get">
                    <div class="form-group">
                        <div class="row">
                            <label class="control-label col-sm-2" for="product_id">제품번호 </label><br/>
                            <div class="col-sm-3">
                                <input type="number" name="product_id" class="form-control" id="product_id"
                                       placeholder="제품번호 입력(xxxx)">
                            </div>
                            <div class="col-sm-3">
                                <button type="button" class="btn btn-info btn-lg btn-sm" data-toggle="modal"
                                        data-target="#myModal">
                                    상품번호 찾기
                                </button>
                            </div>
                        </div>
                    </div>
                    <br/>
                    <div class="form-group">
                        <div class="row">
                            <label class="control-label col-sm-2" for="product_costprice">원가 </label><br/>
                            <div class="col-sm-3">
                                <input type="number" name="product_costprice" class="form-control"
                                       id="product_costprice"
                                       placeholder="제품원가 입력">
                            </div>
                        </div>
                    </div>
                    <br/>
                    <div class="form-group">
                        <div class="row">
                            <label class="control-label col-sm-2" for="product_amount">재고 </label><br/>
                            <div class="col-sm-3">
                                <input type="number" name="product_amount" class="form-control" id="product_amount"
                                       placeholder="재고(변경 시 변경 후 재고) 입력">
                            </div>
                        </div>
                    </div>
                    <br/>
                    <button type="submit" class="btn btn-primary" name="stock_add_btn"
                            id="stock_add_btn">재고 등록(변경)
                    </button>
                </form>
            </div>
        </div>
    </div>
</main>
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Item List</h4>
            </div>
            <div class="modal-body">
                <c:forEach var="obj" items="${prolist}">
                    <p>${obj.product_id} : ${obj.product_name}
                        <input type="radio" name="product_target" onclick="selectItem(${obj.product_id})"/></p>
                </c:forEach>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script>
    function selectItem(itemId) {
        $("input:radio[name='product_target']").removeAttr("checked"); //우선 체크되어 있는 값을 초기화
        $("#product_id").val(itemId); // id 값을 제품번호 input창에 넣기
        closeModal(); // 안먹음
    }

    function closeModal() {
        $("#myModal").modal('hide');
    }
</script>
