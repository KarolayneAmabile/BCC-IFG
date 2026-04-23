// clear ; g++ -std=c++20 C-exemploIPC6.cpp -o C-exemploIPC6 ; ./C-exemploIPC6

#include <chrono>
#include <iostream>
#include <mutex>
#include <semaphore>
#include <random>
#include <thread>
#include <utility>
#include <vector>

constexpr unsigned int tamBuffer = 10;
unsigned int slotsOcupados = 0;
std::vector<int> buffer;
std::mt19937 geradorNumAleatorios;

std::mutex mutex;
std::counting_semaphore<tamBuffer> semaforo1{0},
                                   semaforo2{tamBuffer};

void imprimeBuffer() {
	//std::lock_guard<std::mutex> trava(mutex);
	for (unsigned int cont = 0; cont < tamBuffer; cont++){
		std::cout << cont << " -- " << buffer[cont] << "." << std::endl;
	}
}

void produtor(unsigned int id){
	unsigned int valorAdicionado;
	std::uniform_int_distribution<> valorAleatorio(1, 10000);
	while (true){
		semaforo2.acquire();
		{
			std::lock_guard<std::mutex> trava(mutex);
			valorAdicionado = valorAleatorio(geradorNumAleatorios);
			buffer[slotsOcupados] = valorAdicionado;
			std::cout << ">> PRODUTOR " << id << " -- Valor adicionado (" << slotsOcupados <<"): " << valorAdicionado << std::endl;
			slotsOcupados++;
			imprimeBuffer();
		}
		semaforo1.release();
		std::this_thread::sleep_for(std::chrono::milliseconds(100));
	}
}

void consumidor(unsigned int id){
	unsigned int valorRetirado;
	while (true){
		semaforo1.acquire();
		{
			std::lock_guard<std::mutex> trava(mutex);
			slotsOcupados--;
			valorRetirado = buffer[slotsOcupados];
			std::cout << ">> CONSUMIDOR " << id << " -- Valor retirado (" << slotsOcupados << "): " << valorRetirado << std::endl;
			buffer[slotsOcupados] = 0;
			imprimeBuffer();
		}
		semaforo2.release();
		std::this_thread::sleep_for(std::chrono::milliseconds(2000));
	}
}

int main(){
	buffer.reserve(tamBuffer);

	for (unsigned int cont = 0; cont < tamBuffer; cont++){
		buffer[cont] = 0;
	}
	std::thread t1(produtor, 1);
	std::thread t2(produtor, 2);
	std::thread t3(produtor, 3);
	std::thread t4(produtor, 4);
	std::thread t5(produtor, 5);
	std::thread t6(consumidor, 1);
	std::thread t7(consumidor, 2);

	t1.join();
	t2.join();
	t3.join();
	t4.join();
	t5.join();
	t6.join();
	t7.join();
}