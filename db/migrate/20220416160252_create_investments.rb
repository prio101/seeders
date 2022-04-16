class CreateInvestments < ActiveRecord::Migration[6.0]
  def change
    create_table :investments do |t|
      t.string  :name
      t.string  :contact_email
      t.integer :amount
      t.references :campaign
      t.timestamps
    end
  end
end
