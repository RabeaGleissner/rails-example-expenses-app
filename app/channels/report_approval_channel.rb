class ReportApprovalChannel < ApplicationCable::Channel
  def subscribed
    stream_for "report_approvals"
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
