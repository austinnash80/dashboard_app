class AddPesNumberChangeToCoursesPe < ActiveRecord::Migration[6.1]
  def change
    add_column :courses_pes, :pes_number_change, :integer
  end
end
