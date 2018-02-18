require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    def setup
        @user = User.create(lname: "surname",
                            fname: "given",
                            email: "test@test.edu",
                            thumbnail: "thumb.png")
    end

    test "user must be valid" do
        assert @user.valid?
    end

    test "last name must be present" do
        @user.lname = ""
        assert_not @user.valid?
    end

    test "first name must be present" do
        @user.fname = ""
        assert_not @user.valid?
    end

    test "email must be present" do
        @user.email = ""
        assert_not @user.valid?
    end

    test "email must be unique" do
        @newuser = User.create(lname: "new_surname",
                               fname: "new_given",
                               email: "test@test.edu",
                               thumbnail: "thumb2.png")
        assert_not @newuser.valid?
    end
end
