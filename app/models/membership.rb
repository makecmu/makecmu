require 'csv'

class Membership
  include Mongoid::Document
  field :name, :type => String
  field :email, :type => String
  field :interests, :type => String
  field :comments, :type => String

  validates_presence_of :name, :email

  embedded_in :project

  def self.to_csv(memberships, col_sep = "")
  	attributes = ['name', 'email', 'interests', 'comments']
    CSV.generate(:col_sep => col_sep) do |csv|
      csv << attributes
      memberships.each do |membership|
	      csv << attributes.map{ |a| membership[a] }
	  end
    end
  end
  
end
