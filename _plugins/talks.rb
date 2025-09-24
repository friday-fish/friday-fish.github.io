module Jekyll
  module DateFilter
    def in_future(input)
      today = Time.now
      input.select {|item| item.date >= today }      
    end
    def in_past(input)
      today = Time.now
      input.select {|item| item.date < today }
    end
  end
end

Liquid::Template.register_filter(Jekyll::DateFilter)
