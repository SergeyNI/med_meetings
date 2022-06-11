class AddColumnCommentToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :comment, :string
  end
end
