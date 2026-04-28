// g++ A-exemploIPC0-condicao-corrida.cpp -o A-exemploIPC0-condicao-corrida
#include <iostream>
#include <thread>
#include <mutex>
  
using namespace std;
  
// Recurso compartilhado
int numero = 0;

//Mutex
mutex mtx;
  
// funcao que incrementa a variavel 1.000.000 de vezes
void incrementaVariavel() {
    for(int i = 0; i < 1000000; i++) {
        numero++;
    }
}
  
int main() { 
    // Cria a thread t1 para a funcao incrementaVariavel()
    thread t1(incrementaVariavel); 

    // Cria a thread t1 para a funcao incrementaVariavel()
    thread t2(incrementaVariavel); 
      
    // Espera pela finalizacao das duas threads
    t1.join(); 
    t2.join(); 
      
    // Imprime o valor
    cout << "O valor do numero apos a finalizacao de T1 e T2 é: " << numero << endl;
      
    return 0; 
} 
