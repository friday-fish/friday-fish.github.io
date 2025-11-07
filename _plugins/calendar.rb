require 'jekyll'
require 'icalendar'
require 'time'
require 'tzinfo'
require 'securerandom'

module Jekyll
  class ICalendarGenerator < Jekyll::Generator
    def make_calendar(site, config)
      cal = Icalendar::Calendar.new

      upcoming_talks = site.collections['talks'].docs.select do |talk|
        date = talk.data["talk_date"]
        if date.is_a?(String)
          date = Date.parse(date)
        end
        date >= Date.today
      end
      upcoming_talks.each do |talk|
        cal.event do |e|
          date = talk.data["talk_date"]
          if date.is_a?(String)
            date = Date.parse(date)
          end
          e.uid = SecureRandom.uuid
          zone = TZInfo::Timezone.get("Europe/Amsterdam")
          start_hour, start_min = talk.data["start_time"].split(":").map(&:to_i)
          end_hour, end_min = talk.data["end_time"].split(":").map(&:to_i)
          start_time = zone.local_time(date.year, date.month, date.day, start_hour, start_min, 0)
          end_time = zone.local_time(date.year, date.month, date.day, end_hour, end_min, 0)
          e.dtstart = start_time
          e.dtend = end_time
          e.summary = talk.data['speaker'] + ": " + talk.data['title']
          e.description = talk.data['abstract']
          e.location = talk.data['location']
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
