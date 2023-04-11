require_relative 'lib/gpt_analysis.rb'

# Define the file types to analyze
file_types = ['.rb', 'erb']
# Sometimes it's a README fix, or something like that - which isn't relevant for
# including in a project's CHANGELOG for example
declared_trivial = github.pr_title.include? "#trivial"

# Analyze each modified file
git.modified_files.each do |file|
  # Only analyze files with specified file types
  next unless file_types.include?(File.extname(file))
  # Read the file contents
  code = File.read(file)
  # Analyze the code using the GPT-based AI tool
  issues = analyze_code(code)
  message "#{issues}"
  if issues.present?
    # Display a warning message for any detected issues
    message "Potential issues detected by GPT-based AI model in #{file}:\n#{issues.join('\n')}"
  end
end

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn "PR is classed as Work in Progress" if github.pr_title.include? "[WIP]"

# Warn when there is a big PR
warn("Big PR") if git.lines_of_code > 50

# Don't let testing shortcuts get into master by accident
fail("fdescribe left in tests") if `grep -r fdescribe specs/ `.length > 1
fail("fit left in tests") if `grep -r fit specs/ `.length > 1

message = 'Please include a summary in your pull request description.'
# Check if the pull request description includes a summary
unless github.pr_body.include?('# Summary')
  fail message
end

if github.pr_json["requested_reviewers"].empty?
  fail "The pull request doesn't include any code review requests. Please make sure to request code reviews from at least one team member."
end
