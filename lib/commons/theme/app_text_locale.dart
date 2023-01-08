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
      // ORDER ATTENTION
      AppTextKey.ORDER_ATTENTION_PRIORITY_TEXT: 'Prioridad',
      AppTextKey.ORDER_ATTENTION_STEP_1_TITLE: 'Información',
      AppTextKey.ORDER_ATTENTION_STEP_2_TITLE: 'Inspección',
      AppTextKey.ORDER_ATTENTION_STEP_3_TITLE: 'Diagnóstico',
      AppTextKey.ORDER_ATTENTION_STEP_4_TITLE: 'Ejecución',
      AppTextKey.ORDER_ATTENTION_STEP_5_TITLE: 'Mercadería',
      AppTextKey.ORDER_ATTENTION_CONTINUE_BUTTON_TEXT: 'Continuar',
      // ORDER ATTENTION STEP 1
      AppTextKey.STEP_1_REQUEST_DATE_TEXT: 'Fecha de solicitud',
      AppTextKey.STEP_1_ORDER_STATE_TEXT: 'Estado',
      AppTextKey.STEP_1_ORDER_STATE_DRAFT_TEXT: 'Borrador',
      AppTextKey.STEP_1_CUSTOMER_NAME_TEXT: 'Cliente',
      AppTextKey.STEP_1_CUSTOMER_CELLPHONE_TEXT: 'Teléfono',
      AppTextKey.STEP_1_CUSTOMER_ADDRESS_TEXT: 'Dirección',
      AppTextKey.STEP_1_EQUIPMENT_CODE_TEXT: 'Placa del equipo',
      AppTextKey.STEP_1_EQUIPMENT_NAME_TEXT: 'Nombre del equipo',
      AppTextKey.STEP_1_REQUEST_CAUSE_TEXT: 'Tipo de problema reportado',
      AppTextKey.STEP_1_START_ATTENTION_TEXT: 'Iniciar atención',
      // PROFILE
      AppTextKey.PROFILE_TITLE: 'Perfil',
      AppTextKey.PROFILE_OPTION_EXIT_TEXT: 'Salir'
    }
  };
}