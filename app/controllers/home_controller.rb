class HomeController < ApplicationController
  
  def index
  	@projects = Project.has_image.seeking_collaborators.all.sort_by(&:shuffled_order)[0...4]
  	authorize! :index, Project
  end
  
end
