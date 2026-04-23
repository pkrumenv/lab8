require "test_helper"

class OwnerTest < ActiveSupport::TestCase
  def setup
    @owner = Owner.new(
      first_name: "John",
      last_name: "Doe",
      phone: "555-1234",
      email: "JOHN@EXAMPLE.COM"
    )
  end

  test "should be valid with all required attributes" do
    assert @owner.valid?
  end

  test "should require first_name" do
    @owner.first_name = nil
    assert_not @owner.valid?
    assert_includes @owner.errors[:first_name], "can't be blank"
  end

  test "should require a unique email" do
    @owner.save!
    duplicate_owner = @owner.dup
    duplicate_owner.email = "john@example.com" # Probando que también respete el case
    assert_not duplicate_owner.valid?
    assert_includes duplicate_owner.errors[:email], "has already been taken"
  end

  test "should require a valid email format" do
    @owner.email = "invalid_email"
    assert_not @owner.valid?
    assert_includes @owner.errors[:email], "is invalid"
  end

  test "callback normalizes email to lowercase and strips whitespace" do
    @owner.email = "   UPPERCASE@EXAMPLE.COM  "
    @owner.save
    assert_equal "uppercase@example.com", @owner.email
  end
end