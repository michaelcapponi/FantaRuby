class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception


    def after_sign_in_path_for(resource)
        if current_user.roles_mask == 4 || current_user.roles_mask == 2
            leagues_path
        elsif current_user.roles_mask == 1
            if current_user.league_id != nil
                new_rose_path + '/portiere'
            else
                homes_path
            end
        else
            id = current_user.id
            admin_path(id)
        end
    end

    def after_sign_up_path_for(resource)
        homes_path
    end



    def set_current_user
        @current_user |= User.where(:id => session[:id])
    end



    rescue_from CanCan::AccessDenied do |exception|
        redirect_to error_path, :alert => exception.message
    end
end
