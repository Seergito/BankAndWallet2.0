import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewContactModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for contactName widget.
  TextEditingController? contactNameController;
  String? Function(BuildContext, String?)? contactNameControllerValidator;
  String? _contactNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qpsnbpcr' /* Campo obligatorio */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'xdaayoiu' /* Introduce un nombre correcto */,
      );
    }
    if (val.length > 15) {
      return FFLocalizations.of(context).getText(
        'f57642c7' /* Introduce un nombre correcto */,
      );
    }
    if (!RegExp('^[a-zA-Z\\s]+\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'g48uh5qc' /* Introduce un nombre correcto */,
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
        'aafhihtz' /* Campo obligatorio */,
      );
    }

    if (val.length < 5) {
      return FFLocalizations.of(context).getText(
        'lolh0u3x' /* Introduce un correo válido */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        's0ek8g1m' /* Introduce un correo correcto */,
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
        'erbuzo6e' /* Campo obligatorio */,
      );
    }

    if (val.length < 9) {
      return FFLocalizations.of(context).getText(
        'o6l9g39q' /* Introduce un telefono correcto */,
      );
    }
    if (val.length > 9) {
      return FFLocalizations.of(context).getText(
        '1rbidmpo' /* Introduce un telefono correcto */,
      );
    }
    if (!RegExp('^[0-9]+\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    contactNameControllerValidator = _contactNameControllerValidator;
    emailAddressControllerValidator = _emailAddressControllerValidator;
    telefonoControllerValidator = _telefonoControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    contactNameController?.dispose();
    emailAddressController?.dispose();
    telefonoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
