# frozen_string_literal: true

# == Schema Information
#
# Table name: periods
#
#  id           :bigint(8)        not null, primary key
#  starts_at    :date
#  ends_at      :date
#  editorial_id :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#


class Period < ApplicationRecord
  include PeriodPresenter

  has_one :editorial

  scope :actual_period, -> {
    where("current_time >= starts_at AND :current_time <= ends_at", current_time: Time.current)
  }

  def same_year
    starts_at.year == ends_at.year
  end
end
