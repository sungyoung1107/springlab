<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    /*#c1, #c2, #c3{*/
    /*    width: 250px;*/
    /*    height: 300px;*/
    /*    border: 2px solid blue;*/
    /*    margin: 0 10px*/
    /*}*/
</style>
<script>
    let chart03 = {
        init: function(){
            this.getdata1();
            this.getdata2();
            this.getdata3();
        },
        getdata1: function(){
            $.ajax({
               url: '/chart0301',
               success: function(result){
                   chart03.display1(result);
               }
            });
        },
        getdata2: function(){
            $.ajax({
                url: '/chart0302',
                success: function(result){
                    chart03.display2(result);
                }
            });
        },
        getdata3: function(){
            $.ajax({
                url: '/chart0303',
                success: function(result){
                    chart03.display3(result);
                }
            });
        },
        display1: function(result){
            Highcharts.chart('c1', {
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45
                    }
                },
                title: {
                    text: 'Beijing 2022 gold medals by country',
                    align: 'left'
                },
                subtitle: {
                    text: '3D donut in Highcharts',
                    align: 'left'
                },
                plotOptions: {
                    pie: {
                        innerSize: 100,
                        depth: 45
                    }
                },
                series: [{
                    name: 'Medals',
                    data: result
                }]
            });

        },
        display2: function(result){
            Highcharts.chart('c2', {
                chart: {
                    type: 'bubble',
                    plotBorderWidth: 1,
                    zoomType: 'xy'
                },
                legend: {
                    enabled: false
                },
                title: {
                    text: 'Sugar and fat intake per country'
                },
                subtitle: {
                    text: 'Source: <a href="http://www.euromonitor.com/">Euromonitor</a> and <a href="https://data.oecd.org/">OECD</a>'
                },
                accessibility: {
                    point: {
                        valueDescriptionFormat: '{index}. {point.name}, fat: {point.x}g, sugar: {point.y}g, obesity: {point.z}%.'
                    }
                },
                xAxis: {
                    gridLineWidth: 1,
                    title: {
                        text: 'Daily fat intake'
                    },
                    labels: {
                        format: '{value} gr'
                    },
                    plotLines: [{
                        color: 'black',
                        dashStyle: 'dot',
                        width: 2,
                        value: 65,
                        label: {
                            rotation: 0,
                            y: 15,
                            style: {
                                fontStyle: 'italic'
                            },
                            text: 'Safe fat intake 65g/day'
                        },
                        zIndex: 3
                    }],
                    accessibility: {
                        rangeDescription: 'Range: 60 to 100 grams.'
                    }
                },
                yAxis: {
                    startOnTick: false,
                    endOnTick: false,
                    title: {
                        text: 'Daily sugar intake'
                    },
                    labels: {
                        format: '{value} gr'
                    },
                    maxPadding: 0.2,
                    plotLines: [{
                        color: 'black',
                        dashStyle: 'dot',
                        width: 2,
                        value: 50,
                        label: {
                            align: 'right',
                            style: {
                                fontStyle: 'italic'
                            },
                            text: 'Safe sugar intake 50g/day',
                            x: -10
                        },
                        zIndex: 3
                    }],
                    accessibility: {
                        rangeDescription: 'Range: 0 to 160 grams.'
                    }
                },
                tooltip: {
                    useHTML: true,
                    headerFormat: '<table>',
                    pointFormat: '<tr><th colspan="2"><h3>{point.country}</h3></th></tr>' +
                        '<tr><th>Fat intake:</th><td>{point.x}g</td></tr>' +
                        '<tr><th>Sugar intake:</th><td>{point.y}g</td></tr>' +
                        '<tr><th>Obesity (adults):</th><td>{point.z}%</td></tr>',
                    footerFormat: '</table>',
                    followPointer: true
                },
                plotOptions: {
                    series: {
                        dataLabels: {
                            enabled: true,
                            format: '{point.name}'
                        }
                    }
                },
                series: [{
                    data: result,
                    colorByPoint: true
                }]
            });
        },
        display3: function(result){
            Highcharts.chart('c3', {
                chart: {
                    type: 'item'
                },
                title: {
                    text: 'Distribution of seats'
                },
                subtitle: {
                    text: 'Bundestag election 2021. Source: ' +
                        '<a href="https://www.bundeswahlleiter.de/en/bundeswahlleiter.html"' +
                        'target="_blank">Bundeswahlleiter</a> '
                },
                legend: {
                    labelFormat: '{name} <span style="opacity: 0.4">{y}</span>'
                },
                series: [{
                    name: 'Representatives',
                    keys: ['name', 'y', 'color', 'label'],
                    // data: [
                    //     ['The Left', 39, '#CC0099', 'DIE LINKE'],
                    //     ['Social Democratic Party', 206, '#EE0011', 'SPD'],
                    //     ['Alliance 90/The Greens', 118, '#448833', 'GRÜNE'],
                    //     ['Free Democratic Party', 92, '#FFCC00', 'FDP'],
                    //     ['Christian Democratic Union', 152, '#000000', 'CDU'],
                    //     ['Christian Social Union in Bavaria', 45, '#3366CC', 'CSU'],
                    //     ['Alternative for Germany', 83, '#3399FF', 'AfD'],
                    //     ['South Schleswig Voters\' Association', 1, '#000099', 'SSW']
                    // ],
                    data : result,
                    dataLabels: {
                        enabled: true,
                        format: '{point.label}',
                        style: {
                            textOutline: '3px contrast'
                        }
                    },
                    // Circular options
                    center: ['50%', '88%'],
                    size: '170%',
                    startAngle: -100,
                    endAngle: 100
                }],
                responsive: {
                    rules: [{
                        condition: {
                            maxWidth: 600
                        },
                        chartOptions: {
                            series: [{
                                dataLabels: {
                                    distance: -30
                                }
                            }]
                        }
                    }]
                }
            });
        }
    };
    // 문서가 준비되면~
    $(function(){
        chart03.init();
    })
</script>
<div class="col-sm-8 text-left">
    <div class="container">
        <h2>chart03</h2>
        <div class="row">
            <div class="col-sm-4" id="c1">

            </div>
            <div class="col-sm-4" id="c2">

           </div>
            <div class="col-sm-4" id="c3">

            </div>
        </div>
    </div>
</div>
<%--</html>--%>