require 'rails_helper'

describe User do
  before { @user = User.new(name: "Chris Markel", email: "cmarkel5@gmail.com",
                            password: "foobar", password_confirmation: "foobar",
                            phone: "9999999999") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:phone) }

  it { should be_valid }

  describe "validations" do
    describe "name" do
      context "not present" do
        before { @user.name = " " }
        it { should_not be_valid }
      end

      context "too long" do
        before { @user.name = "a" * 41 }
        it { should_not be_valid }
      end

      context "too short" do
        before { @user.name = "a" }
        it { should_not be_valid }
      end
    end

    describe "email" do
      context "not present" do
        before { @user.email = " " }
        it { should_not be_valid }
      end

      context "too long" do
        before { @user.email = "a" * 41 }
        it { should_not be_valid }
      end

      context "too short" do
        before { @user.email = "a" }
        it { should_not be_valid }
      end

      context "correct format" do
        it "is valid" do
          addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
          addresses.each do |valid_address|
            @user.email = valid_address
            expect(@user).to be_valid
          end
        end
      end

      context "incorrect format" do
        it "is invalid" do
          addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                      foo@bar_baz.com foo@bar+baz.com]
          addresses.each do |invalid_address|
            @user.email = invalid_address
            expect(@user).to_not be_valid
          end
        end
      end

      context "when already taken" do
        before do
          user_with_same_email = @user.dup
          user_with_same_email.save
        end
        it { should_not be_valid }
      end
    end

    describe "password" do
      context "not present" do
        before { @user.password = @user.password_confirmation = " " }
        it { should_not be_valid }
      end

      context "doesn't match confirmation" do
        before { @user.password_confirmation = "mismatch" }
        it { should_not be_valid }
      end

      context "too short" do
        before { @user.password = @user.password_confirmation = "a" * 5 }
        it { should_not be_valid }
      end

      context "too long" do
        before { @user.password = @user.password_confirmation = "a" * 21 }
        it { should_not be_valid }
      end

      describe "return value of authenticate method" do
        before { @user.save }
        let(:found_user) { User.find_by(email: @user.email) }

        describe "with valid password" do
          it { should eq found_user.authenticate(@user.password) }
        end

        describe "with invalid password" do
          let(:user_for_invalid_password) { found_user.authenticate("invalid") }

          it { should_not eq user_for_invalid_password }
          specify { expect(user_for_invalid_password).to be_falsey }
        end
      end
    end

    describe "remember token" do
      before { @user.save }
      it { expect(@user.remember_token).not_to be_blank }
    end

    describe "phone" do
      context "not present" do
        before { @user.phone = " " }
        it { should_not be_valid }
      end
    end
  end
end
