module Jekyll
  module DateFilter
    def in_future(input)
      today = Date.today
      input.select {|item| item.talk_date >= today }      
    end
    def in_past(input)
      today = Date.today
      input.select {|item| item.talk_date < today }
    end
  end
end

Liquid::Template.register_filter(Jekyll::DateFilter)
