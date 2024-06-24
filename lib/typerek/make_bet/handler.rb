# frozen_string_literal: true

module Typerek
  module MakeBet
    class Handler
      def initialize(match_id:, user_id:, result:)
        @match_id = match_id
        @user_id = user_id
        @result = result
      end

      def call
        raise MatchNotFoundError, 'Mecz nie został znaleziony.' unless match
        raise UserNotFoundError, 'Użytkownik nie został znaleziony.' unless user
        raise MatchAlreadyStartedError, 'Mecz już się rozpoczął.' if match.started?

        answer = match.answers.find_or_initialize_by(user_id: user.id)
        answer.update(result: @result)
      rescue ArgumentError
        raise Error, 'Nieprawidłowy typ.'
      end

      private

      def match
        @match ||= Match.find_by(id: @match_id)
      end

      def user
        @user ||= User.find_by(id: @user_id)
      end
    end
  end
end
