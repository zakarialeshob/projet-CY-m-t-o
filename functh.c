#include "functh.h"

Node* createNode(float id1, float x1, float y1, float height1){		//to create a new node
	Node* node= malloc(sizeof(Node));
	if(node==NULL){
		exit(1);
	}
	node->id = id1;
	node-> x = x1;
	node-> y = y1;
	node-> height = height1;
	node-> next = NULL;
	return node;
}

Node* addEnd(Node* pliste, float id, float x, float y, float height){		// add at the end the new node
	Node* nodeend = createNode(id, x, y, height);
	if(pliste==NULL){
		pliste= nodeend;
	}
	else{
		Node* search = pliste;
		while(search->next != NULL){
			search = search->next;
		}
	search ->next = nodeend;    
	}
	return pliste;
}

Node* sortNode(Node* pliste){		//to sort the list 
	if (pliste==NULL){
		exit(0);
	}
	Node *current, *index;
	float id1, x1, y1, height1;
	for (current = pliste; current->next != NULL; current = current->next) {
		for (index = current->next; index != NULL; index = index->next) {
			if (current->height < index->height) {
				id1 = current->id;
				x1 = current->x;
				y1 = current->y;
				height1 = current->height;
				current->id = index->id;
				current->x = index->x;
				current->y = index->y;
				current->height = index->height;
				index->id = id1;
				index->x = x1;
				index->y = y1;
				index->height = height1;
			}
		}
	}
	return pliste;
}

Node* sortNodeR(Node* pliste){		//to sort the list with "r"
	if (pliste==NULL){
		exit(0);
	}
	Node *current, *index;
	float id1, x1, y1, height1;
	for (current = pliste; current->next != NULL; current = current->next) {
		for (index = current->next; index != NULL; index = index->next) {
			if (current->height > index->height) {
				id1 = current->id;
				x1 = current->x;
				y1 = current->y;
				height1 = current->height;
				current->id = index->id;
				current->x = index->x;
				current->y = index->y;
				current->height = index->height;
				index->id = id1;
				index->x = x1;
				index->y = y1;
				index->height = height1;
			}
		}
	}
	return pliste;
}
