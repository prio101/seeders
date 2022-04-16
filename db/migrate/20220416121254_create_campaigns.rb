class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string  :name
      t.string  :image_url
      t.integer :target_amount_in_pence, limit: 8
      t.integer :amount_raised_in_pence, limit: 8
      t.string  :sector
      t.string  :country
      
      t.timestamps
    end
  end
end
