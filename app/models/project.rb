class Project
  include Mongoid::Document
  field :title, :type => String
  field :author, :type => String
  field :description, :type => String
  field :looking_for, :type => Array
end
