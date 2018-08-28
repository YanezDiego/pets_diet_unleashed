


add nested form for or create new food.
auto associated to a species for food.



[x] Models and Association

1. User
  name
  username
  password

  has_many pets

2. Pets
  name
  species

  user_id

  belongs_to user

  has_many diets
  has_many foods through diets

3. Food
  name(brand)

  has_many pets through diets
  has_many diets

4. Diet (joint-table for food and pets)
  name of diet

  belongs to food
  belongs to pet

  pet_id
  food_id


  --- What My APP Should Do ---
  Authenticate Users through GitHub(for now)
[X]  A user can create/login to it's profile.
[X]    users/new <= Sign up

        Switch User#Show (pets info) => Pets#index for user to see all it's pets

[X]    login route
      get '/login' => sessions#new
      post '/login' => sessions#create
      get '/logout' => sessions#destroy


[X]    User can see his/her pets list and add pets

      pets has show - edit - delete pages


  User can add pets to its profile
      users/1/pets/ (shows all the pets associated to that user.)
      users/1/pets/new (renders pets#new form to add pet(s))
      users/1/pets/pets_id (individual pet with food diet.)
