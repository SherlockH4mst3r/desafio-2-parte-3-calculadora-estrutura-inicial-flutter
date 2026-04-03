import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatefulWidget {
  @override
  _MeuAppState createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {
  String mensagemVisor = '0';

  List<List<Map<String, dynamic>>> linhasBotoes = [
    [
      {'texto': 'C', 'cor': Colors.blue, 'acao': 'limpar'},
      {'texto': 'DEL', 'cor': Colors.blue, 'acao': 'deletar'},
      {'texto': '%', 'cor': Colors.blue, 'acao': '%'},
      {'texto': '/', 'cor': Colors.blue, 'acao': '/'},
    ],
    [
      {'texto': '7', 'cor': Colors.white, 'acao': '7'},
      {'texto': '8', 'cor': Colors.white, 'acao': '8'},
      {'texto': '9', 'cor': Colors.white, 'acao': '9'},
      {'texto': '*', 'cor': Colors.blue, 'acao': '*'},
    ],
    [
      {'texto': '4', 'cor': Colors.white, 'acao': '4'},
      {'texto': '5', 'cor': Colors.white, 'acao': '5'},
      {'texto': '6', 'cor': Colors.white, 'acao': '6'},
      {'texto': '+', 'cor': Colors.blue, 'acao': '+'},
    ],
    [
      {'texto': '1', 'cor': Colors.white, 'acao': '1'},
      {'texto': '2', 'cor': Colors.white, 'acao': '2'},
      {'texto': '3', 'cor': Colors.white, 'acao': '3'},
      {'texto': '-', 'cor': Colors.blue, 'acao': '-'},
    ],
    [
      {'texto': '0', 'cor': Colors.white, 'acao': '0'},
      {'texto': '.', 'cor': Colors.white, 'acao': '.'},
      {'texto': '=', 'cor': Colors.blue, 'acao': 'calcular'},
    ],
  ];

  setarValor(String valor) {
    setState(() {
      if (mensagemVisor == '0') {
        mensagemVisor = valor;
      } else {
        mensagemVisor += valor;
      }
    });
  }

  resetar() {
    setState(() {
      mensagemVisor = '0';
    });
  }

  realizarCalculo() {
    ExpressionParser expression = GrammarParser();
    Expression exp = expression.parse(mensagemVisor);
    num resultado = RealEvaluator().evaluate(exp);

    setState(() {
      mensagemVisor = resultado.toString();
    });
  }

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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
              switch (botaoData['acao']) {
                case 'limpar':
                case 'deletar':
                  resetar();
                  break;
                case 'calcular':
                  realizarCalculo();
                  break;
                default:
                  setarValor(botaoData['acao']);
              }
            },
          );
        }).toList(),
      ),
    );
  }
}
