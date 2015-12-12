module Lita
  module Handlers
    class Circletime < Handler
      # insert handler code here

      route(/^build today/, :today)
      route(/^build yestaday/, :yestaday)
      route(/^build week/, :week)
      route(/^build month/, :month)

      Lita.register_handler(self)
    end
  end
end
