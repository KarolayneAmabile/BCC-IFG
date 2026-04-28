// gcc -O3 atv3.c -o atv3 -lpthread; ./atv3

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <time.h>

// NICE DOC: https://www.cse.cuhk.edu.hk/~ericlo/teaching/os/lab/9-PThread/Introduction.html

// Funciona, mas apenas para matrizes pequenas, pois dimensões muito grande estouram a stack
// Matrizes grandes precisam ser usadas usando ponteiros e malloc, pois o malloc aloca na HEAP
// to-do: estudar isso depois
// Erro: Segmentation fault (core dumped)
#define SIZE 300

typedef struct {
    unsigned long long start;
    unsigned long long end;
    double (*matrixA)[SIZE];
    double (*matrixB)[SIZE];
    double (*result_matrix)[SIZE];
} range;

void *matrixAdd(void *arg);
void fillMatrix(double matrixA[SIZE][SIZE], double matrixB[SIZE][SIZE]);

int main() {
    printf("Somatorio de duas matrizes quadraticas A e B\n");

    double matrixA[SIZE][SIZE];
    double matrixB[SIZE][SIZE];
    double result_matrix[SIZE][SIZE];

    fillMatrix(matrixA, matrixB);

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

        pthread_t *threads = (pthread_t *)malloc(numThreads * sizeof(pthread_t));
        range *ranges = (range *)malloc(numThreads * sizeof(range));

        for (int i = 0; i < numThreads; i++) {
            ranges[i].start         = i * columnRanges;
            ranges[i].end           = (i + 1) * columnRanges;
            ranges[i].matrixA       = matrixA;
            ranges[i].matrixB       = matrixB;
            ranges[i].result_matrix = result_matrix;
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

void fillMatrix(double matrixA[SIZE][SIZE], double matrixB[SIZE][SIZE]) {
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
                r->result_matrix[i][j] = r->matrixA[i][j] + r->matrixB[i][j];
            }
        }
    }
    return NULL;
}
