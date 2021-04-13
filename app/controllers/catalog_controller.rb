class CatalogController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:search] != nil and params[:search] != ""
      redirect_to catalog_path(:id => -1, :search => params[:search])
    end
    @categories = Subject.all;

  end

  def show
    if params[:search] != nil and params[:search] != ""
      @subject_name = "search " + params[:search]
      @mentors = Mentor.withUserInfo.where("profile LIKE ? ", "%#{params[:search]}%").or(Mentor.withUserInfo.where("LOWER(username) LIKE ? ", "%#{params[:search].downcase}%")).or(Mentor.withUserInfo.where("LOWER(profile) LIKE ? ", "%#{params[:search].downcase}%"));
    else
      id = params[:id]
      if id == "-1"
        @subject_name = "All"
        @mentors = Mentor.all
      else
        @subject = Subject.find_by_id(id)
        @subject_name = @subject.name
        @mentors = @subject.mentors
      end
    end
  end

end
