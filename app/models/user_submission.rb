class UserSubmission < ActiveRecord::Base
	belongs_to :user
	enum language: [:ruby, :c]
	enum extension: ['.rb','.c']


	def self.validates_language_params language
		byebug
		languages.include? language
	end
end
