import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bulbProvider = ChangeNotifierProvider<BulbState>(
  (ref) => BulbState(),
);

class BulbState extends ChangeNotifier {
  bool _isOn;
  BulbState([this._isOn = false]);

  bool get isOn => _isOn;

  void bulbSwitch() {
    _isOn = !_isOn;
    notifyListeners();
  }
}
