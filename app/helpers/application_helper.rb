module ApplicationHelper


    def logged_in?
      # binding.pry
      @user = current_user
    end
end
