<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>

    let item_get = {
        init: function () {
            $('#cart_btn').click(function () {
                let cust_id = "${logincust.id}";
                let item_id = "${gitem.id}";
                let cnt = $('#cnt').val();
                // alert(cust_id);
                // alert(item_id);
                // alert(cnt);

                $.ajax({
                    url:'/addcart',
                    data: {
                        cust_id : cust_id,
                        item_id : item_id,
                        cnt: cnt
                    },
                    success: function(){
                        // alert("ok");
                        $('#myModal').modal();
                    }
                });

                // $('#cart_form').attr({
                //     action: "/item/addcart",
                //     method: "get"
                // });
                // $('#cart_form').submit();
            });
        }
    };

    $(function () {
        item_get.init();
    });
</script>

<div class="col-sm-8 text-left">
    <div class="container">
        <div class="row content">
            <h2>Item Info</h2>
            <img src="/uimg/${gitem.imgname}" style="width:300px; height:300px">
            <h4>${gitem.id}</h4>
            <h4>${gitem.name}</h4>
            <h4>${gitem.price}</h4>
            <c:if test="${logincust != null}">
                <form class="form-inline well col-sm-5" id="cart_form" action="">
                    <input type="hidden" name="cust_id" value="${logincust.id}">
                    <input type="hidden" name="item_id" value="${gitem.id}">
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="cnt">갯수</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="cnt" placeholder="Enter Count" name="cnt">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-5">
                            <button type="button" id="cart_btn" class="btn btn-primary">Cart</button>
                        </div>
                    </div>
                </form>
            </c:if>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body">
                <a href="/item/allcart?id=${logincust.id}" class="btn btn-info" role="button">GO TO CART</a>
                <a href="/item/allpage" class="btn btn-info" role="button">CONTINUE</a>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>