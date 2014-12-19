class AddQuestionsComments < ActiveRecord::Migration
  def change
    add_column :questions, :question, :string
    add_column :questions, :comments, :string
  end
end
