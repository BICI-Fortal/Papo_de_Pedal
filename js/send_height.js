
(function () {
  function getContentHeight() {
    return Math.max(
      document.body.scrollHeight,
      document.body.offsetHeight,
      //document.documentElement.scrollHeight,
      document.documentElement.offsetHeight
    );
  }

  function sendHeightToParent() {
    const height = getContentHeight();

    window.parent.postMessage(
      {
        type: "resize-iframe",
        height: height
      },
      "*" // idealmente troque pelo domínio exato do sitepai
    );
  }

  // envia ao carregar
  window.addEventListener("load", sendHeightToParent);

  // envia ao redimensionar janela
  //window.addEventListener("resize", sendHeightToParent);

  // observa mudanças no conteúdo
  const observer = new MutationObserver(() => {
    sendHeightToParent();
  });

  observer.observe(document.body, {
    childList: true,
    subtree: true,
    attributes: true,
    characterData: true
  });
  
  setTimeout(sendHeightToParent, 500);
  setTimeout(sendHeightToParent, 1000);
  setTimeout(sendHeightToParent, 1500);
  setTimeout(sendHeightToParent, 2500);
  setTimeout(sendHeightToParent, 5000);

  // opcional: enviar periodicamente se houver conteúdo muito dinâmico
  // setInterval(sendHeightToParent, 500);
})();