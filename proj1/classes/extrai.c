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
        int k = 0;
        do{
            fscanf(in, "%c", &d);
            if(d != '\n')
                c[k++] = d;
        } while(d != '\n');
        c[k] = '\0';
        
       //printf("%s\t%s\n", codigo, c);
        
        int chave_sec;
        rewind(in2);
        int fim = 0;
        do{
            fscanf(in2, "%d", &chave_sec);
            //printf("%d\n", chave_sec);
            int k = 0;
            do{
                fscanf(in2, "%c", &d);
                if(d != '\n')
                    f[k++] = d;
            } while(d != '\n');
            f[k] = '\0';
            //printf("%s %s\n", f, c);
            fim++;
            if(fim > 5000)
                printf("sim %s\n", c);
        } while(strcmp(f, c) != 0);
        
        //printf("%d\n", i++);
        //printf("mais um\n");
        fprintf(out, "%s\t%d\n", codigo, chave_sec);        
    } 
    
    fclose(in);
    fclose(out);
    
    return 0;
}
