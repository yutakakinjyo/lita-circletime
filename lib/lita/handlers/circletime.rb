module Lita
  module Handlers
    class Circletime < Handler

      route(/^build today$/, :today)
      route(/^build yestaday$/, :yestaday)
      route(/^build week$/, :week)
      route(/^build month$/, :month)
      route(/^org\s+(.+)/, :set)

      def set(response)
        org = response.match_data[1]
        redis.set("org", org)
        response.reply("set " + org + " to org name")
      end

      def today(response)
        build_time = CircleTime::BuildTime.new(redis.get("org"))
        response.reply("today's buil time is " + (build_time.today / 1000/ 60 ).to_s + " min")
      end

      def yestaday(response)
        build_time = CircleTime::BuildTime.new(redis.get("org"))
        response.reply("today's buil time is " + (build_time.yestaday / 1000/ 60 ).to_s + " min")
      end

      def week(response)
        build_time = CircleTime::BuildTime.new(redis.get("org"))
        response.reply("today's buil time is " + (build_time.week / 1000/ 60 ).to_s + " min")
      end

      def month(response)
        build_time = CircleTime::BuildTime.new(redis.get("org"))
        response.reply("today's buil time is " + (build_time.month / 1000/ 60 ).to_s + " min")
      end

      Lita.register_handler(self)
    end
  end
end
