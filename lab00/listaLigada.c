#include "listaLigada.h"

itemPatrimonio* novo_No(int numPatrimonio, char nome[], int valor, char dataAquisicao[]){
    itemPatrimonio* novoNo = malloc(sizeof(itemPatrimonio));
    
    novoNo->numPatrimonio = numPatrimonio;
    strcpy(novoNo->nome, nome);
    novoNo->valor = valor;
    strcpy(novoNo->dataAquisicao, dataAquisicao);
    novoNo->next = NULL;
    
    return novoNo;    
}

void addLista(itemPatrimonio* noCabeca,int numPatrimonio, char nome[], int valor, char dataAquisicao[]){
    while(noCabeca->next != NULL) 
        noCabeca = noCabeca->next;  //finds the end of the list
        
    itemPatrimonio* novoNo = novo_No(numPatrimonio, nome, valor, dataAquisicao);
    
    noCabeca->next = novoNo;
}

void leLista(itemPatrimonio* noCabeca, FILE *arqin){
    fprintf(arqin, "\n----Novo Item----\n");
    
    fprintf(arqin, "numero: %d\n", noCabeca->numPatrimonio);
    fprintf(arqin, "nome: %s\n", noCabeca->nome);
    fprintf(arqin, "valor: %d\n", noCabeca->valor);
    fprintf(arqin, "data de aquisicao: %s\n", noCabeca->dataAquisicao);
    
    historico* node = noCabeca->meuhistorico;
    
    fprintf(arqin, "-historico-\n");
    
    do{ 
        fprintf(arqin, "estava em %s desde a data %s\n", node->local, node->data); 
        node = node->next;
    }while(node != NULL);
    
    if(noCabeca->next == NULL)
        return;
    
    leLista(noCabeca->next, arqin);
}

void addHistorico(itemPatrimonio* noCabeca, int numPatrimonio, char data[], char local[]){
    while(noCabeca->next != NULL && noCabeca->numPatrimonio != numPatrimonio)
        noCabeca = noCabeca->next;
    
    if(noCabeca->numPatrimonio != numPatrimonio)
        return;
    
    if(noCabeca->meuhistorico == NULL){
        historico* newNode = malloc(sizeof(historico));
        strcpy(newNode->data, data);
        strcpy(newNode->local, local);
        newNode->next = NULL;
        noCabeca->meuhistorico = newNode;
        return;
    }
    historico* node = noCabeca->meuhistorico;
    
    while(node->next != NULL) node = node->next;
    
    historico* newNode = malloc(sizeof(historico));
    strcpy(newNode->data, data);
    strcpy(newNode->local, local);
    newNode->next = NULL;
    node->next = newNode;    
    
}
