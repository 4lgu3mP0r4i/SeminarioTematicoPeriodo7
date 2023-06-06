import 'dart:async';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:seminario_memorygame/models/jogo/escapeGame6.dart';
import 'package:seminario_memorygame/models/start_game_screen.dart';
import 'package:seminario_memorygame/userData/userdata.dart';
import 'package:seminario_memorygame/widgets/custom_appbar.dart';
import 'package:seminario_memorygame/widgets/custom_drawer.dart';
import 'package:seminario_memorygame/widgets/all_screen_color.dart'
    as onlyColorScreen;
import 'package:flutter/material.dart';
import 'package:seminario_memorygame/widgets/showDialog%20-%20win%20or%20lose%20game/winOrLose.dart';

import '../../audio controll/provider_audio.dart';
import '../../widgets/showDialog - sair/showDialogExit.dart';

class EscapeGame5 extends StatefulWidget {
  const EscapeGame5({Key? key}) : super(key: key);
  @override
  _EscapeGame5State createState() => _EscapeGame5State();
}

class _EscapeGame5State extends State<EscapeGame5> {
  bool canContinue = false;
  bool cardsLocked = false;
  bool gameCompleted = false;
  int totalTime = 10;
  int currentTime = 0;
  Timer? timer;

  List<String> cards = [
    "assets/images/fase5/1.jpeg",
    "assets/images/fase5/2.jpeg",
    "assets/images/fase5/3.jpeg",
    "assets/images/fase5/1.jpeg",
    "assets/images/fase5/2.jpeg",
    "assets/images/fase5/3.jpeg"
  ];

  List<bool> cardFlips = [];
  int previousIndex = -1;
  bool isFlipping = false;
  int pairsFound = 0;
  int points = 0;

  @override
  void initState() {
    super.initState();
    resetGame();
  }

  void resetGame() {
    setState(() {
      currentTime = 0;
      cardsLocked = false;
      if (timer != null && timer!.isActive) {
        timer!.cancel();
        timer = null;
      }
      cards.shuffle(Random());
      cardFlips = List<bool>.filled(cards.length, false);
      previousIndex = -1;
      pairsFound = 0;
      points = 0;
    });
    iniciarTemporizador();
  }

  void iniciarTemporizador() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        currentTime++;
        if (currentTime >= totalTime) {
          timer.cancel();
          pararTemporizador();
          showDialog(
            context: context,
            builder: (context) => const WinOrLose(
              foundColor: Colors.red,
              textMessage: Text(
                "Tempo esgotado!\n Você perdeu!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          );
        }
      });
    });
  }

  void pararTemporizador() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
      timer = null;
    }
  }

  void flipCard(int index) {
    if (isFlipping ||
        cardFlips[index] ||
        gameCompleted ||
        currentTime >= totalTime) {
      return;
    }
    setState(() {
      cardFlips[index] = true;
      if (previousIndex >= 0) {
        isFlipping = true;
        if (cards[previousIndex] == cards[index]) {
          Future.delayed(const Duration(milliseconds: 100), () {
            cardFlips[previousIndex] = true;
            cardFlips[index] = true;
            isFlipping = false;
            previousIndex = -1;
            pairsFound++;
            points++;
            if (pairsFound == cards.length ~/ 2) {
              canContinue = true;
              gameCompleted = true;
              pararTemporizador();
              final usuarioPontuacao =
                  Provider.of<UserData>(context, listen: false);
              usuarioPontuacao.atualizarPontuacaoUsuario(100);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const WinOrLose(
                    foundColor: Colors.green,
                    textMessage: Text(
                      "Parabéns!\nVocê escapou\n... por enquanto!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  );
                },
              );
            }
          });
        } else {
          Future.delayed(const Duration(milliseconds: 1000), () {
            cardFlips[previousIndex] = false;
            cardFlips[index] = false;
            isFlipping = false;
            previousIndex = -1;
          });
        }
      } else {
        previousIndex = index;
        isFlipping = false;
      }
    });
  }

  Future<bool> checkGameCompletion() async {
    await Future.delayed(const Duration(seconds: 1));
    return gameCompleted;
  }

  @override
  Widget build(BuildContext context) {
    final changePoints = Provider.of<UserData>(context, listen: false);
    final audioConfig = Provider.of<ProviderAudioData>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        appbarColor: Colors.transparent,
        profileIconColor: Colors.black,
        starIconColor: Colors.black,
        textColor: Colors.black,
      ),
      drawer: CustomDrawer(
        specialWidget: Container(
          color: Colors.deepOrange,
          child: ListTile(
            splashColor: Colors.black,
            title: Row(
              children: const <Widget>[
                Icon(Icons.home, color: Colors.white),
                SizedBox(width: 5),
                Text(
                  "Voltar para a\n página inicial",
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            onTap: () {
              changePoints.novaPontuacao(0);
              pararTemporizador();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const StartGameScreen(),
                ),
              );
            },
          ),
        ),
      ),
      body: Container(
        color: onlyColorScreen.bronzeBackground,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (pairsFound == cards.length ~/ 2 ||
                          currentTime < totalTime) {
                        resetGame();
                      } else {
                        resetGame();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(200),
                      ),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.replay_outlined),
                        SizedBox(
                          width: 1,
                        ),
                        Text(
                          'REINICIAR',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  FutureBuilder(
                    future: checkGameCompletion(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox(
                          width: 0,
                        );
                      } else if (snapshot.hasData && snapshot.data == true) {
                        return ElevatedButton(
                          onPressed: () {
                            if (pairsFound == cards.length ~/ 2) {
                              gameCompleted = true;
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return const EscapeGame6();
                                },
                              ));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[700],
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(200),
                            ),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.skip_next_sharp),
                              SizedBox(
                                width: 1,
                              ),
                              Text(
                                'PRÓXIMO',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return const SizedBox(
                          width: 0,
                        );
                      }
                    },
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 4,
                  ),
                  itemCount: cards.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        if (!cardFlips[index]) {
                          flipCard(index);
                        }
                      },
                      child: Card(
                        elevation: 5,
                        child: Image.asset(
                          cardFlips[index]
                              ? cards[index]
                              : 'assets/images/card5.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 40),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    width: 240,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: (240 / totalTime) * currentTime,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
