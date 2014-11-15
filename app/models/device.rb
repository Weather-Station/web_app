class Device < ActiveRecord::Base
	belongs_to :user
	has_many :reports
	validates :token, uniqueness: {case_sensitive: false}#check it's unique
	validates_presence_of :uid, :update_period, :name, :token

end
