import 'package:flutter/cupertino.dart';
import 'package:tdd_templete/features/domain/repository/repository.dart';

class HomeViewModel extends ChangeNotifier {
  late Repository _repository;

  HomeViewModel(this._repository);

Future<void> getdata()async {
  _repository.getModel();
}
}
