#!/usr/bin/env ruby
# Language that padded peeps can understand
module Language
  def bab_ok
    ['alright',
     'ok',
     'hee, alright',
     bab_aww].sample
  end

  def bab_there_we_go
    ['there we go',
     bab_ok].sample
  end

  def bab_aww
    ["aw#{'w' * rand(10)}",
     "ahaha, aw#{'w' * rand(10)}"].sample
  end

  def bab_butt
    %w[bum butt bottom tushie tooshie toosh tush].sample
  end

  def bab_new
    ['fresh',
     'new',
     'brand spanking new',
     'clean'].sample
  end

  def bab_name
    ["cutie #{%w[wootie patootie].sample}",
     "crinkle#{bab_butt}",
     'bab'].sample
  end

  def bab_attention
    ['to play',
     'attention',
     "to remind everyone who's a soggy #{bab_name}"].sample
  end

  def bab_notice
    ['wait...',
     'oh!',
     "what's this?",
     ':eyes:'].sample
  end

  def bab_wet
    %w[wet pee soak soil].sample
  end

  def bab_pants
    ['your pants', 'yourself', 'your diaper'].sample
  end

  def bab_diaper_full
    ["did you just #{bab_wet} #{bab_pants}?",
     "you're soaking"].sample + bangs
  end

  def bab_encourage
    ['it suits you!',
     "you look #{['adorable', 'really cute'].sample}!",
     'I like this look!'].sample
  end

  def bab_diaper_change
    ['get you changed',
     'clean you up',
     "change your #{['diaper', bab_butt].sample}"].sample
  end

  def bab_come
    ['come over here!',
     'this way!'].sample
  end

  def bab_clean_diaper
    bab_encourage if rand(5).zero?

    ['all better!',
     "now you're all cleaned up!",
     'a fresh new diaper!',
     'all clean!',
     "doesn't that #{%w[smell feel].sample} much #{%w[better nicer].sample}?",
     "you sure do #{bab_wet} #{bab_pants} a lot"].sample
  end

  # The diaper changing process

  def bab_remove_tapes(bab)
    ["peels off the tapes of #{bab}'s diaper",
     "removes #{bab}'s tapes",
     "slips off the tapes on #{bab}'s diaper"].sample
  end

  def bab_cleaning(bab)
    ["wipes down #{bab} with a fresh baby wipe",
     "grabs a wipe, and cleans up #{bab}",
     "pulls up #{bab}'s legs and starts wiping that #{bab_butt} down"].sample
  end

  def bab_diaper_underneath(bab)
    ["places a clean diaper underneath #{bab}",
     "swaddles #{bab} with a #{bab_new} diaper"].sample
  end

  def bab_tape_up(bab)
    ["tapes #{bab} up",
     'pins both sides of the diaper, and attatches the tapes nice and snug',
     "pulls up both wings of #{bab}'s diaper, and attaches them tightly"].sample
  end

  def bangs(num = 4)
    Array.new(rand(num)).map do |_|
      %w[? !].sample
    end.join
  end
end
