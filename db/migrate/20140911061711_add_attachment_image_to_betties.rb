class AddAttachmentImageToBetties < ActiveRecord::Migration
  def self.up
    change_table :betties do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :betties, :image
  end
end
