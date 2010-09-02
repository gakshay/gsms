class CreateInboxes < ActiveRecord::Migration
  def self.up
    create_table :inboxes do |t|
      t.integer :s_id
      t.integer :d_id
      t.text :message
      t.integer :status, :limit => 3, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :inboxes
  end
end
