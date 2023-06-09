import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en', 'de', 'pt', 'zh_Hans'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
    String? deText = '',
    String? ptText = '',
    String? zh_HansText = '',
  }) =>
      [esText, enText, deText, ptText, zh_HansText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login_page
  {
    'uf8fg8x3': {
      'es': 'Bienvenido',
      'de': 'Willkommen',
      'en': 'Welcome',
      'pt': '',
      'zh_Hans': '',
    },
    '6xsz8vcb': {
      'es': 'Ingresa tus datos para acceder',
      'de': 'Geben Sie Ihre Daten ein, um sich anzumelden.',
      'en': 'Introduce your data to login',
      'pt': '',
      'zh_Hans': '',
    },
    'di7unbj6': {
      'es': 'Correo electrónico',
      'de': 'Email',
      'en': 'Email',
      'pt': '',
      'zh_Hans': '',
    },
    '9483gwo9': {
      'es': 'Introduce email...',
      'de': '\nGeben Sie Ihre E-Mail-Adresse ein...',
      'en': 'Insert email...',
      'pt': '',
      'zh_Hans': '',
    },
    '1o8hhzvh': {
      'es': 'Contraseña',
      'de': '\nPasswort',
      'en': 'Password',
      'pt': '',
      'zh_Hans': '',
    },
    '8f1rro9z': {
      'es': 'Introduce contraseña...',
      'de': '\nGeben Sie Ihr Passwort ein...',
      'en': 'Insert password...',
      'pt': '',
      'zh_Hans': '',
    },
    'kwacugkd': {
      'es': '¿Olvidó su contraseña?',
      'de': 'Haben Sie Ihr Passwort vergessen?',
      'en': 'Forgot your password?',
      'pt': '',
      'zh_Hans': '',
    },
    'dsqy5zbc': {
      'es': 'Login',
      'de': 'Anmelden',
      'en': 'Login',
      'pt': '',
      'zh_Hans': '',
    },
    'txaynd6o': {
      'es': '¿No tiene una cuenta?',
      'de': '\nHaben Sie noch kein Konto?',
      'en': 'Don\'t u have an account?',
      'pt': '',
      'zh_Hans': '',
    },
    'avn8dqzi': {
      'es': 'Registro',
      'de': '\nRegistrieren',
      'en': 'Sign in',
      'pt': '',
      'zh_Hans': '',
    },
    '90it426g': {
      'es': 'Google Login',
      'de': '\nMit Google anmelden',
      'en': 'Sign in with Google',
      'pt': '',
      'zh_Hans': '',
    },
    'fnx9sgx8': {
      'es': 'Home',
      'de': 'Home',
      'en': 'Home',
      'pt': '',
      'zh_Hans': '',
    },
  },
  // register_page
  {
    'qvxud6cm': {
      'es': 'Regístrese',
      'de': '',
      'en': 'Sign in',
      'pt': '',
      'zh_Hans': '',
    },
    '19yv9glm': {
      'es': 'Introduzca sus datos y registrese',
      'de': '',
      'en': 'Insert yout data and register',
      'pt': '',
      'zh_Hans': '',
    },
    'dwz6ja4f': {
      'es': 'Nombre de usuario',
      'de': '',
      'en': 'User name',
      'pt': '',
      'zh_Hans': '',
    },
    'azxmtilk': {
      'es': 'Introduzca su nombre',
      'de': '',
      'en': 'Insert name',
      'pt': '',
      'zh_Hans': '',
    },
    'ueo0yicj': {
      'es': 'Correo electrónico',
      'de': '',
      'en': 'Email',
      'pt': '',
      'zh_Hans': '',
    },
    'f6fd9bq0': {
      'es': 'Introduzca su correo electrónico...',
      'de': '',
      'en': 'Insert email',
      'pt': '',
      'zh_Hans': '',
    },
    '349l7u1a': {
      'es': 'Contraseña',
      'de': '',
      'en': 'Password',
      'pt': '',
      'zh_Hans': '',
    },
    'b5thmniu': {
      'es': 'Introduzca su contraseña...',
      'de': '',
      'en': 'Insert password',
      'pt': '',
      'zh_Hans': '',
    },
    '4wf253em': {
      'es': 'Confirmar contraseña',
      'de': '',
      'en': 'Confirm password',
      'pt': '',
      'zh_Hans': '',
    },
    '18uq9047': {
      'es': 'Confirme su contraseña....',
      'de': '',
      'en': 'Confirm password...',
      'pt': '',
      'zh_Hans': '',
    },
    'ktdlat3r': {
      'es': 'Número teléfono',
      'de': '',
      'en': 'Phone number',
      'pt': '',
      'zh_Hans': '',
    },
    'ztdiejty': {
      'es': 'Tu numero de teléfono...',
      'de': '',
      'en': 'Your phone number...',
      'pt': '',
      'zh_Hans': '',
    },
    'x29k51dc': {
      'es': 'Crear cuenta',
      'de': '',
      'en': 'Create account',
      'pt': '',
      'zh_Hans': '',
    },
    '6hrq4dn5': {
      'es': 'Acceder',
      'de': '',
      'en': 'Login',
      'pt': '',
      'zh_Hans': '',
    },
    'tmlpbhmx': {
      'es': 'Ya tiene una cuentra?',
      'de': '',
      'en': 'Do you have an account?',
      'pt': '',
      'zh_Hans': '',
    },
    'khqmd7zh': {
      'es': 'Campo obligatorio',
      'de': '',
      'en': 'Compulsory camp',
      'pt': '',
      'zh_Hans': '',
    },
    '7oqbnveb': {
      'es': 'Nombre muy corto',
      'de': '',
      'en': 'Name too short',
      'pt': '',
      'zh_Hans': '',
    },
    'oa6hxo3c': {
      'es': 'Nombre muy largo',
      'de': '',
      'en': 'Name too long',
      'pt': '',
      'zh_Hans': '',
    },
    'shux1upi': {
      'es': 'Nombre incorrecto',
      'de': '',
      'en': 'Incorrect name',
      'pt': '',
      'zh_Hans': '',
    },
    '3zzpyidw': {
      'es': 'Porfavor, elige una opción del menú',
      'de': '',
      'en': 'Please choose an option from the dropdown',
      'pt': '',
      'zh_Hans': '',
    },
    'jeu29411': {
      'es': 'Campo obligatorio',
      'de': '',
      'en': 'Compulsory camp',
      'pt': '',
      'zh_Hans': '',
    },
    '376o85zw': {
      'es': 'Correo electronico demasiado corto',
      'de': '',
      'en': 'Email too short',
      'pt': '',
      'zh_Hans': '',
    },
    'm714v1c7': {
      'es': 'Introduce un email correcto',
      'de': '',
      'en': 'Insert an correct email',
      'pt': '',
      'zh_Hans': '',
    },
    '2tw5s80w': {
      'es': 'Porfavor, elige una opción del dropdown',
      'de': '',
      'en': 'Please choose an option from the dropdown',
      'pt': '',
      'zh_Hans': '',
    },
    '6y8k7r6j': {
      'es': 'Campo obligatorio',
      'de': '',
      'en': 'Compulsory camp',
      'pt': '',
      'zh_Hans': '',
    },
    'xm9gyh5n': {
      'es': 'Contraseña demasiado corta',
      'de': '',
      'en': 'Password too short',
      'pt': '',
      'zh_Hans': '',
    },
    'wtd7i070': {
      'es': 'Porfavor, elige una opción del dropdown',
      'de': '',
      'en': 'Please choose an option from the dropdown',
      'pt': '',
      'zh_Hans': '',
    },
    'l9wvtdjf': {
      'es': 'Campo obligatorio',
      'de': '',
      'en': 'Compulsory camp',
      'pt': '',
      'zh_Hans': '',
    },
    '79eqvu15': {
      'es': 'Contraseña demasiado corta',
      'de': '',
      'en': 'Passsword too short',
      'pt': '',
      'zh_Hans': '',
    },
    '3hh6tyf9': {
      'es': 'Porfavor, elige una opción del dropdown',
      'de': '',
      'en': 'Please choose an option from the dropdown',
      'pt': '',
      'zh_Hans': '',
    },
    '5an31etg': {
      'es': 'Campo obligatorio',
      'de': '',
      'en': 'Compulsory camp',
      'pt': '',
      'zh_Hans': '',
    },
    '4ngywfka': {
      'es': 'Introduce un numero correcto',
      'de': '',
      'en': 'Insert a correct number',
      'pt': '',
      'zh_Hans': '',
    },
    'gugmq4yl': {
      'es': 'Introduce un numero correcto',
      'de': '',
      'en': 'Insert a correct number',
      'pt': '',
      'zh_Hans': '',
    },
    'u6b0mrdl': {
      'es': 'Introduce solo digitos',
      'de': '',
      'en': 'Insert  only digits',
      'pt': '',
      'zh_Hans': '',
    },
    '4bvl813u': {
      'es': 'Porfavor, elige una opción del dropdown',
      'de': '',
      'en': 'Please choose an option from the dropdown',
      'pt': '',
      'zh_Hans': '',
    },
    'f3afpmh6': {
      'es': 'Home',
      'de': '',
      'en': 'Home',
      'pt': '',
      'zh_Hans': '',
    },
  },
  // forgot_password
  {
    'ftrouwoj': {
      'es': 'Recuperar cuenta',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '4nj9lgcn': {
      'es': 'Introduzca el email asociado con su cuenta ',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'nb7se9ix': {
      'es': 'Correo electrónico',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'sl1oagms': {
      'es': 'Introduzca su email...',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'wcl97erw': {
      'es': 'Enviar',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'hmyn6j9b': {
      'es': 'Home',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
  },
  // mainpage
  {
    'oiag4ao3': {
      'es': 'Bienvenido',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '6jrcsydl': {
      'es': 'Esta es tu cuenta corriente',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '2zxbepn8': {
      'es': 'Balance',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'fvvstu13': {
      'es': 'Balance',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'z405xxaw': {
      'es': '+',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '50f7m9ec': {
      'es': 'Transacciones recientes',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'il8zs3hw': {
      'es': 'Contactos recientes',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '494bxmj2': {
      'es': 'Home',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
  },
  // settingsPage
  {
    '0b1npxl3': {
      'es': 'Alternar modo oscuro',
      'de': 'Dunkler Modus',
      'en': 'Dark mode',
      'pt': 'Modo escuro',
      'zh_Hans': '暗黑模式',
    },
    'y7xszy8k': {
      'es': 'Alternar modo claro',
      'de': 'Heller Modus',
      'en': 'Light mode',
      'pt': 'Modo claro',
      'zh_Hans': '亮色模式',
    },
    'nxsmzkni': {
      'es': 'Editar perfil',
      'de': 'Profil bearbeiten',
      'en': 'Edit profile',
      'pt': 'Editar perfil',
      'zh_Hans': '编辑个人资料',
    },
    'yz3nhuwv': {
      'es': 'Editar nombre',
      'de': 'Namen bearbeiten',
      'en': 'Edit name',
      'pt': 'Editar nombre',
      'zh_Hans': '编辑名称',
    },
    'wk2indxo': {
      'es': '>',
      'de': '>',
      'en': '>',
      'pt': '>',
      'zh_Hans': '>',
    },
    'iyshzmmy': {
      'es': 'Editar email',
      'de': 'E-Mail bearbeiten',
      'en': 'Edit mail',
      'pt': 'E-mail bearbeiten',
      'zh_Hans': '编辑电子邮件',
    },
    'cjmrkxvm': {
      'es': '>',
      'de': '>',
      'en': '>',
      'pt': '>',
      'zh_Hans': '>',
    },
    '6vb4uow4': {
      'es': 'Editar teléfono',
      'de': '\nTelefonnummer bearbeiten',
      'en': 'Edit phone',
      'pt': 'Editar telefono',
      'zh_Hans': '编辑电话号码',
    },
    'lr5uafdj': {
      'es': '>',
      'de': '>',
      'en': '>',
      'pt': '>',
      'zh_Hans': '>',
    },
    '8xj8ukit': {
      'es': 'Añadir cuenta bancaria',
      'de': 'Bankkonto hinzufügen',
      'en': 'Add bank account',
      'pt': 'Adicionar conta bancária',
      'zh_Hans': '添加银行账户',
    },
    'iukn527b': {
      'es': '>',
      'de': '>',
      'en': '>',
      'pt': '>',
      'zh_Hans': '>',
    },
    'j2ty62wz': {
      'es': 'Eliminar perfil',
      'de': 'Profil löschen',
      'en': 'Delete profile',
      'pt': 'Excluir perfil',
      'zh_Hans': '删除个人资料',
    },
    'kzpgk02w': {
      'es': '>',
      'de': '>',
      'en': '>',
      'pt': '>',
      'zh_Hans': '>',
    },
    '5xbdtv3a': {
      'es': 'Opciones',
      'de': 'Optionen',
      'en': 'Options',
      'pt': 'Opções',
      'zh_Hans': '选项',
    },
    'ruuf2ev8': {
      'es': 'Gestionar cuentas bancarias',
      'de': 'Bankkonten verwalten',
      'en': 'Manage bank accounts',
      'pt': 'Gerenciar contas bancárias',
      'zh_Hans': '管理银行账户',
    },
    'qzjcuyt5': {
      'es': '>',
      'de': '>',
      'en': '>',
      'pt': '>',
      'zh_Hans': '>',
    },
    'qdct9a11': {
      'es': 'Privacidad',
      'de': 'Datenschutz',
      'en': 'Privacy',
      'pt': 'Privacidade',
      'zh_Hans': '隐私',
    },
    'gaui9nvg': {
      'es': '>',
      'de': '>',
      'en': '>',
      'pt': '>',
      'zh_Hans': '>',
    },
    '6iprwm8q': {
      'es': 'Accesibilidad',
      'de': 'Barrierefreiheit',
      'en': 'Accesibility',
      'pt': 'Acessibilidade',
      'zh_Hans': '可访问性',
    },
    'iagajon6': {
      'es': '>',
      'de': '>',
      'en': '>',
      'pt': '>',
      'zh_Hans': '>',
    },
    'f69sjpi7': {
      'es': 'Notificaciones',
      'de': 'Benachrichtigungen',
      'en': 'Notifications',
      'pt': 'Notificações',
      'zh_Hans': '通知',
    },
    'fps7bdmf': {
      'es': '>',
      'de': '>',
      'en': '>',
      'pt': '>',
      'zh_Hans': '>',
    },
    'gd1vmmx8': {
      'es': 'Eliminar perfil',
      'de': 'Profil löschen',
      'en': 'Delete profile',
      'pt': 'Excluir perfil',
      'zh_Hans': '删除个人资料',
    },
    'rgz29sqg': {
      'es': '>',
      'de': '>',
      'en': '>',
      'pt': '>',
      'zh_Hans': '>',
    },
    'fuh378sz': {
      'es': 'Idioma',
      'de': 'Sprache',
      'en': 'Language',
      'pt': 'Idioma',
      'zh_Hans': '语言',
    },
    'susd6ej1': {
      'es': 'Contacto soporte',
      'de': 'Support',
      'en': 'Support',
      'pt': 'Support',
      'zh_Hans': 'Support',
    },
    '5fv6bmdw': {
      'es': 'Logout',
      'de': 'Logout',
      'en': 'Logout',
      'pt': 'Logout',
      'zh_Hans': 'Logout',
    },
    '72n85jd9': {
      'es': '__',
      'de': '_',
      'en': '_',
      'pt': '_',
      'zh_Hans': '_',
    },
  },
  // payment_confirmed
  {
    'a0751dty': {
      'es': 'Pago Realizado',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '8vnqynu4': {
      'es': '€',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'vux72aho': {
      'es':
          'Tu pago ha sido confirmado, este proceso puede llevar un tiempo hasta que se llegue a mostrar en la pestaña de transacciones',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '7yo70f48': {
      'es': 'Volver',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
  },
  // payment
  {
    'hmpk1q70': {
      'es': 'Introduce efectivo',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '2x6snc6o': {
      'es': '0',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'rg5g1n3x': {
      'es': 'Introduce efectivo',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '9b8c4634': {
      'es': 'Conceptos...',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '5ix6nyvj': {
      'es': 'Search for an item...',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'aqdsjh3z': {
      'es': 'Contactos',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'rl90we7j': {
      'es': 'Busca un contacto...',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'cvuelk69': {
      'es': '+',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '4dlx1ner': {
      'es': 'Home',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
  },
  // confirmMail
  {
    'x50t0nkv': {
      'es': 'Revisa tu correo electrónico',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '51j6aqjv': {
      'es':
          'Te hemos enviado un correo electrónico. Porfavor, revisalo antes de acceder .',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'ti4600mw': {
      'es': 'Volver',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
  },
  // addCard
  {
    'chbqmj5y': {
      'es': 'Añadir tarjeta ',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'oe3kffta': {
      'es': 'Introduzca los datos de su tarjeta ',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '5w3x6xqe': {
      'es': 'Número tarjeta',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'uyfwwzzw': {
      'es': 'Introduzca su numero de tarjeta...',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'ocjt52e9': {
      'es': 'Titular',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'i88mhh41': {
      'es': 'Introduzca nombre titular',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'kuxci2uj': {
      'es': 'MM',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '7s83rwkg': {
      'es': 'MM',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'irbup0o0': {
      'es': '/',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'grrlqaxx': {
      'es': 'AA',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'zcirj5kw': {
      'es': 'AA',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'za4x5wtk': {
      'es': 'CVC',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'p7g66xsj': {
      'es': 'CVC',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'ukt1euqp': {
      'es': 'VISA',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'k8h0zvi1': {
      'es': 'MasterCard',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'lymx69ur': {
      'es': 'Tarjeta...',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'c46e8whb': {
      'es': 'Search for an item...',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'dmcxtgna': {
      'es': 'Añadir',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'qtbz4bw4': {
      'es': 'Cancelar',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'lp80wu2e': {
      'es': 'Volver atras',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '3qgyphfx': {
      'es': 'Campo obligatorio',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'n845104b': {
      'es': 'Introduce una tarjeta correcta',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    's0tnay79': {
      'es': 'Introduce una tarjeta correcta',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'skte62y3': {
      'es': 'Introduce solamente dígitos',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'hmu7aeh1': {
      'es': 'Please choose an option from the dropdown',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '9djq7g7c': {
      'es': 'Campo obligatorio',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'smpb631z': {
      'es': 'Introduce tu nombre completo',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'p043w4v7': {
      'es': 'Introduce un nombre válido',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    't7qqnvb0': {
      'es': 'Please choose an option from the dropdown',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'liut224u': {
      'es': 'Campo obligatorio',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'r5n8ehe9': {
      'es': 'Introduce una fecha válida',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'vui98p1s': {
      'es': 'Introduce una fecha válida',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'pxgykduv': {
      'es': 'Indica una fecha válida',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'ljbh97ra': {
      'es': 'Please choose an option from the dropdown',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'effvheks': {
      'es': 'Campo obligatorio',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'mbx6q6vu': {
      'es': 'Introduce una fecha válida',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'cfsqvkjn': {
      'es': 'Introduce una fecha válida',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '5hk3s22r': {
      'es': 'Introduce una fecha válida',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'k9km1upu': {
      'es': 'Please choose an option from the dropdown',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'fbzkeikv': {
      'es': 'Campo obligatorio',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'us5j3y4j': {
      'es': 'Introduce un CVC válido',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '5oopddlq': {
      'es': 'Introduce un CVC válido',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'eprq9e4s': {
      'es': 'Introduce un CVC válido',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '6nbf36rl': {
      'es': 'Please choose an option from the dropdown',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'zz53efve': {
      'es': 'Home',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
  },
  // Transactions
  {
    'iewq8w82': {
      'es': 'Transacciones',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'anr49w38': {
      'es': '€',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '3p9rns8b': {
      'es': 'Ingresos',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'adb04jc2': {
      'es': 'Pérdidas',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'zpjlhj22': {
      'es': 'Neto',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'pcktmnxg': {
      'es': 'Transactions',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
  },
  // chartsPage
  {
    '476512qf': {
      'es': 'Tus movimientos',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'cmqya392': {
      'es': 'Tu efectivo',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '9qvl08ej': {
      'es': 'Tus cuentas',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'suf3361i': {
      'es': 'Fracción titulares',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'ewjj2b19': {
      'es': 'Entidades',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'ekzerztd': {
      'es': 'Resúmen',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'y56d15o6': {
      'es': 'Home',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
  },
  // newContact
  {
    'h7mogcrl': {
      'es': 'Introduzca datos de contacto',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '53zcaw0n': {
      'es': 'Nombre de contacto',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'jp2yarmo': {
      'es': 'Introduzca su nombre',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'hyfjo9c9': {
      'es': 'Correo electrónico',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'hpnckcvv': {
      'es': 'Introduzca su correo electrónico...',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'kyiw8fvk': {
      'es': 'Número teléfono',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '42rzjzvg': {
      'es': 'Tu numero de teléfono...',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'v8rfrkia': {
      'es': 'Agregar contacto',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'qpsnbpcr': {
      'es': 'Campo obligatorio',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'xdaayoiu': {
      'es': 'Introduce un nombre correcto',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'f57642c7': {
      'es': 'Introduce un nombre correcto',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'g48uh5qc': {
      'es': 'Introduce un nombre correcto',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'ihzofw52': {
      'es': 'Please choose an option from the dropdown',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'aafhihtz': {
      'es': 'Campo obligatorio',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'lolh0u3x': {
      'es': 'Introduce un correo válido',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    's0ek8g1m': {
      'es': 'Introduce un correo correcto',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'kjt3le0t': {
      'es': 'Please choose an option from the dropdown',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'erbuzo6e': {
      'es': 'Campo obligatorio',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'o6l9g39q': {
      'es': 'Introduce un telefono correcto',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '1rbidmpo': {
      'es': 'Introduce un telefono correcto',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'lzg4j3v4': {
      'es': 'Please choose an option from the dropdown',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '0r0o6qyn': {
      'es': 'Nuevo contacto',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '5mmsdruz': {
      'es': 'Home',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
  },
  // startPage
  {
    '79o5ag0b': {
      'es': 'Home',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
  },
  // SinRegistros
  {
    '6cwm72w4': {
      'es': 'Sin registros',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
  },
  // modalInsert
  {
    'cjnmecer': {
      'es': 'Introduce un concepto',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    's0sv4qaj': {
      'es': 'Introduce nuevo concepto...',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'w8qs5z3p': {
      'es': 'Guardar',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'umx7u385': {
      'es': 'Cancelar',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
  },
  // Miscellaneous
  {
    'dd0tjo13': {
      'es': 'Porfavor, permite el acceso al chip NFC',
      'de': '',
      'en': 'Please, allow acces to NFC  manager',
      'pt': '',
      'zh_Hans': '',
    },
    'mv49kgcv': {
      'es': 'Porfavor, permite el acceso al chip NFC',
      'de': '',
      'en': 'Please, allow acces to NFC  manager',
      'pt': '',
      'zh_Hans': '',
    },
    'r7e7dvmy': {
      'es': 'Porfavor,permite el acceso al chip NFC',
      'de': '',
      'en': 'Please, allow acces to NFC  manager',
      'pt': '',
      'zh_Hans': '',
    },
    '4v194255': {
      'es': '',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'e9ms0s55': {
      'es': '',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'zbyhci0f': {
      'es': '',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '9fy5utv9': {
      'es': '',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'aw023g6u': {
      'es': '',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'fizk7w28': {
      'es': '',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'v667yms9': {
      'es': '',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'dfi8w1wf': {
      'es': '',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '93t8bf8x': {
      'es': '',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'gmsdslic': {
      'es': '',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'pu67dytj': {
      'es': '',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '5dvzs7r8': {
      'es': '',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'nrey9qbx': {
      'es': '',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '0p1u2wfd': {
      'es': '',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '40ve9ysi': {
      'es': '',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'aqxpdyki': {
      'es': '',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'qrle0smh': {
      'es': '',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '1hqh4lpr': {
      'es': '',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '4tktg8ar': {
      'es': '',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    '9yazsy4y': {
      'es': '',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
    'i41jrvp8': {
      'es': '',
      'de': '',
      'en': '',
      'pt': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
