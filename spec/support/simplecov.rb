if ENV['COVERAGE']
  require 'simplecov'

  SimpleCov.start :rails do
    coverage_dir 'tmp/coverage'
    minimum_coverage 90
    maximum_coverage_drop 1

    add_group 'Long files' do |src_file|
      src_file.lines.count > 100
    end
  end
end
