class Attachment < ApplicationRecord
	mount_uploader :attach_file, AttachmentUploader # Tells rails to use this uploader for this model.
   	validates :attachment_name, presence: true # Make sure the owner's name is present.
   	belongs_to :project
end
