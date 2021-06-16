class CreateCannedResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :canned_responses do |t|
      t.string :company
      t.string :des
      t.string :state
      t.text :questions
      t.text :answer
      t.text :notes

      t.timestamps
    end
  end
end
