# app/models/event.rb
class Event < ApplicationRecord
  scope :in_date_range, ->(start_date, end_date) {
    where("start_time >= :start_date AND start_time <= :end_date", start_date: start_date, end_date: end_date)
  }
   validate :end_time_after_start_time
   
   private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    if end_time <= start_time
      errors.add(:end_time, "終了時刻は開始時刻よりも後に設定してください")
    end
  end
end
