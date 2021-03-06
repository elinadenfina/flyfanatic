class Favorite < ActiveRecord::Base
	belongs_to :user
	has_many :playlists
	
	validate :is_instagram, :on => :update

	
	attr_accessible = :spotify_id, :instagram_id, :twitter_user, :distance 

	def is_instagram 
		if self.instagram_id != ""
		  	if !Instagram::user_search(self.instagram_id).first 
		  		errors.add(:instagram_id, 'not a valid Instagram user')
		  	end
		end
	end

	def self.search(query)
    where("name like ?", "%#{query}%")
  	end


end
