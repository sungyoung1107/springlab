<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

    let stockChart = {
        init : function(){
            stockChart.getData();
        },
        getData : function(){
            $.ajax({
                url: '/charts/stockimpl',
                success: function(result){
                    console.log(result);
                    stockChart.display(result);
                }
            });
        },
        display : function(result){
            Highcharts.chart('container1', {
                chart: {
                    type: 'spline'
                },
                title: {
                    text: '재고 부족 상품 리스트'
                },
                subtitle: {
                    text: 'Source: ' +
                        '<a href="/stock/all" ' +
                        'target="_blank">Stock Management</a>'
                },
                xAxis: {
                    categories: result["categories"],
                    accessibility: {
                        description: 'Months of the year'
                    }
                },
                yAxis: {
                    title: {
                        text: 'Stock'
                    },
                    labels: {
                        formatter: function () {
                            return this.value + '개';
                        }
                    }
                },
                tooltip: {
                    crosshairs: true,
                    shared: true
                },
                plotOptions: {
                    spline: {
                        marker: {
                            radius: 4,
                            lineColor: '#666666',
                            lineWidth: 1
                        }
                    }
                },
                series: [{
                    name: '실 재고 수량',
                    data: result["amount"]
                }, {
                    name: '예상 재고 수량',
                    data:result["expectedamount"]
                }]
            });
        }
    }

    let categoryChart = {
        init:function(){
            $.ajax({
                url:'/chart1',
                success:function(data){
                    categoryChart.display(data)
                }
            });
        },
        display:function(data){
            Highcharts.chart('container2', {
                chart: {
                    type: 'column'
                },
                title: {
                    text: '카테고리별 남녀 주문량'
                },
                subtitle: {
                    text: 'Source: cart'
                },
                xAxis: {
                    categories: [
                        '귀걸이',
                        '반지',
                        '시계',
                        '팔찌',
                        '목걸이',
                        '기타'
                    ],
                    crosshair: true
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: '수량(개)'
                    }
                },
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y:.1f} 개</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series: data
            });

        }
    }

    let popularChart = {
        init : function() {
            popularChart.getData();
        },
        getData : function (){
            $.ajax({
                url:'/charts/popular',
                success: function (result) {
                    console.log(result);
                    // alert("인기상품입니다 : "+ result);
                    popularChart.display(result);
                },
                error  : function (xhr, status, error) {
                    console.log(error);
                }
            });
        },
        display : function(result){
            $("#item1").text("'"+result["1위"]+"' 가 고객의 마음을 가장 많이 사로잡았어요!"+"  실시간 카트에 담긴 갯수는 "+result["1위수량"]+"개!!");
            $("#item2").text("'"+result["2위"]+"' 가 2위로 달리고 있어요!+"+"  실시간 카트에 담긴 갯수는 "+result["2위수량"]+"개!!");
            $("#item3").text("'"+result["3위"]+"' 가 3위!!!!!"+"  실시간 카트에 담긴 갯수는 "+result["3위수량"]+"개!!");
            $("#item4").text("'"+
                result["4위"]+"' 가 4위가 담겼네요!"+"  실시간 카트에 담긴 갯수는 "+result["4위수량"]+"개!!");
        }
    }

    $(document).ready(function () {
        stockChart.init();
        categoryChart.init();
        popularChart.init();

        setInterval(stockChart.init, 5000);
        setInterval(categoryChart.init, 5000);
        setInterval(popularChart.init, 5000);
    });

</script>

<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">Dashboard</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item active">오늘 고객의 마음을 사로잡은 아이템은 무엇일까요?</li>
        </ol>
        <div class="row">
            <div class="col-xl-3 col-md-6">
                <div class="card bg-primary text-white mb-4">
                    <div class="card-body">오늘의 관심 상품 1위</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <span id="item1"></span>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-warning text-white mb-4">
                    <div class="card-body">오늘의 관심 상품 2위</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <span id="item2"></span>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-success text-white mb-4">
                    <div class="card-body">오늘의 관심 상품 3위</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <span id="item3"></span>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-danger text-white mb-4">
                    <div class="card-body">오늘의 관심 상품 4위</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <span id="item4"></span>
                    </div>
                </div>
                </div>
            </div>
        </div>
        <div class="container-fluid px-4">
            <div class="card mb-4">
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">한 눈에 보는 차트</li>
                </ol>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm">
                            <div id="container1"></div>
                        </div>
                        <div class="col-sm">
                            <div id="container2"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</main>
