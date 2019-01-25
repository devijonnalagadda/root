class AttachmentsController < ApplicationController
	before_action :authenticate_user!

   	def index
      @projects = current_user.projects
    end
   
   	def new
    	@attachment = Attachment.new
   	end
   
   	def create

        @attachment = Attachment.new(attachment_params)
        @attachment.project_id=params[:projects][:id]

        if @attachment.save
        	redirect_to attachments_path
        else
        	render "new"
        end
   	end
   
   	def destroy
    	@attachment = Attachment.find(params[:id])
    	@attachment.destroy
    	redirect_to attachments_path
   	end
   
   	private
   	def attachment_params 
    	params.require(:attachment).permit(:attachment_name, :attach_file, :project_id)  
   	end
end
