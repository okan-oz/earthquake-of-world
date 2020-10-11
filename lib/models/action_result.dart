import 'models.dart';

class ActionResult<T> {
  bool isSucces;
  ExceptionModel exception;
  T resultData;
}
