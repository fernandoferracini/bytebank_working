# Bytebank

"Inicialmente, reaproveitamos o projeto criado na primeira implementação, que focava na integração entre o aplicativo e o banco de dados e cuja única funcionalidade era uma lista de contatos. Partimos então para a adição de novas features/funcionalidades, que são:

"Transfer", antes a lista de contatos, mas que agora permite a abertura de um formulário no qual é possível fazer transferências para os contatos
"Transaction Feed", no qual são listadas as transferências a partir das informações armazenadas na Web API
As novas funcionalidades alteraram o fluxo do nosso aplicativo. Agora podemos clicar em "Transfer", selecionar um dos contatos, inserir um valor no formulário e clicar no botão "Transfer" para enviar os dados para a Web API. Ao acessarmos "Transaction Feed", esses dados são buscados e exibidos na tela.

Para tornarmos isso possível, começamos reutilizando o comportamento de feature dentro de um novo widget. Isso nos chamou a atenção a algumas peculiaridades, mais precisamente à maneira de reutilizarmos o código desse widget, permitindo a execução de diferentes comportamentos na presença de um clique, algo que conseguimos implementar com a técnica do callback.

Com isso, o usuário agora pode acessar diferentes funcionalidades a partir da Dashboard, além de abrir formulários com dados específicos de acordo com o contato que é clicado na lista.

No momento de fazermos a comunicação com a Web API, tivemos o auxílio do pacote http do Dart, que foi adicionado ao projeto e implementado a partir do nosso webclient.dart. Antes dessa implementação, entendemos como é possível subir a Web API, testamos as requisições com o navegador e o Postman e então construímos o nosso código.

Inicialmente o webclient.dart não nos trazia nenhum feedback a respeito das chamadas, algo que corrigimos utilizando um interceptador do HTTP (http_interceptor, outro pacote do Dart). Nesse caso, o LoggingInterceptor foi o responsável por nos mostrar em detalhes o que acontecia nessa comunicação, permitindo uma espécie de debugging e facilitando identificarmos se as informações da requisição e da resposta fazem sentido em relação ao esperado.

Depois de termos um código funcional, da maneira mais simples e objetiva possível, passamos a tomar alguns cuidados extras de modo a facilitar as nossas soluções, mais especificamente na conversão de objeto para JSON e vice-versa. Existem diversas maneiras de fazer isso, e a própria documentação do Flutter tem uma página exclusiva detalhando essas possibilidades.

No nosso projeto, optamos por fazer a conversão direta dentro do próprio modelo utilizando os conversores fromJson(), toJson() e assim por diante. Prosseguindo, conseguimos simplificar ainda mais o nosso código, eliminando a necessidade de funções que haviam sido extraídas anteriormente com a utilização do map(), um recurso bastante interessante quando queremos fazer transformações de listas.

Em relação ao HTTP, vimos que é possível configurar a requisição de modo a atender as nossas necessidades, seja com o GET para buscar informações, seja com o POST para enviarmos dados (headers, body, e assim por diante).

Trabalhando nesse cenário, identificamos alguns problemas comuns na comunicação externa, como manter o endereço errado, uma Web API indisponível, entre outras situações que requerem a nossa atenção.

No caso da lista de transferências, utilizamos o FutureBuilder para tornarmos as informações mais atraentes ao usuário. Por exemplo, incluímos um timeout que entra em ação quando o endereço errado é acessado, encerrando a busca e indicando ao usuário que não existe nenhum dado a ser exibido.

Tivemos esse cuidado para apresentarmos algo que faça mais sentido ao usuário, ao invés de uma tela em branco que não traz nenhuma informação ou um loading infinito."

[Github do professor](https://github.com/alura-cursos/flutter-webapi)