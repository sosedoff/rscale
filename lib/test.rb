require 'rscale'

RScale.configure do |c|
  c.root = '/home/dan/Temp/imagescale'
  c.public = c.root + '/public'
end

RScale.format :company do |f|
  f.style :small, :size => '75x55'
  f.style :medium, :size => '310x218'
  f.style :large, :size => '635x444'
end

# ------------------------------------------------------------------------------

image = RScale.image_for :company, '/home/dan/Temp/imagescale/input/purple_chicago_skylineresized2.jpg'