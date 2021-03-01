#include "jni.h"      
#include "stdio.h" 
#include "stdlib.h"
#include "time.h"

JNIEXPORT jcharArray JNICALL Java_jarr_first(JNIEnv *env, jobject obj, jint size){ 
    jchar tmp[size]; // temporary array	
	
	jcharArray randomArr = (*env)->NewCharArray(env, size);
	
	char alpha[26] = {'a','b', 'c', 'd', 'e', 'f', 'g', 
                          'h', 'i', 'j', 'k', 'l', 'm', 'n',  
                          'o', 'p', 'q', 'r', 's', 't', 'u', 
						  'v', 'w', 'x', 'y', 'z'};
						  

		
	srand(time(NULL));
	for (int i=0; i<size; i++){
		tmp[i] = alpha[rand()%26];
		//printf("The random array is: %c", tmp[i]);
	}
	
	(*env)->SetCharArrayRegion(env, randomArr, 0, size, tmp); //copy tmp into arr
	
	return randomArr;
}



