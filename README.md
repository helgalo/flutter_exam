# flutter_exam

Projeto flutter desenvolvido como um desafio de criar uma tela de login e home para demonstrar alguns conhecimentos com gerência de estado e afins.

Utilizei pacotes como MobX e SharedPreferences e também fiz alguns testes de integração básicos.

Versão flutter:
3.13.9

Resumo de resultado:

![login](https://github.com/helgalo/flutter_exam/assets/44454981/edbdef00-025d-4a60-ac66-ac76358f3095)

Desafio:

Tela de login:

![image](https://github.com/helgalo/flutter_exam/assets/44454981/07b499a5-ddd8-418a-9dc8-039e0cb982a0)

Uma tela de autenƟcação onde o usuário é obrigado a digitar seu login e senha.
A tela deve conter:
- Um Campo de senha 
- Um campo de texto para representar o Login 
- Um Label descrito "PolíƟca de privacidade"

Como tela deve se comportar 
- Verificar e alertar se ambos os campos de Login e senha estão preenchidos. 
  - O campo senha não pode ter menos que dois caracteres. 
  - O campo senha não pode ter caracteres especiais, sendo apenas possível 
informar 'a' até 'Z' e '0' até '9'. 
- Ambos os campos não podem ultrapassar 20 caracteres. 
- Ambos os campos não podem terminar com o caractere de espaço no final. 
- Se ambas as informações esƟveram preenchidas deve ir para a próxima tela. 
- Ao tocar no label "PolíƟca de privacidade" uma página web direcionada para o 
google.com.br deve ser aberta. 


Tela de captura de informações:

![image](https://github.com/helgalo/flutter_exam/assets/44454981/ab777507-9594-445f-b2b0-43038cf8631f)

A tela deve salvar as informações digitadas pelo usuário em um card, listando essas informações 
salvas e dando a opção de editar ou excluir. Essas informações não podem ser perdidas ao fechar 
o app, ou seja, ao abrir a tela as informações salvas anteriormente devem ser mostradas na 
ordem. 
A tela deve conter:
- Um card principal e central 
- Um campo de texto

Como a tela deve se comportar:
- O foco da digitação deve estar o tempo todo no campo de "Digite seu texto" e não pode 
ser perdido ao interagir com a tela. 
- Ao acionar o "enter" o campo tem que verificar se a informação foi preenchida. 
- O Card principal deve receber a informação digitada do campo. 
- As informações precisam ser salvas e lidas uƟlizando a biblioteca shared_ preferences 
(hƩps://pub.dev/packages/shared_preferences)
- O Icone de excluir deve abrir um pop-up confirmando a ação. 
- Obrigatório a utilização do plugin MOBX para a construção da tela.
