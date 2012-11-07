STATUS_OPTIONS=['up','warning','down']
APP_CONFIG = YAML.load(File.read(File.expand_path('../../appstatus.yml', __FILE__)))
APP_CONFIG.merge! APP_CONFIG.fetch(Rails.env, {})
APP_CONFIG.symbolize_keys!