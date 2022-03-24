class WebhookRequestsController < ApplicationController
  def index
    @webhook_requests = WebhookRequest.order(created_at: :desc)
  end

  def create
    @webhook_request = WebhookRequest.create!(
      request_method: request.method,
      original_url: request.original_url,
      headers: request.headers.select { |k, _| k.starts_with?("HTTP_") }.to_h,
      raw_post: request.raw_post
    )
  end

  def delete_all
    WebhookRequest.delete_all
    Turbo::StreamsChannel.broadcast_remove_to(:webhook_requests, targets: "[id^=webhook_request_")

    redirect_to root_path, notice: "All Webhook Requests successfully deleted"
  end
end
