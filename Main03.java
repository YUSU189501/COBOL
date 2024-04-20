public class Main03 {
	public static void main(String[] args) {
		int i, j = 0;
		for (i = 1; i <= 10; i++) { 
			System.out.print("年齢:");
			int age = new java.util.Scanner(System.in).nextInt();
			if(age < 10 || age >= 30 && age <= 39 ||
			   age == 44 || age == 55 || age >= 75 ) {
			   j++; } else { continue;
			}
		}
		System.out.println("カウンタ" + j);
	}
}
