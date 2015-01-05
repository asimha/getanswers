class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    get_collections
    @answers = Answer.where("question_id = ?", params[:question_id]).page(params[:page]).per(10)
  end

  def technical_new
    @question = Question.new
  end

  def non_technical_new
    @question = Question.new
  end

  def technical_create
    @question = Question.new(question_params)
    @question.technical = true
    @user = current_user
    @question.user_id = @user.id
    if @question.save
      redirect_to technical_questions_path 
    else
      render 'technical_new'
    end
  end

  def non_technical_create
    @question = Question.new(question_params)
    @question.non_technical = true
    @user = current_user
    @question.user_id = @user.id
    if @question.save
      redirect_to non_technical_questions_path 
    else
      render 'non_technical_new'
    end
  end

  def user_questions
    @user = current_user
    @questions = @user.questions
  end

  def technical_question
    @technical_question = Question.where(:technical => true).all
  end

  def non_technical_question
    @non_technical_question = Question.where(:non_technical => true)
  end

  private
  def question_params
    params.require(:question).permit(:question, :photo, :technial, :non_technical)
  end

  def get_collections

    relation = Question.where("")
    if params[:query]
      @query = params[:query].strip
      relation = relation.search(@query) if !@query.blank?
    end

    @questions = relation.order("created_at desc").page(params[:page]).per(10)

    ## Initializing the @user object so that we can render the show partial
    @question = @questions.first unless @question

    return true

  end
end


