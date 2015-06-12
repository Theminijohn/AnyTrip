module Fetcher
	class	Base

		def initialize(args)
			post_initialize(args)
		end

		def post_initialize(args)
			nil
		end

		def perform
			raise NotImplementedError
		end

		def fetch
      begin
        perform
      rescue StandardError => e
        raise FetchError, e
      end
    end

	end
end
