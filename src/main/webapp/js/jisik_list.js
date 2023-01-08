var insert_button = document.getElementById("insert_list");
var listbox = document.getElementById("listBox");
console.log(insert_button.getAttribute('value'));
console.log(listbox);	
	
	insert_button.addEventListener('click',function(){
		
		
		var hidden = document.getElementById("log_id");
		var p_id = hidden.getAttribute('value');
		
		
		
		
	 	if( p_id == '' ){
			alert('로그인 후에 글쓰기 가능합니다');
			return;
		}
		
		location.href = 'jisik_insert.jsp?id=' + p_id; 
		
	});
	
	
	listbox.addEventListener('click', function(){
		var list_Idx = document.getElementById("list_idx");
		var p_idx = list_Idx.getAttribute('value');
		alert(p_idx);
		location.href = "view.do?idx=" + p_idx;
		
	});
	