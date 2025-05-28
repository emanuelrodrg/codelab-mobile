## Flutter Beautiful Login Page UI Design and Animation - Day 14

```dart
class Afgprogrammer extends Flutter100DaysOfCode {
  video() {
    return {
      "title": "Flutter Beautiful Login Page UI Design and Animation",
      "description": "Let's see how we can design a Login page UI and add some cool animation.",
      "day": 14,
      "videoLink": "https://youtu.be/txvyAO894DY"
    }
  }
}
```
### [Watch it on Youtube](https://youtu.be/txvyAO894DY)


# Projeto CodeLab App: Plataforma de Estudos Voltado a Programação

## 1. Informações Gerais do Projeto

O **CodeLab App** emerge como uma solução abrangente e integrada, meticulosamente desenvolvida para atender às necessidades multifacetadas de estudantes e entusiastas no universo da programação. Este projeto não se limita a uma única funcionalidade, mas sim consolida diversas ferramentas essenciais, desde o acompanhamento de cursos e aulas interativas até a gestão de desempenho acadêmico com cálculo de média, passando pela organização pessoal com notas e lembretes, aprimoramento da produtividade via técnica Pomodoro, e até mesmo a praticidade de agendamento de laboratórios. Em sua essência, o CodeLab App se propõe a ser um hub centralizado, onde o estudante pode otimizar seu tempo e aprimorar sua organização, elevando a experiência de aprendizado a um novo patamar de eficiência e conveniência.

A concepção e o desenvolvimento deste aplicativo foram liderados por **Emanuel Rodrigues**, que atuou como Desenvolvedor Full-stack Flutter, responsável por orquestrar todas as camadas da aplicação, desde a lógica de negócio até a construção da interface do usuário. Para a materialização do CodeLab App, foram empregadas tecnologias de ponta e ferramentas robustas, garantindo performance e escalabilidade. A base tecnológica reside no **Flutter 3.x**, impulsionado pela linguagem **Dart 3.x**, que oferece um ambiente ágil e produtivo para o desenvolvimento multiplataforma. O **Git e GitHub** foram cruciais para o controle de versão e colaboração, assegurando um histórico de desenvolvimento organizado e seguro. No que tange à experiência visual e interatividade, a biblioteca `animate_do` foi habilmente utilizada para infundir o aplicativo com animações fluidas e atraentes, enriquecendo a interação do usuário. Adicionalmente, a configuração de `flutter_lints` para análise de código garantiu que o projeto aderisse às melhores práticas de desenvolvimento, promovendo um código limpo, consistente e de alta qualidade.

## 2. Objetivos do Aplicativo

O principal propósito do CodeLab App é transcender a ideia de um mero conjunto de ferramentas, posicionando-se como uma plataforma holística que empodera estudantes de programação em todas as etapas de sua jornada acadêmica e de autoestudo. O aplicativo foi arquitetado com uma visão clara de simplificar a rotina de estudos, atacando diretamente os desafios de organização, acompanhamento e produtividade. Um dos pilares é **centralizar recursos**, eliminando a necessidade de múltiplos aplicativos ao reunir em um só lugar funcionalidades que vão desde o aprendizado ativo até a gestão de tempo e informações. Busca-se também **otimizar o aprendizado** ao oferecer um sistema intuitivo de acompanhamento de progresso em cursos e aulas, culminando na possibilidade simbólica de emissão de certificados, o que serve como um poderoso incentivo para a conclusão de módulos e a manutenção da disciplina.

Além disso, o CodeLab App visa **facilitar a gestão acadêmica**, simplificando tarefas rotineiras e muitas vezes tediosas, como o cálculo de médias e a organização de notas e lembretes cruciais, permitindo que o estudante foque mais no conteúdo e menos na burocracia. No quesito **produtividade**, a inclusão da técnica Pomodoro é estratégica, fornecendo uma ferramenta eficaz para gerenciar o tempo de estudo de forma estruturada, combatendo a procrastinação e otimizando o foco. A preocupação com a **acessibilidade** é intrínseca ao design do aplicativo, garantindo que ele seja utilizável por um espectro diversificado de usuários, com recursos que visam uma experiência inclusiva. Por fim, ao permitir a **conexão entre o aluno e a instituição** através da funcionalidade de reserva de laboratórios, o aplicativo estreita a ponte entre o ambiente virtual de estudo e os recursos físicos disponíveis, enriquecendo a experiência educacional como um todo.

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
