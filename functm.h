#include<stdio.h>
#include<stdlib.h>
#include <string.h>

typedef struct node{
	float id;
	float x;
	float y;
	float moisture;
	struct node* next;
} Node;

Node* createNode(float id1, float x1, float y1, float moisture1);

Node* addEnd(Node* pliste, float id, float x, float y, float moisture);

Node* sortNode(Node* pliste);

Node* sortNodeR(Node* pliste);
