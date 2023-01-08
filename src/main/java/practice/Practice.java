package practice;

import java.util.ArrayList;
import java.util.List;

public class Practice {
	public static void main(String[] args) {
		
		List<String> filenameArr = new ArrayList<String>();
		filenameArr.add("we");
		filenameArr.add("adf");
		
		for( int i = 0; i < filenameArr.size(); i++ ) {
			System.out.println(filenameArr.get(i));
			
		}
		
		System.out.println(filenameArr.size());
		
	}//main

}
