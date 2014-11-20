class AddColumnToUserQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :user_id, :integer
    add_column :users, :question_id, :integer
  end
end
