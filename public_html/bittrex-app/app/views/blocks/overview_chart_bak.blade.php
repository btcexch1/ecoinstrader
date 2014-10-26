<div id="overview">
	<div class="container">		
		<span class="title left"><i class="icon-air"></i> Overview</span>		
        <p class="show-all"><a href="<?=url('/user/profile/orders', $parameters = array(), $secure = null);?>">Show order book<i class="icon-arrow-right-5"></i></a></p>
		<hr>
		<div class="tab-control" data-role="tab-control">
		    <ul class="tabs">
		        <li class="active tabusd"><a href="#_page_1">USD</a></li>
		        <li class="tabltc"><a href="#_page_2">LTC</a></li>		        
		    </ul>
		 
		    <div class="frames">
		        <div class="frame" id="_page_1" style="display: block;">
		        	<div class="data-tab">
		        		<div class="data-tab-left" id="lastprice-{{{Session::get('market_id')}}}">
			        		<span id="spanLastPrice-{{{Session::get('market_id')}}}"><sup class="big-text">{{{$coinsecond}}}</sup><span class="big-text">@if(empty($lastest_price)) {{{sprintf('%.8f',0)}}} @else {{sprintf('%.8f',$lastest_price)}} @endif</span></span>
			        		<!-- <span class="change"><i class="icon-arrow-up-2"></i><br>0.67%</span> -->
			        	</div>
		        		<div class="data-tab-right">
			        		<table class="table">
			        			{{--<tbody>
                                    <tr><td class="title-td">Today's Open</td><td class="">$645.56</td><td class="title-td">Change</td><td class="">$4.33<i class="icon-arrow-up-2 green small"></i></td></tr>

			        			    <tr><td class="title-td">Today's High</td><td class=""><span id="spanHighPrice-{{{Session::get('market_id')}}}">@if(empty($get_prices->max)) {{{sprintf('%.8f',0)}}} @else {{sprintf('%.8f',$get_prices->max)}} @endif</span> {{{$coinsecond}}}</td><td class="title-td">Market Cap</td><td class="">$4.33</td></tr>

			        			    <tr><td class="title-td">Today's Low</td><td class=""><span id="spanLowPrice-{{{Session::get('market_id')}}}">@if(empty($get_prices->min)) {{{sprintf('%.8f',0)}}} @else {{sprintf('%.8f',$get_prices->min)}} @endif</span> {{{$coinsecond}}}</td><td class="title-td">Total BTC</td><td class="">{{(isset($statistic_btc->total) && !empty($statistic_btc->total))? sprintf('%.8f',$statistic_btc->total):0}}</td></tr>
    			        		</tbody>--}}
                                <tbody>
                                    <tr><td class="title-td">Today's High</td><td class=""><span id="spanHighPrice-{{{Session::get('market_id')}}}">@if(empty($get_prices->max)) {{{sprintf('%.8f',0)}}} @else {{sprintf('%.8f',$get_prices->max)}} @endif</span> {{{$coinsecond}}}</td></tr>

                                    <tr><td class="title-td">Today's Low</td><td class=""><span id="spanLowPrice-{{{Session::get('market_id')}}}">@if(empty($get_prices->min)) {{{sprintf('%.8f',0)}}} @else {{sprintf('%.8f',$get_prices->min)}} @endif</span> {{{$coinsecond}}}</td></tr>
                                    <tr><td class="title-td">Total BTC</td><td class="">{{(isset($statistic_btc->total) && !empty($statistic_btc->total))? sprintf('%.8f',$statistic_btc->total):0}}</td></tr>
                                </tbody>
                            </table>
			        	</div>
			        	<div class="chart-data clear">
			        		<div id="chartdiv" style="width:100%; height:400px;"></div>
			        	</div>
		        	</div>
		        </div>
		        <div class="frame" id="_page_2" style="display: none;">
		        	<div class="data-tab">
		        		<div class="data-tab-left">
			        		<span><sup class="big-text">$</sup><span class="big-text">649.90</span></span>
			        		<span class="change"><i class="icon-arrow-up-2"></i><br>0.67%</span>
			        	</div>
		        		<div class="data-tab-right">
			        		<table class="table">
			        			<tbody><tr><td class="title-td">Today's Open</td><td class="">$645.56</td><td class="title-td">Change</td><td class="">$4.33<i class="icon-arrow-up-2 green small"></i></td></tr>
			        			<tr><td class="title-td">Today's High</td><td class="">$652.87</td><td class="title-td">Market Cap</td><td class="">$4.33</td></tr>
			        			<tr><td class="title-td">Today's Low</td><td class="">$635.85</td><td class="title-td">Total LTC</td><td class="">$4.33</td></tr>
			        		</tbody></table>
			        	</div>
			        	<div class="chart-data clear">
			        		<div id="chartdivLTC"></div>
			        	</div>
		        	</div>
		        </div>		        
		    </div>
		</div>
	</div>
</div>
@section('script.footer')
@parent
{{HTML::style('assets/amcharts/style.css')}}
{{ HTML::script('assets/amcharts/amcharts.js') }}
{{ HTML::script('assets/amcharts/serial.js') }}
{{ HTML::script('assets/amcharts/amstock.js') }}
<script type="text/javascript">
var chart;
var defaultLoad=false;
var chartData=[];
AmCharts.loadJSON=function(timeSpan,buttonClick){
    chartData=[];
    createStockChart();
    var timeSpan_ = '6 hour';
    //console.log('timeSpan:',timeSpan);
    switch(timeSpan){
        case "1DD":
            timeSpan_ = '1 day';
            break;
        case "3DD":
            timeSpan_ = '3 day';
            break;
        case "7DD":
            timeSpan_ = '7 day';
            break;
        case "MAX":
            timeSpan_ = 'MAX';
            break;
        default:
            timeSpan_ = '6 hour';
    }
    console.log('timeSpan_:',timeSpan_);
    $('.loading').show();
    $.ajax({
        url:"<?php echo action('HomeController@getChart')?>",
        type:'post',
        dataType:'json',
        data: {Ajax:1,timeSpan:timeSpan_,market_id:<?php echo $market_id ?>},
        cache:false,
        async:true,
        success:function(rows){ 
            console.log('rows: ',rows);     
            $('.loading').hide();
            for(var i=0; i<rows.length; i++){
                //console.log('chartData '+i+': ',rows[i]);
                var open=parseFloat(rows[i]['open']).toFixed(8);
                var close=parseFloat(rows[i]['close']).toFixed(8);
                var high=parseFloat(rows[i]['high']).toFixed(8);
                var low=parseFloat(rows[i]['low']).toFixed(8);              
                //console.log('rows '+i+' date: '+rows[i]['date']+' open: '+open+' close: '+close+' high: '+high+' low: '+low);
                chartData.push({date:rows[i]['date'],open:open,close:close,high:high,low:low,exchange_volume:rows[i]['exchange_volume']});
            }
            //console.log('chartData: ',chartData);
            //date=rows[rows.length-1]['date'];
            //date=new Date(date.replace(" ","T")+'Z');
            //var localOffset=date.getTimezoneOffset()*60000;
            //date.setTime(date.getTime()+ 600000+ localOffset);
            //chartData.push({date:date,open:rows[rows.length-1]['close'],close:rows[rows.length-1]['close'],high:rows[rows.length-1]['close'],low:rows[rows.length-1]['close'],exchange_volume:0});
            chart.dataProvider=chartData;
            chart.validateNow();
            if(buttonClick===false){
                $('input[value="6 hours"]').click();
            }else{
                //$('input[value="MAX"]').removeClass('amChartsButtonSelected').addClass('amChartsButton');
                $('.amChartsPeriodSelector input[type=button]').removeClass('amChartsButtonSelected').addClass('amChartsButton');
                if(timeSpan=='6hh'){
                    $('input[value="6 hours"]').removeClass('amChartsButton').addClass('amChartsButtonSelected');
                }else if(timeSpan=='1DD'){
                    $('input[value="24 hours"]').removeClass('amChartsButton').addClass('amChartsButtonSelected');
                }else if(timeSpan=='3DD'){
                    $('input[value="3 days"]').removeClass('amChartsButton').addClass('amChartsButtonSelected');
                }else if(timeSpan=='7DD'){
                    $('input[value="1 week"]').removeClass('amChartsButton').addClass('amChartsButtonSelected');
                }else{
                    $('input[value="MAX"]').removeClass('amChartsButton').addClass('amChartsButtonSelected');
                }
            }

        }
    });
};
function buttonClickHandler(data){
    console.log('buttonClickHandler:',data);
    if(defaultLoad===true){
        if(typeof data.count!=='undefined'){AmCharts.loadJSON(data.count+ data.predefinedPeriod,true);
        }else{
            AmCharts.loadJSON(data.predefinedPeriod,true);
        }
    }else{
        defaultLoad=true;
    }
}
AmCharts.ready(function(){AmCharts.loadJSON('6hh',false);
    createStockChart();
});
function createStockChart(){
    chart=new AmCharts.AmStockChart();
    chart.pathToImages="/assets/js/amcharts/images/";
    var categoryAxesSettings=new AmCharts.CategoryAxesSettings();
    categoryAxesSettings.minPeriod="10mm";
    categoryAxesSettings.groupToPeriods=["10mm","30mm","hh","3hh","6hh","12hh","DD"];
    chart.categoryAxesSettings=categoryAxesSettings;
    chart.dataDateFormat="YYYY-MM-DD JJ:NN";
    var dataSet=new AmCharts.DataSet();
    dataSet.color="#7f8da9";
    dataSet.fieldMappings=[
        {fromField:"open",toField:"open"},
        {fromField:"close",toField:"close"},
        {fromField:"high",toField:"high"},
        {fromField:"low",toField:"low"},
        {fromField:"exchange_volume",toField:"exchange_volume"}
    ];
    dataSet.dataProvider=chartData;
    dataSet.categoryField="date";
    chart.dataSets=[dataSet];
    var stockPanel1=new AmCharts.StockPanel();
    stockPanel1.showCategoryAxis=false;
    stockPanel1.title="Price";
    stockPanel1.percentHeight=70;
    stockPanel1.numberFormatter={precision:8,decimalSeparator:'.',thousandsSeparator:','};
    var graph1=new AmCharts.StockGraph();
    graph1.valueField="value";
    graph1.type="candlestick";
    graph1.openField="open";
    graph1.closeField="close";
    graph1.highField="high";
    graph1.lowField="low";
    graph1.valueField="close";
    graph1.lineColor="#6bbf46";
    graph1.fillColors="#6bbf46";
    graph1.negativeLineColor="#F87A06";//"#db4c3c";
    graph1.negativeFillColors="#F87A06";//"#db4c3c";
    graph1.fillAlphas=1;
    graph1.balloonText="open:<b>[[open]]</b><br>close:<b>[[close]]</b><br>low:<b>[[low]]</b><br>high:<b>[[high]]</b>";
    graph1.useDataSetColors=false;
    stockPanel1.addStockGraph(graph1);
    var stockLegend1=new AmCharts.StockLegend();
    stockLegend1.valueTextRegular=" ";
    stockLegend1.markerType="none";
    stockPanel1.stockLegend=stockLegend1;
    var stockPanel2=new AmCharts.StockPanel();
    stockPanel2.title="Volume";
    stockPanel2.percentHeight=30;
    stockPanel2.numberFormatter={precision:3,decimalSeparator:'.',thousandsSeparator:','};
    var graph2=new AmCharts.StockGraph();
    graph2.valueField="exchange_volume";
    graph2.type="column";
    graph2.cornerRadiusTop=2;
    graph2.fillAlphas=1;
    graph2.periodValue="Sum";
    stockPanel2.addStockGraph(graph2);
    var stockLegend2=new AmCharts.StockLegend();
    stockLegend2.valueTextRegular=" ";
    stockLegend2.markerType="none";
    stockPanel2.stockLegend=stockLegend2;
    chart.panels=[stockPanel1,stockPanel2];
    var cursorSettings=new AmCharts.ChartCursorSettings();
    cursorSettings.valueBalloonsEnabled=true;
    cursorSettings.fullWidth=true;
    cursorSettings.cursorAlpha=0.1;
    chart.chartCursorSettings=cursorSettings;
    var periodSelector=new AmCharts.PeriodSelector();
    periodSelector.position="top";
    periodSelector.dateFormat="YYYY-MM-DD JJ:NN";
    periodSelector.inputFieldWidth=150;
    periodSelector.inputFieldsEnabled=false;
    periodSelector.hideOutOfScopePeriods=false;
    periodSelector.periods=[
        {period:"hh",count:6,label:"6 hours",selected:true},
        {period:"DD",count:1,label:"24 hours"},
        {period:"DD",count:3,label:"3 days"},
        {period:"DD",count:7,label:"1 week"},
        {period:"MAX",label:"MAX"}
    ];
    periodSelector.addListener('changed',function(period){buttonClickHandler(period);});
    chart.periodSelector=periodSelector;
    var panelsSettings=new AmCharts.PanelsSettings();
    panelsSettings.usePrefixes=false;
    chart.panelsSettings=panelsSettings;
    var valueAxis=new AmCharts.ValueAxis();
    valueAxis.precision=8;
    chart.valueAxis=valueAxis;
    chart.chartScrollbarSettings.enabled=false;
    chart.write('chartdiv');
}
    
    function use_price(type, price, total_amount){
        // var pre = 'b_';
        // if(type==2) pre = 's_';
        // $('#'+pre+'price').val(price.toFixed(8));
        // $('#'+pre+'amount').val(total_amount.toFixed(8));
        $('#s_price').val(price.toFixed(8));
        $('#s_amount').val(total_amount.toFixed(8));
        $('#b_price').val(price.toFixed(8));
        $('#b_amount').val(total_amount.toFixed(8));
        updateDataSell();
        updateDataBuy();
    } 

</script>
@stop