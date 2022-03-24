class CreateWebhookRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :webhook_requests do |t|
      t.integer :request_method, null: false
      t.string :original_url
      t.jsonb :headers, default: "{}"
      t.text :raw_post

      t.timestamps
    end
  end
end
