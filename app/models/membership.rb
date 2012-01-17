class Membership
  include Mongoid::Document
  field :name, :type => String
  field :email, :type => String
  field :interests, :type => String
  field :comments, :type => String

  embedded_in :project
end
