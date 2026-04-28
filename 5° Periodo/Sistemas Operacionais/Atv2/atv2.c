// gcc -O3 atv2.c -o atv2 -lpthread; ./atv1

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <time.h>

// NICE DOC: https://www.cse.cuhk.edu.hk/~ericlo/teaching/os/lab/9-PThread/Introduction.html

#define SIZE 10000
double matrixA[SIZE][SIZE];
double matrixB[SIZE][SIZE];
double result_matrix[SIZE][SIZE];

typedef struct {
    unsigned long long start;
    unsigned long long end;
} range;

void *matrixAdd(void *arg);
void fillMatrix();

int main() {
    printf("Somatorio de duas matrizes quadraticas A e B\n");
    fillMatrix();

    unsigned int numThreads;
    do {
        printf("Digite o número desejados de threads a serem criadas (digite 0 para sair):\n--> ");
        if (scanf("%u", &numThreads) != 1) break;
        if (numThreads == 0) break;
        if (SIZE % numThreads != 0) {
            printf("O número de threads não é um divisor do tamanho da matriz quadratica! Tente outro valor.\n");
            continue;
        }

        unsigned long long columnRanges = SIZE / numThreads;
        for (int cont = 0; cont < numThreads; cont++) {
            printf("Intervalo %u -- [%llu - %llu)\n", cont, cont * columnRanges, (cont + 1) * columnRanges);
        }

        // nao da pra usar clock() para medir o tempo gasto em threads, pois ele mede o tempo gasto pelo >processo< inteiro,
        // e nao o tempo gasto por cada thread individualmente
        // https://stackoverflow.com/questions/2962785/c-using-clock-to-measure-time-in-multi-threaded-programs
        // mas podemos usar o timespec, que mede o `wall-clock time`, ie, o tempo real gasto, independente do numero de threads
        struct timespec start, end;
        clock_gettime(CLOCK_MONOTONIC, &start);

        // pthread_t: to define a thread id
        // um array pra armazenar os ids de cada thread criada
        pthread_t *threads = (pthread_t *)malloc(numThreads * sizeof(pthread_t));
        range *ranges = (range *)malloc(numThreads * sizeof(range));

        for (int i = 0; i < numThreads; i++) {
            ranges[i].start = i * columnRanges;
            ranges[i].end = (i + 1) * columnRanges;
            // pthread_create(thread_id, attr, start_routine, arg)
            // https://www.cse.cuhk.edu.hk/~ericlo/teaching/os/lab/9-PThread/Pass.html
            pthread_create(&threads[i], NULL, matrixAdd, &ranges[i]);
        }

        // força a espera do fim das threads
        for (int i = 0; i < numThreads; i++) {
            pthread_join(threads[i], NULL);
        }

        clock_gettime(CLOCK_MONOTONIC, &end);
        double elapsed = (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;

        printf("Tempo gasto na execucao %.6f segundos\n", elapsed);

        free(threads);
        free(ranges);
    } while (1);
    return 0;
}

void fillMatrix() {
    printf("Gerando serialmente os números aleatórios para as matrizes...\n");
    srand(0);
    for (unsigned long long i = 0; i < SIZE; i++)
        for (unsigned long long j = 0; j < SIZE; j++) {
            matrixA[i][j] = (double)((rand() % 10) + 1);
            matrixB[i][j] = (double)((rand() % 10) + 1);
        }
}

// Repete o somatorio 100x pra forçar a vizualizacao de consumo da CPU
void *matrixAdd(void *arg) {
    range *r = (range *)arg;
    for (int rep = 0; rep < 100; rep++) {
        for (unsigned long long i = 0; i < SIZE; i++) { 
            for (unsigned long long j = r->start; j < r->end; j++) {
                result_matrix[i][j] = matrixA[i][j] + matrixB[i][j];
            }
        }
    }
    return NULL;
}

// void *matrixAdd(void *arg) {
//     range *r = (range *)arg;
//     for (unsigned long long i = 0; i < SIZE; i++) {
//         for (unsigned long long j = r->start; j < r->end; j++) {
//             result_matrix[i * SIZE + j] = matrixA[i * SIZE + j] + matrixB[i * SIZE + j];
//         }
//     }
//     return NULL;
// }