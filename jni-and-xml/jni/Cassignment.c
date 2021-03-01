#include <jni.h>

JNIEXPORT jboolean JNICALL Java_assignment_display(JNIEnv *env, jobject obj, jint num){

   if (num == 3){
   printf("It is Triangular Pyramid");
   }
   else if(num == 4){
	   printf("It is Square Pyramid");
   }
   else if (num == 5){
	   printf("It is Pentagonal Pyramid");
   }
   else
	   printf("Invalid input");
   
   return num;


}
