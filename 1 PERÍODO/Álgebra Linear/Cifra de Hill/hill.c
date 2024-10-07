#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>

// 2x2 encryption key and its inverse for decryption
const int key[2][2] = {{3, 1}, {5, 2}};
const int inverseKey[2][2] = {{2, -1}, {-5, 3}};

char plainText[100];
char cipherText[100];
int length = 0; 

void applyHillCipher(void);
void applyHillDecryption(void);
void printString(char oldString[], char newString[]);

int main(void)
{
    int choice = 0;
    printf("\t CIFRA DE HILLS\n");
    printf("\n1. Codificar string\n2. Decodificar string\n\nEscolha uma opcao: ");
    scanf("%d", &choice);
    fflush(stdin);

    if (choice == 1)
    {
        printf("Insira a string a ser codificada: ");
        gets(plainText);
        applyHillCipher();
        printf("Cipher Text: ");
        printString(plainText, cipherText);
    }
    if (choice == 2)
    {
        printf("Insira a string a ser descodificada: ");
        gets(cipherText);
        applyHillDecryption();
        printf("Decrypted Text: ");
        printString(cipherText, plainText);
    }
}

void applyHillCipher(void)
{
    // selects only the characters that are part of the ASCII alphabet and 
    // converts them to uppercase
    int j = 0;
    for (int i = 0; i < strlen(plainText); i++) {
        if (isalnum(plainText[i])) {
            cipherText[j] = toupper(plainText[i]);
            j++;
        }
    }
    cipherText[j] = '\0';
    length = strlen(cipherText);

    // if the length of the string is odd, pad with 'A'
    if (length % 2 == 1) {
        cipherText[length] = 'A';
        cipherText[length + 1] = '\0';
        length++;
    }

    // encrypt pairs of characters using the Hill Cipher key
    char tmp1, tmp2;
    for (int i = 0; i < length; i += 2)
    {
        tmp1 = ((cipherText[i] - 'A') * key[0][0] + (cipherText[i + 1] - 'A') * key[0][1]) % 26;
        tmp2 = ((cipherText[i] - 'A') * key[1][0] + (cipherText[i + 1] - 'A') * key[1][1]) % 26;

        // convert the result back to characters
        cipherText[i] = tmp1 + 'A';
        cipherText[i + 1] = tmp2 + 'A';
    }
}

void applyHillDecryption(void)
{
    int j = 0;
    for (int i = 0; i < strlen(cipherText); i++) {
        if (isalnum(cipherText[i])) {
            plainText[j] = toupper(cipherText[i]);
            j++;
        }
    }
    plainText[j] = '\0';
    length = strlen(plainText);

    // if the length of the string is odd, pad with 'A'
    if (length % 2 == 1) {
        plainText[length] = 'A';
        plainText[length + 1] = '\0';
        length++;
    }

    // decrypt pairs of characters using the inverse Hill Cipher key
    char tmp1, tmp2;
    for (int i = 0; i < length; i += 2)
    {
        tmp1 = (((plainText[i] - 'A') * inverseKey[0][0] + (plainText[i + 1] - 'A') * inverseKey[0][1]) + 26) % 26;
        tmp2 = (((plainText[i] - 'A') * inverseKey[1][0] + (plainText[i + 1] - 'A') * inverseKey[1][1]) + 26) % 26;

        // convert the result back to characters
        plainText[i] = tmp1 + 'A';
        plainText[i + 1] = tmp2 + 'A';
    }
}

void printString(char oldString[], char newString[])
{
    for (int i = 0, j = 0; i < strlen(oldString); i++)
    {
        // print the encoded/decoded string, preserving the original case
        if (isalnum(oldString[i]))
        {
            if (islower(oldString[i]))
            {
                printf("%c", tolower(newString[j]));
                j++;
            } else {
                printf("%c", newString[j]);
                j++;
            }
        } else {
            // print non-alphanumeric characters as is
            printf("%c", oldString[i]);
        }
    }
}