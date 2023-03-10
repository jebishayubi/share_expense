class ReportMailer < ApplicationMailer
     def status_change(employee_email)
      @amount = params[:amount]
      @status = params[:status]
       mail(to: employee_email, subject: 'Status change')
  end
  def add_comment(employee_email)
      @amount = params[:amount]
      @comment = params[:comment]
       mail(to: employee_email, subject: 'Comment added on expense report')
  end
end
