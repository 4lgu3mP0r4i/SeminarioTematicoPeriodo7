// ignore_for_file: library_prefixes, avoid_unnecessary_containers
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:seminario_memorygame/widgets/showDialog - creditos/showDialogCreditos.dart';
import 'package:seminario_memorygame/models/jogo/escapeGame1.dart';
import 'package:seminario_memorygame/widgets/showDialog%20-%20configs/showDialogSettings.dart';
import 'package:seminario_memorygame/widgets/showDialog%20-%20sair/showDialogExit.dart';
import '../userData/userdata.dart';

class StartGameScreen extends StatefulWidget {
  const StartGameScreen({super.key});

  @override
  State<StartGameScreen> createState() => _StartGameScreenState();
}

class _StartGameScreenState extends State<StartGameScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final usuarioPontuacao = Provider.of<UserData>(context);
    final pontuacao = usuarioPontuacao.pontuacaoUsuario;

    final usuarioNome = Provider.of<UserData>(context);
    final nomeUsuario = usuarioNome.nomeUsuario;

    Color buttonColor = Colors.deepOrangeAccent;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/gameStartScreen.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.deepOrangeAccent,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            nomeUsuario,
                            style: const TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 141, 126, 126)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "SCORE:",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const Icon(
                            Icons.star,
                            size: 30,
                            color: Colors.amber,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "$pontuacao",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //espaço no centro da tela que comporta os botões.
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: const Color.fromARGB(92, 119, 25, 1),
                      border: Border.all(
                        width: 5,
                        style: BorderStyle.solid,
                        color: const Color.fromARGB(158, 158, 158, 158),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Divider(
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          //botão 1
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(200),
                            ),
                            backgroundColor: buttonColor,
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EscapeGame1(),
                              ),
                            );
                          },
                          child: const Text(
                            "Jogar",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          //botão 2
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(200),
                            ),
                            backgroundColor: buttonColor,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => const ShowDialogSettings(),
                            );
                          },
                          child: const Text(
                            "Configurações",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          //botão 3
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(200),
                            ),
                            backgroundColor: buttonColor,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => const ShowDialogCreditos(),
                            );
                          },
                          child: const Text(
                            "Créditos",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          //botão 4
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(200),
                            ),
                            backgroundColor: buttonColor,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => const ShowDialogExit(),
                            );
                          },
                          child: const Text(
                            "Sair do App",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const Divider(color: Colors.black54),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Divider(color: Colors.black54),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
