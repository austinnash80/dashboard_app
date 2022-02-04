class CreateLicFixUploads < ActiveRecord::Migration[6.1]
  def change
    create_table :lic_fix_uploads do |t|
      t.integer :uid
      t.string :lic

      t.timestamps
    end
  end
end
