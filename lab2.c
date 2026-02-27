#include <stdio.h>
extern int find_hamming(char *str1, char *str2);

int main(){
    //Initialize strings to find
    char strings[2][255] = {};
    int hamming = 0;

    //Ask user for desired characters 
    printf("Input First String(UNDER 255 CHARACTERS): ");
    scanf("%[^\n]%*c", strings[0]);
    
    printf("Input Second String(UNDER 255 CHARACTERS): ");
    scanf("%[^\n]%*c", strings[1]);

    //Find length of shortest string for indexing2
    hamming = find_hamming(strings[0],strings[1]);
    printf("\nHamming Distance: %d\n", hamming);
    return 0;
}