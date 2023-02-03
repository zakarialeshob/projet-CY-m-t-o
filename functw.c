#include "functw.h"

Node* createNode(float id1, float x1, float y1, float xwind1, float ywind1){		//for create a node
	Node* node= malloc(sizeof(Node));
	if(node==NULL){
		exit(1);
	}
	node->id = id1;
	node-> x = x1;
	node-> y = y1;
	node-> xwind = xwind1;
	node->ywind = ywind1;
	node-> next = NULL;
	return node;
}

Node* addEnd(Node* pliste, float id, float x, float y, float xwind, float ywind){		// add the new node at the end
	Node* nodeend = createNode(id, x, y, xwind, ywind);
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

Node* sortNode(Node* pliste){		// sort the list with 
	if (pliste==NULL){
		exit(0);
	}
	Node *current, *index;
	float id1, x1, y1, xwind1, ywind1;
	for (current = pliste; current->next != NULL; current = current->next) {
		for (index = current->next; index != NULL; index = index->next) {
			if (current->id < index->id) {
				id1 = current->id;
				x1 = current->x;
				y1 = current->y;
				xwind1 = current->xwind;
				ywind1 = current->ywind;
				current->id = index->id;
				current->x = index->x;
				current->y = index->y;
				current->xwind = index->xwind;
				current->ywind = index->ywind;
				index->id = id1;
				index->x = x1;
				index->y = y1;
				index->xwind = xwind1;
				index->ywind = ywind1;
			}
		}
	}
	return pliste;
}

Node* sortNodeR(Node* pliste){		// sort the list with "r"
	if (pliste==NULL){
		exit(0);
	}
	Node *current, *index;
	float id1, x1, y1, xwind1, ywind1;
	for (current = pliste; current->next != NULL; current = current->next) {
		for (index = current->next; index != NULL; index = index->next) {
			if (current->id < index->id) {
				id1 = current->id;
				x1 = current->x;
				y1 = current->y;
				xwind1 = current->xwind;
				ywind1 = current->ywind;
				current->id = index->id;
				current->x = index->x;
				current->y = index->y;
				current->xwind = index->xwind;
				current->ywind = index->ywind;
				index->id = id1;
				index->x = x1;
				index->y = y1;
				index->xwind = xwind1;
				index->ywind = ywind1;
			}
		}
	}
	return pliste;
}
