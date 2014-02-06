class CreatePostvotes < ActiveRecord::Migration
  def change
    create_table :postvotes do |t|
      t.integer :post_id
      t.integer :votes, :default => 0
    end
  end
end
