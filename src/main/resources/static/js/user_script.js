// 회원가입 관련
let register_form = {

    init: function () {
        /* 유효성 검사 통과 유무 변수 */
        let id_duplicate_check = false; // 아이디 중복 검사

        /***** 취소 버튼 클릭 *****/
        $("#cancel_btn").click(function () {
            location.href = "/"
        });

        /***** 가입하기 버튼 클릭 *****/
        $("#register_btn").click(function () {
            let user_id = $("#user_id").val(); // id 입력란
            let user_pwd = $("#user_pwd").val(); // 비밀번호 입력란
            let user_pwd2 = $("#user_pwd2").val(); // 비밀번호 확인 입력란
            let user_gender = $("#user_gender option:selected").val();
            let user_name = $("#user_name").val(); // 이름 입력란
            let user_contact = $("#user_contact").val(); // 핸드폰번호 입력란
            let user_address1 = $("#user_address1").val(); // 우편번호 입력란
            let user_address2 = $("#user_address2").val(); // 주소 입력란
            let user_address3 = $("#user_address3").val(); // 상세주소 입력란
            let user_birthday = $("#user_birthday").val(); // 생년월일

            $("#register_info").hide();
            // 모든 값 있는지 확인
            if (user_id == "" || user_pwd == "" || user_pwd2 == "" || user_gender =="" || user_name == "" ||
                user_contact == "" || user_address1 == "" || user_address2 == "" || user_address3 == "" ||
                user_birthday == "") {
                $("#register_info_msg").text("모든 값을 입력하셔야 합니다. 확인해주세요!");
                $("#register_info").show();
                return;
            }
            // id 중복검사를 진행했는지 확인
            if (id_duplicate_check == false) {
                $("#register_info_msg").text("id 중복체크를 해주세요");
                $("#register_info").show();
                return;
            }
            // 비밀번호가 같은지 확인
            if (user_pwd !== user_pwd2) {
                $("#register_info_msg").text("비밀번호를 다시 확인해주세요");
                $("#register_info").show();
                $("#user_pwd2").val(""); // 초기화
                $("#user_pwd2").focus(); // 비밀번호 확인란에 커서
                return;
            }

            let user_address = $("#user_address1").val() + " " + $("#user_address2").val() + " " + $("#user_address3").val();
            $("#user_address").val(user_address);

            $("#register_form").attr("action", "/registerimpl"); // action이 어디로 갈지 경로 지정
            $("#register_form").submit();
        });

        /***** 아이디 중복체크 버튼 클릭 *****/
        $("#btnIdCheck").click(function () {
            let user_id = $("#user_id").val();
            if (user_id === "") {
                alert("아이디를 입력해주세요");
            } else {
                $.ajax({
                    type   : "POST",
                    url    : "/checkId",
                    data   : {
                        user_id: user_id
                    },
                    success: function (result) {
                        if (result === "success") {
                            $("#idAvailable").show();
                            $("#idFailure").hide();
                            id_duplicate_check = true;
                        } else {
                            $("#idAvailable").hide();
                            $("#idFailure").show();
                        }
                    },
                    error  : function (xhr, status, error) {
                        console.log(error);
                    }
                });
            }
        });
    }
}

// 상세페이지에서 회원정보 수정 관련
let user_detail_form = {
    init: function(){
        let self = user_detail_form;

        let user_address = $("#user_address1").val() + " " + $("#user_address2").val() + " " + $("#user_address3").val();
        $("#user_address").val(user_address);

        $("#btnSendcnum").click(function () {
            console.log("인증번호 전송"); // 인증번호 전송
            let user_id = $("#user_id").val();
            console.log("user_id : "+ user_id); // 인증번호 전송

            $.ajax({
               type: "post",
               url: "/forgotPwd",
               data : {
                   user_id: user_id
               },
                success: function (result) {
                    alert("비밀번호 초기화 : "+ result);
                },
                error  : function (xhr, status, error) {
                    console.log(error);
                }
            });
        });

        $('#update_btn').click(function(){
            self.send();
        });

        $('#delete_btn').click(function(){
            let c = confirm("삭제하시겠습니까?");
            if(c==true){
                location.href="/user/deleteimpl?id="+$("#user_id").val();
            }
        });
    },

    send: function(){
        $('#user_detail_form').attr({
            action : '/user/updateimpl',
            method : 'post'
        });
        $('#user_detail_form').submit();
    }
    
}


// 다음 주소 api
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            let addr = ''; // 주소 변수
            let extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if (data.userSelectedType === 'R') {
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraAddr !== '') {
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                // document.getElementById("sample6_extraAddress").value = extraAddr;

            } else {
                // document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('user_address1').value = data.zonecode;
            document.getElementById("user_address2").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("user_address3").focus();
        }
    }).open();
}

