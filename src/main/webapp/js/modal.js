

 var beforeChecked = -1;
	 
     
	 
	   $(function(){
	 
	 
	 
	      $(document).on("click", "input[type=radio]", function(e) {
	 
	         var index = $(this).parent().index("label");
	 
	         if(beforeChecked == index) {
	 
	         beforeChecked = -1;
	 
	         $(this).prop("checked", false);
	 
	         }else{
	 
	         beforeChecked = index;
	 
	         }
	 
	      });
	 
	 });




