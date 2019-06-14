require "test_helper"

describe ExamsController do
  it "should get index" do
    get exams_index_url
    value(response).must_be :success?
  end

end
