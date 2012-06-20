require 'spec_helper'

describe "tweets/edit" do
  before(:each) do
    @tweet = assign(:tweet, stub_model(Tweet,
      :tweet_id => "MyString",
      :text => "MyString"
    ))
  end

  it "renders the edit tweet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tweets_path(@tweet), :method => "post" do
      assert_select "input#tweet_tweet_id", :name => "tweet[tweet_id]"
      assert_select "input#tweet_text", :name => "tweet[text]"
    end
  end
end
