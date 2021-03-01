#include "jni.h"      
#include "stdio.h" 

JNIEXPORT jcharArray JNICALL Java_jarr_calculate(JNIEnv *env, jobject obj, jint size){ 
    jchar tmp[size];   // temporary array
	
	// declare an array with size determined by user, named arr, of type integer.
     jcharArray arr = (*env)->NewCharArray(env, size);
    
    printf("\nEnter the %ld characters: \n", size);    
    
	// get the input from user and store it into tmp 
	for (jint i=0; i<size; i++){
	scanf("%C", &tmp[i]); //take input
	}
    // update the content of array arr
     (*env)->SetCharArrayRegion(env, arr, 0, size, tmp); //copy tmp into arr

    // return the arr array
     return arr; 
}
