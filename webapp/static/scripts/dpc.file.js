/**
 * 
 */
function initUploadFile(obj) {
	var realName = $('#realName').val();
	realName = realName + "**" + obj.realName + "**";
	$('#realName').val(realName);
	var saveName = $('#saveName').val();
	saveName = saveName + "**" + obj.saveName + "**";
	$('#saveName').val(saveName);
//alert("init:" + realName + "----" + saveName);
}
	
function removeUploadFile(fileName) {
	var realName = $('#realName').val();
	var saveName = $('#saveName').val();
	realName = realName.replace(/\*\*\*\*/g, "||||").replace(/\*\*/g, "");
	saveName = saveName.replace(/\*\*\*\*/g, "||||").replace(/\*\*/g, "");
	var realArr = realName.split("||||");
	var saveArr = saveName.split("||||");
	var index = 0;
	for(var i = 0; i < realArr.length; i++) {
		if(fileName == realArr[i]) {
			index = i;
			break;
		}
	}
	realName = "||" + realName + "||";
	realName = realName.replace("||" +realArr[index]+ "||", "").replace(/\|\|\|\|/g, "****").replace(/\|\|/g, "**");
	saveName = "||" + saveName + "||";
	saveName = saveName.replace("||" +saveArr[index]+ "||", "").replace(/\|\|\|\|/g, "****").replace(/\|\|/g, "**");
	
	$('#realName').val(realName);
	$('#saveName').val(saveName);
//alert("remove:" + realName + "----" + saveName);
}

function cancleUploadFile(index, fileRealName, fileSaveName) {
	//alert(index);
	$('#uploadifive-file-dpc-' + index).remove();
	$('#dpc-file-' + index).remove();
	removeUploadFile(fileRealName);
	//$('#file').uploadifive('cancel', $('#uploadifive-file-file-' + index).first().data('file'));
}