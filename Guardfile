# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :rubocop, all_on_start: false, cli: ['--format', 'clang', '--rails'] do
  watch('config.ru')
  watch('Rakefile')
  watch('Gemfile')
  watch(%r{.+\.rb$})
  watch(%r{.+\.rake$})
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end

guard :rspec do
  watch(%r{^spec/.+_spec\.rb$})
  watch('spec/spec_helper.rb')                       { 'spec' }
  watch(%r{^spec/support/(.+)\.rb$})                 { 'spec' }
  watch(%r{^lib/(.+)\.rb$})                          { |m| "spec/lib/#{m[1]}_spec.rb" }

  # Rails
  watch('config/routes.rb')                          { 'spec/routing' }
  watch('app/controllers/application_controller.rb') { 'spec/controllers' }
  watch(%r{^app/(.+)\.rb$})                          { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$})         { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$}) do |m|
    [ "spec/routing/#{m[1]}_routing_spec.rb",
      "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
      "spec/acceptance/#{m[1]}_spec.rb"]
  end

  # FactoryGirl
  watch('spec/factories.rb') { 'spec' }

  # Capybara features specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml|slim)$}) { |m| "spec/features/#{m[1]}_spec.rb" }

  # Turnip features and steps
  watch(%r{^spec/acceptance/(.+)\.feature$})
  watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$}) do |m|
    Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance'
  end
end
