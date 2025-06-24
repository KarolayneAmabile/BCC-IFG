### Karolayne Amabile Brito Borges
### 3°P - Bacharelado em Ciência da Computação


# Análise Crítica da Interface do Aplicativo Crunchyroll sob a Perspectiva da Interação Humano-Computador (IHC)

A interface digital escolhida para esta análise é o aplicativo **Crunchyroll**, uma plataforma de streaming especializada em animes. Por ser uma aplicação bastante utilizada por fãs desse tipo de conteúdo, sua experiência de uso deveria ser intuitiva e fluida. No entanto, durante o uso frequente, é possível perceber algumas falhas de design que acabam induzindo os usuários a erros, afetando diretamente a usabilidade e a satisfação.

## 1. Identificação da Interface Analisada

O Crunchyroll é um aplicativo disponível para Android, iOS e também com versão web. Ele permite ao usuário assistir a episódios de animes, organizar listas, salvar favoritos, entre outras funcionalidades.

## 2. Descrição dos Erros Recorrentes Observados

Durante o uso da plataforma, alguns problemas específicos podem ser destacados:

- **Erro na reprodução de episódios (Mistake)**: Um erro comum ocorre quando o usuário tenta reproduzir um episódio e, devido ao design confuso da tela de navegação, acaba clicando em um episódio diferente do que pretendia assistir.
- **Slips durante a rolagem**: A navegação por listas longas (como "Minha Lista" ou "Continuar assistindo") apresenta rolagem sensível, o que faz com que o usuário selecione o conteúdo errado ao tentar apenas deslizar a tela.
- **Falta de feedback ao adicionar/remover um anime da lista**: Muitas vezes, ao clicar para adicionar ou remover um anime da lista de favoritos, não há um feedback visual claro, gerando dúvida se a ação realmente foi realizada.

## 3. Análise Crítica com Base nos Conceitos de IHC

Aplicando os conceitos discutidos em aula:

- **Affordance**: A interface apresenta baixa affordance em alguns botões. Por exemplo, o botão de "Adicionar à lista" não tem diferenciação visual suficiente para indicar claramente sua função, parecendo apenas um marcador estático.
- **Feedback**: A ausência de feedback imediato após ações como adicionar ou remover um anime da lista é um problema clássico de IHC. O usuário fica incerto sobre o resultado da sua interação.
- **Slips**: O excesso de sensibilidade na rolagem faz com que o usuário cometa deslizes (slips), clicando em episódios ou animes que não pretendia selecionar.

## 4. Propostas de Melhorias com Justificativas Técnicas

Com base nos problemas identificados e nos conceitos teóricos, as seguintes melhorias são sugeridas:

- **Melhorar a affordance dos botões**: Usar ícones universais (como o símbolo de "+") e reforçar com texto, além de trabalhar com cores diferentes para estados diferentes (exemplo: "adicionado" fica verde com um check).
- **Implementar feedback imediato**: Sempre que o usuário adicionar ou remover um item, uma notificação simples (snackbar ou popup discreto) deve aparecer com a confirmação da ação.
- **Padronizar a interface entre plataformas**: Criar um design mais unificado, onde a organização de menus, botões e categorias siga a mesma lógica, independentemente de ser usado no navegador ou no celular.
- **Ajustar a sensibilidade da rolagem**: Trabalhar na ergonomia digital do aplicativo, calibrando a resposta do toque para evitar seleções acidentais.

## Conclusão

A análise do aplicativo Crunchyroll revela que, apesar de ser uma plataforma consolidada, ainda apresenta falhas importantes do ponto de vista da Interação Humano-Computador. Problemas como falta de feedback, inconsistência, excesso de carga cognitiva e má definição de affordances impactam negativamente a experiência do usuário.