import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:juego/Models/Message.dart';

class ItemsMessages with ChangeNotifier{
  List<MessageItem> items = new List<MessageItem>();
  Socket socket ;

  List<MessageItem> get getItems {
    return items;
  }

  Socket get getSocket{
    return socket;
  }

  void setSocket(Socket socketa){
    socket = socketa;
  }

  void addMessage(MessageItem message) {
    items.insert(0,message);
    notifyListeners();
  }

  void reset_Items() {
    items.clear();
    notifyListeners();
  }
}