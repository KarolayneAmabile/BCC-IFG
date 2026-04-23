// g++ A-exemploIPC0-solucao-paralela.cpp -o A-exemploIPC0-solucao-paralela
#include <iostream>
#include <thread>
#include <mutex>
  
using namespace std;
  
// Recurso compartilhado
unsigned int numero = 0;
long int lotes[5];

//Mutex
mutex mtx;
  
// funcao que incrementa a variavel 1.000.000 de vezes
void incrementaVariavel(int lote) {
    for(int i = 0; i < 100000000; i++) {
        lotes[lote]++;
    }
}
  
int main() { 
    thread t1(incrementaVariavel, 0); 
    thread t2(incrementaVariavel, 1); 
    thread t3(incrementaVariavel, 2); 
    thread t4(incrementaVariavel, 3); 
    thread t5(incrementaVariavel, 4); 

    // Espera pela finalizacao das duas threads
    t1.join(); 
    t2.join();
    t3.join();
    t4.join();
    t5.join();
    
    numero = lotes[0] + lotes[1] + lotes[2] + lotes[3] + lotes[4];

    // Imprime o valor
    cout << "O valor do numero apos a finalizacao de T1 e T2 é: " << numero << endl;
      
    return 0; 
} 
