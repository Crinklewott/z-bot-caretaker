#!/usr/bin/env ruby
# Language that padded peeps can understand
module Language
  def bab_ok
    ['alright',
     'ok',
     'hee, alright',
     bab_aww].sample
  end

  def bab_aww
    ["a#{'w' * rand(10)}",
     "ahaha, a#{'w' * rand(10)}"].sample
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

  def bangs(num = 4)
    Array.new(rand(num)).map do |_|
      %w[? !].sample
    end.join
  end
end
