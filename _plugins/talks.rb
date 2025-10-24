module Jekyll
  module DateFilter
    def in_future(input)
      today = Date.today
      input.select do |item|
        date = item.talk_date
        if date.is_a?(String)
          date = Date.parse(date)
        end
        date >= today
      end
    end
    def in_past(input)
      today = Date.today
      input.select do |item|
        date = item.talk_date
        if date.is_a?(String)
          date = Date.parse(date)
        end
        date < today
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::DateFilter)
