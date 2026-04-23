## 1 Programa A-exemploIPC0.cpp
### 1.1 Compile o código, execute o programa várias vezes e anote o seu resultado.
Output:
```
karolayne@Karol:~/BCC-IFG/sistemas-operacionais$ g++ A-exemploIPC0.cpp -o A-exemploIPC0
karolayne@Karol:~/BCC-IFG/sistemas-operacionais$ ./A-exemploIPC0
O valor do numero apos a finalizacao de T1 e T2 é: 2000000
karolayne@Karol:~/BCC-IFG/sistemas-operacionais$ ./A-exemploIPC0
O valor do numero apos a finalizacao de T1 e T2 é: 2000000
karolayne@Karol:~/BCC-IFG/sistemas-operacionais$ ./A-exemploIPC0
O valor do numero apos a finalizacao de T1 e T2 é: 2000000
karolayne@Karol:~/BCC-IFG/sistemas-operacionais$ ./A-exemploIPC0
O valor do numero apos a finalizacao de T1 e T2 é: 2000000
karolayne@Karol:~/BCC-IFG/sistemas-operacionais$ ./A-exemploIPC0
O valor do numero apos a finalizacao de T1 e T2 é: 2000000
karolayne@Karol:~/BCC-IFG/sistemas-operacionais$ ./A-exemploIPC0
O valor do numero apos a finalizacao de T1 e T2 é: 2000000
```

### 1.2 Altere o código para forçar uma condição de corrida. Compile-o, execute-o várias vezes e anote o seu resultado.
Output:
```
karolayne@Karol:~/BCC-IFG/sistemas-operacionais$ g++ A-exemploIPC0-condicao-corrida.cpp -o A-exemploIPC0-condicao-corrida
karolayne@Karol:~/BCC-IFG/sistemas-operacionais$ ./A-exemploIPC0-condicao-corrida 
O valor do numero apos a finalizacao de T1 e T2 é: 1010806
karolayne@Karol:~/BCC-IFG/sistemas-operacionais$ ./A-exemploIPC0-condicao-corrida 
O valor do numero apos a finalizacao de T1 e T2 é: 1181034
karolayne@Karol:~/BCC-IFG/sistemas-operacionais$ ./A-exemploIPC0-condicao-corrida 
O valor do numero apos a finalizacao de T1 e T2 é: 1133531
karolayne@Karol:~/BCC-IFG/sistemas-operacionais$ ./A-exemploIPC0-condicao-corrida 
O valor do numero apos a finalizacao de T1 e T2 é: 1043105
karolayne@Karol:~/BCC-IFG/sistemas-operacionais$ ./A-exemploIPC0-condicao-corrida 
O valor do numero apos a finalizacao de T1 e T2 é: 1218794
karolayne@Karol:~/BCC-IFG/sistemas-operacionais$ ./A-exemploIPC0-condicao-corrida 
O valor do numero apos a finalizacao de T1 e T2 é: 1046855
```

### 1.3 Explique o que você fez no código e explique porque está ocorrendo a condição de corrida.
Para forçar uma condição de corrida, basta retirar o mutex da função incrementaVariavel. Isso faz com que as threads acessem o mesmo recurso simultaneamente e haja sobrescrita.

---

## 2 Programa B-exemploIPC2.cpp
### 2.1 Qual é o método de IPC empregado para coordenar as atividades das duas threads ? Embase sua resposta fazendo referência ao código.
O método de IPC empregado nas duas threads é o de alternância estrita, um tipo de implementação de mutex com espera ocupada. É possível identificá-lo atráves das variáveis `turn` presente em cada thread. Ao fim de uma execução crítica, a thread atual altera o valor da variável `turn`, liberando a execução da área crítica da outra thread.

### 2.2 Compile o código e mantenha o programa em execução por um tempo.
```
karolayne@Karol:~/BCC-IFG/sistemas-operacionais/exemploB$ ./B-exemploIPC2 
Thread principal -- variavelCompartilhada: 20
Thread T1 entrou na região crítica.
ID da thread 1: 132796217554624
ID da thread 2: 132796209161920
Thread T1 -- variavelCompartilhada: 30
Thread T1 vai sair da região crítica.
Thread T1 está fazendo algo fora da região crítica.
Thread T2 entrou na região crítica.
Thread T2 -- variavelCompartilhada: 17.1429
Thread T2 vai sair da região crítica.
Thread T2 está fazendo algo fora da região crítica.
Thread T1 entrou na região crítica.
Thread T1 -- variavelCompartilhada: 27.1429
Thread T1 vai sair da região crítica.
Thread T1 está fazendo algo fora da região crítica.
Thread T2 entrou na região crítica.
Thread T2 -- variavelCompartilhada: 15.5102
Thread T2 vai sair da região crítica.
Thread T2 está fazendo algo fora da região crítica.
Thread T1 entrou na região crítica.
```

### 2.3 Analise o resultado da execução do código. As threads thread1() e thread2() estão entrando na região crítica ao mesmo tempo? Explique como chegou a essa conclusão.
Não, as threads não estão entrando em execução ao mesmo tempo, devido a alternância restrita. Entretando, acompanhando a execução em tempo real.

### 2.4 Mantendo o programa ainda em execução, abra outra janela de terminal e entre no utilitário htop do Linux. Como saber, na prática, se o método de IPC empregado é um método de esper ocupada? Explique.
É possível observar que o método IPC empregado é um método de espera ocupada pois, no momento em que uma thread entra na região crítica, é possível observar que há consumo de apenas um dos núcleos do computador.

### 2.5 O código está fazendo uso de alguma API do sistema operacional para realizar IPC? Explique.
Não, o método da alternância restrita não faz uso de nenhuma API do sistema operacional. A implementação é puramente em software, no qual as threads se comunicam por meio de uma variável compartilhada que dita quem deve entrar em execução. Isso é possível pois a operação de reatribuir a variável é atômica. 

---

## 3 Programa C-exemploIPC6.cpp
### 3.1 Compile o código e mantenha o programa em execução por um tempo.
### 3.2 Usando o utilitário htop , o que se percebeu de diferença ao comparar a execução deste programa com o programa anterior? Explique.
No programa C, nenhuma das CPU's do computador é ocupada de forma significativa, indicando que o método não é de espera ocupada.

### 3.3 Por que a linha 22 está comentada e não incorre em nenhum erro na execução do programa? Explique.
Pois, apesar de todas as threads acessarem o `buffer`, ele é um vetor, de forma que a posição na memória que é acessada por cada thread não é compartilhada no momento do acesso. Esse controle se deve graças ao IPC semáforo.

### 3.4 O programa faz uso de cinco threads produtoras e duas threads consumidoras. No decorrer da execução do programa, contudo, o buffer fica vazio. Por quê? Explique, fazendo referência ao código-fonte.
O buffer fica vazio pois o tempo de `sleep` das threads produtoras é 20x maior que o tempo das threads consumidoras, o que faz com que as threads produtoras levem mais tempo para adicionar um item novo no buffer.

### 3.5 Que alteração no código poderia ser feita para que o buffer fique cheio no decorrer da execução do código?
Alterar o tempo de duração do `sleep` das threads produtas; trocar os valores dos tempos, por exemplo, faz com que o buffer esteja sempre cheio.

---

## 4 Programas D-somavetor1.cpp e D-somaVetor2.cpp
### 4.1 Compile os dois códigos-fonte e execute os dois programas, um por vez. Atenção: um dos programas é monothread. O outro, multithread. Assim, anote o tempo de execução do monothread e diversos tempos de execução do multithread com variadas quantidades de threads.

### 4.2 Por que há diferença no tempo de execução do programa monothread vs multithread?
O programa multithread consegue ser mais eficiente pois acessa mais de um dos núcleos que o computador possui.

### 4.3 Que alteração você faria para deixar o código multithread mais performático?
### 4.4 Depois que você alterou o código multithread para deixá-lo mais rápido, responda à seguinte pergunta: para o código multithread em questão e para o seu computador, qual é a quantidade ideal de threads para executar este programa?
### 4.5 Altere o prompt de compilação que você usou, tirando o parâmetro -O3 , e anote os tempos de execução dos dois programas. Por que houve alteração nos tempos de execução dos dois programas?