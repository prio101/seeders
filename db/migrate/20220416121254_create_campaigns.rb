class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string  :name
      t.string  :image_url
      t.decimal :target_amount
      t.decimal :amount_raised
      t.string  :sector
      t.string  :country
      
      t.timestamps
    end
  end
end
