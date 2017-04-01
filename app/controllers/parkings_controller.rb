class ParkingsController < ApplicationController
  # Step1: 显示开始停车的表单
  def new
    @parking = Parking.new
  end

  # Step2: 新建一笔停车，纪录下开始时间
  def create
    @parking = Parking.new( :start_at => Time.now )

    # 有登入的话，根据用户选的费率。没有登入的话，指定是 guest 费率
    if current_user
      @parking.parking_type = params[:parking][:parking_type]
      @parking.user = current_user
    else
      @parking.parking_type = "guest"
    end
    @parking.save!
    redirect_to parking_path(@parking)
  end

  # Step3: 如果还没结束，显示结束停车的表单
  # Step5: 如果已经结束，显示停车费用。
  def show
    @parking = Parking.find(params[:id])
  end

  # Step4: 结束一笔停车，记录下结束时间，并且计算停车费
  def update
    @parking = Parking.find(params[:id])
    @parking.end_at = Time.now
    @parking.calculate_amount

    @parking.save!

    redirect_to parking_path(@parking)
 end
end
