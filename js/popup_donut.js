const tooltip = document.createElement("div");
tooltip.className = "tooltip";
document.body.appendChild(tooltip);

document.querySelectorAll(".donut").forEach(el => {

  el.addEventListener("mouseenter", e => {
    const label = el.dataset.label;
    const value = el.dataset.value;

    tooltip.innerHTML = `<b>${label}</b><br>${value}`;
    tooltip.style.opacity = 1;
  });

  el.addEventListener("mousemove", e => {
    tooltip.style.left = e.clientX + "px";
    tooltip.style.top  = e.clientY + "px";
  });

  el.addEventListener("mouseleave", () => {
    tooltip.style.opacity = 0;
  });

});
