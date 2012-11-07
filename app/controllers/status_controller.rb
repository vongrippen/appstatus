class StatusController < ApplicationController

  def index
    @services = Service.all
    @service_status = 'service-up'
    @services.each do |s|
      if @service_status != 'service-down'
        if s.status == 'down'
          @service_status = 'service-down'
        elsif s.status == 'warning'
          @service_status = 'service-warning'
        end
      end
    end
    @message = Message.last
  end
end
