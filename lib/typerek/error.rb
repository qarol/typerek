# frozen_string_literal: true

module Typerek
  class Error < StandardError; end

  class MatchAlreadyStartedError < Error; end

  class MatchNotFoundError < Error; end

  class UserNotFoundError < Error; end
end
