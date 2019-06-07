# frozen_string_literal: true

module PeriodPresenter
  def period_name
    if same_year
      "#{I18n.l(starts_at, format: :month_name)} - #{I18n.l(ends_at, format: :month_name_and_year)}"
    else
      "#{I18n.l(starts_at, format: :month_name_and_year)} - #{I18n.l(ends_at, format: :month_name_and_year)}"
    end
  end
end
