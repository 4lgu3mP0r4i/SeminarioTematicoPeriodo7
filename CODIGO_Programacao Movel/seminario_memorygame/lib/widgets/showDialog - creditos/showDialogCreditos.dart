// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class ShowDialogCreditos extends StatelessWidget {
  const ShowDialogCreditos({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 75),
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                width: double.infinity,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.cancel,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    // COLUNA 1
                    Column(
                      children: [
                        Row(
                          children: const [
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "CRÉDITOS:",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              "IMAGENS:",
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Todas as imagens desta aplicação, com exceção do logo, foram "
                              "produzidas pela I.A. Microsoft Bing Image Creator.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 15),
                            ),
                            const Divider(
                              height: 40,
                              color: Colors.black,
                            ),
                            Text(
                              "MÚSICA:",
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "A música de fundo neste App (que por padrão vem pausada)" +
                                  'chama-se "Raga Of Thousand Suns - Hanu Dixit” e foi retirada' +
                                  'de https://www.youtube.com/c/AudioLibraryEN/playlists,' +
                                  'um canal do YouTube chamado "Audio Library - No Copyright Music"' +
                                  ', um canal conhecido por fornecer músicas livres de direitos autorais.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 15),
                            ),
                            const Divider(
                              height: 40,
                              color: Colors.black,
                            ),
                            const Text(
                              "EQUIPE DE DESENVOLVIMENTO:",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.deepOrange,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Programadores:",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "Marcos André de Jesus Souza\n" +
                                  "Tiago Santos da Silva\n",
                              textAlign: TextAlign.center,
                            ),
                            const Text(
                              "Design Gráfico:",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "Eduardo Silva Nabate\n",
                              textAlign: TextAlign.center,
                            ),
                            const Text(
                              "Gerenciamento de Projeto:",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "Luiz Gustavo Freitas Carvalho\n",
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
