import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for userName widget.
  TextEditingController? userNameController;
  String? Function(BuildContext, String?)? userNameControllerValidator;
  String? _userNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'khqmd7zh' /* Campo obligatorio */,
      );
    }

    if (val.length < 3) {
      return FFLocalizations.of(context).getText(
        '7oqbnveb' /* Nombre muy corto */,
      );
    }
    if (val.length > 15) {
      return FFLocalizations.of(context).getText(
        'oa6hxo3c' /* Nombre muy largo */,
      );
    }
    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'shux1upi' /* Nombre incorrecto */,
      );
    }
    return null;
  }

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  String? _emailAddressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jeu29411' /* Campo obligatorio */,
      );
    }

    if (val.length < 5) {
      return FFLocalizations.of(context).getText(
        '376o85zw' /* Correo electronico demasiado c... */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'm714v1c7' /* Introduce un email correcto */,
      );
    }
    return null;
  }

  // State field(s) for password-Create widget.
  TextEditingController? passwordCreateController;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)? passwordCreateControllerValidator;
  String? _passwordCreateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6y8k7r6j' /* Campo obligatorio */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'xm9gyh5n' /* Contraseña demasiado corta */,
      );
    }

    return null;
  }

  // State field(s) for passwordConfirm widget.
  TextEditingController? passwordConfirmController;
  late bool passwordConfirmVisibility;
  String? Function(BuildContext, String?)? passwordConfirmControllerValidator;
  String? _passwordConfirmControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'l9wvtdjf' /* Campo obligatorio */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        '79eqvu15' /* Contraseña demasiado corta */,
      );
    }

    return null;
  }

  // State field(s) for telefono widget.
  TextEditingController? telefonoController;
  String? Function(BuildContext, String?)? telefonoControllerValidator;
  String? _telefonoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5an31etg' /* Campo obligatorio */,
      );
    }

    if (val.length < 9) {
      return FFLocalizations.of(context).getText(
        '4ngywfka' /* Introduce un numero correcto */,
      );
    }
    if (val.length > 9) {
      return FFLocalizations.of(context).getText(
        'gugmq4yl' /* Introduce un numero correcto */,
      );
    }
    if (!RegExp('^[0-9]+\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'u6b0mrdl' /* Introduce solo digitos */,
      );
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    userNameControllerValidator = _userNameControllerValidator;
    emailAddressControllerValidator = _emailAddressControllerValidator;
    passwordCreateVisibility = false;
    passwordCreateControllerValidator = _passwordCreateControllerValidator;
    passwordConfirmVisibility = false;
    passwordConfirmControllerValidator = _passwordConfirmControllerValidator;
    telefonoControllerValidator = _telefonoControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    userNameController?.dispose();
    emailAddressController?.dispose();
    passwordCreateController?.dispose();
    passwordConfirmController?.dispose();
    telefonoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
