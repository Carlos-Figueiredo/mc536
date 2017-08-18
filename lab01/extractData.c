#include <stdio.h>
#include <string.h>
#include "listaLigada.h"

typedef enum { false, true } bool;

int main(){
        int numPatrimonio;
        char nome[50];
        int valor;
        char dataAquisicao[20];
        char setor[30];
        char option;
        char local[100];
        FILE *arqin = fopen("saida.txt", "w");
        //atribuicao do cadastro
        
        scanf("%d,%49[^,],%d,%19[^,],%s", &numPatrimonio, nome, &valor,  dataAquisicao, setor);
        itemPatrimonio *cabeca = novo_No(numPatrimonio, nome, valor, dataAquisicao);
        addHistorico(cabeca, numPatrimonio, dataAquisicao, setor);
        
        
        do {
            scanf(" %c", &option);
            if(option == '1'){
                scanf("%d,%49[^,],%d,%19[^,],%s", &numPatrimonio, nome, &valor,  dataAquisicao, setor);      
                addLista(cabeca, numPatrimonio, nome, valor, dataAquisicao);
                addHistorico(cabeca, numPatrimonio, dataAquisicao, setor);
            }
            else if(option == '2'){
                scanf("%d,%99[^,],%s", &numPatrimonio, local, dataAquisicao);
                addHistorico(cabeca, numPatrimonio, dataAquisicao, local);
            }
        } while(option != '*');
        
        leLista(cabeca, arqin);
    
        return 0;
}
