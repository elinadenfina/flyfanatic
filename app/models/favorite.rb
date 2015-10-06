class Favorite < ActiveRecord::Base
	belongs_to :user
	validate :is_instagram

	validates_uniqueness_of :spotify_id
	attr_accessible = :spotify_id, :instagram_id 

	def is_instagram 
		if !Instagram::user_search(self.instagram_id).first
			errors.add(:instagram_id, 'not a valid Instagram user')
		end
	end


end
