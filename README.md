# Projeto CodeLab App: Plataforma de Estudos de Programação

## 1. Informações Gerais do Projeto
### Nome do Aplicativo

O aplicativo recebeu o nome de CodeLab.

### Descrição

O CodeLab App é uma plataforma educacional multifuncional, desenvolvida para ser um auxiliar para universitários que cursam programação. O objetivo principal é centralizar e simplificar as diversas exigências do dia a dia acadêmico e de estudo, combatendo a dispersão de ferramentas e informações que frequentemente sobrecarrega os estudantes. O aplicativo resolve desafios cruciais, como a dificuldade em gerenciar o tempo de estudo e a organização de tarefas, oferecendo um sistema de lembretes onde os estudantes podem gerenciar suas atividades, garantindo que nenhum prazo importante seja perdido. O projeto também conta com outras funcionalidades essenciais para os usuários, como agendamento de laboratório e modo foco, transformando a rotina de estudos em uma experiência mais fluida e produtiva.

Pensando em uma jornada de aprendizado inclusiva, o CodeLab App foi projetado desde sua concepção com a acessibilidade em mente. Incorporamos funcionalidades e um design que atendem a usuários com diversas limitações, tornando a experiência de aprendizado mais equitativa e abrangente para todos. Com ele, os usuários podem acompanhar cursos e aulas de programação de forma intuitiva, gerenciar suas notas e prazos acadêmicos com facilidade, e aproveitar ferramentas de produtividade essenciais, como o Pomodoro Timer, para otimizar o foco e a eficiência nos estudos. Além disso, a funcionalidade de agendamento de laboratórios da faculdade adiciona uma camada de praticidade, resolvendo problemas como a falta de comunicação na reserva, conectando o ambiente virtual com os recursos físicos disponíveis de forma descomplicada. Em suma, o CodeLab App é uma solução completa e pensada para elevar a experiência de aprendizado, tornando-a significativamente mais organizada, eficiente, acessível e verdadeiramente integrada.

### Equipe

Emanuel de Oliveira Rodrigues (04161645) - Desenvolvedor Flutter Principal: Responsável pela arquitetura geral do aplicativo, implementação das funcionalidades, integração de módulos e garantia da coesão técnica do projeto.

João Vitor Ramos Soares (0416556)- Desenvolvedor Front-end: Focou na criação da interface do usuário, garantindo a estética visual, a responsividade dos layouts e a experiência de uso intuitiva, além de contribuir com a implementação de telas.

Wallace Ney dos Santos Silva (04149344) - Desenvolvedor de Integrações e Testes: Atuou na implementação de lógicas de integração entre módulos, como a simulação de reserva de laboratórios, e na elaboração e execução de testes para garantir a estabilidade e o bom funcionamento do aplicativo.

Bruna Rayane Silva da Costa (04158175) - Acessibilidade: Contribuiu na pesquisa e definição de funcionalidades de acessibilidade, além de auxiliar na coleta e análise dos requisitos do usuário para garantir que o aplicativo atendesse às necessidades do público-alvo.

Kevin Guimarães da Silva Morais (04153687) - Desenvolvedor de Funcionalidades e Suporte Técnico: Participou na implementação de diversas funcionalidades, como o timer Pomodoro e o cálculo de notas, e forneceu suporte técnico na resolução de desafios de codificação.

Eduardo Henrique do Nascimento Costa (04154362) - Documentador: Colaborou na organização e estruturação do conteúdo educacional simulado no app, além de ter um papel na documentação do projeto, incluindo a elaboração e revisão do README.md.

### Tecnologias Utilizadas

Para a construção do CodeLab App, foi adotado um conjunto de tecnologias modernas e eficientes, garantindo alta performance e uma experiência de usuário fluida. A base do nosso aplicativo é o Flutter, o renomado framework de UI da Google. Ele nos permitiu desenvolver uma aplicação robusta para múltiplas plataformas a partir de uma única base de código, otimizando o processo e assegurando consistência. A linguagem de programação utilizada é o Dart, otimizada para o desenvolvimento front-end, conhecida por sua velocidade e facilidade de uso.

Para o controle de versão e a colaboração entre a equipe, foi realizada no GitHub, que nos proporcionam um histórico de desenvolvimento organizado e um ambiente seguro para o compartilhamento de código. Além disso, incorporamos bibliotecas e ferramentas importantes como "animate_do" para adicionar animações fluidas e envolventes, enriquecendo a interação visual do usuário. A utilização de "flutter_lints" é crucial para mantermos a qualidade do código, garantindo que sigamos as melhores práticas de desenvolvimento e produzamos um código limpo e consistente.

## 2. Objetivos do Aplicativo

O principal objetivo do CodeLab App é ir além da ideia de um mero conjunto de ferramentas, posicionando-se como uma plataforma usual que auxilia estudantes de programação em todas as etapas de sua jornada acadêmica e de estudos. O aplicativo foi arquitetado com uma visão clara de simplificar a rotina de estudos, atacando diretamente os desafios de organização, acompanhamento e produtividade. Um dos pilares é **centralizar recursos**, eliminando a necessidade de múltiplos aplicativos ao reunir em um só lugar funcionalidades que vão desde o aprendizado ativo até a gestão de tempo e informações. Buscou-se também **otimizar o aprendizado** ao oferecer um sistema intuitivo de acompanhamento de progresso em cursos e aulas, culminando na possibilidade simbólica de emissão de certificados, o que serve como um incentivo para a conclusão de módulos e a manutenção da disciplina. A ideia é que o aplicativo possa ser usado em conjunto as universidades de modo que facilite a vida dos estudantes.

Além disso, o CodeLab App visa **facilitar a gestão acadêmica**, simplificando tarefas rotineiras e muitas vezes tediosas, como o cálculo de médias e a organização de notas e lembretes cruciais, permitindo que o estudante foque mais no conteúdo. No quesito **produtividade**, a inclusão da técnica Pomodoro é estratégica, fornecendo uma ferramenta eficaz para gerenciar o tempo de estudo de forma estruturada, combatendo a procrastinação e otimizando o foco. A preocupação com a **acessibilidade** é intrínseca ao design do aplicativo, garantindo que ele seja utilizável por um espectro diversificado de usuários, com recursos que visam uma experiência inclusiva. Por fim, ao permitir a **conexão entre o aluno e a instituição** através da funcionalidade de reserva de laboratórios, o aplicativo melhora o ambiente virtual de estudo e os recursos físicos disponíveis, enriquecendo a experiência educacional como um todo.

## 3. Funcionalidades

O CodeLab App foi meticulosamente desenhado com um conjunto robusto de funcionalidades, cada uma delas pensada para ser intuitiva e de grande utilidade no cotidiano do estudante de programação. O **sistema de autenticação** inicia a jornada do usuário, oferecendo um **Login** seguro com matrícula e senha, e uma funcionalidade para "Esqueceu a Senha?" que, embora simulada neste momento, aponta para uma futura capacidade de recuperação de credenciais, garantindo a acessibilidade à plataforma.

No coração do aprendizado, as seções de **Aulas e Cursos** permitem a visualização de uma lista de cursos disponíveis, com detalhamento profundo de cada aula, culminando em um **Acompanhamento de Progresso** dinâmico que permite ao usuário marcar aulas como concluídas, visualizando seu progresso percentual de forma clara. Ao finalizar um curso, a opção de **Emissão de Certificado** oferece uma recompensa simbólica, reforçando a sensação de conquista. Para a gestão acadêmica, a ferramenta de **Cálculo de Média** é indispensável, processando notas de AV1, AV2 e Prova Final (PF) para determinar a aprovação ou reprovação de forma transparente. A funcionalidade de **Notas & Lembretes** atua como um caderno digital, permitindo adicionar, gerenciar e editar anotações e lembretes importantes, garantindo que nenhuma tarefa ou informação crucial seja esquecida.

Para impulsionar a produtividade, o **Pomodoro Timer** integra a renomada técnica Pomodoro, oferecendo ciclos configuráveis de foco e pausa com um contador regressivo completo, que pode ser iniciado, pausado e reiniciado conforme a necessidade do estudo. A **Reserva de Laboratório** adiciona uma camada de praticidade ao ambiente físico, permitindo o agendamento de horários em laboratórios específicos com detalhes como professor, turma, data e hora, além de possibilitar a visualização e gestão das reservas existentes. A **Acessibilidade** é um pilar do design, com uma seção dedicada que explora recursos planejados como legendas, feedback tátil e ajuste de fonte, visando uma experiência inclusiva para todos os usuários. Finalmente, a seção **Meu Perfil** é o cartão de visitas do estudante, exibindo informações detalhadas como nome, e-mail, matrícula e semestre, e, notavelmente, mostrando o progresso individual no curso principal, como "Ciência da Computação", conectando a identidade do usuário ao seu caminho de aprendizado.

Olhando para o futuro, o CodeLab App já vislumbra a expansão de suas capacidades com diversas **Funcionalidades Futuras** que aprimorarão ainda mais a experiência do usuário. Planeja-se a integração com calendários externos para uma gestão de lembretes mais eficaz, a implementação de notificações push para avisos importantes sobre aulas e reservas, a introdução de um sistema de gamificação para incentivar o estudo e a conclusão de módulos, o acesso direto a material didático dentro do aplicativo, e a personalização de temas e cores para uma interface ainda mais agradável e adaptada às preferências do usuário.

## 4. Interface e Design

A interface e o design do CodeLab App foram concebidos com a premissa de serem não apenas esteticamente agradáveis, mas sobretudo funcionais e intuitivos, elevando a usabilidade e a experiência do usuário a um patamar superior. A **paleta de cores** dominante, composta por tons profundos de azul escuro e o frescor do branco, com acentos estratégicos em verde para indicar sucesso ou progresso, e tons de amarelo ou vermelho para avisos e erros, confere ao aplicativo uma identidade visual profissional e focada, que ressoa com o universo da tecnologia. O uso de **gradientes de azul** no topo das telas adiciona um elemento de dinamismo e coesão visual, conectando fluidamente as diversas seções do aplicativo.

A organização do conteúdo é primorosa, fazendo uso extensivo de **cartões (Cards) e sombras sutis**, que não só agrupam informações de forma lógica mas também adicionam profundidade e uma sensação tátil à interface, facilitando a distinção entre elementos e a leitura visual. As **animações suaves**, implementadas com maestria através da biblioteca `animate_do` (especialmente os efeitos de *FadeInUp* e *FadeInDown*), infundem vida nas transições de elementos e telas, proporcionando uma experiência de navegação fluida e envolvente que cativa o usuário. A escolha por **ícones intuitivos** e universalmente reconhecíveis para cada funcionalidade simplifica a navegação e a compreensão visual, tornando o aplicativo acessível a um público amplo.

Além disso, a **responsividade** foi um fator chave no design, garantindo que os layouts se adaptem harmoniosamente a diferentes tamanhos de tela, desde smartphones compactos até tablets, proporcionando uma experiência consistente e otimizada em uma variedade de dispositivos móveis. O **feedback visual** imediato é uma constante no aplicativo, seja através de barras de progresso para indicar o avanço em cursos, ícones de check para aulas concluídas, ou mensagens claras e contextuais de sucesso ou erro (Snackbars), assegurando que o usuário esteja sempre ciente do estado da sua interação com o aplicativo.

## 5. Como Executar o Projeto

Para vivenciar e explorar o CodeLab App em seu ambiente de desenvolvimento, siga este guia detalhado, que o conduzirá desde a configuração inicial até a execução do aplicativo em um emulador ou dispositivo físico.

Primeiramente, certifique-se de possuir os **Pré-requisitos** essenciais: o Flutter SDK deve estar devidamente instalado e configurado em sua máquina, preferencialmente na versão estável mais recente para garantir compatibilidade e acesso às funcionalidades mais recentes. Um editor de código robusto como o VS Code ou Android Studio, com os plugins Flutter e Dart instalados e ativos, é fundamental para uma experiência de desenvolvimento eficiente. Adicionalmente, você precisará ter um emulador Android ou iOS configurado e funcional, ou um dispositivo físico conectado ao seu computador e habilitado para depuração, que servirá como alvo para a execução do aplicativo.

Com o ambiente pronto, o processo se inicia clonando o repositório do projeto. Abra o terminal de sua preferência (seja o terminal integrado do VS Code, Git Bash ou o prompt de comando) e execute o comando `git clone` seguido do URL do repositório:
```bash
git clone [https://github.com/emanuelrodrg/codelab-mobile.git](https://github.com/emanuelrodrg/codelab-mobile.git)
