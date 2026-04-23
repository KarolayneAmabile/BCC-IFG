// clear ; g++ -O3 D-somaVetor2.cpp -o D-somaVetor2; ./D-somaVetor2

#include <chrono>
#include <iostream>
#include <mutex>
#include <random>
#include <thread>
#include <utility>
#include <vector>

constexpr long long tamanhoVetor = 500e6; //500e6 --> 3,7 GB; 100e6 --> 766 MB

std::mutex mutex;

void somaVetor(double& soma, const std::vector<double>& vetor, unsigned long long inicioIntervalo, unsigned long long fimIntervalo){
	mutex.lock();
	for (unsigned long long posicao = inicioIntervalo; posicao < fimIntervalo; posicao++)
		for (int temp = 0; temp < 10; temp++)
			soma += vetor[posicao];
	mutex.unlock();
}

int main(){
	std::cout << ">>> D-somaVetor2 <<<" << std::endl;
	std::vector<double> vetor;
	std::cout << "Alocando memória para o vetor..." << std::endl;
	vetor.reserve(tamanhoVetor);

	std::cout << "Gerando serialmente os números aleatórios..." << std::endl;
	std::mt19937 geradorNumAleatorios;
	std::uniform_int_distribution<> uniformDist(1, 10);
	for (long long i = 0; i < tamanhoVetor; i++)
		vetor.push_back(uniformDist(geradorNumAleatorios));

	unsigned int numThreads;
	do {
		std::cout << "Digite o número desejados de threads a serem criadas (digite 0 para sair):" << std::endl << "--> ";
		std::cin >> numThreads;
		if (numThreads <= 0)
			break;
		if (tamanhoVetor % numThreads != 0){
			std::cout << "O número de threads não é um divisor do tamanho do vetor! Tente outro valor." << std::endl;
			continue;
		}
		unsigned long long tamIntervalo = tamanhoVetor/numThreads;
		std::vector<unsigned long long> intervalos;
		intervalos.reserve(numThreads + 1);
		for (unsigned int cont = 0; cont <= numThreads; cont++){
			intervalos.push_back( cont*tamIntervalo );
		}
		for (unsigned int cont = 0; cont < numThreads; cont++){
			std::cout << "Intervalo " << cont << " -- [" << cont*tamIntervalo << " - " << (cont + 1)*tamIntervalo << ")" << std::endl;
		}
		std::cout << "Somando os elementos e guardando o resultado da soma em uma variável compartilhada..." << std::endl;
		double soma = 0;
		auto start = std::chrono::system_clock::now();

		std::vector<std::thread> vetThreads;
		vetThreads.reserve(numThreads);
		for (unsigned int cont = 0; cont < numThreads; cont++){
			vetThreads.emplace_back(somaVetor, std::ref(soma), std::ref(vetor), intervalos[cont], intervalos[cont + 1]);
		}
		for (auto& thread: vetThreads) {
			thread.join();
		}

		std::chrono::duration<double> dur = std::chrono::system_clock::now() - start;
		std::cout << "Tempo gasto na soma " << dur.count() << " segundos" << std::endl;
		std::cout << "Resultado da soma: " << soma << std::endl;

		std::cout << std::endl;
	} while (numThreads > 0);
}