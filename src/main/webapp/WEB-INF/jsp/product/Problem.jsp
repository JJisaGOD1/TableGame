<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/dashboard.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- 匯入jquery的核心依賴庫 -->
<script type="text/javascript"
	src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<!-- 匯入echarts的核心依賴庫 -->
<script type="text/javascript" src="${contextRoot}/js/echarts.min.js"></script>

<title>餅狀圖表</title>
</head>
<body>

	<!-- 為 ECharts 準備一個具備大小（寬高）的 DOM -->
	<div id="main" style="width: 50vw; height: 50vw; left: 10vw"></div>

</body>
<script type="text/javascript">
	/* 基於準備好的dom，初始化echarts例項 */
	var myChart = echarts.init(document.getElementById('main'));
	/* 核心顯示設定 */
	var option = {
		/* 標題設定 */

		title : {
			text : '商品問題回報統計',
			x : 'center',
			textStyle : {
				fontSize : 24,
				color : "rgba(204, 62, 62, 1)"
			}

		},
		tooltip : {
			trigger : 'item',
			formatter : "{a} <br/>{b} : {c} ({d}%)"
		},
		/* 顏色和選項的對應關係 */
		legend : {
			orient : 'vertical',
			left : 'left',
			data : [],
			textStyle : {
				fontSize :16
			}

		//待填充資料項1
		},
		/* 內容顯示 */
		series : [ {
			name : '商品', //滑鼠移至不同扇形區提示資訊的標題
			type : 'pie', //指定資料生成的圖表型別
			radius : '55%',
			center : [ '50%', '60%' ],
			data : [], //待填充資料項2
			/* 陰影區域設定 */
			itemStyle : {
				emphasis : {
					shadowBlur : 10,
					shadowOffsetX : 0,
					shadowColor : 'rgba(0, 0, 0, 0.5)'
				}
			},
			textStyle : {
				fontSize : 24
			}
		} ]
	};
	/* 傳送ajax請求 */
	var data = {};
	//傳送key-value型別的請求資料
	//例如：data.xxx = 1;
	$.ajax({
		type : "POST",
		//當傳送json資料時新增：
		/*  contentType: "application/json; charset=utf-8", */
		url : "${contextRoot}/getChart",
		data : data,
		error : function(data) {
			alert("出錯了！");
		},
		success : function(data) {
			//對echarts模板進行資料填充 
			option.legend.data = data.title;
			option.series[0].data = data.number;
			//重新載入圖表顯示
			myChart.setOption(option);
		}
	});
</script>
</html>