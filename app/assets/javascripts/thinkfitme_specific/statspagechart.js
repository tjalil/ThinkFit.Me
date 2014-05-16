var lineResize,
    lineChart;
function lineChartOperaHack(){
    //lineChart is somehow not rendered correctly after updates. Need to reupdate
    if ($.browser.opera){
        clearTimeout(lineResize);
        lineResize = setTimeout(lineChart.update, 300);
    }
}
nv.addGraph(function() {
    var chart = nv.models.lineChart()
        .margin({top: 0, bottom: 25, left: 25, right: 0})
        //.showLegend(false)
        .color([
            //$orange, '#cf6d51'
            $green, '#56bc76'
            //'#618fb0', '#61b082'
        ]);

    chart.legend.margin({top: 3});

    chart.yAxis
        .showMaxMin(false)
        .tickFormat(d3.format(',.f'));

    chart.xAxis
        .showMaxMin(false)
        .tickFormat(function(d) { return d3.time.format('%b %d')(new Date(d)) });
    var data = testData(['All'], 60);
    data[0].area = true;
    d3.select('#statspagechart svg')
        .datum(data)
        .transition().duration(500)
        .call(chart);

    nv.utils.windowResize(chart.update);

    chart.legend.dispatch.on('legendClick.updateExamples', function() {
        lineChartOperaHack();
    });

    lineChart = chart;

    lineChartOperaHack();

    return chart;
});