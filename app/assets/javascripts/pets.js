// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(() => {
  clickHandler();
})

const clickHandler = () =>{
  $(".js-moreInfo").on('click', function(){
    let id = $(this).data("id")
    $.get("/pets/" + id + ".json", function(data){
      console.log(data)
    })
  })
}


function Pet(id, name, species, user_id){
  this.id = data["id"]
  this.name = data["name"]
  this.species = data["species"]
  this.user_id = data["user_id"]
}



// $(".dog-show").append(`
//   <% @current_user.pets.dog.each do |dog| %>
//   <%= dog.name %>
//   <% end %>
//   `)
