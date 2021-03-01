import java.util.Scanner;

class jarr { 
   public native char[] calculate(int nn); 
   public native char[] first(int nn);
   public native int[] third (char[] a, char[] b);
   
   public void display (char[] array){
        System.out.print("The random array is ");
	for (char text: array) 
                 System.out.print(text + " ");        
   }
   public void display2 (char[] array){
        System.out.print("The complete array is ");
	for (char text: array) 
                 System.out.print(text + " ");        
   }
   public void display3 (int[] array){
        System.out.print("\nThe result array is ");
	for (int element: array) 
                 System.out.print(element + " ");        
   }
   static { 
        System.loadLibrary("Cjarr");
		System.loadLibrary("Csecond");
		System.loadLibrary("Cthird");
    }    
    public static void main(String[] args) { 
        jarr ww = new jarr(); 
        Scanner input = new Scanner(System.in);   
        System.out.print("How many character do you want to enter? ");
        int nn = input.nextInt();
		char rand[] = ww.first(nn);
		ww.display(rand);
		char user[] = ww.calculate(nn);
		ww.display2(user);
		int compare[] = ww.third(rand, user); 	
		ww.display3(compare);
	}    
}

