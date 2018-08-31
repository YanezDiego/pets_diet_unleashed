// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(() => {
  dietClickHandler();
})

const dietClickHandler = () => {
  $(".all-diets").on('click', function(e){
    e.preventDefault()
    history.pushState(null, null, "diets")
    fetch(`/diets`)
      .then((res) => res.json())
      .then(diets => {
        $("#body-display").html('')
        diets.forEach(diet => {
          console.log(diet)
        })
      })
  })
}

function Diet(diet){
  this.id = diet.id
  this.name = diet.name
  this.food = diet.food
}
