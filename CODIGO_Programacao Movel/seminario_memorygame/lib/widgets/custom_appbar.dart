// ignore_for_file: must_be_immutable, library_prefixes
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seminario_memorygame/userData/userdata.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      required this.appbarColor,
      required this.profileIconColor,
      required this.starIconColor,
      required this.textColor})
      : super(key: key);

  final Color appbarColor;
  final Color profileIconColor;
  final Color starIconColor;
  final Color textColor;

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    final usuarioPontuacao = Provider.of<UserData>(context);
    final pontuacao = usuarioPontuacao.pontuacaoUsuario;

    final usuarioNome = Provider.of<UserData>(context);
    final nomeusuario = usuarioNome.nomeUsuario;

    return AppBar(
      leading: Builder(builder: (context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        );
      }),
      backgroundColor: appbarColor,
      elevation: 0,
      shadowColor: Colors.transparent,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color.fromARGB(255, 77, 77, 77),
            ),  
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 30,
                      color: profileIconColor,
                    ),
                    Text(
                      nomeusuario,
                      style: TextStyle(color: textColor),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 25,
                      color: Colors.amber[800],
                    ),
                    const SizedBox(
                      width: 0.25,
                    ),
                    Text(
                      "$pontuacao",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: textColor),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
