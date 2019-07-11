class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson, only: [:show]
  
  def show
  end
  
  private
  
  def require_authorized_for_current_lesson
    if current_user.enrolled_in? != current_user
      redirect_to course_path(current_course), alert: 'You must be enrolled in course to view course content'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
