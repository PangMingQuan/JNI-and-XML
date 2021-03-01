import java.util.Scanner;

class assignment{

    public native void display(int num);
    public native void volume (int num);
   
   static {
	System.loadLibrary("Cassignment");
	System.loadLibrary("Cassign2");
   }
    public static void main (String args[]){
		int num;
		
        	assignment a = new assignment();
			Scanner input = new Scanner(System.in);
             System.out.println(" What is the total number of bottom edge of the pyramid");
			 num = input.nextInt();
        	a.display(num);
			a.volume(num);
   }

}