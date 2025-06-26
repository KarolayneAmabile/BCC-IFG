#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void fill(int array[], int size);
void print(int array[], int size);
void selectionSort(int array[], int size);
void bubbleSort(int array[], int size);
void insectionSort(int array[], int size);

int main(void) {
    int size = 15;
    int array[size];

    // selection sort
    fill(array, size);
    printf("\nUnsorted: "); print(array, size);
    selectionSort(array, size);
    printf("\nSorted:   "); print(array, size);

    fill(array, size);
    printf("\nUnsorted: "); print(array, size);
    bubbleSort(array, size);
    printf("\nSorted:   "); print(array, size);

    fill(array, size);
    printf("\nUnsorted: "); print(array, size);
    insectionSort(array, size);
    printf("\nSorted:   "); print(array, size);

    // bubble sort
    return 0;
}

void fill(int array[], int size) {
    for (int i = 0; i < size; i++) {
        array[i] = rand() % 100;
    }
}

void print(int array[], int size) {
    for (int i = 0; i < size; i++) {
        printf("%d ", array[i]);
    }
}

void selectionSort(int array[], int size) {
    /*
    trabalhamos com duas variaveis: uma que aponta para o item atual e outra que busca o menor item. A ideia é fazer
    meio que na força bruta. Na posicao 0, buscamos o menor item da coleção; após encontrá-lo, fazemos a troca e nos
    movemos para a posição 2. 
    */

    // a cada interação, o index avança em 1 e a parte anteior a ele corresponde a parte ordenada da coleção
    // não é necessário percorrer por todo o array, pois em tempo size - 1, o último elemento será o maior, por lógica
    for(int j = 0; j < size - 1; j++) {
        // é o index que irá corresponder ao menor item
        // no inicio de cada comparação, corresponde ao elemento da posição inicial
        int currentMinimum = j;
        
        // é o loop que percorre a parte não-ordenada da coleção, por isso, começa em uma posição a frente ao item
        // que está sendo comparado no inicio de cada ciclo.
        for (int currentItem = j + 1; currentItem < size; currentItem++) {

            // armazena o indice de onde o menor item está localizado
            if (array[currentItem] < array[currentMinimum]) {
                // note que estamos trabalhando apenas com indices, numeros inteiros
                currentMinimum = currentItem;
            }
        }

        // se currentMinimum for igual a j, significa que o elemento já está no local corespondente, e não
        // há necessidade de trocas
        if (currentMinimum != j) {
            // armazena o conteudo da posição atual
            int temp = array[j];
            // substitui pelo item que de fato corresponde aquela posição
            array[j] = array[currentMinimum];
            // armazena o conteúdo deslocado na posição antiga do outro
            array[currentMinimum] = temp;
        }

    }
}

void bubbleSort(int array[], int size) {
    /*
    A ideia com bubble sort é comparar o elemento atual com o seu próximo; caso o próximo seja
    menor, eles são trocados. A ideia é levar o maior elemento para a última posição.
    */

    // esse for é a quantidade de vezes que as comparações são feitas; nesse caso, é
    // o tamanho - 1, pois naturalemente, na última iteração o elemento só pode estar no lugar correto
    for (int i = 1; i < size; i++) {
        // esse for corresponde as comparações em si, que sao sempre do elemento atual com o proximo
        // ele percorre ate que j seja iqual a subtracao do tamanho - i
        // como i é a quantidade de vezes que temos que realizar as trocas, j é a quantidade de
        // elementos que devem ser comparados
        for (int j = 0; j < size - i; j++) {

            // checa se o elemento a frente é menor que o atual
            if (array[j] > array[j + 1]) {
                int tmp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = tmp;
            }
        }
    }
}

void insectionSort(int array[], int size) {
    /*
    A ideia aqui é dividir a coleção em uma parte ordenada e a outra não;
    começamos considerando que a primeira posição está ordenada, e comparamos
    se o próximo item está na posição correta; se sim, ele pode ficar onde está;
    se não, comparamos com os demais da lista e o colocamos no lugar certo.
    */

    // esse loop representa a quantidade de vezes que precisamos percorrer o array
    for (int i = 1; i < size; i++) {
        // como o primeiro elemento é considerado a parte ordenada em tempo 0,
        // começamos a fazer comparações a partir do segundo elemento
        int j = i;

        // verificamos se a posicao j atual é menor que o elemento anterior
        // j nao pode ser = 0, pois precisamos fazer a comparação com um elemento anterior a ele
        // dai enquanto a posicao anterior é menor, vamos fazendo a troca
        while (j > 0 && array[j - 1] > array[j]) {
            int tmp = array[j];
            array[j] = array[j - 1];
            array[j - 1] = tmp;
            j -= 1;
        }
    }
}






