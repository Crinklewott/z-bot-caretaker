#!/usr/bin/env ruby

# A watcher and state class for all you silly babs
class CrinkleButt
  attr_reader :watcher, :noticed, :restrained
  attr_accessor :diaper

  # Creates a CrinkleButt and attaches a watcher thread that will call
  # the passed in block at least once an hour
  #
  # This block will be passed this bab object to do things like
  # checks, or interacting with the user attached to it in various
  # ways
  def initialize(event, bab_id, &block)
    @bab_id = bab_id.to_i
    @event = event
    @diaper = 0
    @bladder = 0
    @continence = 0
    @watcher = make_watcher(&block)
  end

  # Retreives the user on this server who is attached to this
  # CrinkleButt object
  def user
    @event.channel.users.find do |user|
      user.id == @bab_id
    end
  end

  # Messages the user this CrinkleButt object is for
  def message(text)
    @event.respond text
  end

  # Returns a string that will ping the attached user
  def ping
    "<@#{@bab_id}>"
  end

  # Messages the user this CrinkleButt object is for, except with a
  # ping!
  def ping_message(text)
    @event.respond "#{ping}: #{text}"
  end

  # Outputs a stream of messages, all with a random delay between them
  # according to the range passed in
  def delay_message(delay, *messages)
    messages.each do |message|
      message(message)
      sleep(rand delay)
    end
  end

  # Locks this user to a specific role (Default 'Restrained'), yields
  # to the passed-in block, and then restores the user to the roles
  # from before
  def lock(restrained = get_role('Restrained'), normal = get_role('Normal'))
    user.remove_role normal
    user.add_role restrained
    yield self
    user.remove_role restrained
    user.add_role normal
  end

  private

  # Creates a watcher thread for this CrinkleButt that updates this
  # thread at least once an hour, and then calls the passed in block
  # with this object
  def make_watcher
    Thread.new do
      loop do
        sleep rand(60 * 60)
        update
        yield self
      end
    end
  end

  # What happens as time passes for this CrinkleButt?
  def update
    if rand(@continence) < @bladder && rand(2).zero?
      how_bad = rand(@bladder)
      @diaper += how_bad
      @bladder -= how_bad
    end

    @bladder += 1
  end

  # Fetches a role from this CrinkleButt's server by name
  def get_role(name)
    @event.server.roles.find do |role|
      role.name == name
    end
  end
end
