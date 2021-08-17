class AddLinkToEmpireState < ActiveRecord::Migration[6.1]
  def change
    add_column :empire_states, :link, :string
  end
end
