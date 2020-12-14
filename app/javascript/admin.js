function admin() {
  const admins = document.querySelectorAll(".admin-btn");
  admins.forEach(function (admin) {
    if (admin.getAttribute("data-load") != null) {
      return null;
    };
    admin.setAttribute("data-load", "true");
    admin.addEventListener("click", () => {
      const userId = admin.getAttribute("user-id");
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/users/${userId}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;          
        }
        const item = XHR.response.user;
        const prev = admin.parentNode.previousElementSibling;
        if (item.admin === true) {
          admin.setAttribute("user-admin", "true")
          admin.setAttribute("value", "管理者から外す")
          prev.innerHTML=`管理者`
        } else if (item.admin === false) {
          admin.setAttribute("user-admin", "false")
          admin.setAttribute("value", "管理者に変更")
          prev.innerHTML=``
        }
      };
    });
  });
}
setInterval(admin, 1000);