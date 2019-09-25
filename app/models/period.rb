# frozen_string_literal: true

# == Schema Information
#
# Table name: periods
#
#  id           :bigint           not null, primary key
#  starts_at    :date
#  ends_at      :date
#  editorial_id :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Period < ApplicationRecord
  include PeriodPresenter

  belongs_to :editorial

  scope :actual_period, lambda {
    where('current_time  AND :current_time <= ends_at', current_time: Time.current)[0]
  }

  def same_year
    starts_at.year == ends_at.year
  end
end
