require 'jekyll'
require 'icalendar'
require 'time'
require 'securerandom'

module Jekyll
  class ICalendarGenerator < Jekyll::Generator
    def make_calendar(site, config)
      cal = Icalendar::Calendar.new

      site.collections['talks'].docs.each do |talk|
        cal.event do |e|
          date = talk.data["talk_date"]
          if date.is_a?(String)
            date = Date.parse(date)
          end
          if date < Date.today
            next
          end
          e.uid = SecureRandom.uuid
          start_time = Time.parse(date.iso8601 + " " + talk.data["start_time"])
          end_time = Time.parse(date.iso8601 + " " + talk.data["end_time"])
          e.dtstart = start_time
          e.dtend = end_time
          e.summary = talk.data['speaker'] + ": " + talk.data['title']
          e.description = talk.data['abstract']
          e.url = talk.data['redirectURL']
        end
      end
      
      cal
    end

    def generate(site)
      calendar = make_calendar site, {}

      PageWithoutAFile.new(site, __dir__, "", "calendar.ics").tap do |file|
        file.content = calendar.to_ical
        site.pages << file
      end
    end
  end
end
