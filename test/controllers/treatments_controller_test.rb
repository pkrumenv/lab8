require "test_helper"

class TreatmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appointment = appointments(:one)
    @treatment = treatments(:one)
  end

  # No evaluamos index ni show porque Treatments no los tiene

  test "should create treatment with valid params" do
    assert_difference("Treatment.count", 1) do
      # Fíjate cómo la URL necesita el objeto @appointment
      post appointment_treatments_url(@appointment), params: { treatment: { name: "Antibiotic", administered_at: Time.current } }
    end
    assert_redirected_to appointment_url(@appointment) # Redirige al padre
    assert_not_nil flash[:notice]
  end

  test "should not create treatment with invalid params" do
    assert_no_difference("Treatment.count") do
      post appointment_treatments_url(@appointment), params: { treatment: { name: "" } }
    end
    assert_response :unprocessable_entity
  end

  test "should update treatment with valid params" do
    # La URL de edit/update/destroy necesita ambos objetos
    patch appointment_treatment_url(@appointment, @treatment), params: { treatment: { notes: "Updated note" } }
    assert_redirected_to appointment_url(@appointment)
    assert_not_nil flash[:notice]
  end

  test "should destroy treatment" do
    assert_difference("Treatment.count", -1) do
      delete appointment_treatment_url(@appointment, @treatment)
    end
    assert_redirected_to appointment_url(@appointment)
    assert_not_nil flash[:notice]
  end
end