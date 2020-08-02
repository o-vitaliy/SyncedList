import 'validator.dart';

class EmptyValidator extends Validator {
  @override
  dynamic valid(String value, dynamic error) {
    return value == null || value.isEmpty ? error : null;
  }
}
