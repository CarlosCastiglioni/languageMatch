# match_code

## Introdução

Este aplicativo foi desenvolvido em Flutter, e baseia-se em o usuário escolher entre dar Match ou Rejeitar uma linguagem de programação
que aparecerá de tempos em tempos.

## Packages Utilizados
- firebase_core
- firebase_auth
- shared_preferences
- google_fonts
- google_sign_in
- flutter_bloc
- equatable
- flutter_local_notifications
- rxdart

## Relação dos packages com o funcionamento do App
- O login do app é feito utilizando-se Firebase e google sign in, para que seja feito login diretamente com usuário Google e após logado, a autenticação do usuário
  é armazenada utilizando-se o package shared_preferences.

- O estado global é tratado utilizando-se Bloc(flutter_bloc), de forma a criar um fluxo de contador que trabalhe constantemente com o decorrer do tempo
  e encerre com a conclusão das funcionalidades.

- O App possui uma pasta de compartilhamento de estilos e imagens chamada "shared", e nela estão armazenadas todas as cores, fontes (estas são
  provenientes do package google_fonts) e as imagens da pasta assets já declaradas em variáveis para facilitar sua utilização.
  
 - O App também trabalha com um sistema de push notification toda vez que o usuário recebe uma nova oportunidade de escolher uma linguagem para
   dar match ou rejeitar, e para isso é utilizado o package flutter_local_notifications.




