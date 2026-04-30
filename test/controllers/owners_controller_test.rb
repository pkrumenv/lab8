require "test_helper"

class OwnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    # Cargamos el registro "one" desde test/fixtures/owners.yml
    @owner = owners(:one) 
  end

  test "should get index" do
    get owners_url
    assert_response :success
  end

  test "should get show" do
    get owner_url(@owner)
    assert_response :success
  end

  test "should create owner with valid params" do
    assert_difference("Owner.count", 1) do
      post owners_url, params: { owner: { first_name: "New", last_name: "Owner", email: "new@email.com", phone: "1234" } }
    end
    assert_redirected_to owner_url(Owner.last)
    assert_not_nil flash[:notice] # Verifica que haya un mensaje de éxito
  end

  test "should not create owner with invalid params" do
    assert_no_difference("Owner.count") do
      # Mandamos el first_name en blanco a propósito para que falle la validación
      post owners_url, params: { owner: { first_name: "", last_name: "Doe" } } 
    end
    assert_response :unprocessable_entity # Verifica que devuelva el status 422
  end

  test "should update owner with valid params" do
    patch owner_url(@owner), params: { owner: { first_name: "Updated Name" } }
    assert_redirected_to owner_url(@owner)
    assert_not_nil flash[:notice]
  end

  test "should destroy owner" do
    assert_difference("Owner.count", -1) do
      delete owner_url(@owner)
    end
    assert_redirected_to owners_url
    assert_not_nil flash[:notice]
  end
end