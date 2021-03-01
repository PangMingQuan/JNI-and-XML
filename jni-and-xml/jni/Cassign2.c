#include <jni.h>
#include <stdio.h>
#include <math.h>

JNIEXPORT jboolean JNICALL Java_assignment_volume(JNIEnv *env, jobject obj, jint num){
	
	double length, height1, height2, width, base, area, vol, rad;
	double const div = 1.0/3.0;
	rad = 54*(3.142/180);
	
   if (num == 3){
   printf("\nPlease enter the length: ");
   scanf ("%lf", &length);
   printf("Please enter the height1: ");
   scanf ("%lf", &height1);
   printf ("Please enter the height2: ");
   scanf ("%lf", &height2);
   
   area = 1.0/2.0*length*height2;
   vol = div*area*height1;
   printf("Volume = %.4lf", vol);
 
   }
   else if(num == 4){
	    printf("\nPlease enter the length: ");
		scanf ("%lf", &length);
		printf("Please enter the width: ");
		scanf ("%lf", &width);
		printf ("Please enter the height1: ");
		scanf ("%lf", &height1);
   
   area = length*width;
   vol = div*area*height1;
   printf("Volume = %.4lf", vol);
   }
   else if (num == 5){
	    printf("\nPlease enter the height1: ");
		scanf ("%lf", &height1);
		printf ("Please enter the base edge: ");
		scanf ("%lf", &base);
   
   vol = 5.0/12.0*tan(rad)*height1*base*base;
   printf("Volume = %.4lf", vol);
   }
   else
	   printf("Invalid input");
   
   return num;


}
