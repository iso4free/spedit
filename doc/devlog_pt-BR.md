REGISTRO DE DESENVOLVIMENTO	
=======

#Descrição
- [*] Algumas alterações
- [!] Conserto de alguns erros ou bugs
- [+] Adição de algo novo
- [-] Remoção de recursos sem uso

2000-2001
=
- [+] Primeira versão para MS-DOS (o código foi perdido)

2002
=
- [+] Segunda versão com o suporte ao formato PCX (no arquivo)

2004
=
- [+] Terceira versão - portada para FPC para o Windows, usava paleta de 256 cores (no arquivo)

16.04.2021
=
- [*] Processo de trabalho completamente redesenhado

- [+] Implementeda uma Biblioteca Local de Sprites para armazenar imagens importadas no formato PNG separado por categorias

26.04.2022
=

- [+] Na aba 'Imagem de Origem' foi adicionado funcionalidades de trabalho com quadros (lista de quadros, propriedades de quadro,  deletar quadros selecionados)

07.05.2022
=
- [*] A tela de 'Sobre' foi modificada (traçado otimizado, animação trocada)

22.05.2022
=
- [+] Implementação de paleta e seleção de cor

08.06.2022
=
- [+] Adição da interface de trabalho com camadas
- [!] Conserto de um bug com o traçado da grade
- [*] Alteração da previsualização (centralizada e com padrão em xadres como fundo transparente)
- [*] Algumas pequenas alterações

09.06.2022
=
- [*] Algumas alterações na interface (Ferramentas de desenho agora possuem propriedades)
- [+] Inicia-se a tentativa de desenho (ainda não funciona bem - precisa de conserto)

25.10.2022
=
- [*] Muitas mudanças durante todo o período (12.10-25.10):
- [+] Implementação do destaque das células ao mover o mouse sobre a grade
- [+] Adição de teclas direcionais para mover o cursor da célula
- [+] Adição de classes básicas de camada e quadro
- [+] Adição de listas mapeadas de camadas/quadros
- [!] Conserto do vazamento de memória
- [+] Adição da opção de Exportar quadro para PNG
- [!] Conserto do controle do cursor usando as teclas
- [+] Adição do desenho com a cor secundária (tecla Enter), deletar pixel com a tecla Del

27.10.2022
=
- [*] Criação de janelas separadas para previsualização, referência, camadas
- [*] Reestruturação e otimização do código
- [*] Remoção de componentes desnecessários
- [*] Algumas alterações na organização de projeto
- [*] Este arquivo foi atualizado

28.10.2022
=
- [+] Adição de janela de modelo para os quadros
- [*] Algumas correções e alterações

31.10.2022
=
- [+] Adição de mudança no tamanho do lápis
- [+] Adiçao da ferramenta de desenho com linha
- [+] Adição do desenho com mouse(ferramenta lápis)
- [*] ALteração para conexão via LazLogger ao invés do console WriteLN
- [!] Conserto do fundo transparente ao desenhar com mouse

02.11.2022
=
- [*] ALteração da funcionalidade interna das ferramentas de desenho, mas o app falha ao fechar
- [+] Adição de modelo para a Ferramenta Borracha

04.11.2022
=
- [+] Adição do diálogo Novo Quadro
- [!] Conserto de vazamento de memória

12.11.2022
=
- [+] Adição da tradução para o Português Brasileiro
- [+] Adição da tradução para o Ucraniano
- [*] Conserto de alguns erros de escrita em documentos
- [*] Migração de todo o projeto para o Lazarus
- [+] Adição do carregamento automático do idioma local quando existe um arquivo de tradução 

13.11.2022
=
- [+] Adição da seleção manual do idioma do arquivo e salvamento do idioma nas configurações

20.11.2022
=
- [+] Implementação da lista de camadas do conteúdo desenhado na grade
- [!] Conserto do erro SIGSEGV