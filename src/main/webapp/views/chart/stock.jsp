<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
      Highcharts.chart('container', {
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


  $(document).ready(function () {
    stockChart.init();
    categoryChart.init();
  });

</script>

<style>
  #container {
    width: 100%;
    height: 50%;
  }
</style>

<main>
  <div class="container-fluid px-4">
    <br>
    <div class="card mb-4">
      <div class="card-header">
        <i class="fas fa-table me-1"></i>
        차트
      </div>
      <div class="card-body">
        <div id="container"></div>
        <div id="container2"></div>
      </div>
    </div>
  </div>
</main>