require 'rails_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_title('Sign up') }
  end

  describe "signup" do
    before { visit signup_path }
    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "does not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Chris Markel"
        fill_in "Email",        with: "cmarkel5@gmail.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
        fill_in "Phone",        with: "9999999999"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'cmarkel5@gmail.com') }

        it { should have_link('Sign out') }
        it { should have_title(user.name) }
      end

      describe "followed by signout" do
        before do
          click_button submit
          click_link "Sign out"
        end
        
        it { should have_link('Sign in') }
      end
    end
  end
end