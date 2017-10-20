#include <stdio.h>
#include <string.h>


int main(int argc, char *argv[]){
    char final[3000][1000];
    FILE *in = fopen(argv[1], "r");
    FILE *in2 = fopen(argv[2], "r");
    FILE *out = fopen(argv[3], "w");
    
    char c[1000], f[1000];
    char d;
    int size = 0;
    int i = 0;
    int k, j;
    char codigo[100];
    
    while(fscanf(in, "%s", codigo) != EOF){
        
        do{
            int k = 0;
            do{
                fscanf(in2, "%c", &d);
                if(k != 0 || d != ' '){
                    if(d != '\n' && d != ',')
                        c[k++] = d;                
                }
            } while(d != '\n' && d != ',');
            c[k] = '\0';
            fprintf(out, "%s\t%s\n", codigo, c);
            //printf("%s\t%s\n", codigo, c);
        } while(d != '\n');       
        
    } 
    
    return 0;
}
