import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  String nomeUsuario;
  int pontuacaoUsuario;

  UserData(this.nomeUsuario, this.pontuacaoUsuario);

  void atualizarNomeUsuario(String novoNomeUsuario) {
    nomeUsuario = novoNomeUsuario;
    notifyListeners();
  }

  void atualizarPontuacaoUsuario(int pontos) {
    pontuacaoUsuario += pontos;
    notifyListeners();
  }

  void novaPontuacao(int newPointsValue) {
    pontuacaoUsuario = newPointsValue;
    notifyListeners();
  }
}
