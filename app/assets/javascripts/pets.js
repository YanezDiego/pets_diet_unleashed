// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(() => {
  clickHandler();
  submitPet();
})

const clickHandler = () =>{
  $(".js-moreInfo").on('click', function(){
    let id = $(this).data("id")
    $.get("/pets/" + id + ".json", function(pet){
      let newPet = new Pet(pet)
      $("#right-side").html("")
      let petHTML = newPet.showPet(newPet)
      $("#right-side").append(petHTML)
    })
  })
}

const submitPet = () => {
  $('form').submit(function(e){
    e.preventDefault()

    let values = $(this).serialize();

    let posting = $.post('/pets', values)
    posting.done(function(data){
      let pet = data
      $("#petName").text(pet["name"])
      $("#petSpecies").text(pet["species"])
    })
  })
}


// Possible feature
// const nextHandler = () => {
//   $("#js-next").on("click", function(e){
//     e.preventDefault()
//
//   })
// }


function Pet(pet){
  this.id = pet.id
  this.name = pet.name
  this.species = pet.species
  this.user = pet.user
  this.diets = pet.diets
}


Pet.prototype.showPet = function(){
  let petHTML = `
          <h3 id="petName">${this.name}</h3>
          <h3 id="petSpecies"> Species: ${this.species}</h3>
          <a href="/pets/${this.id}">See Even More Info.</a>

          `
  return petHTML
}
