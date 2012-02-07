class HomeController < ApplicationController
  
  def index
  	@projects = Project.limit(4)
  	authorize! :index, Project
  end
  
end
