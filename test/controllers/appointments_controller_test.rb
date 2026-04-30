require "test_helper"

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appointment = appointments(:one)
    # Necesitamos estos objetos para asociarlos al crear una nueva cita
    @pet = pets(:one)
    @vet = vets(:one)
  end

  test "should get index" do
    get appointments_url
    assert_response :success
  end

  test "should get show" do
    get appointment_url(@appointment)
    assert_response :success
  end

  test "should create appointment with valid params" do
    assert_difference("Appointment.count", 1) do
      post appointments_url, params: { 
        appointment: { 
          date: 3.days.from_now, 
          reason: "Vaccination", 
          status: "scheduled",
          pet_id: @pet.id,
          vet_id: @vet.id
        } 
      }
    end
    assert_redirected_to appointment_url(Appointment.last)
    assert_not_nil flash[:notice]
  end

  test "should not create appointment with invalid params" do
    assert_no_difference("Appointment.count") do
      # Mandamos la razón en blanco para provocar el error de validación
      post appointments_url, params: { 
        appointment: { 
          reason: "", 
          pet_id: @pet.id, 
          vet_id: @vet.id 
        } 
      }
    end
    assert_response :unprocessable_entity
  end

  test "should update appointment with valid params" do
    patch appointment_url(@appointment), params: { appointment: { status: "completed" } }
    assert_redirected_to appointment_url(@appointment)
    assert_not_nil flash[:notice]
  end

  test "should destroy appointment" do
    assert_difference("Appointment.count", -1) do
      delete appointment_url(@appointment)
    end
    assert_redirected_to appointments_url
    assert_not_nil flash[:notice]
  end
end