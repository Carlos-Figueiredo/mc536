#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Historico{
    char local[100];
    char data[20];
    struct Historico* next;
} historico;

typedef struct ItemPatrimonio{
    int numPatrimonio;
    char nome[50];
    int valor;
    char dataAquisicao[20];
    struct ItemPatrimonio* next;
    historico *meuhistorico;
} itemPatrimonio;

itemPatrimonio* novo_No(int numPatrimonio, char nome[], int valor, char dataAquisicao[]);

void addLista(itemPatrimonio* noCabeca,int numPatrimonio, char nome[], int valor, char dataAquisicao[]);

void addHistorico(itemPatrimonio* noCabeca, int numPatrimonio, char data[], char local[]);

void leLista(itemPatrimonio* noCabeca, FILE *arqin);
