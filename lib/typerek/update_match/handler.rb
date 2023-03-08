# frozen_string_literal: true

module Typerek
  module UpdateMatch
    class Handler
      def initialize(match_id:, attributes: {})
        @match_id = match_id
        @attributes = attributes.symbolize_keys
      end

      def call
        raise MatchNotFoundError, "Mecz nie został znaleziony." unless match

        match.update(@attributes)
      end

      private

      def match
        @match ||= Match.find_by(id: @match_id)
      end
    end
  end
end
