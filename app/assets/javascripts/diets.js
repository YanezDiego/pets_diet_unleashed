// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(() => {
  console.log('diets attached');
  dietClickHandler();
})

const dietClickHandler = () => {
  $(".all-diets").on('click', function(e){
    e.preventDefault()
    history.pushState(null, null, "diets")
    fetch(`/diets.json`)
      .then((res) => res.json())
      .then(diets => {
        $("#body-display").html('')
        diets.forEach(diet => {
          let newDiet = new Diet(diet)

          let dietHTML = newDiet.renderDiets(newDiet)

          $("#body-display").append(dietHTML)
        })
      })
  })
}

function Diet(diet){
  this.id = diet.id
  this.name = diet.name
  this.pet = diet.pet
  this.food = diet.food
}

Diet.prototype.renderDiets = function(){
  let dietHTML = `
    <h3>${this.name}</h3>
  `
  return dietHTML
}
