document.addEventListener('DOMContentLoaded', function () {
  const select = document.getElementById('filtro');

  function getSelectedValues() {
    return Array.from(select.selectedOptions).map(o => o.value);
  }

  select.addEventListener('change', function () {
    const valores = getSelectedValues();
    console.log('Selecionados:', valores);
    
  });
})


function runfilter(){
  const select = document.getElementById('filtro');
  
  selected = Array.from(select.selectedOptions).map(o => o.value);
  
  console.log('Selecionado: ',selected[[0]])
  
  frame = document.getElementById('results_frame');
  src_link = '../edicoes/'+ selected + '/' + selected + '.html';
  frame.setAttribute('src',src_link);
  
}


