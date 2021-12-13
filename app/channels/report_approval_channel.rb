class ReportApprovalChannel < ApplicationCable::Channel
  def subscribed
    stream_for "report_approvals"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
