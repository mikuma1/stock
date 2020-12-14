function approval() {
  const approvals = document.querySelectorAll(".approval-btn");
  approvals.forEach(function (approval) {
    if (approval.getAttribute("data-load") != null) {
      return null;
    };
    approval.setAttribute("data-load", "true");
    approval.addEventListener("click", () => {
      const parent = approval.parentNode;
      const consumptionId = parent.getAttribute("id");
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/consumptions/${consumptionId}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;
        }
        parent.innerHTML=`承認済`
      };
    });
  });
}
setInterval(approval, 1000);