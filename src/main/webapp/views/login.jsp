<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let login_form = {
        init: function () {
            $('#login_btn').click(function () {
                login_form.send();
            });
        },
        send: function () {
            $('#login_form').attr({
               'action': '/loginimpl',
                'method': 'post'
            });
            $('#login_form').submit();
        }

    }

    $(function () {
        login_form.init();
    })
</script>

<main>
    <div class="container-fluid px-4">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <form id="login_form">
                            <div class="row justify-content-center">
                                <div class="col-lg-5">
                                    <div class="card shadow-lg border-0 rounded-lg mt-5">
                                        <div class="card-header"><h3 class="text-center font-weight-light my-4">
                                            Login</h3></div>
                                        <div class="card-body">
                                            <form>
                                                <div class="form-floating mb-3">
                                                    <input class="form-control" id="user_id" name="user_id" type="text"
                                                           placeholder="Id"/>
                                                    <label for="user_id">Id</label>
                                                </div>
                                                <div class="form-floating mb-3">
                                                    <input class="form-control" id="user_pwd" name="user_pwd" type="password"
                                                           placeholder="Password"/>
                                                    <label for="user_pwd">Password</label>
                                                </div>
                                                <div class="form-check mb-3">
                                                    <input class="form-check-input" id="inputRememberPassword"
                                                           type="checkbox" value=""/>
                                                    <label class="form-check-label" for="inputRememberPassword">Remember
                                                        Password</label>
                                                </div>
                                                <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                    <a class="small" href="/user/getPassword">Forgot Password?</a>
                                                    <button type="button" id="login_btn" class="btn btn-primary">Login
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="card-footer text-center py-3">
                                            <div class="small"><a href="/register">Need an account? Sign up!</a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </main>
            </div>
        </div>
    </div>
</main>
