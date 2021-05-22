class FixColumnNameEmpireMasterNyList < ActiveRecord::Migration[6.1]
  def change
    rename_column :empire_master_ny_lists, :issue_date, :iss_date
  end
end
