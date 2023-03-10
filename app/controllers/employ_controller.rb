require 'bcrypt'
class EmployController < ApplicationController
    skip_before_action :verify_authenticity_token

    
    def show
        if(session[:current_employee_id].nil?)
            render json: "login",status: 403
        else
        @emp = Employ.find_by(id: params[:id])
        if(@emp.nil?)
            render json: {message: "Employee does not exist"},status: 400
        else
        render json: @emp
        end
    end
    end
    def create
        e=!params[:email].empty? and !params[:password].empty?
        if(e)
        
        @emp = Employ.create(name: params[:name],role: 'employee', emp_status: params[:emp_status],
        department: params[:department],email: params[:email].downcase.strip,address: params[:address],password: params[:password])
        if (@emp.id.nil?)
           render json: {Message: "Employee details already exists"},status: 400
        else
        render json: @emp
        end
    else
        render json: {Message: "Enter username and password"},status: 400
    end 
    end
    def index
        
        if(session[:current_employee_id].nil?)
            render json: "login",status: 403
        else
        @emp = Employ.all
        render json: @emp
        end
    end


    def displaypermanent
        if(session[:current_employee_id].nil?)
            render json: "login",status: 403
        else
        @emp =Employ.where(emp_status: "Permanent")
        render json: @emp
        end
    end
    def update
        if(session[:current_employee_id].nil?)
            render json: "login"
        else
        @emp = Employ.find(session[:current_employee_id])
        if(@emp.role == "admin")
        @empup = Employ.find(params[:id])
        # @emp = @empup.update(role: params[:role])
        @emp = @empup.update('role': params[:role])
       
        render json: {Data: @empup}
        else
            render json: {message: "Permission denied"},status: 403
        end
    end
    end
    def updateempstatus
        if(session[:current_employee_id].nil?)
            render json: "login"
        else
        @emp = Employ.find(session[:current_employee_id])
        if(@emp.role == "admin")
        @empup = Employ.find(params[:id])
        # @emp = @empup.update(role: params[:role])
        @emp = @empup.update('emp_status': params[:emp_status])
       
        render json: {Data: @empup}
        else
            render json: {message: "Permission denied"},status: 403
        end
    end
    end

    def admindelete
        if(session[:current_employee_id].nil?)
            render json: "login",status: 403
        else
        @emp = Employ.find(session[:current_employee_id])
        if(@emp.role == "admin")
        @employee=Employ.find(params[:id])
        @employee.destroy
        render json: {message: "Employee deleted"}
    else
        render json: {message: "Permission denied"},status: 403
    end
end
    end
   
    # def authenuser
    #     (session[:current_employee_id].nil?)
        
    # end
  
end
