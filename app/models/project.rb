class Project
  include Mongoid::Document

  key :title

  field :title, :type => String
  field :author, :type => String
  field :description, :type => String
  field :looking_for, :type => Array

  validates_uniqueness_of :title
  validates_presence_of :title, :author, :description, :looking_for, :image

  mount_uploader :image, ImageUploader

  embeds_many :memberships
end
