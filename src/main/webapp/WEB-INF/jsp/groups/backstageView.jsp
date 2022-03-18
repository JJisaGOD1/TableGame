<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../layout/dashboard.jsp"></jsp:include>

<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>

<%-- <link href="${contextRoot }/css/bootstrap.min.css" rel="stylesheet"> --%>
<%-- <link href="${contextRoot }/js/bootstrap.bundle.min.js" rel="stylesheet"> --%>
<%-- <link href="${contextRoot }/js/bootstrap.bundle.min.js.map" rel="stylesheet"> --%>

<%-- <link rel="stylesheet" type="text/css" href="${contextRoot}/DataTables/datatables.css"> --%>
<%-- <script type="text/javascript" charset="utf8" src="${contextRoot}/DataTables/datatables.js"></script> --%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.popup_table_th th{
		width: 200px;
	}

</style>

</head>
<body>
<div style="width: 1000px ;display: flex ;margin: auto">
	<table id="table_id" class="display">
	    <thead>
	        <tr>
	            <th>團編號</th>
	            <th>發起者</th>
	            <th>桌遊名稱</th>
	            <th>聚團日期</th>
	            <th>建團時間</th>
	            <th>目前人數</th>
	            <th>查刪</th>
	        </tr>
	    </thead>
	    <tbody>
	    	<c:forEach items="${groups}" var="group">
	        <tr>
	            <td>${group.groupId}</td>
	            <td>${group.launcher.cusName}</td>
	            <td>${group.product.product_name }</td>
	            <td>${group.gameDate }</td>
	            <td>${group.createdTime}</td>
	            <td>${playerNumPerGroup[group.groupId]}</td>
	            <td>
					<!-- 創造 class:checkTheGroup  利用$('.checkTheGroup').click(function({...}))觸發點擊事件-->
					<button type="button" class="btn btn-success checkTheGroup" data-toggle="modal" data-target="#exampleModal" >
					查看
					</button>
	            	<a	class="btn btn-danger"
						href="${contextRoot}/backstage/groups/DeleteGroup/${group.groupId}"
						onclick="return del()">
					刪除
					</a>
	            </td>
	        </tr>
	        </c:forEach>
	    </tbody>
	</table>
	<p>
	


<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
	  <div class="modal-dialog" >
	    <div id="modal-content" class="modal-content" style="width: 700px;">
	      <div class="modal-header">
	        <h3 class="modal-title" id="popupGroupId" style="width: 250px;">popupGroupId</h3>
			<span style='margin: 0,auto'></span>遊戲：</span>

		<form id="saveChange" action="${contextRoot}/backstage/groups/saveGameAndNumChange" >
			<input id="inputGroupId" type="text" style="display: none;" value="" name="groupId">
			<select id="selectGame" name="updateProduct" > 
			</select>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div id='popupWindow' class="modal-body">
			<table id="popup_table" class="table">
				<thead class="thead-dark">
					<tr class="popup_table_th">
						<th>參加者</th>
						<th>攜帶人數</th>
						<th>加入時間</th>
						<th class="">刪除</th>
						<th style="display: none;">參加者id</th>
					</tr>
				</thead>
				<tbody id="popup_table_tbody">
	
					<!-- <tr>
						<td>亞當</td>
						<td>8</td>
						<td>0000/03/03</td>
						<td>
							<a>刪</a>
						</td>
					</tr>
					<tr>
						<td>亞當</td>
						<td>8</td>
						<td>0000/03/03</td>
						<td>
							<a>刪</a>
						</td>
					</tr> -->
				</tbody>
			</table>
	
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
	        <input type="submit" class="btn btn-primary" value="儲存" onclick="check()"></button>
	      </div>
		</form>
	    </div>
	  </div>
	</div>
</div>

<script >

$('.checkTheGroup').click(function(){

	let groupId=parseInt($(this).parent().parent().children()[0].innerHTML)
	$('#inputGroupId').val(groupId)
	
	$.ajax({
		url:"http://localhost:8080/homepage/backstage/groups/Participants/"+groupId,
		type:"get",
		dataType:"JSON",
		success: function(respData) {
			// array.forEach(function(currentValue, index, arr), thisValue)
			console.log(respData)
			
			
			// console.log(respData[0].participant.id.groupId)
			// <input type="text" style="display: none;" value="" name="groupId">
			
			

			$('#popupGroupId').html('團編號：'+groupId)
			
			// respData.participants.forEach(function(participant, index, arr){
			// console.log(participant.participant)
			// })

			//遊戲option "${product.product_id==group.product.product_id}"
				$('#selectGame *').remove()
				respData.prods.forEach(function(prod, index, arr){
				let op=document.createElement('option')
				op.id='o'+prod.product_id
				op.value=prod.product_id
				op.innerHTML=prod.product_name
				if(prod.product_id==respData.group.product.product_id){
					op.selected="selected"
				}
				$('#selectGame').append(op)
			})

			$('#popup_table_tbody *').remove()
			$('#saveChange .numOfparticipant').remove()
			//ul dto作法
			respData.participants.forEach(function(dto, index, arr){
				// console.log(dto.participant.id.groupId)
				let row=document.createElement('tr')
				let name=document.createElement('td')
				if(respData.group.launcher.id==dto.member.id){
					name.innerHTML=dto.member.cusName+'(團長)'
				}else{
					name.innerHTML=dto.member.cusName
				}
				let num=document.createElement('td')
				let numInput=document.createElement('input')
				numInput.type='number'
				numInput.name='numOf'+dto.member.id
				numInput.className='numOfparticipant'
				numInput.value=dto.participant.participantNum
				numInput.min=1;numInput.max=10
				numInput.style.width='3em'

				$('#saveChange').append(numInput)//加到form表單上
				num.append(numInput)
				
				
				let joinedTime=document.createElement('td')
				joinedTime.innerHTML=dto.participant.joinedTime
				let tdBtn=document.createElement('td')

				let hiddenParticipantId=document.createElement('td')
					hiddenParticipantId.id='hiddenParticipantId'
					hiddenParticipantId.innerHTML=dto.member.id
					hiddenParticipantId.value=dto.member.id
					hiddenParticipantId.style.display="none"
					console.log(hiddenParticipantId.innerHTML)
				
				
				if(respData.group.launcher.id==dto.member.id){
					tdBtn.innerHTML='團長不可移除'
				}else{
					let deleteBtn=document.createElement('input')
					// deleteBtn.href='${contextRoot }/backstage/groups/DeleteJoiner/'+groupId+'/'+dto.member.id
					deleteBtn.type='button'
					deleteBtn.onclick='return del()'
					deleteBtn.value='刪除'
					deleteBtn.className='btn btn-danger deleteParticipant'
					deleteBtn.id='deleteParticipant'
					tdBtn.append(deleteBtn)

				}
				
				console.log(dto.participant.joinedTime)

				row.append(name)
				row.append(num)
				row.append(joinedTime)
				row.append(tdBtn)
				row.append(hiddenParticipantId)
			
				$('#popup_table_tbody').append(row)
			})
			
			
		},
		error: function(){
			console.log('something wrong')
		}
	});
});

//動態生成按鈕需從其父元素以上開始繫結
$(document).on('click','.deleteParticipant',function(){
	if(confirm('確定刪除此參加者?')){
		let groupId=parseInt($(this).parent().parent().parent().parent().parent().
					prev().children()[0].innerHTML.substring(4))
		console.log(groupId)
		let hiddenParticipantId=parseInt($(this).parent().siblings('#hiddenParticipantId').text())
		console.log(hiddenParticipantId)
		$.ajax({
			url:'${contextRoot }/backstage/groups/DeleteJoiner/'+groupId+'/'+hiddenParticipantId,
			type:"get",
			dataType:"JSON",
			success: function(respData) {
				console.log(respData)
				
				$('#popupGroupId').html('團編號：'+groupId)
				$('#popup_table_tbody *').remove()
				$('#saveChange .numOfparticipant').remove()
				//dto作法
				respData.participants.forEach(function(dto, index, arr){
					let row=document.createElement('tr')
					let name=document.createElement('td')
					if(respData.group.launcher.id==dto.member.id){
						name.innerHTML=dto.member.cusName+'(團長)'
					}else{
						name.innerHTML=dto.member.cusName
					}
					let num=document.createElement('td')
					let numInput=document.createElement('input')
					numInput.type='number'
					numInput.name='numOf'+dto.member.id
					
					numInput.value=dto.participant.participantNum
					numInput.min=1;numInput.max=10
					numInput.style.width='3em'
					num.append(numInput)
					// $('#saveChange').append(numInput)

					let joinedTime=document.createElement('td')
					joinedTime.innerHTML=dto.participant.joinedTime
					let tdBtn=document.createElement('td')
					
					if(respData.group.launcher.id==dto.member.id){
						tdBtn.innerHTML='團長不可移除'
					}else{
						let deleteBtn=document.createElement('input')
						deleteBtn.href='${contextRoot }/backstage/groups/DeleteJoiner/'+groupId+'/'+dto.member.id
						deleteBtn.type='button'
						deleteBtn.onclick='return del()'
						deleteBtn.value='刪除'
						deleteBtn.className='btn btn-danger deleteParticipant'
						deleteBtn.id='deleteParticipant'
						tdBtn.append(deleteBtn)
					}
					console.log(dto.participant.joinedTime)

					row.append(name)
					row.append(num)
					row.append(joinedTime)
					row.append(tdBtn)
					$('#popup_table_tbody').append(row)
				})	
			},
			error: function(){
				console.log('something wrong')
			}
		});
	}
})

function check(){

}

	




$(document).ready( function () {
    $('#table_id').DataTable({
    	"lengthMenu": [ [5,10, 25, 50, -1], [5,10, 25, 50, "All"] ],
    	"language": {
            "processing": "處理中...",
            "loadingRecords": "載入中...",
            "lengthMenu": "顯示 _MENU_ 項結果",
            "zeroRecords": "沒有符合的結果",
            "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
            "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
            "infoFiltered": "(從 _MAX_ 項結果中過濾)",
            "infoPostFix": "",
            "search": "搜尋:",
            "paginate": {
                "first": "第一頁",
                "previous": "上一頁",
                "next": "下一頁",
                "last": "最後一頁"
            },
            "aria": {
                "sortAscending": ": 升冪排列",
                "sortDescending": ": 降冪排列"
            }
        }
    }
    );
} );


function del() {
	var msg = "是否刪除此團?";
	if (confirm(msg) == true) {
		return true;
	} else {
		return false;
	}
}
</script>
</body>
</html>