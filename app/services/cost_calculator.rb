class CostCalculator

    def initialize(sitting_request)
      @sitting_request = sitting_request
    end

    def calculate
        base_cost = 20
        total_cost = base_cost + (hourly_rate * get_total_hours)
    end

private
    def get_hourly_rate
        hourly_rate = @sitting_request.animal.hourly_cost
    end

    def get_total_hours
        time_in_seconds = @sitting_request.pickup - @sitting_request.drop_off
        (time_in_seconds.to_f / 60 / 60).ceil
    end

end