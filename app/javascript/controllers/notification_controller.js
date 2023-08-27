// app/javascript/controllers/notification_controller.js
// import { Controller } from "stimulus";

// export default class extends Controller {
//   handleClick() {
//     const frameElement = this.element.closest("[data-turbo-frame]");
//     const notificationWindow = frameElement.querySelector(".notification-window");
    
//     // Fetch the notification content using Turbo Visit
//     fetch(this.data.get("url")).then(response => {
//       if (response.ok) {
//         response.text().then(content => {
//           notificationWindow.innerHTML = content;
//           // Optionally, you can add any additional logic to handle the notification window behavior.
//         });
//       }
//     });
//   }
// }

import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    const notificationToggle = this.element;
    const notificationWindow = document.querySelector(".notification-window");

    notificationToggle.addEventListener("click", function () {
      notificationWindow.toggleAttribute("hidden");
    });
  }
}