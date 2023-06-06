import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:seminario_memorygame/audio%20controll/provider_audio.dart';
import 'package:provider/provider.dart';

import '../../userData/userdata.dart';

class ShowDialogSettings extends StatefulWidget {
  const ShowDialogSettings({super.key});
  @override
  _ShowDialogSettingsState createState() => _ShowDialogSettingsState();
}

class _ShowDialogSettingsState extends State<ShowDialogSettings> {
  @override
  Widget build(BuildContext context) {
    final usuarioNome = Provider.of<UserData>(context);
    String nomeUsuario = usuarioNome.nomeUsuario;

    final audioConfig = Provider.of<ProviderAudioData>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 100),
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
                    //////////////////////////////////////
                    ///////COLUNA1
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "NOME: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              nomeUsuario,
                              style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: const [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "EDITAR",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.green),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.edit,
                              color: Colors.green,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)))),
                                initialValue: nomeUsuario,
                                style: const TextStyle(fontSize: 25),
                                onChanged: (value) {
                                  nomeUsuario = value;
                                },
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.save,
                                color: Colors.blue,
                              ),
                              onPressed: () {
                                usuarioNome.atualizarNomeUsuario(nomeUsuario);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      height: 60,
                      color: Colors.black,
                    ),
                    ////////////////////////////////////
                    ////COLUNA2
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "MÚSICA:",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 90, right: 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      if (audioConfig.estaReproduzindo) {
                                        audioConfig.pausar();
                                      } else {
                                        audioConfig.reproduzir();
                                      }
                                    },
                                    child: Icon(
                                      audioConfig.estaReproduzindo
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      size: 70,
                                      color: audioConfig.estaReproduzindo
                                          ? Colors.red
                                          : Colors.green,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              audioConfig.estaReproduzindo ? "PAUSE" : "PLAY",
                              style: TextStyle(
                                  color: audioConfig.estaReproduzindo
                                      ? Colors.red
                                      : Colors.green),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
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
