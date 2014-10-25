require 'rails_helper'

describe StaticPagesController, :type => :controller do
  describe "welcome" do
    it "renders welcome" do
      get :welcome
      expect(response).to render_template(:welcome)
    end
  end
end