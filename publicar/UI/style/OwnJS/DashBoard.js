function dashBoardColumnBar(PageName, MethodName, TableName, Name, Value, highChartName, highCahrtType, highChartTitle, color) {
    $.ajax({
        type: "POST",
        url: '' + PageName + '.aspx/' + MethodName + '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {
            if (data.d.length > 0) {
                var xmlDoc = $.parseXML(data.d);
                var xml = $(xmlDoc);
                var info = xml.find('' + TableName + '');

                var mySeries = [];

                $(info).each(function () {

                    mySeries.push({ name: $(this).find("" + Name + "").text(), y: parseInt($(this).find("" + Value + "").text()) });
                })


                Highcharts.chart('' + highChartName + '', {
                    chart: {
                        type: '' + highCahrtType + ''
                    },
                    title: {
                        text: '' + highChartTitle + ''
                    },
                    accessibility: {
                        announceNewData: {
                            enabled: false
                        }
                    },
                    xAxis: {
                        type: 'category'
                    },
                    yAxis: {
                        title: {
                            text: 'Cantidad'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            borderWidth: 0,
                            dataLabels: {
                                enabled: true,
                                crop: false,
                                overflow: "none"
                            }
                        }
                    },

                    tooltip: {
                        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.0f}</b><br />'
                    },
                    colors: [color],
                    series: [
                        {
                            name: "",
                            colorByPoint: true,
                            data: mySeries,
                            minPointLength: 10
                        }
                    ]
                }

                );
            }
        },
        error: function (result) {
            alert("Error");
        }
    });
}


function dashBoardColumnBarDate(PageName, MethodName, TableName, Name, Value, highChartName, highCahrtType, highChartTitle, color, date1, date2) {
    var params = "{ Date1:'" + date1 + "', Date2:'" + date2 + "'}";
    $.ajax({
        type: "POST",
        url: '' + PageName + '.aspx/' + MethodName + '',
        data: params,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {
            if (data.d.length > 0) {
                var xmlDoc = $.parseXML(data.d);
                var xml = $(xmlDoc);
                var info = xml.find('' + TableName + '');

                var mySeries = [];

                $(info).each(function () {

                    mySeries.push({ name: $(this).find("" + Name + "").text(), y: parseInt($(this).find("" + Value + "").text()) });
                })


                Highcharts.chart('' + highChartName + '', {
                    chart: {
                        type: '' + highCahrtType + ''
                    },
                    title: {
                        text: '' + highChartTitle + ''
                    },
                    accessibility: {
                        announceNewData: {
                            enabled: false
                        }
                    },
                    xAxis: {
                        type: 'category'
                    },
                    yAxis: {
                        title: {
                            text: 'Cantidad'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            borderWidth: 0,
                            dataLabels: {
                                enabled: true,
                                crop: false,
                                overflow: "none"
                            }
                        }
                    },

                    tooltip: {
                        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.0f}</b><br />'
                    },
                    colors: [color],
                    series: [
                        {
                            name: "",
                            colorByPoint: true,
                            data: mySeries,
                            minPointLength: 10
                        }
                    ]
                }

                );
            }
        },
        error: function (result) {
            alert("Error");
        }
    });
}

// ********************* Grafico de barras **********************//
function tendenciaTotal(chartName, dato1, dato2, goal, categories, title) {


    console.log("Prueba: " + categories.toString());

    Highcharts.chart(chartName, {
        title: {
            text: title
        },
        accessibility: {
            announceNewData: {
                enabled: false
            }
        },
        xAxis: {
            categories: categories
        },
        yAxis: {
            title: {
                text: 'Porcentaje'
            }
        },
        legend: {
            enabled: false
        },
        plotOptions: { //Título encima de las barras
            series: {
                borderWidth: 0,
                dataLabels: {
                    enabled: true,
                    crop: false,
                    overflow: "none",
                    format: '{point.y:.f}%'
                }
            }
        },
        labels: {
            items: [{
                style: {
                    left: '50px',
                    top: '18px',
                    color: ( // theme
                        Highcharts.defaultOptions.title.style &&
                        Highcharts.defaultOptions.title.style.color
                    ) || 'black'
                }
            }]
        },
        series: [{
            type: 'column',
            name: 'Batch Counted Accuracy',
            data: dato1
        }, {
            type: 'column',
            name: 'Count Cost',
            data: dato2
        }, {
            type: 'spline',
            name: 'Goal',
            data: goal,
            marker: {
                lineWidth: 5,
                lineColor: Highcharts.getOptions().colors[3],
                fillColor: 'red'
            }
        }]
    });
}
// ********************* Grafico genérico **********************//
function loadChart(series, mydrillDown, chartName, text, legend, type, color, subtitle, categories, goal) {
    Highcharts.chart(chartName, {
        chart: {
            type: type
        },
        title: {
            text: text
        },
        subtitle: {
            text: subtitle
        },

        accessibility: {
            announceNewData: {
                enabled: false
            }
        },
        xAxis: {
            type: 'category',
            categories: categories
        },
        yAxis: {
            title: {
                text: legend
            }
        },
        legend: {
            enabled: false
        },
        plotOptions: {
            series: {
                borderWidth: 0,
                dataLabels: {
                    enabled: true,
                    crop: false,
                    overflow: "none"
                }
            }
        },

        tooltip: {
            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}</b><br />'
        },
        //colors: [color],
        series: [
            {
                name: "",
                colorByPoint: true,
                data: series,
                minPointLength: 10
            }, {
                type: 'spline',
                name: 'Goal',
                data: goal,
                marker: {
                    lineWidth: 5,
                    lineColor: Highcharts.getOptions().colors[3],
                    fillColor: 'red'
                }
            }
        ], drilldown: {
            series: mydrillDown
        }
    }
    );
}

// ********************* Grafico pila de columnas **********************//
function columnStack(chartName, title, categories, data) {
    Highcharts.chart(chartName, {
        chart: {
            type: 'column'
        },
        title: {
            text: title
        },
        xAxis: {
            categories: categories
        },
        yAxis: {
            min: 0,
            title: {
                text: 'cantidad'
            },
            stackLabels: {
                enabled: true,
                style: {
                    fontWeight: 'bold',
                    color: ( // theme
                        Highcharts.defaultOptions.title.style &&
                        Highcharts.defaultOptions.title.style.color
                    ) || 'gray'
                }
            }
        },
        legend: {
            align: 'right',
            x: -30,
            verticalAlign: 'top',
            y: 25,
            floating: true,
            backgroundColor:
                Highcharts.defaultOptions.legend.backgroundColor || 'white',
            borderColor: '#CCC',
            borderWidth: 1,
            shadow: false
        },
        tooltip: {
            headerFormat: '<b>{point.x}</b><br/>',
            pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
        },
        plotOptions: {
            column: {
                stacking: 'normal',
                dataLabels: {
                    enabled: true
                }
            }
        },
        series: data
    });
}