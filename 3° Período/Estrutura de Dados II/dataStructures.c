#include <stdio.h>
#include <stdlib.h>

/// ===============================
/// LISTA SIMPLESMENTE ENCADEADA
/// ===============================

typedef struct NoSimples {
    int dado;
    struct NoSimples* prox;  // Aponta apenas para o próximo
} NoSimples;

/// ===============================
/// LISTA CIRCULAR SIMPLES
/// ===============================

typedef struct NoCircular {
    int dado;
    struct NoCircular* prox;  // O último aponta para o primeiro
} NoCircular;

/// ===============================
/// LISTA DUPLAMENTE ENCADEADA
/// ===============================

typedef struct NoDuplo {
    int dado;
    struct NoDuplo* prox;  // Próximo nó
    struct NoDuplo* ant;   // Nó anterior
} NoDuplo;

/// ===============================
/// LISTA DUPLA CIRCULAR
/// ===============================

typedef struct NoDuploCircular {
    int dado;
    struct NoDuploCircular* prox;  // Próximo nó
    struct NoDuploCircular* ant;   // Nó anterior
    // O primeiro aponta pro último e o último pro primeiro
} NoDuploCircular;

/// ===============================
/// EXEMPLOS BÁSICOS DE INSERÇÃO
/// ===============================

// Inserção no início da lista simples
NoSimples* inserirSimples(NoSimples* inicio, int valor) {
    NoSimples* novo = malloc(sizeof(NoSimples));
    novo->dado = valor;
    novo->prox = inicio;  // Novo nó aponta pro antigo início
    return novo;          // Novo início da lista
}

// Inserção no final da lista circular simples
NoCircular* inserirCircular(NoCircular* inicio, int valor) {
    NoCircular* novo = malloc(sizeof(NoCircular));
    novo->dado = valor;

    if (inicio == NULL) {
        novo->prox = novo;  // Aponta pra si mesmo
        return novo;
    }

    NoCircular* atual = inicio;
    while (atual->prox != inicio) {
        atual = atual->prox;
    }

    atual->prox = novo;
    novo->prox = inicio;

    return inicio;
}

// Inserção no final da lista duplamente encadeada
NoDuplo* inserirDuplo(NoDuplo* inicio, int valor) {
    NoDuplo* novo = malloc(sizeof(NoDuplo));
    novo->dado = valor;
    novo->prox = NULL;
    novo->ant = NULL;

    if (inicio == NULL) return novo;

    NoDuplo* atual = inicio;
    while (atual->prox != NULL) {
        atual = atual->prox;
    }

    atual->prox = novo;
    novo->ant = atual;

    return inicio;
}

// Inserção na lista dupla circular
NoDuploCircular* inserirDuploCircular(NoDuploCircular* inicio, int valor) {
    NoDuploCircular* novo = malloc(sizeof(NoDuploCircular));
    novo->dado = valor;

    if (inicio == NULL) {
        novo->prox = novo;
        novo->ant = novo;
        return novo;
    }

    NoDuploCircular* ultimo = inicio->ant;

    novo->prox = inicio;
    novo->ant = ultimo;

    ultimo->prox = novo;
    inicio->ant = novo;

    return inicio;
}
