// clear ; g++ A-exemploIPC0.cpp -o A-exemploIPC0 ; ./A-exemploIPC0
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
    mtx.lock();
    for(int i = 0; i < 1000000; i++) {
        numero++;
    }
    mtx.unlock();
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
