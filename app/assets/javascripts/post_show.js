


// document.addEventListener("DOMContentLoaded", () => {
//     console.log("DOM loaded");
//     // Your other code here
//     const csrfToken = document.querySelector("html").getAttribute("data-csrf-token");

//   });
  

// document.addEventListener("DOMContentLoaded", () => {
//   const likeButton = document.querySelector(".like-button");
//   const whiteIcon = document.querySelector(".white-icon");
//   const coloredIcon = document.querySelector(".colored-icon");
//   const likesCount = document.querySelector(".likes-count");
//   const postId = likeButton.getAttribute("data-post-id");


//   let isLiked = false; // Track the like state

//   const updateLikeState = async () => {
//     if (isLiked) {
//       // Handle unlike action
//       // Send AJAX request to unlike action in the controller
//       // Update likes count UI
//     //   likesCount.textContent = parseInt(likesCount.textContent) - 1;
//       coloredIcon.classList.add("hidden");
//       console.log('      coloredIcon.classList.add("hidden")      ')
//       whiteIcon.classList.remove("hidden");
//       console.log('       whiteIcon.classList.remove("hidden");      ')
//       await fetch(`/posts/${postId}/like`, {
//          method: 'POST',
//          headers: {
//             "Content-Type": "application/json",
//             'X-CSRF-Token': csrfToken
//          } });

//     } else {
//       // Handle like action
//       // Send AJAX request to like action in the controller
//       // Update likes count UI
//     //   likesCount.textContent = parseInt(likesCount.textContent) + 1;
//       whiteIcon.classList.add("hidden");
//       console.log('      whiteIcon.classList.add("hidden");      ')
//       coloredIcon.classList.remove("hidden");
//       console.log('      coloredIcon.classList.remove("hidden");      ')
//       await fetch(`/posts/${postId}/unlike`, {
//         method: 'POST',
//         headers: {
//            "Content-Type": "application/json",
//            'X-CSRF-Token': csrfToken
//         } });
//     }

//     isLiked = !isLiked; // Toggle like state
// };

//   whiteIcon.addEventListener("click", updateLikeState);
//   coloredIcon.addEventListener("click", updateLikeState);
// });
