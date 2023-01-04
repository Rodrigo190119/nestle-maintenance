import 'package:flutter_maintenance/commons/theme/app_text_key.dart';
import 'package:get/get.dart';

class AppTextLocale extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'es_PE': {
      // LOGIN
      AppTextKey.LOGIN_USERNAME_TEXT: 'Usuario',
      AppTextKey.LOGIN_PASSWORD_TEXT: 'Contraseña',
      AppTextKey.TYPE_USERNAME_TEXT: 'Ingrese un usuario',
      AppTextKey.TYPE_PASSWORD_TEXT: 'Ingrese una contraseña',
      AppTextKey.LOGIN_TEXT: 'Ingresar',
      AppTextKey.VERSION_TEXT: 'Versión',
      AppTextKey.DEVICE_MODEL_TEXT: 'Dispositivo',
      AppTextKey.BUILD_NUMBER_TEXT: 'Nº compilación',
      // ROOT
      AppTextKey.BOTTOMBAR_HOME_TEXT: 'Inicio',
      AppTextKey.BOTTOMBAR_PROFILE_TEXT: 'Perfil',
      // HOME
      AppTextKey.HOME_SEARCH_TEXT: 'Buscar...',
      AppTextKey.HOME_ORDERS_COUNT_TEXT: 'Órdenes por atender: ',
      AppTextKey.HOME_EMPTY_ORDERS_TEXT: 'No tienes órdenes por atender',
      // ORDER CARD
      AppTextKey.ORDER_CARD_PRIORITY_LOW_TEXT: 'Baja',
      AppTextKey.ORDER_CARD_PRIORITY_NORMAL_TEXT: 'Normal',
      AppTextKey.ORDER_CARD_PRIORITY_HIGH_TEXT: 'Alta',
      // PROFILE
      AppTextKey.PROFILE_TITLE: 'Perfil',
      AppTextKey.PROFILE_OPTION_EXIT_TEXT: 'Salir'
    }
  };
}