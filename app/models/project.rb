class Project < ApplicationRecord
	belongs_to :user
	has_many :tasks, dependent: :delete_all
	has_many :attachments,  dependent: :delete_all
end
