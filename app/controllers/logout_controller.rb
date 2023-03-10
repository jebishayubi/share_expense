class LogoutController < ApplicationController
    def index
        session.delete(:current_employee_id)
        render json: "Loggedout"
            end
end
