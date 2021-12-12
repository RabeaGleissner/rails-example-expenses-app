import consumer from "./consumer";

const initReportApprovalCable = () => {
  const approvalContainers = document.querySelectorAll("#approval-container");
  if (approvalContainers) {
    const ids = [...approvalContainers].map((container) => container.dataset);

    consumer.subscriptions.create(
      { channel: "ReportApprovalChannel" },
      {
        received(data) {
          const approvedId = data.split(" ")[1];

          const elementToChange = [...approvalContainers].find((container) => {
            return container.dataset.expenseReportApprovalId === approvedId;
          });
          elementToChange.innerText = "YES";
        },
      }
    );
  }
};

export { initReportApprovalCable };
