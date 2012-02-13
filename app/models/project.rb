class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, :type => String
  field :description, :type => String
  field :looking_for, :type => Array
  field :seeking_collaborators, :type => Boolean

  belongs_to :user

  validates_presence_of :title, :description, :looking_for

  scope :has_image, where(:image.exists => true)
  scope :no_image, where(:image.exists => false)

  scope :seeking_collaborators, where(:seeking_collaborators => true)
  scope :not_seeking_collaborators, where(:seeking_collaborators => false)

  mount_uploader :image, ImageUploader

  embeds_many :memberships

  # Hacky and slow way to make the projects shuffle
  def shuffled_order
  	now = DateTime.now
  	( p.hash + now.hour + now.day*100 ).hash
  end
end
