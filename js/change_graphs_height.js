setTimeout(function() {
  iframe = document.getElementById("results_frame");
  relHeight = iframe.offsetHeight;
  relHeight = (relHeight+10)+"px"
  document.querySelector("div.graphs_container").style.height = relHeight
}, 5000);