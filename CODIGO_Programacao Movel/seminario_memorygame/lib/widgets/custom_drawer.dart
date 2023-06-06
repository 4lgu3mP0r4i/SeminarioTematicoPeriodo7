import 'dart:io';
import 'package:flutter/material.dart';
import 'package:seminario_memorygame/models/start_game_screen.dart';
import 'package:seminario_memorygame/widgets/showDialog%20-%20configs/showDialogSettings.dart';
import 'package:seminario_memorygame/widgets/showDialog%20-%20sair/showDialogHome.dart';
import 'showDialog - sair/showDialogExit.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.specialWidget,
  });

  final Widget specialWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: Colors.deepOrangeAccent,
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                color: Colors.deepOrange,
                child: ListTile(
                  splashColor: Colors.black,
                  title: Row(
                    children: const <Widget>[
                      Icon(Icons.settings, color: Colors.white),
                      SizedBox(width: 5),
                      Text("Configurações",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const ShowDialogSettings();
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.deepOrange,
                child: ListTile(
                  splashColor: Colors.black,
                  title: Row(
                    children: const <Widget>[
                      Icon(Icons.home, color: Colors.white),
                      SizedBox(width: 5),
                      Text("Voltar para a tela \ninicial",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const ShowDialogHome(),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Container(
              color: Colors.deepOrange[700],
              child: ListTile(
                title: Row(
                  children: const <Widget>[
                    Icon(Icons.exit_to_app, color: Colors.white),
                    SizedBox(width: 5),
                    Text("Sair do app", style: TextStyle(color: Colors.white)),
                  ],
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ShowDialogExit(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
