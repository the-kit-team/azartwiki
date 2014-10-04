# A sample Guardfile
# More info at https://github.com/guard/guard#readme
notification :terminal_notifier, subtitle: 'Azartwiki'

group :specs do
  guard :rubocop, all_on_start: false, cli: ['--format', 'clang', '--rails'] do
    watch 'config.ru'
    watch 'Rakefile'
    watch 'Gemfile'
    watch 'Guardfile'
    watch(/.+\.(rb|rake)$/)
    watch(/(?:.+\/)?\.rubocop\.yml$/) { |m| File.dirname(m[0]) }
  end

  guard :rspec, cmd: 'COVERAGE=true bin/spring rspec' do
    watch(/^spec\/.+_spec\.rb$/)        { 'spec' }
    watch('spec/spec_helper.rb')        { 'spec' }
    watch(%r{^spec/support/(.+)\.rb$/}) { 'spec' }

    # Rails
    watch('app/controllers/application_controller.rb') { 'spec' }
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
end

guard :bundler do
  watch 'Gemfile'
end

guard :migrate do
  watch(%r{^db/migrate/(\d+).+\.rb})
  watch('db/seeds.rb')
end

# Update brawser page if view updated
guard :livereload do
  watch(%r{app(/views/.+\.(erb|haml))$}) { |m| m[1] }
  watch(%r{app/helpers/.+\.rb})
  watch(/public\/.+\.(css|js|html)/)
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/.+\.(css|js|html|png|jpg).*)}) { |m| m[2] }
end

guard :shell do
  watch(/.+/) do |m|
    require 'json'
    coveraged = JSON.parse(IO.read 'tmp/coverage/.last_run.json')['result']['covered_percent']
    message = coveraged > 90 ? :success : :failed
    n "#{m[0]} changed", sprintf('Middle coverage is %.1f%', coveraged), message
  end
  watch(/.+/) do
    not_commited_files = `git status -s`.split("\n").count
    not_commited_lines = `git diff --shortstat`
    not_commited_lines = not_commited_lines ? not_commited_lines.scan(/\d+/).last(2).map(&:to_i).inject(:+) : 0
    type = not_commited_files < 10 && not_commited_lines < 60 ? :notify : :failed
    message = "Not committed - files: #{not_commited_files}; lines: #{not_commited_lines}"
    n message, 'git status', type: type
  end
end
