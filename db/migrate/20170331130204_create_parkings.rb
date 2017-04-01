class CreateParkings < ActiveRecord::Migration[5.0]
  def change
    create_table :parkings do |t|
      t.string :parking_type  # 费率类型: guest, short-term, long-term

      t.datetime :start_at    # 开始时间

      t.datetime :end_at      # 结束时间

      t.integer :amount       # 总金额(分)

      t.integer :user_id, :index => true
      t.timestamps
    end
  end
end
