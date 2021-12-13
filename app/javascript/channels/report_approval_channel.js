import consumer from "./consumer";

const initReportApprovalCable = () => {
  console.log("working!");

  consumer.subscriptions.create(
    { channel: "ReportApprovalChannel" },
    {
      received(data) {
        console.log(data);
      },
    }
  );
};

export { initReportApprovalCable };
