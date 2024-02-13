window.addEventListener("blur", function () {
  window.location.href = "triche.php";
});
document.addEventListener('DOMContentLoaded', function() {
    var nom = window.location.pathname;
    nom = nom.split("/");
    nom = nom[nom.length - 1];
    nom = nom.substr(0, nom.lastIndexOf("."));
    nom = nom.replace(new RegExp("(%20|_|-)", "g"), "");
  const progressBar = document.getElementById('progress');
  const timeDisplay = document.getElementById('time');
  const totalTime = 15 * 60; 
  let currentTime = getSavedTime() || 0;
  let currentPage = sessionStorage.getItem('currentPage') || window.location.href;

  const updateProgressBar = () => {
    const progressPercentage = (currentTime / totalTime) * 100;
    progressBar.style.width = `${progressPercentage}%`;
  };

  const updateDisplayTime = () => {
    const minutes = Math.floor(currentTime / 60);
    const seconds = currentTime % 60;
    const formattedTime = `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
    timeDisplay.textContent = formattedTime;
  };

  const updateProgressAndTime = () => {
    updateProgressBar();
    updateDisplayTime();
    saveTime();
  };

  const incrementTime = () => {
    if (currentPage !== window.location.href) {
      currentTime = 0;
      currentPage = window.location.href;
      sessionStorage.setItem('currentPage', currentPage);
    }

    if (currentTime < totalTime) {
      currentTime++;
      updateProgressAndTime();
    }
  };

  setInterval(incrementTime, 1000);

  function saveTime() {
    document.cookie = `lastTimerHTML${nom}=${currentTime}; expires=Sun, 31 Dec 2034 12:00:00 UTC; path=/`;
  }

  function getSavedTime() {
    const cookieValue = document.cookie
      .split('; ')
      .find(row => row.startsWith(`lastTimerHTML${nom}=`))
      ?.split('=')[1];
    return cookieValue ? parseInt(cookieValue, 10) : null;
  }
});

var blinkInterval;
var isMouseInside = false;

function showNotification() {
    document.getElementById('message').style.display = 'none';
}

function hideNotification() {
    document.getElementById('message').style.display = 'flex';
}

$(document).on('mouseenter', 'html', function () {
    isMouseInside = true;
    setTimeout(function () {
        if (isMouseInside) {
            showNotification();
        }
    }, 100);
});

$(document).on('mouseleave', 'html', function () {
    isMouseInside = false;
    clearInterval(blinkInterval);
    hideNotification();
});
