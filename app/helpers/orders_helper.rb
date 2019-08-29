require "date"

module OrdersHelper
  def delivery_date_list
    delivery_date_list = []
    (3..14).each do |interval|
      d = Date.today + interval
      delivery_date_list << d.strftime('%Y-%m-%d (%a)') unless d.saturday? || d.sunday?
    end
    delivery_date_list
  end

  def delivery_timezone_select_options
    ['8-12', '12-14', '14-16', '16-18', '18-20', '20-21']
  end
end
