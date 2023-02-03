#include "functm.h"

Node* createNode(float id1, float x1, float y1, float moisture1){		//for create a node
	Node* node= malloc(sizeof(Node));
	if(node==NULL){
		exit(1);
	}
	node->id = id1;
	node-> x = x1;
	node-> y = y1;
	node-> moisture = moisture1;
	node-> next = NULL;
	return node;
}

Node* addEnd(Node* pliste, float id, float x, float y, float moisture){		// add the new node at the end
	Node* nodeend = createNode(id, x, y, moisture);
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

Node* sortNode(Node* pliste){		// for sort the list with
	if (pliste==NULL){
		exit(0);
	}
	Node *current, *index;
	float id1, x1, y1, moisture1;
	for (current = pliste; current->next != NULL; current = current->next) {
		for (index = current->next; index != NULL; index = index->next) {
			if (current->moisture < index->moisture) {
				id1 = current->id;
				x1 = current->x;
				y1 = current->y;
				moisture1 = current->moisture;
				current->id = index->id;
				current->x = index->x;
				current->y = index->y;
				current->moisture = index->moisture;
				index->id = id1;
				index->x = x1;
				index->y = y1;
				index->moisture = moisture1;
			}
		}
	}
	return pliste;
}

Node* sortNodeA(Node* pliste) {		// sort the list with "r"
	if (pliste == NULL) {
		exit(0);
	}
	Node *current, *index;
	float id1, x1, y1, moisture1;
	for (current = pliste; current->next != NULL; current = current->next) {
		for (index = current->next; index != NULL; index = index->next) {
			if (current->moisture > index->moisture) {
				id1 = current->id;
				x1 = current->x;
				y1 = current->y;
				moisture1 = current->moisture;
				current->id = index->id;
				current->x = index->x;
				current->y = index->y;
				current->moisture = index->moisture;
				index->id = id1;
				index->x = x1;
				index->y = y1;
				index->moisture = moisture1;
			}
		}
	}
	return pliste;
}
