/**
 * 
 */

function areaChange(form) {
		   
        var p_subject_middle = document.getElementById("subject_middle").value;
        //console.log(p_subject_middle);
        var url = "pick.do";
        var param = "subject_middle=" + p_subject_middle;
        sel = form.subject_bottom;
        sendRequest(url, param, result_Subject, "GET");
     }
     
     function result_Subject(data){
        if(xhr.readyState == 4 && xhr.status == 200) {
           var data = xhr.responseText;
           var json = eval(data);   //json으로 받음.
           console.log(json);
           var jsonObj = JSON.parse(data); 
           var arr = [];   //배열로 전환.
           arr[0] = "";
           for(var i = 0 ; i < json.length ; i++){
              arr[i+1] = json[i].subject_bottom;
           }
           
           //기존에 있던 옵션박스 삭제
           for (i=sel.length; i>=1; i--){	
              sel.options[i] = null;
           }
           
           /* 옵션박스추가 */
           for (i=0; i < arr.length;i++){
              sel.options[i] = new Option(arr[i], arr[i]);
           }
        }
     }
	
     
     function areaChange(form) {
		   
         var p_subject_middle = document.getElementById("subject_middle").value;
         //console.log(p_subject_middle);
         var url = "pick.do";
         var param = "subject_middle=" + p_subject_middle;
         sel = form.subject_bottom;
         sendRequest(url, param, result_Subject, "GET");
      }