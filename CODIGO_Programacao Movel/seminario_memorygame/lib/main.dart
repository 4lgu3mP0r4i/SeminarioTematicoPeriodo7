import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seminario_memorygame/audio%20controll/provider_audio.dart';
import 'package:seminario_memorygame/models/tela_inicial.dart';
import 'userData/userdata.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserData("", 0),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderAudioData(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.black),
        home: const TelaInicial(),
      ),
    ));
