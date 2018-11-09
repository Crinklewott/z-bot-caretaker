#!/usr/bin/env ruby
require_relative 'crinkle_butt'
require_relative 'language'

# A caretaker bot extension
module CareTaker
  include Language

  # Gets a hash of all babs this CareTaker is watching, associated to
  # their CrinkleButt objects
  def babs
    @babs = {} if @babs.nil?
    @babs
  end

  # Babysits a user, a bot-exposed function that creates a CrinkleButt
  # object for the user this is supposed to babysit
  def bot_babysit(event, user)
    user_id = user[/\d+/].to_i

    if babs.key? user_id
      event.respond "#{bab_aww.capitalize}, this #{bab_name} wants " \
                    "#{bab_attention}"
    else
      babs[user_id] = create_bab(event, user_id)
      event.respond "#{bab_ok.capitalize} lets get you all cleaned up"
    end
  end

  # Creates a CrinkleButt object for the passed in user and event that
  # called #bab_check in this module
  def create_bab(event, user_id)
    CrinkleButt.new(event, user_id) do |bab|
      bab_check(bab)
    end
  end

  # Checks the bab passed in, and notices if their diaper needs attention
  def bab_check(bab)
    return if bab.user.idle?
    return unless bab.diaper > 10

    bab.message bab_notice.capitalize
    sleep 3
    bab.ping_message bab_diaper_full
    sleep rand(3..8)

    bab_request_change(bab)
  end

  # Requests that this bab be changed
  # TODO: Lock out all other bab change requests
  def bab_request_change(bab)
    bab.message 'Alright, time to get you changed!'
    bab.lock(&method(:bab_change))
    bab.diaper = 0
    bab.message 'There we go! All better!'
  end

  # The things that happen during a diaper change
  def bab_change(bab)
    bab.delay_message(
      3..8,
      "\\*peels off the tapes of #{bab.ping}'s diaper\\*",
      "\\*places another, clean diaper underneath #{bab.ping}\\*",
      "\\*tapes #{bab.ping} up\\*"
    )
  end
end
