class CatalogController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Subject.all;
  end

  def show
    if params[:search] != nil and params[:search] != ""
      @mentors = @mentors.where("profile LIKE ? ", "%#{params[:search]}%").or(@mentors.where("username LIKE ? ", "%#{params[:search]}%"));
    else
      id = params[:id]
      if id == "-1"
        @mentors = Mentor.withUserInfo
      else
        @subject = Subject.find_by_id(id)
        @mentors = @subject.mentors
      end
    end
  end

end
