class CreateUserSubmissions < ActiveRecord::Migration
  def change
    create_table :user_submissions do |t|
    	t.references :user, null: false
    	t.integer :language, null: false
    	t.integer :extension, null: false
    	t.string :code, null: false
    	t.string :input
    	t.string :output, null: false
    	t.boolean :success, null: false
		t.timestamps null: false
    end
  end
end
