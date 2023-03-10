class EmpcommentController < ApplicationController
    skip_before_action :verify_authenticity_token
    def addcomment
        @com = Empcomment.create(expense_id: params[:expense_id],comment: params[:comment],
        commenter_id: params[:commenter_id])
        render json: @com
    end
    def viewcomment
        @com = Empcomment.find_by(id: params[:id])
        render json: @com
    end
end
