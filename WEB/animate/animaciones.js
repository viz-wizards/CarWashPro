document.addEventListener("DOMContentLoaded", function () {
    const imagen = document.getElementById("imagen-animada");
  
    const observer = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          imagen.classList.add("animate__backInLeft"); 
          observer.unobserve(imagen); // Solo se ejecuta una vez
        }
      });
    }, {
      threshold: 0.5 
    });
  
    observer.observe(imagen);
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
    threshold: 0.3
  });

  elementos.forEach(el => observer.observe(el));
});
