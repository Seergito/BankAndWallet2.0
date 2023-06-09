import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCardModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for cardNumber widget.
  TextEditingController? cardNumberController;
  String? Function(BuildContext, String?)? cardNumberControllerValidator;
  String? _cardNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3qgyphfx' /* Campo obligatorio */,
      );
    }

    if (val.length < 20) {
      return FFLocalizations.of(context).getText(
        'n845104b' /* Introduce una tarjeta correcta */,
      );
    }
    if (val.length > 20) {
      return FFLocalizations.of(context).getText(
        's0tnay79' /* Introduce una tarjeta correcta */,
      );
    }
    if (!RegExp('^[0-9]+\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'skte62y3' /* Introduce solamente dígitos */,
      );
    }
    return null;
  }

  // State field(s) for nombreTitular widget.
  TextEditingController? nombreTitularController;
  String? Function(BuildContext, String?)? nombreTitularControllerValidator;
  String? _nombreTitularControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9djq7g7c' /* Campo obligatorio */,
      );
    }

    if (val.length < 5) {
      return FFLocalizations.of(context).getText(
        'smpb631z' /* Introduce tu nombre completo */,
      );
    }

    if (!RegExp('^[a-zA-Z\\s]+\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'p043w4v7' /* Introduce un nombre válido */,
      );
    }
    return null;
  }

  // State field(s) for MM widget.
  TextEditingController? mmController1;
  String? Function(BuildContext, String?)? mmController1Validator;
  String? _mmController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'liut224u' /* Campo obligatorio */,
      );
    }

    if (val.length < 1) {
      return FFLocalizations.of(context).getText(
        'r5n8ehe9' /* Introduce una fecha válida */,
      );
    }
    if (val.length > 2) {
      return FFLocalizations.of(context).getText(
        'vui98p1s' /* Introduce una fecha válida */,
      );
    }
    if (!RegExp('^[0-9]+\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'pxgykduv' /* Indica una fecha válida */,
      );
    }
    return null;
  }

  // State field(s) for AA widget.
  TextEditingController? aaController;
  String? Function(BuildContext, String?)? aaControllerValidator;
  String? _aaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'effvheks' /* Campo obligatorio */,
      );
    }

    if (val.length < 1) {
      return FFLocalizations.of(context).getText(
        'mbx6q6vu' /* Introduce una fecha válida */,
      );
    }
    if (val.length > 2) {
      return FFLocalizations.of(context).getText(
        'cfsqvkjn' /* Introduce una fecha válida */,
      );
    }
    if (!RegExp('^[0-9]+\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '5hk3s22r' /* Introduce una fecha válida */,
      );
    }
    return null;
  }

  // State field(s) for MM widget.
  TextEditingController? mmController2;
  String? Function(BuildContext, String?)? mmController2Validator;
  String? _mmController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fbzkeikv' /* Campo obligatorio */,
      );
    }

    if (val.length < 3) {
      return FFLocalizations.of(context).getText(
        'us5j3y4j' /* Introduce un CVC válido */,
      );
    }
    if (val.length > 3) {
      return FFLocalizations.of(context).getText(
        '5oopddlq' /* Introduce un CVC válido */,
      );
    }
    if (!RegExp('^[0-9]+\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'eprq9e4s' /* Introduce un CVC válido */,
      );
    }
    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (createWallet)] action in Button widget.
  ApiCallResponse? creacionWalletAuthUser;
  // Stores action output result for [Backend Call - API (SignUp)] action in Button widget.
  ApiCallResponse? apiRegistro;
  // Stores action output result for [Backend Call - API (createWallet)] action in Button widget.
  ApiCallResponse? creacionWallet;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cardNumberControllerValidator = _cardNumberControllerValidator;
    nombreTitularControllerValidator = _nombreTitularControllerValidator;
    mmController1Validator = _mmController1Validator;
    aaControllerValidator = _aaControllerValidator;
    mmController2Validator = _mmController2Validator;
  }

  void dispose() {
    unfocusNode.dispose();
    cardNumberController?.dispose();
    nombreTitularController?.dispose();
    mmController1?.dispose();
    aaController?.dispose();
    mmController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
