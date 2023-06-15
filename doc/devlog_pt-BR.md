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

23.11.2022
=
- [!] Conserto de vazamento de memória e  quando o programa é fechado
- [!] Agora funciona bem em ambos Linux e Windows (testado com as últimas versões Ubuntu x64 e Windows 11 x64)

26.11.2022
- [+] Adição da função para importar quadros a partir de uma imagem
- [!] Conserto de tamanhos diferentes de quadros quando um novo quadro é criado
- [+] Adição da ferramente de desenho em linha
- [*] Alteração do docs (adição da área 'Como obter')

02.12.2022
=
- [!] Conserto da ferramenta Pipeta
+ [+] Adição da ferramenta de desenho em Retângulo 

04.12.2022
=
- [!] Conserto do erro em que as ferramentas desapareciam ao usar a tela de desenho maximizada
- [+] Adição da ferramenta Retângulo Preenchido
- [+] Adição das possibilidades de 'Copiar Camada' e 'Renomear Camada'
- [+] Estende a camada com codificação/decodificação BASE64 (usado ao copiar ou renomear a camada)
- [*] Atualização dos Documentos
- [!] Conserto de 'Deletar Camada'
- [!] Impedir a modificação camada quando bloqueado
- [*] Update da tradução Ucraniana da Interface do Usiário
- [*] Mudança da ordem das camadas (mais nova em cima, mais velha em baixo)
- [*] Agora mostra que as camadas pertencem apenas ao quadro atual
- [+] Adição da ferramenta Círculo
- [+] Os últimos botões da interface foram feitos no SPedit!

12.12.2022
=
- [*] Redesign completo da IU, muito código foi retrabalhado (alguns dias de trabalho entre apagões de energia)
- [*] Redesign do mascote do SPEDit (ícone e animação na tela de 'Sobre') - graças ao @EddieMattos
- [+] Adição de um modo em Tela Cheia
- [!] Correção de oscilações e congelamento quando as janelas modais são exibidas
- [-] Remoção do estilo DOS antigo de desenhar com as teclas (era um método estranho)

14.12.2022
=
- [+] Adicionadas as teclas Shift+setas para mover a área da grade de desenho
- [+] Acrescentado o tamanho mínimo da célula no diálogo 'Novo quadro'.

17.12.2022
=
- [+] Trabalho ampliado com cores - adicionado a combobox Stadard pré-definida (será preenchida em breve), a paleta pré-definida e o seletor de cores Hex
- [*] Mudou-se a seleção de cores de fundo para Ctrl+Clique em vez de Ctrl+Clique com o botão direito do mouse. A seleção de cor de primeiro plano funciona com o clique esquerdo do mouse.

22.12.2022
=
- [+] Adição do suporte à paletas no formato PNG
- [+] Adição de cursores customizados enquanto se desenha

25.12.2022
=
- [+] Adição do 'Modo Zen' em tela cheia
- [+] Adição do recurso 'Redimensionar quadro' 

26.12.2022
=
- [!] Conserto do aviso GTK2 no Linux e parece que também está funcionando no Windows

28.12.2022
=
- [+] Adição da ferramenta de pontilhismo (aplique uma paleta para obter o efeito desejado)
- [*] Depois de carregar as paletas elas aparecerão com seu nome na caixa de busca de paletas
02.01.2023
=
- [!] Conserto do carregamento de Idioma, auto-carregamento de paletas e erro desconhecido (Issue #16)
- [+] Implementação da ferramenta de seleção Retangular
- [*] Pequenas mudanças e melhorias

07.01.2023
=
- [+] Adição do recurso para desativar/reativar a grade
- [+] Adição do recurso Mesclar camada com a inferior
- [!] Conserto da lista de camadas incorreta na grade de Camadas

08.01.2023
=
- [+] Adição de menu Popup para camadas (clique direito)
- [+] Adição do recurso Mover camada (use Popup menu)
- [+] Adição da ferramenta para mover o desenho

10.01.2023
=
- [+] Adição do recurso Espelhar/Girar camadas
- [*] A última paleta usada auto carrega e auto salva
- [*] O caminho da última exportação de quadro é salva nas configurações
- [+] Adição dos atalhos nos documentos

14.01.2023
=
- [*] Adição do suporte JSON para TSPLayer e TSPFrame (Usado com o gerenciador de Desfazer/Refazer,
  em breve será usado um formato próprio do SPEdit)
- [*] O gerenciador de Desfazer/Refazer foi reescrito

7.06.2023
=
- [*] Migração do Lazarus IDE para o CodeTyphon Studio - sem a necessidade de dependências externas
- [*] Atualização dos documentos

11.06.2023
=
- [+] Adição do modelo de interface para o modo 'Papel Vegetal' ('Onion skin')
- [!] Ajuste de algumas dependências, remoção de unidades duplicadas
- [*] Mudança do ícone de alguns botões

12.06.2023
=
- [!] Conserto da função deletar quadro
- [!] Ajuste da função salvar o caminho do último projeto aberto
- [!] Conserto do vazamento de memória (se abrir vários projetos em sequência)
- [*] Alguns textos foram devinculados do código para facilitar a tradução

13.06.2023
=
- [*] A função 'Papel Vegetal' está quase pronta
