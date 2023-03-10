class LoginController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        @emailadd = (params[:email]).downcase
        @emp = Employ.find_by('email': @emailadd)
        if(@emp.nil?)
            render json: "Employee does not exists",status: 403
        else
            if(@emp.authenticate(params[:password]))
                session[:current_employee_id] = @emp.id
            render json: "welcome"
            else
                render json: "Invalid Details",status: 400
        end
    end
end
end
