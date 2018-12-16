class Timecard < ApplicationRecord
     belongs_to :user
     
     validates :year, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
     validates :month , numericality: { only_integer: true, greater_than_or_equal_to: 1 }
     validates :day , numericality: { only_integer: true, greater_than_or_equal_to: 1 }
     validates :remark , length: { maximum: 30 }
     validate :leaving_time_is_later_than_arrival_time

     # 指定年月のタイムカードを取得する
    def self.monthly(user,year,month)
   
      self.where("user_id = ? and year = ? and month = ?", user.id, year, month).all
    end
    
    private
         # カスタムバリデーション（退社時間が出社時間より後か？）
        def leaving_time_is_later_than_arrival_time
          return if leaving_time.nil? || arrival_time.nil?
    
          if arrival_time > leaving_time
            errors[:base] << '退社時間は、出社時間より後の時間である必要があります'
          end
        end
end