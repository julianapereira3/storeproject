class AddIdDepartmentToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :id_department, :integer
  end
end
