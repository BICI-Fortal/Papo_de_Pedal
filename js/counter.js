// Seleciona todos os elementos com a classe 'counter'
const counters = document.querySelectorAll('.info_counter');

counters.forEach(counter => {
    counter.innerText = '0'; // Define o início como 0

    const updateCounter = () => {
        // Lê o valor alvo da tag HTML
        const target = +counter.getAttribute('data-target');
        const speed = +counter.getAttribute('data-speed');
        // Lê o valor atual na tela
        const c = +counter.innerText;

        // Calcula o incremento (velocidade)
        const increment = target / speed; // Quanto menor o divisor, mais rápido

        if (c < target) {
            // Aumenta o número e arredonda para cima
            counter.innerText = `${Math.ceil(c + increment)}`;
            // Chama a função novamente após 1ms
            setTimeout(updateCounter, 1);
        } else {
            counter.innerText = target; // Garante que termine no valor exato
        }
    };

    updateCounter();
});
