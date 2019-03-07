# frozen_string_literal: true

# == Schema Information
#
# Table name: comprehension_options
#
#  id                        :bigint(8)        not null, primary key
#  content                   :string(255)
#  type                      :integer
#  comprehension_question_id :bigint(8)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

require "test_helper"

describe ComprehensionOption do
  let(:comprehension_option) { ComprehensionOption.new }

  it "must be valid" do
    value(comprehension_option).must_be :valid?
  end
end
