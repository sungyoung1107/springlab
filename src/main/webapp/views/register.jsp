<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
    $(document).ready(function () {
        register_form.init();
    });
</script>

<style>
    .alert {
        padding: 0.5rem 1rem;
        font-size: 0.875rem;
    }

     .input-label {
         display: inline-block;
         margin-right: 10px;
         font-size: 1rem;
         font-weight: bold;
         color: grey;
         width: 100px;
     }

</style>

<main>
    <div class="container-fluid px-10">
        <br>
        <H3 style="text-align:center">JOIN US!</H3>
        <!-- Outer Row -->
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="col-lg-13">
                            <div class="p-5">
                                <form id="register_form" method="post">
                                    <input type="hidden" id="idcheckyn" name="idcheckyn" value="N"/>
                                    <!-- address 통합 주소 보내기 , 통합은 js에서 -->
                                    <input type="hidden" id="user_address" name="user_address" value=""/>
                                    <div class="container mt-3">
                                        <div class="input-group mb-2">
                                            <label for="user_id" class="input-label">ID</label>
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    placeholder="ID"
                                                    name="user_id"
                                                    id="user_id"
                                            />
                                            <div class="input-group-append">
                                                <button class="btn btn-success" type="button" id="btnIdCheck">
                                                    CHECK
                                                </button>
                                            </div>
                                        </div>
                                        <div class="input-group mb-3">
                                            <div class="alert alert-success" id="idAvailable" style="display: none">
                                                <strong>사용가능 ID! </strong>해당 id는 사용 가능한 id입니다.
                                            </div>
                                            <div class="alert alert-danger" id="idFailure" style="display: none">
                                                <strong>사용불가 ID! </strong>해당 id는 이미 사용 중으로 사용 불가합니다.
                                            </div>
                                            <span></span>
                                        </div>

                                        <div class="input-group mb-3">
                                            <label for="user_name" class="input-label">사용자이름</label>
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    placeholder="NAME"
                                                    name="user_name"
                                                    id="user_name"
                                            />
                                        </div>

                                        <div class="input-group mb-3">
                                            <label class="input-label">성별</label>
                                            <select class="form-control" name="user_gender" id="user_gender">
                                                <option value="" selected>성별을 선택해주세요</option>
                                                <option value="M">
                                                    남자
                                                </option>
                                                <option value="F">
                                                    여자
                                                </option>
                                            </select>
                                        </div>

                                        <div class="input-group mb-3">
                                            <label for="user_pwd" class="input-label">비밀번호</label>
                                            <input
                                                    type="password"
                                                    class="form-control"
                                                    name="user_pwd"
                                                    id="user_pwd"
                                                    placeholder="PASSWORD"
                                            />
                                        </div>

                                        <div class="input-group mb-3">
                                            <label for="user_pwd2" class="input-label">비밀번호확인</label>
                                            <input
                                                    type="password"
                                                    class="form-control"
                                                    name="user_pwd2"
                                                    id="user_pwd2"
                                                    placeholder="PASSWORD CONFIRM"
                                            />
                                        </div>

                                        <div class="input-group mb-3">
                                            <label for="user_contact" class="input-label">핸드폰번호</label>
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    placeholder="PHONE NUMBER"
                                                    name="user_contact"
                                                    id="user_contact"
                                            />
                                        </div>

                                        <div class="input-group mb-3">
                                            <label for="user_address1" class="input-label">우편번호</label>
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    id="user_address1"
                                                    name="user_address1"
                                                    placeholder="ZIPCODE"
                                            />
                                            <div class="input-group-append">
                                                <button class="btn btn-success" type="button" id="btnSearch"
                                                        onclick="DaumPostcode()">
                                                    SEARCH
                                                </button>
                                            </div>
                                        </div>

                                        <div class="input-group mb-3">
                                            <label for="user_address2" class="input-label">지번/도로명주소</label>
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    placeholder="ADDRESS"
                                                    name="user_address2"
                                                    id="user_address2"
                                            />
                                        </div>
                                        <span id="guide" style="color: #999; display: none"></span>

                                        <div class="input-group mb-3">
                                            <label for="user_address3" class="input-label">상세주소</label>
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    placeholder="STREET ADDRESS"
                                                    name="user_address3"
                                                    id="user_address3"
                                            />
                                        </div>

                                        <div class="input-group mb-3">
                                            <label for="user_birthday" class="input-label">생년월일</label>
                                            <input type="date" name="user_birthday" class="form-control birthday-input" id="user_birthday" placeholder="Enter Birthday">
                                        </div>

                                        <div class="alert alert-warning" style="display: none" id="register_info">
                                            <span id="register_info_msg"></span>
                                        </div>

                                        <div class="container" style="text-align: right">
                                            <button type="button" class="btn btn-primary" name="register_btn"
                                                    id="register_btn">REGISTER
                                            </button>
                                            <button type="button" class="btn btn-warning" name="cancel_btn"
                                                    id="cancel_btn">CANCEL
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
