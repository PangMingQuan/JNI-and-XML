#include "jni.h"      
#include "stdio.h"
#include "stdlib.h"

JNIEXPORT jintArray JNICALL Java_jarr_third(JNIEnv *env, jobject obj, jcharArray a, jcharArray b){


      jsize length_a = (*env)->GetArrayLength(env, a);
	  jsize length_b = (*env)->GetArrayLength(env, b);
	  
	  jintArray result = (*env)->NewIntArray(env, length_a);
	  jint tmp[length_a];
	  
	  jchar *body_a = (*env)->GetCharArrayElements(env, a, 0);
	  jchar *body_b = (*env)->GetCharArrayElements(env, b, 0);
	  
	  for(int i=0; i<length_b; i++){
		  if (body_a[i] == body_b[i]){
			  tmp[i] = 0;
		  }else{
			  tmp[i] = 1;
		  }
	  }
	  
	(*env)->ReleaseCharArrayElements(env, a, body_a, 0);
	(*env)->ReleaseCharArrayElements(env, a, body_b, 0);
	(*env)->SetIntArrayRegion(env, result, 0, length_a, tmp);
	
	return result;
   
   
}