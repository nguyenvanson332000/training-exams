class Admin::QuestionsController < ApplicationController
<<<<<<< HEAD
  before_action :load_exam, only: %i(new create)
  def new
=======
  before_action :load_exam, only: %i(create)
  def new
    @exam = Exam.find_by(id: params[:exam_id])
>>>>>>> Create Index Questions
    @question = @exam.questions.new
  end

  def create
    @question = @exam.questions.new question_params
    if @question.save
      flash[:success] = t "controller.admin.create_question_success"
      redirect_to admin_exam_path(@exam)
    else
<<<<<<< HEAD
      flash[:danger] = t "controller.admin.create_question_fail"
=======
      flash[:danger] = t"controller.admin.create_question_fail"
>>>>>>> Create Index Questions
      redirect_to admin_exam_path(@exam)
    end
  end

  private

  def question_params
    params.require(:question).permit :content
  end

   def load_exam
    @exam = Exam.find_by(id: params[:exam_id])
    return if @exam

    flash[:warning] = t "controller.admin.load_exam_fail"
    redirect_to root_path
  end
end
