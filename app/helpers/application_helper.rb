module ApplicationHelper

    def logged_in?
      @user = current_user
    end

end
