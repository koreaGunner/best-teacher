package practice;

public class String_test {
	public static void main(String[] args) {
		
		String a = "abcdefghijklmnopqrstuvwxyz";
		
		int length = a.length();
		int half_length = length/2;
		int quarter_length = half_length/2;
		
		System.out.println("length:" + length);
		System.out.println("half_length:" + half_length);
		System.out.println("quarter_length:" + quarter_length);
		
		
		String part1 = a.substring(0,quarter_length);
		String part2 = a.substring(quarter_length,quarter_length *2);
		String part3 = a.substring(quarter_length*2,quarter_length*3);
		String part4 = a.substring(quarter_length*3, quarter_length*4);
		System.out.println(part1);
		System.out.println(part2);
		System.out.println(part3);
		System.out.println(part4);
		
		
		
	}//main

}
