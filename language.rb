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

  def bab_name
    ["cutie #{%w[wootie patootie].sample}",
     "crinkle#{%w[butt bottom tushie tooshie toosh tush].sample}",
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
     "what's this?"].sample
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
     "change your #{%w[diaper bum tooshie].sample}"].sample
  end

  def bab_clean_diaper
    ['all better!',
     "now you're all cleaned up!",
     'a fresh new diaper!',
     'all clean!',
     "doesn't that #{%w[smell feel].sample} much #{%w[better nicer].sample}?",
     "you sure do #{bab_wet} #{bab_pants} a lot"].sample
  end

  def bangs(num = 4)
    Array.new(rand(num)).map do |_|
      %w[? !].sample
    end.join
  end
end
