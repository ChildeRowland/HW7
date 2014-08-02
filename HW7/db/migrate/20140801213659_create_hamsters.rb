class CreateHamsters < ActiveRecord::Migration
  def change
    create_table :hamsters do |t|
    	t.string :name
    	t.string :phrase
    	t.integer :user_id
      t.timestamps
    end
  end
end
