// ignore_for_file: library_prefixes
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seminario_memorygame/widgets/all_screen_color.dart'
    as onlyColorScreen;
import 'package:seminario_memorygame/userData/userdata.dart';
import 'package:seminario_memorygame/models/start_game_screen.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);
  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  //
  final formKey = GlobalKey<FormState>();
  final nome = TextEditingController();
  //
  final Color appbarColor = onlyColorScreen.blackBackground;
  //

  void validarNome() {
    if (formKey.currentState!.validate()) {
      String nomeUsuario = nome.value.text;
      Provider.of<UserData>(context, listen: false)
          .atualizarNomeUsuario(nomeUsuario);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StartGameScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: appbarColor,
          shadowColor: Colors.transparent,
        ),
        body: Container(
            height: 1200,
            decoration: BoxDecoration(color: appbarColor),
            child: Stack(children: <Widget>[
              Center(
                child: ListView(
                  children: const <Widget>[
                    SizedBox(
                      height: 150,
                    ),
                    Image(
                      image: AssetImage("assets/images/gamelogo.png"),
                    ),
                    Center(
                      child: Text(
                        "Seja bem vindo(a)!",
                        style: TextStyle(
                            color: Color.fromARGB(255, 61, 61, 61),
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 240,
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                            ),
                            child: TextFormField(
                              initialValue: null,
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                              controller: nome,
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(),
                                label: Center(
                                  child: Text(
                                    "NOME DE USUÁRIO:",
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                ),
                              ),
                              validator: (userName) {
                                if (userName!.isEmpty) {
                                  return ("PREENCHA ESTE CAMPO!");
                                }
                              },
                              onSaved: (newValue) => {
                                context
                                    .read<UserData>()
                                    .atualizarNomeUsuario(newValue!)
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: validarNome,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrangeAccent,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'JOGAR',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ))
            ])));
  }
}



// JOGO DA MEMÓRIA DE SUSPENSE?

  // mesclar um jogo considerado arcaico com uma história envolvente e torná-lo 
  // tenso, causando "tensão" ao jogador com um timer que regride o tempo à medi
  // da em que vai progredindo de fase.