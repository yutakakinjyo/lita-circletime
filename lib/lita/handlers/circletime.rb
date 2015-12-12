module Lita
  module Handlers
    class Circletime < Handler

      route(/^build\s+(.+)/, :set)
      route(/^build today/, :today)
      route(/^build yestaday/, :yestaday)
      route(/^build week/, :week)
      route(/^build month/, :month)

      def set(response)
        @org = response.match_data[1]
      end

      def today(response)
        build_time = CircleTime::BuildTime.new(@org)
        response.reply("today's buil time is " + (build_time / 1000/ 60 ) + " min")
      end

      Lita.register_handler(self)
    end
  end
end
