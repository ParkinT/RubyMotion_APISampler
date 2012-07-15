class AppProperties
  VERSION = '0.9'
  APP_DELEGATE = 'AppDelegate' #default
  COMPANY_NAME = 'com.websembly.'
  
  def name
     'APISampler'
  end

  def version
   VERSION
  end

  def delegate
    APP_DELEGATE
  end

  def identifier
    COMPANY_NAME + APP_DELEGATE
  end
end