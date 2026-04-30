require "test_helper"

class PetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # Cargamos una mascota de prueba desde test/fixtures/pets.yml
    @pet = pets(:one)
    # Necesitamos el ID de un dueño válido para poder crear una mascota nueva
    @owner = owners(:one)
  end

  test "should get index" do
    get pets_url
    assert_response :success
  end

  test "should get show" do
    get pet_url(@pet)
    assert_response :success
  end

  test "should create pet with valid params" do
    assert_difference("Pet.count", 1) do
      # Enviamos datos válidos, incluyendo el owner_id
      post pets_url, params: { 
        pet: { 
          name: "Buddy", 
          species: "Dog", 
          breed: "Golden Retriever", 
          weight: 25.5, 
          date_of_birth: "2023-01-15",
          owner_id: @owner.id 
        } 
      }
    end
    assert_redirected_to pet_url(Pet.last)
    assert_not_nil flash[:notice]
  end

  test "should not create pet with invalid params" do
    assert_no_difference("Pet.count") do
      # Mandamos el nombre en blanco a propósito para simular un error de validación
      post pets_url, params: { pet: { name: "", species: "Dog", owner_id: @owner.id } }
    end
    assert_response :unprocessable_entity
  end

  test "should update pet with valid params" do
    patch pet_url(@pet), params: { pet: { weight: 30.0 } }
    assert_redirected_to pet_url(@pet)
    assert_not_nil flash[:notice]
  end

  test "should destroy pet" do
    assert_difference("Pet.count", -1) do
      delete pet_url(@pet)
    end
    assert_redirected_to pets_url
    assert_not_nil flash[:notice]
  end
end