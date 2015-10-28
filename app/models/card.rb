class Card < ActiveRecord::Base

	app_namespace = 'granat_skeleton_app' # one bucket - multiple apps - split into folders by its namespace
	has_attached_file :image, :styles => { normal: "600x600#", small: "341x333#", thumb: "75x75#"},
	  :default_url => "/avatar/:style.png",
	  :storage => :s3,
	  :s3_credentials => {
    	:bucket => 'granat-bucket',
    	:access_key_id => "#{ENV['S3_KEY']}",
    	:secret_access_key => "#{ENV['S3_ACCESS']}"
  	},
	  :path => app_namespace + if Rails.env.production? then "/:id/:style.:extension" else "/dev/:id/:style.:extension" end
	validates :image, presence: true


	belongs_to :user

	scope :approved, -> {where(approved: true)}

	acts_as_votable


end
