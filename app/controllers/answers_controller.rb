class AnswersController < ApplicationController
  before_action :authenticate_user!

  def index
    @question = Question.find params[:question_id]
    @answers = Answer.where("question_id = ?", params[:question_id]).page(params[:page]).per(10)
  end
  
  def new
    @answer = Answer.new
    @question = Question.find params[:question_id]
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id]
    if @answer.save
      redirect_to questions_path 
    else
      render 'new'
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:answer)
  end

end
