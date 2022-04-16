class CreateInvestments < ActiveRecord::Migration[6.0]
  def change
    create_table :investments do |t|
      t.string  :name
      t.string  :contact_email
      t.integer :amount_in_pence
      t.references :campaign
      t.timestamps
    end
  end
end
