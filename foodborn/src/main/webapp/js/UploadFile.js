/**
 * Author:by Alina
 * 
 */
var timer;
function uploadStep1(){
	document.getElementById("sporadic_upload_form_step1").submit();
	document.getElementById("progress_img_step1").style.width = "0%";
	document.getElementById("progress_txt_step1").innerHTML = "0%";
	document.getElementById("progress_step1").style.visibility = "visible";
	timer = setInterval("getProgressStep1()", 500);//每50ms调用一次回调函数查询进度
}
function getProgressStep1(){
	$.ajax({
		type:"POST",
		url:"sporadic_progress_step1.do",
		async:true,
		dataType:"text",
		success:function(data){
			var json = eval(data);
			var progress = json.progress;
			var result = json.result;
			var error = json.error;
			if(error != "" || error.length > 0){
				window.clearInterval(timer);
				alert(error);
			}else{
				if(result == "done"){
					window.clearInterval(timer);
					alert("上传成功！");
				}else if(result == "uploading"){
					document.getElementById("progress_img_step1").style.width = progress+"%";
					document.getElementById("progress_txt_step1").innerHTML = progress+"%";
//					window.clearInterval(timer);
				}else{
					window.clearInterval(timer);
				}
			}
		}
	});
}