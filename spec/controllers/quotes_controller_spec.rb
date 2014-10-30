require 'rails_helper'

describe QuotesController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user, no_capybara: true }

  describe "POST create" do
    context "valid attributes" do
      it "saves quote" do
        expect{
          post :create, quote: FactoryGirl.attributes_for(:quote, user_id: user.id)
        }.to change(Quote, :count).by(1)
      end

      it "redirects to :show" do
        post :create, quote: FactoryGirl.attributes_for(:quote, user_id: user.id)
        last_quote = Quote.last
        expect(response).to redirect_to(user_path(last_quote.user.id))
      end
    end
  end
end

