require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'report_builder'

namespace :test do
  Cucumber::Rake::Task.new(:features) do |t|
    t.profile = 'default'
    at_exit { Rake::Task['test:report_builder'].invoke }
  end

  desc 'Rake task to build report'
  task :report_builder, %i[json_path report_path] do |_t, args|
    args.with_defaults(json_path: nil, report_path: 'test_report', color: 'cyan', report_title: 'Mobile Hubbub Automation')
    options = { json_path: args.json_path, report_path: args.report_path, color: args.color, report_title: args.report_title }
    ReportBuilder.build_report options
  end
end
