//Al cargar la pagina, obtener todos los elementos
document.addEventListener("DOMContentLoaded", function () {
  cargarTodo();
});

//Funcion para cargar los elementos

function cargarTodo() {
  fetch("/api/elementos")
    .then((response) => {
      if (!response.ok) {
        throw new Error("Error en la respuesta del servidor");
      }
      return response.json();
    })
    .then((elementos) => {
      construirTabla(elementos);
    })
    .catch((error) => {
      console.error("Error: ", error);
      document.getElementById("tabla").innerHTML =
        'p class="error">Error al cargar los elementos</p>';
    });
}
