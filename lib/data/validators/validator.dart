import 'package:flutter/cupertino.dart';

import '../../localizations.dart';
import 'empty_validator.dart';

abstract class Validator {
  dynamic valid(String value, error);
}

String requiredValidation(BuildContext context, String value) {
  final error = EmptyValidator().valid(value, "requiredField");
  if (error != null) {
    return L.of(context).get(error);
  }
  return null;
}
