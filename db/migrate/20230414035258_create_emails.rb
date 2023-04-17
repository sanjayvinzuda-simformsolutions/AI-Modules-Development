class CreateEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :emails do |t|
      t.string :received
      t.string :description
      t.string :tonality
      
      t.timestamps
    end
  end
end
