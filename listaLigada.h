#include <stdio.h>
#include <stdlib.h>
#include <string.h>

itemPatrimonio novoNo(int numPatrimonio, char nome[], int valor, char dataAquisicao[]);

void addLista(itemPatrimonio* noCabeca,int numPatrimonio, char nome[], int valor, char dataAquisicao[]);

void leLista(itemPatrimonio* noCabeca, FILE *arqsaida);
