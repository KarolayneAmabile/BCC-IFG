#include <stdio.h>
#include <stdlib.h>

typedef struct No {
    int valor;
    struct No* esquerda;
    struct No* direita;
} No;

// Estrutura da árvore com cabeça
typedef struct Arvore {
    No* raiz;
} Arvore;


// Cria a árvore inicial com cabeça
Arvore* criarArvore() {
    Arvore* arv = malloc(sizeof(Arvore)); 
    arv->raiz = NULL;                    
    return arv;
}

// Cria um novo nó com um valor
No* criarNo(int valor) {
    No* novo = malloc(sizeof(No));  // aloca espaço para o nó
    novo->valor = valor;            // define o valor
    novo->esquerda = NULL;          // sem filhos inicialmente
    novo->direita = NULL;
    return novo;
}

No* inserirOrdenado(No* raiz, int valor) {
    if (raiz == NULL)
        return criarNo(valor);  // cria o nó se chegou no lugar certo

    if (valor < raiz->valor)
        raiz->esquerda = inserirOrdenado(raiz->esquerda, valor); // vai pra esquerda
    else if (valor > raiz->valor)
        raiz->direita = inserirOrdenado(raiz->direita, valor);   // vai pra direita

    return raiz; // retorna a raiz para manter a ligação
}


int altura(No* raiz) {
    if (raiz == NULL)
        return -1;  // altura de árvore vazia é -1

    int altEsq = altura(raiz->esquerda); // altura da esquerda
    int altDir = altura(raiz->direita);  // altura da direita

    return (altEsq > altDir ? altEsq : altDir) + 1; // retorna a maior altura + 1
}

// ============================
// REMOÇÃO
// ============================

// Encontra o menor da subárvore direita
No* menorDireita(No* raiz) {
    No* atual = raiz;
    while (atual && atual->esquerda != NULL)
        atual = atual->esquerda;
    return atual;
}

// Remove um nó da árvore
No* remover(No* raiz, int valor) {
    if (raiz == NULL)
        return NULL;

    if (valor < raiz->valor) {
        raiz->esquerda = remover(raiz->esquerda, valor);
    } else if (valor > raiz->valor) {
        raiz->direita = remover(raiz->direita, valor);
    } else {
        // CASO 1: nó folha (sem filhos)
        if (raiz->esquerda == NULL && raiz->direita == NULL) {
            free(raiz);
            return NULL;
        }

        // CASO 2: um filho (direita)
        else if (raiz->esquerda == NULL) {
            No* temp = raiz->direita;
            free(raiz);
            return temp;
        }

        // CASO 2: um filho (esquerda)
        else if (raiz->direita == NULL) {
            No* temp = raiz->esquerda;
            free(raiz);
            return temp;
        }

        // CASO 3: dois filhos
        No* temp = menorDireita(raiz->direita); 
        raiz->valor = temp->valor;
        raiz->direita = remover(raiz->direita, temp->valor); 
    }
    return raiz;
}

void preOrdem(No* raiz) {
    if (raiz) {
        printf("%d ", raiz->valor);
        preOrdem(raiz->esquerda);
        preOrdem(raiz->direita);
    }
}

void emOrdem(No* raiz) {
    if (raiz) {
        emOrdem(raiz->esquerda);
        printf("%d ", raiz->valor);
        emOrdem(raiz->direita);
    }
}

void posOrdem(No* raiz) {
    if (raiz) {
        posOrdem(raiz->esquerda);
        posOrdem(raiz->direita);
        printf("%d ", raiz->valor);
    }
}

int main() {
    Arvore* minhaArvore = criarArvore();
    int opcao, valor;

    do {
        printf("\n--- MENU ---\n");
        printf("1 - Inserir\n");
        printf("2 - Remover\n");
        printf("3 - Altura\n");
        printf("4 - Imprimir (1-pre, 2-ordem, 3-pos)\n");
        printf("0 - Sair\n");
        printf("Opcao: ");
        scanf("%d", &opcao);

        switch (opcao) {
            case 1:
                printf("Valor a inserir: ");
                scanf("%d", &valor);
                minhaArvore->raiz = inserirOrdenado(minhaArvore->raiz, valor);
                break;
            case 2:
                printf("Valor a remover: ");
                scanf("%d", &valor);
                minhaArvore->raiz = remover(minhaArvore->raiz, valor);
                break;
            case 3:
                printf("Altura da árvore: %d\n", altura(minhaArvore->raiz));
                break;
            case 4:
                printf("Tipo de impressão: ");
                scanf("%d", &valor);
                if (valor == 1) {
                    printf("Pré-ordem: ");
                    preOrdem(minhaArvore->raiz);
                } else if (valor == 2) {
                    printf("Em ordem: ");
                    emOrdem(minhaArvore->raiz);
                } else if (valor == 3) {
                    printf("Pós-ordem: ");
                    posOrdem(minhaArvore->raiz);
                }
                printf("\n");
                break;
            case 0:
                printf("Saindo...\n");
                break;
            default:
                printf("Opcao invalida!\n");
        }
    } while (opcao != 0);

    return 0;
}
