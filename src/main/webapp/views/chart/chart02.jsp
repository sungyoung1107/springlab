<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #container {
        width: 600px;
        height: 400px;
        border: 2px solid red;
    }
</style>

<script>
    /* 화살표 함수를 쓰면 this는 chart02를 가르키고, 일반 function(){}을 쓰면 this는 button을 가르킨다. */
    let chart02 = {
        init: function(){
            /* this를 고정 */
            const self=  this;

            /* 버튼 누르면 나오게 하기 */
            $('#chart02 > button').on('click',()=>{
                self.getData(self);
            });

            /* 5초마다 데이터를 뿌리기 */
            setInterval(function(){
                self.getData(self)
            }, 5000);
            // setInterval(chart02.getData(), 5000);
        },
        getData : function(self){
            $.ajax({
                url: '/chart02',
                success: function(result){
                    self.display(result);
                }
            });
        },
        display: function(result){
            Highcharts.chart('container', {
                chart: {
                    type: 'column',
                    options3d: {
                        enabled: true,
                        alpha: 10,
                        beta: 25,
                        depth: 70
                    }
                },
                title: {
                    text: 'External trade in goods by country, Norway 2021',
                    align: 'left'
                },
                subtitle: {
                    text: 'Source: ' +
                        '<a href="https://www.ssb.no/en/statbank/table/08804/"' +
                        'target="_blank">SSB</a>',
                    align: 'left'
                },
                plotOptions: {
                    column: {
                        depth: 25
                    }
                },
                xAxis: {
                    categories: result.categories,
                    labels: {
                        skew3d: true,
                        style: {
                            fontSize: '16px'
                        }
                    }
                },
                yAxis: {
                    title: {
                        text: 'NOK (million)',
                        margin: 20
                    }
                },
                tooltip: {
                    valueSuffix: ' MNOK'
                },
                series: [{
                    name: 'Total imports',
                    data: result.datas
                }]
            });
        }
    };
    // 문서가 준비되면~
    $(function(){
        chart02.init();
    })
</script>
<div class="col-sm-8 text-left">
    <div class="container" id="chart02">
        <h2>chart02</h2>
        <button type="button" class="btn btn-primary">Chart</button>
        <div id="container"></div>
    </div>
</div>
<%--</html>--%>