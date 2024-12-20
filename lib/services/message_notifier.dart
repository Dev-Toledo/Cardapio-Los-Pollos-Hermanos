import 'package:flutter/material.dart';

class MessageNotifier extends ChangeNotifier {
  final List<String> _messages = [];

  List<String> get messages => _messages;

  void addMessage(String message) {
    _messages.add(message);
    notifyListeners(); // Notifica os ouvintes para atualizar a UI
  }
}
