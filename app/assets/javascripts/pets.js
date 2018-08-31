// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(() => {
  clickHandler();
})

const clickHandler = () =>{
  $(".js-moreInfo").on('click', function(){
    let id = $(this).data("id")
    $.get("/pets/" + id + ".json", function(pet){
      let newPet = new Pet(pet)
      let petHTML = newPet.showPet(newPet)
      $("#right-side").append(petHTML)
    })
  })
}

function Pet(pet){
  this.id = pet.id
  this.name = pet.name
  this.species = pet.species
  this.user = pet.user
  this.diets = pet.diets
}


Pet.prototype.showPet = function(){
  let petHTML = `<div>
          <h3>${this.name}</h3>
          <h5> Species: ${this.species}</h5>
          </div>`
  return petHTML
}









// `
// <div class="diet-<%= pet.id %>"></div>
//
// // $(".dog-show").append(`
//   <% @current_user.pets.dog.each do |dog| %>
//   <%= dog.name %>
//   <% end %>
//   `)
