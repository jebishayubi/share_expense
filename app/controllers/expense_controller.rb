class ExpenseController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @expense = Expense.all
        render json: @expense
    end

    def show
        if(authenthicateexpense)
            render json: "login",status: 403
        else
        @expense = Expense.where(employ_id: params[:employ_id])
        render json: @expense
        end
    end

    def myexpense
        if(authenthicateexpense)
            render json: "login",status: 403
        else
        # @expense = Expense.where(employ_id: session[:current_employee_id])
        @expense = Expense.where(employ_id: params[:employ_id])
        @total = 0
        @data = @expense.map do |expense|
            @total = expense.amount + @total
        end 
        render json: {data:@expense,total: @total}
    end
    end

    def create
        if(session[:current_employee_id].nil?)
            render json: "login",status: 403
        else
        @emp = Employ.find(session[:current_employee_id])
        if(@emp.emp_status == "Permanent") 
        @expense = Expense.create(employ_id: params[:employ_id],description: params[:description],
        amount: params[:amount],invoice_number: params[:invoice_number],
        expense_type: params[:expense_type],document: params[:document],
        date: params[:date],comment: params[:comment],reply: params[:reply],approvalstatus: "0")
        render json: {message: @expense}
        else
            render json: {message: "Not available"}
        end
    end
end
  
  def expensereport 
    if(authenthicateexpense)
        render json: "login",status: 403
    else
    # @e = Expense.where(employ_id: session[:current_employee_id])
    @e = Expense.where(employ_id: params[:employ_id])
    @expense = @e.where("expense_type LIKE ?","%" + params[:expense_type]+ "%")
    @total = 0
    @data = @expense.map do |expense|
        @total = expense.amount + @total
    end 
    render json: {data:@expense,total: @total}
end

  end

  def destroyexpense
    if(authenthicateexpense)
        render json: "login",status: 403
    else
    # @expense=Expense.where(employ_id: session[:current_employee_id],id: params[:id])
    @expense=Expense.where(employ_id: params[:employ_id],id: params[:id])
    @expense.destroy_all
    render json: {message: "Expense deleted"}
    end
end

    def approval
        if(authenthicateexpense)
            render json: "login",status: 403
        else
        if(session[:current_employee_id].nil?)
            render json: {message: "No"}
        else
        @emp = Employ.find(session[:current_employee_id])
        if(@emp.role == "admin")
        @expense = Expense.find(params[:id]) 
        @employee =Employ.find_by(id: @expense.employ_id)
        @employee_email = @employee.email;
        @expense = @expense.update(approvalstatus: params[:approvalstatus])
        @amount =  Expense.find(params[:id])
        if(@amount.approvalstatus == 1)
            @status = "approved"
        else
           @status = "rejected"
        end
        ReportMailer.with(amount: @amount.amount,status: @status).status_change(@employee_email).deliver_now
        render json: {message:"updated",data:  @status}
    else
        render json: {message: "Permission denied"},status: 403
    end
end
end
    
    end

    def myreport
        if(authenthicateexpense)
            render json: "login",status: 403
        else
        # @employee = Employ.find(session[:current_employee_id])
        @employee = Employ.find_by(id: params[:id])
        @expense = Expense.where(employ_id: @employee.id)
        @total = 0
        @data = @expense.map do |expense|
            @total = expense.amount + @total
        end
        render json: {data:@expense,total: @total}
    end
end

    def admincomment
        if(authenthicateexpense)
            render json: "login",status: 403
        else
        @emp = Employ.find(session[:current_employee_id])
        if(@emp.role == "admin")
        @expense = Expense.find_by(id: params[:id])
        if(@expense.nil?)
            render json: {message: "Expense not available"}
        else
        @expense = @expense.update(comment: params[:comment])
        @send = Expense.find_by(id: params[:id])
        @employee = Employ.find_by(id: @send.employ_id)
        @employee_email = @employee.email;
        ReportMailer.with(amount: @send.amount,comment: @send.comment).add_comment(@employee_email).deliver_now
        render json: {message:"comment added",data: @expense} 
        end
        else
            render json: {message: "Permission denied"},status: 403
        
    end
end
    end

    def reply
       if(authenthicateexpense)
        render json: "login"
       else
        # @expense=Expense.where(employ_id: session[:current_employee_id],id: params[:id])
        @expense=Expense.where(employ_id: params[:employ_id],id: params[:id])
        @expense = @expense.update(reply: params[:reply])
        render json: {message: "Replied"},status: 403
       end
    end


    def admindelete
        if(authenthicateexpense)
            render json: "login"
        else
        @expense=Expense.find(params[:id])
        @expense.destroy
        render json: {message: "Expense deleted"},status: 403
    end
end
    def addcomment
        if(authenthicateexpense)
            render json: "login",status: 403
        else
        @com = Employcomment.create(expense_id: params[:expense_id],comment: params[:comment],
        commenter_id: params[:commenter_id])
        render json: @com
    end
end
    def viewcomment
        if(authenthicateexpense)
            render json: "login",status: 403
        else
        @com = Employcomment.find_by(id: params[:id])
        render json: @com
    end
end
    def authenthicateexpense
        (session[:current_employee_id].nil?)
    end
    def addadmincomment
        if(authenthicateexpense)
            render json: "login",status: 403
        else
        @com = Employcomment.create(expense_id: params[:expense_id],comment: params[:comment],
        commenter_id: params[:commenter_id])
        @send = Expense.find_by(expense_id: params[:expense_id])
        @employee = Employ.find_by(id: @send.employ_id)
        @employee_email = @employee.email;
        ReportMailer.with(amount: @send.amount,comment: @send.comment).add_comment(@employee_email).deliver_now
        render json: @com
    end
end

def invoicevalidation
    # @expense=Expense.where(employ_id: params[:employ_id],id: params[:id])
    # invoice = @expense.invoice_number
    invoice = 2
    @response = `curl -H "X-API-Key: b490bb80" -X POST -d '{"invoice_id":#{invoice}}' https://my.api.mockaroo.com/invoices.json`
    render json: @response
end


end

