Este modelo foi criado para a criação do relatório de atividades para o
processo de promoção e de progressão na carreira de Professor do Magistério
Superior da Universidade Tecnológica Federal do Paraná (UTFPR), classe
Associado.

O modelo considera os seguintes documentos como base, conforme disponibilizados na [página da UTFPR sobre a classe de Professor Associado](https://www.utfpr.edu.br/servidores/site/carreira-e-remuneracao/docentes-magisterio-superior/promocao-e-progressao/promocao-e-progressao-classe-associado):
* [Deliberação COUNI-UTFPR 28/18, de 26 de outubro de 2018](https://sei.utfpr.edu.br/sei/publicacoes/controlador_publicacoes.php?acao=publicacao_visualizar&id_documento=663762&id_orgao_publicacao=0): Regulamento para avaliação de desempenho acadêmico para fins de promoção e progressão funcional para a classe de Professor Associado da UTFPR
* [Instruções de Preenchimento de Formulário para Fins de Promoção à Classe Associado](https://cloud.utfpr.edu.br/index.php/s/0wAyNnvUdy6oNku)

O modelo é estruturado nos seguintes arquivos:
* root.tex, que contém a estrutura principal. Neste arquivo precisam ser alterados o nome do docente e a data do relatório.
* formacao.tex, ensino.tex, producao.tex e atividades.tex, que descrevem as atividades realizadas e citam os documentos comprobatórios.
* apendice.tex, que contém os documentos comprobatórios.

Quanto ao modelo, nos arquivos formacao.tex, ensino.tex, producao.tex e atividades.tex é necessário citar os documentos comprobatórios com o comando \doc{<identificador>}. Para cada documento citado, é necessário criar ou incluir os respectivos documentos comprobatórios no arquivo apendice.tex, usando os comandos \docheader{<identifiador>}{Nome bonito do item} e os \includepdf{} dos comprovantes.

Observe que é possível usar o mesmo documento comprobatório para várias atividades. Por exemplo, para os casos de bancas de estágio, que um único documento comprobatório serve para vários itens (evento/seminário de avaliação de estágios), basta o comando \doc{} de cada estágio orientador usar o mesmo o mesmo identificador usado para o documento comprobatório (não precisa repetir os \docheader{} no apendices.tex).
