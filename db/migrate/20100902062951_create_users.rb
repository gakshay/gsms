class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :mobile
      t.string :email
      t.integer :limit, :default => 200
      t.integer :count, :default => 0
      t.timestamps
    end
    create_table :friends, {:id => false} do |t|
      t.column :user_id, :integer, :null => false
      t.column :user_id_target, :integer, :null => false      # target of the relationship
    end

  end

  def self.down
    drop_table :users
    drop_table :friends
  end
end
