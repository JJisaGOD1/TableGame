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

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.popup_table_th th{
		width: 200px;
	}

	#table_style{
		background-color: white;
		padding: 1rem 2rem;
		border-radius: 1rem;
		box-shadow: rgb(0 0 0 / 24%) 0px 3px 8px;
		margin: auto;
		width: 56vw
	}
	h1{
		width: 10vw;
		display: inline-block;
		margin-left: 20vw
	}

</style>

</head>
<body>
<div style="display: flex ; margin-top: 4rem;">
	
	<div id="table_style">
		<h1 style="padding: 0 auto;">????????????</h1>
	<table id="table_id" class="display">
	    <thead>
	        <tr>
	            <th>?????????</th>
	            <th>?????????</th>
	            <th>????????????</th>
	            <th>????????????</th>
	            <th>????????????</th>
	            <th>????????????</th>
	            <th>??????</th>
	        </tr>
	    </thead>
	    <tbody>
	    	<c:forEach items="${groups}" var="group">
	        <tr class="oneGroup">
	            <td>${group.groupId}</td>
	            <td>${group.launcher.cusName}</td>
	            <td id="gameNameOf${group.groupId}">${group.product.product_name }</td>
	            <td>${group.gameDate }</td>
	            <td>${group.createdTime}</td>
	            <td id="playerNumOf${group.groupId}">${playerNumPerGroup[group.groupId]}</td>
	            <td>
					<!-- ?????? class:checkTheGroup  ??????$('.checkTheGroup').click(function({...}))??????????????????-->
					<button type="button" class="btn btn-success checkTheGroup" data-toggle="modal" data-target="#theGroupInfo" >
					??????
					</button>
	            	<!-- <a	class="btn btn-danger"
						href="${contextRoot}/backstage/groups/DeleteGroup/${group.groupId}"
						onclick="return del()">
					??????
					</a> -->
					<button 
						id="deleteGroup"+${group.groupId}
						class="btn btn-danger deleteGroup"
						value=${group.groupId}
						>??????
					</button>
	            </td>
	        </tr>
	        </c:forEach>
	    </tbody>
	</table>
	</div>
	<p>
	


<!-- Modal -->
	<div class="modal fade" id="theGroupInfo" tabindex="-1" aria-labelledby="theGroupInfoLabel" aria-hidden="true" >
	  <div class="modal-dialog" >
	    <div id="modal-content" class="modal-content" style="width: 700px;">
	      <div class="modal-header">
	        <h3 class="modal-title" id="popupGroupId" style="width: 250px;">popupGroupId</h3>
			<span style='margin: 0,auto'></span>?????????</span>

		<!-- <form id="saveChange" action="${contextRoot}/backstage/groups/saveGameAndNumChange" > -->
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
						<th>?????????</th>
						<th>????????????</th>
						<th>????????????</th>
						<th class="">??????</th>
						<th style="display: none;">?????????id</th>
					</tr>
				</thead>
				<tbody id="popup_table_tbody">
	
					<!-- <tr>
						<td>??????</td>
						<td>8</td>
						<td>0000/03/03</td>
						<td>
							<a>???</a>
						</td>
					</tr>
					<tr>
						<td>??????</td>
						<td>8</td>
						<td>0000/03/03</td>
						<td>
							<a>???</a>
						</td>
					</tr> -->
				</tbody>
			</table>
	
	      </div>
	      <div class="modal-footer">
			  <span id="warning"></span>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">??????</button>
			<!-- <input type="submit" class="btn btn-info" value="??????" onclick="check()"></button> -->
	        <button id="saveChange" class="btn btn-primary">??????</button>
	      </div>
		<!-- </form> -->		
	    </div>
	  </div>
	</div>
	<!-- Modal -->
</div>

<script >

$('.deleteGroup').click(function(){
	let groupId=$(this).val()
	Swal.fire({
	title: '???????????????????',
	text: "?????????????????????!",
	icon: 'warning',
	showCancelButton: true,
	cancelButtonColor: '#888888',
	cancelButtonText:'??????',
	confirmButtonColor: '#3085d6',
	confirmButtonText: '??????????????????!'
	}).then((result) => {
		if (result.isConfirmed) {
			$.ajax({
				type:'get',
				url:'http://localhost:8080/homepage/backstage/groups/DeleteGroup/'+groupId,
				cache:false,
				async:false,
				success: function(){
					setTimeout(function(){
						window.location.reload()
					},1000)
				}
			});
			Swal.fire(
			'?????????!',
			'???????????????.',
			'success'
			)
		}
	})
})

$('.checkTheGroup').click(function(){
	$('#warning').html('')//??????#warning

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
			
			

			$('#popupGroupId').html('????????????'+groupId)
			
			// respData.participants.forEach(function(participant, index, arr){
			// console.log(participant.participant)
			// })

			//??????option "${product.product_id==group.product.product_id}"
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
			$('#theGroupInfo .numOfparticipant').remove()
			//ul dto??????
			respData.participants.forEach(function(dto, index, arr){
				// console.log(dto.participant.id.groupId)
				let row=document.createElement('tr')
				let name=document.createElement('td')
				if(respData.group.launcher.id==dto.member.id){
					name.innerHTML=dto.member.cusName+'(??????)'
				}else{
					name.innerHTML=dto.member.cusName
				}
				let num=document.createElement('td')
				let numInput=document.createElement('input')
				numInput.type='number'
				numInput.name='numOf'+dto.member.id
				numInput.setAttribute('participantId',dto.member.id);//??????????????????participantId
				numInput.className='numOfparticipant'
				numInput.value=dto.participant.participantNum
				numInput.min=1;numInput.max=10
				numInput.style.width='3em'

				// $('#saveChange').append(numInput) //??????form?????????
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
					tdBtn.innerHTML='??????????????????'
				}else{
					let deleteBtn=document.createElement('input')
					// deleteBtn.href='${contextRoot }/backstage/groups/DeleteJoiner/'+groupId+'/'+dto.member.id
					deleteBtn.type='button'
					deleteBtn.onclick='return del()'
					deleteBtn.value='??????'
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

//??????????????????????????????????????????????????????
$(document).on('click','.deleteParticipant',function(){
	if(confirm('?????????????????????????')){
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

				//ajax??????datatable??????
				let originNum=parseInt( $('#playerNumOf'+groupId).html() )
				let tempNum=originNum
				
				$('#popupGroupId').html('????????????'+groupId)
				$('#popup_table_tbody *').remove()
				$('#theGroupInfo .numOfparticipant').remove()

				//dto??????
				respData.participants.forEach(function(dto, index, arr){
					let row=document.createElement('tr')
					let name=document.createElement('td')
					if(respData.group.launcher.id==dto.member.id){
						name.innerHTML=dto.member.cusName+'(??????)'
					}else{
						name.innerHTML=dto.member.cusName
					}
					let num=document.createElement('td')
					let numInput=document.createElement('input')
					numInput.type='number'
					numInput.name='numOf'+dto.member.id
					numInput.setAttribute('participantId',dto.member.id);//??????????????????participantId?????????
					numInput.participantId=dto.member.id
					numInput.className='numOfparticipant'
					numInput.value=dto.participant.participantNum
					numInput.min=1;numInput.max=10
					numInput.style.width='3em'
					num.append(numInput)
					// $('#saveChange').append(numInput)
					
					//ajax??????datatable????????????????????????????????????????????????????????????
					tempNum-=dto.participant.participantNum

					let joinedTime=document.createElement('td')
					joinedTime.innerHTML=dto.participant.joinedTime
					let tdBtn=document.createElement('td')
					
					if(respData.group.launcher.id==dto.member.id){
						tdBtn.innerHTML='??????????????????'
					}else{
						let deleteBtn=document.createElement('input')
						deleteBtn.href='${contextRoot }/backstage/groups/DeleteJoiner/'+groupId+'/'+dto.member.id
						deleteBtn.type='button'
						deleteBtn.onclick='return del()'
						deleteBtn.value='??????'
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
				//ajax??????datatable????????????????????????????????????????????????????????????
				$('#playerNumOf'+$('#inputGroupId').val()).html(originNum-tempNum)
			},
			error: function(){
				console.log('something wrong')
			}
		});
	}
})

$('#saveChange').click(function(){
	// console.log($('#selectGame').val())
	// $('.numOfparticipant').each(function(index){
	// 	console.log(index+':'+$(this).attr('name')+' '+$(this).val())
	// })

	

	let numOfparticipants={}
	$('.numOfparticipant').each(function(index){
		numOfparticipants[$(this).attr('participantId')]=parseInt( $(this).val())
	})

	let theGroupChangeInfo={
		'groupId':parseInt($('#inputGroupId').val()) ,
		'prodId':parseInt($('#selectGame').val()),
		'numOfparticipants':numOfparticipants
	}
	console.log(theGroupChangeInfo)

	$.ajax({
		url:'${contextRoot}/groups/changeMaxNums',
		contentType : 'application/json; charset=UTF-8',//????????????
		type:"post",
		dataType:"JSON",
		data:JSON.stringify({
			'productId':$('#selectGame').val()
		}),
		success: function(respData) {
			console.log(respData)
			let sum=0
			$('.numOfparticipant').each(function(index){
				sum+=parseInt($(this).val())
			})
			if(respData.maxplayer<sum){
				$('#warning').html('??????????????????????????????????????????').css('color','red')
			}else{
				$('#warning').html('')
				$('#theGroupInfo').modal('hide');//????????????
				$('.modal-backdrop').remove();//????????????
				$.ajax({
					url:'${contextRoot}/backstage/groups/change',
					contentType : 'application/json; charset=UTF-8',//????????????
					type:"post",
					// dataType:"JSON",
					data:JSON.stringify(theGroupChangeInfo),
					success:function(){
						//ajax??????datatable?????????????????????
						$('#playerNumOf'+$('#inputGroupId').val()).html(sum)
						$('#gameNameOf'+$('#inputGroupId').val()).html( $('#o'+$('#selectGame').val()).html())
					}
				})
			}
		}
	})
})



$(document).ready(function(){
    $('#table_id').DataTable({
    	"lengthMenu": [ [5,10, 25, 50, -1],[5,10, 25, 50, "All"] ],
    	"language": {
            "processing": "?????????...",
            "loadingRecords": "?????????...",
            "lengthMenu": "?????? _MENU_ ?????????",
            "zeroRecords": "?????????????????????",
            "info": "????????? _START_ ??? _END_ ??????????????? _TOTAL_ ???",
            "infoEmpty": "????????? 0 ??? 0 ??????????????? 0 ???",
            "infoFiltered": "(??? _MAX_ ??????????????????)",
            "infoPostFix": "",
            "search": "??????:",
            "paginate": {
                "first": "?????????",
                "previous": "?????????",
                "next": "?????????",
                "last": "????????????"
            },
            "aria": {
                "sortAscending": ": ????????????",
                "sortDescending": ": ????????????"
            }
        }
    }
    );
} );

function del() {
	var msg = "???????????????????";
	if (confirm(msg) == true) {
		return true;
	} else {
		return false;
	}
}
</script>
</body>
</html>