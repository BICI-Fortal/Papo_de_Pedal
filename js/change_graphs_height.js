
//const iframe = document.getElementById("results_frame");

function change_graphs_container(h) {
    graphs = document.querySelector("div.graphs_container");
    if (graphs) {
    graphs.style.height = h + "px";
  }
  }

window.addEventListener("message", function (event) {
  // segurança: valide a origem
  if (
    event.data &&
    event.data.type === "resize-iframe" &&
    typeof event.data.height === "number"
  ) {
    //iframe.style.height = (event.data.height + 5) + "px";
    //graphs.style.height = (event.data.height + 5) + "px";
    change_graphs_container(event.data.height+5)
  }
});
