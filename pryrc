Pry.config.theme = 'pry-modern-256'

Pry.config.prompt = [
  proc { |obj, nest_level, _| "(#{obj}):#{nest_level} > " },
  proc { |obj, nest_level, _| "(#{obj}):#{nest_level} * " }
]
