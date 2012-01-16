class Project
  include Mongoid::Document
  field :title, :type => String
  field :author, :type => String
  field :description, :type => String
  field :looking_for, :type => Array

  validates_uniqueness_of :title
  validates_presence_of :title, :author, :description, :looking_for

  key :title
end
