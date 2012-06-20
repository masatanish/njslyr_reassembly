require 'spec_helper'

describe "tweets/index" do
  before(:each) do
    assign(:tweets, [
      stub_model(Tweet,
        :tweet_id => "Tweet",
        :text => "Text"
      ),
      stub_model(Tweet,
        :tweet_id => "Tweet",
        :text => "Text"
      )
    ])
  end

  it "renders a list of tweets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tweet".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
