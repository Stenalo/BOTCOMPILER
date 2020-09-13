class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.string :message
      t.string :string

      t.timestamps
    end
  end
end
