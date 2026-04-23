// clear ; g++ -O3 D-somaVetor1.cpp -o D-somaVetor1; ./D-somaVetor1

#include <chrono>
#include <iostream>
#include <random>
#include <thread>
#include <utility>
#include <vector>

constexpr long long tamanhoVetor = 500e6; //500e6 --> 3,7 GB; 100e6 --> 766 MB

void somaVetor(double& soma, const std::vector<double>& vetor, unsigned long long inicioIntervalo, unsigned long long fimIntervalo){
	for (unsigned long long posicao = inicioIntervalo; posicao < fimIntervalo; posicao++)
		soma += vetor[posicao];
}

int main(){
	std::cout << ">>> D-somaVetor1 <<<" << std::endl;
	std::vector<double> vetor;
	std::cout << "Alocando memória para o vetor..." << std::endl;
	vetor.reserve(tamanhoVetor);

	std::cout << "Gerando serialmente os números aleatórios..." << std::endl;
	std::mt19937 geradorNumAleatorios;
	std::uniform_int_distribution<> uniformDist(1, 10);
	for ( long long i = 0; i < tamanhoVetor; i++)
		vetor.push_back(uniformDist(geradorNumAleatorios));

	std::cout << "Somando os elementos e guardando o resultado da soma em uma variável compartilhada..." << std::endl;
	double soma = 0;
	auto start = std::chrono::system_clock::now();

	somaVetor(std::ref(soma), std::ref(vetor), 0, tamanhoVetor);

	std::chrono::duration<double> dur = std::chrono::system_clock::now() - start;
	std::cout << "Tempo gasto na soma " << dur.count() << " segundos" << std::endl;
	std::cout << "Resultado da soma: " << soma << std::endl;

	std::cout << std::endl;

}