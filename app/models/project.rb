class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, :type => String
  field :description, :type => String
  field :looking_for, :type => Array

  belongs_to :user

  validates_presence_of :title, :description, :looking_for

  mount_uploader :image, ImageUploader

  embeds_many :memberships
end
