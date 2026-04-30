require "test_helper"

class VetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vet = vets(:one)
  end

  test "should get index" do
    get vets_url
    assert_response :success
  end

  test "should get show" do
    get vet_url(@vet)
    assert_response :success
  end

  test "should create vet with valid params" do
    assert_difference("Vet.count", 1) do
      post vets_url, params: { 
        vet: { 
          first_name: "Dr. John", 
          last_name: "Dolittle", 
          specialization: "Exotics", 
          email: "john@vetclinic.com", 
          phone: "555-9999" 
        } 
      }
    end
    assert_redirected_to vet_url(Vet.last)
    assert_not_nil flash[:notice]
  end

  test "should not create vet with invalid params" do
    assert_no_difference("Vet.count") do
      # Mandamos el nombre en blanco asumiendo que tienes una validación presence: true
      post vets_url, params: { vet: { first_name: "", last_name: "Smith" } }
    end
    assert_response :unprocessable_entity
  end

  test "should update vet with valid params" do
    patch vet_url(@vet), params: { vet: { specialization: "Surgery" } }
    assert_redirected_to vet_url(@vet)
    assert_not_nil flash[:notice]
  end

  test "should destroy vet" do
    assert_difference("Vet.count", -1) do
      delete vet_url(@vet)
    end
    assert_redirected_to vets_url
    assert_not_nil flash[:notice]
  end
end