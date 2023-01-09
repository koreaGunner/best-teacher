package practice;

public class String_test_1 {
	public static void main(String[] args) {
		
		
		String test = "?search_content=are";
		
		
		
		String real_param = test.substring(1);
		System.out.println(real_param);
		
		int index = real_param.indexOf('=');
		System.out.println(real_param.substring(0, index));
		String search_part = real_param.substring(0, index);
		
		String param_content = real_param.substring(index+1, real_param.length());
		System.out.println(param_content);
		
		
		
	}//main

}
