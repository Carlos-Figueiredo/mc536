#include "listaLigada.h"

itemPatrimonio novoNo(int numPatrimonio, char nome[], int valor, char dataAquisicao[]){
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
        
    itemPatrimonio* novoNo = novoNo(numPatrimonio, nome, valor, dataAquisicao);
    
    noCabeca->next = novoNo;
}

void leLista(itemPatrimonio* noCabeca, FILE *arqsaida){
    fprintf(arqsaida, "\n----Novo Item----\n");
    
    fprintf(arqsaida, "numero: %d\n", noCabeca->numPatrimonio);
    fprintf(arqsaida, "nome: %s\n", noCabeca->nome);
    fprintf(arqsaida, "valor: %d\n", noCabeca->valor);
    fprintf(arqsaida, "data de aquisicao: %s\n", noCabeca->dataAquisicao);
    
    historico* node = noCabeca->meuhistorico;
    
    while(meuhistorico->next != NULL){ 
        fprinf(arqsaida, "estava em %s na data %s\n", meuhistorico->local, meuhistorico->data); 
        meuhistorico = meuhistorico->next;
    }
    
    if(noCabeca->next == NULL)
        return;
    
    leLista(noCabeca->next);
}

void addHistorico(itemPatrimonio* noCabeca, int numPatrimonio, char data[], char local[]){
    while(noCabeca->next != NULL && noCabeca->numPatrimonio != numPatrimonio)
        noCabeca = noCabeca->next;
    
    if(noCabeca->numPatrimonio != numPatrimonio)
        return;
    
    historico* node = noCabeca->meuhistorico;
    
    while(meuhistorico->next != NULL) meuhistorico = meuhistorico->next;
    
    historico* newNode = malloc(sizeof(historico));
    strcpy(newNode->data, data);
    strcpy(newNode->local, local);
    newNode->next = NULL;
    meuhistorico->next = newNode;    
    
}
