class WebhookRequest < ApplicationRecord
  enum :request_method, ActionDispatch::Request::HTTP_METHODS

  after_create_commit -> { broadcast_prepend_to :webhook_requests }

  def parsed_raw_post
    JSON.parse(raw_post)
  rescue
    raw_post
  end
end
