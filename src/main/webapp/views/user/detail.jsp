<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    $(document).ready(function () {
        user_detail_form.init();
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
        width: 120px;
    }

</style>

<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">User Detail Information</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="/">Dashboard</a></li>
        </ol>
        <div class="card mb-4">
            <div class="card-body">
                '${cdetail.user_name}'님 정보
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                User Detail Information
            </div>
            <div id="container">
                <form class="form-horizontal" id="user_detail_form" action="">
                    <input type="hidden" id="user_address" name="user_address" value=""/>
                    <input type="hidden" name="user_id" value="${cdetail.user_id}"/>
                    <div class="form-group">
                        <div class="container mt-3">
                            <div class="input-group mb-3">
                                <label for="user_id" class="input-label">ID</label>
                                <input
                                        type="text"
                                        class="form-control"
                                        placeholder="ID"
                                        name="user_id"
                                        id="user_id"
                                        value="${cdetail.user_id}"
                                        disabled
                                />
                            </div>

                            <div class="input-group mb-3">
                                <label for="user_name" class="input-label">사용자이름</label>
                                <input
                                        type="text"
                                        class="form-control"
                                        placeholder="NAME"
                                        name="user_name"
                                        id="user_name"
                                        value="${cdetail.user_name}"
                                />
                            </div>

                            <div class="input-group mb-3">
                                <label class="input-label">성별</label>
                                <select class="form-control" name="user_gender" id="user_gender">
                                    <option value="">성별을 선택해주세요</option>
                                    <option value="M"
                                            <c:if test="${cdetail.user_gender.equalsIgnoreCase('M')}">selected</c:if>>남자
                                    </option>
                                    <option value="F"
                                            <c:if test="${cdetail.user_gender.equalsIgnoreCase('F')}">selected</c:if>>여자
                                    </option>
                                </select>
                            </div>

                            <div class="input-group mb-3">
                                <label for="user_contact" class="input-label">핸드폰번호</label>
                                <input
                                        type="text"
                                        class="form-control"
                                        placeholder="PHONE NUMBER"
                                        name="user_contact"
                                        id="user_contact"
                                        value="${cdetail.user_contact}"
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
                                        value="${cdetail.user_address}"
                                />
                            </div>

                            <div class="input-group mb-3">
                                <label for="user_birthday" class="input-label">생년월일</label>
                                <input type="date" name="user_birthday" class="form-control birthday-input"
                                       id="user_birthday" placeholder="Enter Birthday" value="${cdetail.user_birthday}">
                            </div>

                            <div class="container" style="text-align: right">
                                <button class="btn btn-success" type="button" id="btnSendcnum">
                                    임시 비밀번호 재전송
                                </button>
                                <button type="button" class="btn btn-primary" name="update_btn"
                                        id="update_btn">회원정보 수정
                                </button>
                                <button type="button" class="btn btn-warning" name="delete_btn"
                                        id="delete_btn">회원정보 삭제(탈퇴)
                                </button>
                            </div>
                            <br/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>