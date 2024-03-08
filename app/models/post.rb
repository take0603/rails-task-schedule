class Post < ApplicationRecord
  validates :title, presence: true, length: {maximum: 20}
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :memo, length: {maximum: 500}

  validate :end_date_not_backdate

  def end_date_not_backdate
    errors.add(:end_date, "は開始日以降の日付を選択してください") if self.end_date != nil && self.end_date < self.start_date
  end

end
