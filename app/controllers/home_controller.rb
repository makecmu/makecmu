class HomeController < ApplicationController
  
  def index
  	@projects = Project.all
  	authorize! :index, Project
  end
  
end
