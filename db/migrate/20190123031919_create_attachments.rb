class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.string :attachment_name
      t.string :attach_file

      t.timestamps
    end
  end
end
