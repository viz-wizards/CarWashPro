document.addEventListener("DOMContentLoaded", function () {
  const imagen = document.getElementById("imagen-animada");

  function estaEnPantalla(elemento) {
    const rect = elemento.getBoundingClientRect();
    return (
      rect.top < window.innerHeight && rect.bottom > 0
    );
  }

  function manejarScroll() {
    if (estaEnPantalla(imagen)) {
      imagen.classList.add("animate__animated", "animate__backInRight");
    } else {
      imagen.classList.remove("animate__backInRight");
    }
  }

  document.addEventListener("scroll", manejarScroll);
});

  document.addEventListener("DOMContentLoaded", function () {
  const elementos = document.querySelectorAll(".animar-texto");

  const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add("animate__backInLeft"); 
        observer.unobserve(entry.target); // Solo se anima una vez
      }
    });
  }, {
    threshold: 0.1
  });

  elementos.forEach(el => observer.observe(el));
});



document.addEventListener("DOMContentLoaded", function () {
  const navLinks = document.querySelectorAll(".nav-link");
  const navbarCollapse = document.getElementById("navbarNav");

  navLinks.forEach(link => {
    link.addEventListener("click", () => {
      if (navbarCollapse.classList.contains("show")) {
        const bsCollapse = new bootstrap.Collapse(navbarCollapse, {
          toggle: true
        });
        bsCollapse.hide();
      }
    });
  });
});


document.addEventListener("DOMContentLoaded", function () {
  const cards = [
    { element: document.getElementById("cardIzq"), animation: "animate__backInLeft" },
    { element: document.getElementById("cardCent"), animation: "animate__slideInDown" },
    { element: document.getElementById("cardDerc"), animation: "animate__backInRight" },
  ];

  const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        //   card que corresponde al elemento visible OJITO CON ESTO
        const card = cards.find(c => c.element === entry.target);
        if (card) {
          card.element.classList.add("animate__animated", card.animation);
          observer.unobserve(card.element);
        }
      }
    });
  }, {
    threshold: 0.1,
    rootMargin: "0px 0px -100px 0px"
  });

  cards.forEach(c => {
    if (c.element) observer.observe(c.element);
  });
});



// apara ocultar el navbar
let lastScrollTop = 0;
const navbar = document.querySelector('.navbar');

window.addEventListener('scroll', function () {
  const scrollTop = window.pageYOffset || document.documentElement.scrollTop;

  if (scrollTop > lastScrollTop) {
    // Scroll hacia abajo => ocultar navbar
    navbar.style.top = '-80px'; // ajusta este valor según la altura de tu navbar
  } else {
    // Scroll hacia arriba => mostrar navbar
    navbar.style.top = '0';
  }

  lastScrollTop = scrollTop <= 0 ? 0 : scrollTop;
});
