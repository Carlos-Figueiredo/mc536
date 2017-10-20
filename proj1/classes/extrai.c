#include <stdio.h>
#include <string.h>


int main(int argc, char *argv[]){
    char final[3000][1000];
    FILE *p = fopen(argv[1], "r");
    FILE *out = fopen("labels.txt", "w");
    
    char c[1000];
    char d;
    int size = 0;
    int i = 0;
    int k, j;
    while(fscanf(p, "%c", &d) != EOF){
        if(d == '\n' || d == ','){
            c[k] = '\0';
            for(j = 0; j < size; j++)
                if(strcmp(c, final[j]) == 0)
                    break;
            if(j == size)
                strcpy(final[size++], c);
            i++;
            k = 0;
        }
        else
            if(k != 0 || d != ' ')
                c[k++] = d;
    }
    
    for(int j = 0; j < size; j++)
        fprintf(out, "%s\n", final[j]);
    
    printf("%d %d\n", i, size);
    
    fclose(p);
    fclose(out);
    
    return 0;
}
