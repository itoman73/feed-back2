class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    private

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
        devise_parameter_sanitizer.permit(:account_update, keys: [:name]) # 情報更新時(account_update時)にnameというキーのパラメーターを追加で許可する        
    end
    
    before_action :get_user

    def get_user
       @users = User.all 
    end
end
