import 'package:flutter/material.dart';
//TODO - 9: Importe o pacote math_expressions.

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatefulWidget {
  @override
  _MeuAppState createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {
  String mensagemVisor = '';

  List<List<Map<String, dynamic>>> linhasBotoes = [
    [
      {'texto': 'C', 'cor': Colors.blue, 'acao': 'limpar'},
      {'texto': 'DEL', 'cor': Colors.blue, 'acao': 'deletar'},
      {'texto': '%', 'cor': Colors.blue, 'acao': 'porcentagem'},
      {'texto': '/', 'cor': Colors.blue, 'acao': 'dividir'},
    ],
    [
      {'texto': '7', 'cor': Colors.white, 'acao': '7'},
      {'texto': '8', 'cor': Colors.white, 'acao': '8'},
      {'texto': '9', 'cor': Colors.white, 'acao': '9'},
      {'texto': '*', 'cor': Colors.blue, 'acao': 'multiplicar'},
    ],
    [
      {'texto': '4', 'cor': Colors.white, 'acao': '4'},
      {'texto': '5', 'cor': Colors.white, 'acao': '5'},
      {'texto': '6', 'cor': Colors.white, 'acao': '6'},
      {'texto': '+', 'cor': Colors.blue, 'acao': 'somar'},
    ],
    [
      {'texto': '1', 'cor': Colors.white, 'acao': '1'},
      {'texto': '2', 'cor': Colors.white, 'acao': '2'},
      {'texto': '3', 'cor': Colors.white, 'acao': '3'},
      {'texto': '-', 'cor': Colors.blue, 'acao': 'subtrair'},
    ],
    [
      {'texto': '0', 'cor': Colors.white, 'acao': '0'},
      {'texto': '.', 'cor': Colors.white, 'acao': '.'},
      {'texto': '=', 'cor': Colors.blue, 'acao': 'calcular'},
    ],
  ];

  //TODO - 3: Para resolver as equações com as operações disponíveis
  //em nossa calculadora utilizaremos um pacote chamado math_expressions.
  //Esse paco consegue pegar uma equação elaborada, como por exemplo (3+2)
  //ou (10+5)/3 e resolvê-la. Nesse sentido, crie um método chamado setarValor
  //que receberá um parâmetro do tipo String para o valor da tecla pressionada.

  //TODO - 5: Dentro do método setValor insira um setState e dentro do setState crie uma estrutura condicional que deve testar se a variável mensagemVisor é igual a 0. Caso seja, a variável mensagemVisor deve apenas receber o primeiro valor repassado, caso contrário, utilize o += para receber e concatenar o valor na String e formar a expressão.

  //TODO - 6: Crie um método chamado resetar para zerar a calculadora caso precise realizar outras contas.

  //TODO - 10: Crie um método chamado realizarCalculo.

  //TODO - 11: Utilizando o arquivo readme e os exemplos disponíveis na página oficial do pacote math_expressions crie uma variável que receba a nossa expressão matemática que atualmente se encontra dentro da variável mensagemVisor.

  //TODO - 12: Ainda utilizando a documentação oficial da math_expressions faça com que a expressão seja executada e que o resultado seja armazenado em uma outra variável.

  //TODO - 13: Utilizando um setState, ainda dentro do método realizarCalculo faça com que o valor da variável mensagemVisor seja atualizado para o resultado obtido através do uso da math_expressions. Você precisará converter esse resultado para String (se não souber como fazer esse tipo de conversão dê um Google xD).

  //TODO - 14: Para a tecla de divisão utilizamos o símbolo "÷", entretanto, esse símbolo não é reconhecido desta forma nas expressões matemáticas. Utilize o método replaceAll (https://api.flutter.dev/flutter/dart-core/String/replaceAll.html) para substituir o símbolo "÷" pelo "/" antes da expressão ser repassada ao math_expressions.

  //TODO - 15: Na versão mais recente do Flutter o RaisedButton foi descontinuado. Como desafio, sugiro que você atualize esse widget para a versão mais recente. Dê uma olhada no link a seguir: https://api.flutter.dev/flutter/material/RaisedButton-class.html.

  //TODO - 16: Execute o app.

  //TODO - 17: Seja feliz!

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Calculadora', style: TextStyle(color: Colors.amber)),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.white,
              margin: EdgeInsets.all(15),
              width: 400,
              height: 120,
              child: Text(mensagemVisor, style: TextStyle(fontSize: 50)),
            ),
            Container(
              //margin: EdgeInsets.all(15),
              child: Expanded(
                child: Column(
                  children: [
                    ...linhasBotoes
                        .map((linha) => construirLinha(linha))
                        .toList(),
                    //TODO - 4: No método onPressed faça uma chamada para o método setValor
                    //e passe o valor da tecla pressionada. Lembre-se que nessa altura seu
                    //código já deve estar otimizado para que os botões sejam construídos
                    //através de uma função.

                    //TODO - 7: Para as teclas: C e DEL, no onPressed ao invés do setValor
                    //chame o método resetar para zerar a calculadora.
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //TODO - 1 : Crie uma função que será responsável por construir os botões da
  //calculadora evitando a redundância que temos atualmente no código-fonte.
  //Se tiver dúvidas quanto à criação dessa função volte e assista a aula
  //#41 - App Marimba - Atualizando a interface do nosso App (https://www.youtube.com/watch?v=HevYf8Pila4).

  //TODO - 2: Lembre-se de repassar as informações necessárias para dentro da
  //função a ser criada no TODO - 1. São algumas das principais informações a
  //serem repassadas: o caracter da tecla, a cor da tecla e o método onPressed.
  Expanded construirBotao({
    required String textoBotao,
    Color corTexto = Colors.white,
    required aoPressionar,
    int flex = 1,
  }) {
    return Expanded(
      flex: flex,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black12,
          foregroundColor: corTexto,
        ),
        onPressed: () {
          aoPressionar();
        },
        child: Text(textoBotao, style: TextStyle(fontSize: 28)),
      ),
    );
  }

  Expanded construirLinha(List<Map<String, dynamic>> dadosLinha) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: dadosLinha.map((botaoData) {
          return construirBotao(
            flex: botaoData['texto'] == '0' ? 2 : 1,
            corTexto: botaoData['cor'] ?? Colors.white,
            textoBotao: botaoData['texto'],
            aoPressionar: () {
              print('Botão pressionado: ${botaoData['texto']}');
            },
          );
        }).toList(),
      ),
    );
  }
}
