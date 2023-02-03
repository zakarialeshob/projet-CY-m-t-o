#include <stdio.h>
#include<stdlib.h>
#include <string.h>
#include "functm.h"

int main(int argc, char* argv[]) {		
	int i, j, nb=0;
	float col1, col2, col3, col4;
	char* filename1=argv[1];
	char* filename2=argv[2];
	char* option=argv[3];
	FILE *file = fopen(filename1, "r");		//verification for the file
	if (file == NULL) {
		return 2;
	}
	FILE *output = fopen(filename2, "w");
	if (output == NULL) {
		return 3;
	}
	Node* liste = NULL;
	Node* nliste = NULL;
	Node* tg=NULL;
	char line[1024];
	while(fgets(line, 1024, file) != NULL){		//compt the number of line
		nb++;
	}
	printf("%d\n", nb);
	fclose(file);
	file=fopen(filename1, "r");
	for (i=1; i<=100000; i++){		
		fscanf(file, "%f,%f,%f,%f", &col1, &col2, &col3, &col4);		//create the list node 
		liste = addEnd(liste, col1,col2,col3,col4); 
	}  
	tg=liste;
	fclose(file);
	if(option == "r"){			// sort the list with "r" or not
		nliste = sortNodeR(tg);
	}
	else{
		nliste = sortNode(tg);
	}
	while (nliste->next!=NULL){
		fprintf(output,"%f,%f,%f,%f\n", nliste->id,nliste->x,nliste->y,nliste->moisture);	//replace the data in new file
		nliste=nliste->next;
	}
	fclose(output);
	return 0;
}
