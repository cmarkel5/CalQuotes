require 'rails_helper' 

describe Quote do
  let(:user) { FactoryGirl.create(:user) }
  before { @quote = user.quotes.create(content: "Amateur doesn't mean rookie") }

  subject { @quote }

  it { should respond_to(:content) }
  it { should respond_to(:ihq_id) }
  it { should respond_to(:source) }
  it { should respond_to(:user_id) }

  describe "validations" do
    describe "content" do
      describe "not present" do
        before { @quote.content = " "}
        it { should_not be_valid }
      end
    end

    describe "source" do
      describe "not present" do
        before { @quote.source = " "}
        it { should_not be_valid }
      end
    end

    describe "ihq_id" do
      describe "not present" do
        before { @quote.ihq_id = " "}
        it { should_not be_valid }
      end
    end

    describe "user_id" do
      describe "not present" do
        before { @quote.user_id = " "}
        it { should_not be_valid }
      end
    end
  end
end
