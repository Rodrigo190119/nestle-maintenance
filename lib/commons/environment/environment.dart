enum ENVIRONMENT {
  testing,
  production
}

extension Environment on ENVIRONMENT {
  static ENVIRONMENT environment = ENVIRONMENT.testing;
  static Map<String, dynamic> get appConfig {
    switch (environment) {
      case ENVIRONMENT.testing:
        return {
          "environment": "TEST",
          "baseUrl": "https://eam.laraigo.com/odoo-eam-tst",
          "connectTimeout": 300000,   // 5 minutes
          "receiveTimeout": 300000,   // 5 minutes
          "companyName": "VCA Perú",
        };
      case ENVIRONMENT.production:
        return {
          "environment": "PROD",
          "baseUrl": "https://eam.laraigo.com/odoo-eam",
          "connectTimeout": 150000,   // 2.5 minutes
          "receiveTimeout": 150000,   // 2.5 minutes
          "companyName": "VCA Perú",
        };
      default:
        return {};
    }
  }
}