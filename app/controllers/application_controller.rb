class ApplicationController < ActionController::Base
    def page_not_found
        respond_to do |format|
          format.html { render template: 'errors/not_found_error', layout: 'layouts/application', status: 404 }
          format.all  { render nothing: true, status: 404 }
        end
    end

    def authenticate_admin
      return unless !(current_user && current_user.admin?)
      redirect_to(root_path)
    end
    helper_method :authenticate_admin

end
