module DietsHelper


def food_select
  if @diet.pet.species == 'cat'
    Food.cat_food
  else
    Food.dog_food
   end
end


end
