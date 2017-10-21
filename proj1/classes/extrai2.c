#include <stdio.h>
#include <string.h>


int main(int argc, char *argv[]){
    char final[3000][1000];
    FILE *in = fopen(argv[1], "r");
    FILE *out = fopen(argv[2], "w");
    
    char c[1000], f[1000];
    char d;
    int size = 0;
    int i = 0;
    int k, j;
    char codigo[100];
    
    while(fscanf(in, "%c", &d) != EOF){
        int k = 0;
        if(k != 0 || d != ' ')
            c[k++] = d;
        do{
            fscanf(in, "%c", &d);
            if(k != 0 || d != ' '){
                if(d != '\n' && d != ',')
                    c[k++] = d;                
            }
        } while(d != '\n' && d != ',');
        c[k] = '\0';
        for(j = 0; j < i; j++)
            if(strcmp(c, final[j]) == 0)
                break;
        if(j == i){
            strcpy(final[i++], c);
            fprintf(out, "%d\t%s\n", i, c); 
        }
    } 
    
    fclose(in);
    fclose(out);
    
    return 0;
}
