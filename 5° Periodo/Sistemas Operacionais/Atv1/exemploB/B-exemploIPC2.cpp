// clear ; g++ B-exemploIPC2.cpp -o B-exemploIPC2 ; ./B-exemploIPC2

#include <atomic>
#include <chrono>
#include <iostream>
#include <mutex>
#include <random>
#include <thread>
#include <utility>
#include <vector>

unsigned int turn = 1;
float        variavelCompartilhada = 20;

void thread1() {
	while(1){
		while (turn != 1);
		std::cout << "Thread T1 entrou na região crítica." << std::endl;
		std::this_thread::sleep_for(std::chrono::milliseconds(5000));
		variavelCompartilhada += 10;
		std::cout << "Thread T1 -- variavelCompartilhada: " << variavelCompartilhada << std::endl;
		std::cout << "Thread T1 vai sair da região crítica." << std::endl;
		turn = 2;
		std::cout << "Thread T1 está fazendo algo fora da região crítica." << std::endl;
		std::this_thread::sleep_for(std::chrono::milliseconds(1000));
	}
	pthread_exit(0);
}

void thread2() {
	while(1){
		while (turn != 2);
		std::cout << "Thread T2 entrou na região crítica." << std::endl;
		std::this_thread::sleep_for(std::chrono::milliseconds(2000));
		variavelCompartilhada /= 1.75f;
		std::cout << "Thread T2 -- variavelCompartilhada: " << variavelCompartilhada << std::endl;
		std::cout << "Thread T2 vai sair da região crítica." << std::endl;
		turn = 1;
		std::cout << "Thread T2 está fazendo algo fora da região crítica." << std::endl;
		std::this_thread::sleep_for(std::chrono::milliseconds(1000));
	}
	pthread_exit(0);
}


int main(){
	std::thread t1, t2;

	std::cout << "Thread principal -- variavelCompartilhada: " << variavelCompartilhada << std::endl;

	t1 = std::thread(thread1);
	t2 = std::thread(thread2);

	std::cout << "ID da thread 1: " << t1.get_id() << std::endl;
	std::cout << "ID da thread 2: " << t2.get_id() << std::endl;
	t1.join();
	t2.join();
}















/*

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
	int status;
	trava = 0;
	variavelCompartilhada = 20;
	pthread_t t1, t2;

	printf("Thread principal -- variavelCompartilhada: %i.\n", variavelCompartilhada);
	status = pthread_create(&t1, NULL, thread1, NULL);
	if (status != 0) {
		printf("Thread principal -- erro na criacao da thread t1! Codigo de retorno do pthread: %d\n", status);
		exit(-1);
	}
	status = pthread_create(&t2, NULL, thread2, NULL);
	if (status != 0) {
		printf("Thread principal -- erro na criacao da thread t1! Codigo de retorno do pthread: %d\n", status);
		exit(-1);
	}
	printf("Thread principal -- threads auxiliares t1 e t2 criadas.\n");

	//O programa só será finalizado se as threads t1 e t2 finalizarem, o que não vai acontecer.
	pthread_join(t1, NULL);
	pthread_join(t2, NULL);
	exit(0);
}


*/