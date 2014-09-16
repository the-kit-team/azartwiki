# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :rubocop, all_on_start: false, cli: ['--format', 'clang', '--rails'] do
  watch 'config.ru'
  watch 'Rakefile'
  watch 'Gemfile'
  watch 'Guardfile'
  watch(/.+\.(rb|rake)$/)
  watch(/(?:.+\/)?\.rubocop\.yml$/) { |m| File.dirname(m[0]) }
end

guard :bundler do
  watch 'Gemfile'
end

guard :migrate do
  watch(%r{^db/migrate/(\d+).+\.rb})
  watch('db/seeds.rb')
end

guard :rspec, cmd: 'bin/rspec' do
  watch(/^spec\/.+_spec\.rb$/)        { 'spec' }
  watch('spec/spec_helper.rb')        { 'spec' }
  watch(%r{^spec/support/(.+)\.rb$/}) { 'spec' }

  # Rails
  watch('config/routes.rb')           { 'spec/routing' }
  watch(/^app\/(.+)\.rb$/)            { |m| "spec/#{m[1]}_spec.rb" }
  watch(/^app\/(.*)(\.erb|\.haml)$/)  { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$}) do |m|
    [
      "spec/routing/#{m[1]}_routing_spec.rb",
      "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
      "spec/acceptance/#{m[1]}_spec.rb"
    ]
  end

  # FactoryGirl
  watch('spec/factories.rb') { 'spec' }

  # Capybara features specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$}) { |m| "spec/features/#{m[1]}_spec.rb" }
end

# Update brawser page if view updated
guard :livereload do
  watch(%r{app/views/.+\.(erb|haml)$})
  watch(%r{app/helpers/.+\.rb})
  watch(/public\/.+\.(css|js|html)/)
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
end

guard :shell do
  watch(/.+/) { `git status -s` }
end
