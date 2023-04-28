
let login_form = {
    init: function () {
        $("#login_btn").click(function () {
            login_form.send(); // this.send() 안됨! 유의
        });
    },
    // 서버로 보내기
    send: function () {
        $("#login_form").attr({
            'action': '/loginimpl', // controller로 간다.
            'method': 'post'
        });
        $("#login_form").submit();
    }
};

// let register_form = {
//     init: function () {
//         $("#register_btn").click(function () {
//             register_form.send(); // this.send() 안됨! 유의
//         });
//     },
//     // 서버로 보내기
//     send: function () {
//         $("#register_form").attr({
//             'action': '/registerimpl',
//             'method': 'post'
//         });
//         $("#register_form").submit();
//     }
// };

let jsp01 = {
    data: 0,
    init : function(num){
        this.data = num;
        // this.data = '${num}';
        // this.data = '<c:out value="${num}"/>';
        this.display();
    },
    display: function(){
        $('#jsp01').text(this.data+'입니다');
    }
};