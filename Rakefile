#--
# Copyright (c) 2017 John Pagonis <john@pagonis.org>
# Copyright (c) 2010 Ryan Grove <ryan@wonko.com>
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#   * Redistributions of source code must retain the above copyright notice,
#     this list of conditions and the following disclaimer.
#   * Redistributions in binary form must reproduce the above copyright notice,
#     this list of conditions and the following disclaimer in the documentation
#     and/or other materials provided with the distribution.
#   * Neither the name of this project nor the names of its contributors may be
#     used to endorse or promote products derived from this software without
#     specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#++

# Prepend the Thoth /lib directory to the include path if it's not there
# already.
$:.unshift(File.join(File.dirname(__FILE__), 'lib'))
$:.uniq!

require 'find'
require 'rubygems/package_task'
require 'rdoc/task'
require 'thoth/version'

# Don't include resource forks in tarballs on Mac OS X.
ENV['COPY_EXTENDED_ATTRIBUTES_DISABLE'] = 'true'
ENV['COPYFILE_DISABLE'] = 'true'

# Gemspec for Thoth
thoth_gemspec = Gem::Specification.new do |s|
  s.name     = 'rethoth'
  s.version  = Thoth::APP_VERSION
  s.authors  = Thoth::APP_AUTHORS
  s.email    = Thoth::APP_EMAIL
  s.homepage = Thoth::APP_URL
  s.platform = Gem::Platform::RUBY
  s.summary  = 'A simple to understand, run and maintain Ruby blogging engine.'
  s.description = <<-EOF
    Rethoth is a simple to understand, run and maintain Ruby blogging engine

    Rethoth is written in Ruby and is based on the Ramaze web framework and the Sequel database toolkit. 
    Rethoth is a modern port, to 2017, of the original Thoth created by @ryangrove.
    
    Rethoth demonstrates how to easily build a useful MVC-style app in Ruby without having to deal directly with meta-programming and DSL magic.
    
    Rethoth is an example of how to build a web application in Ruby without the need to learn Rails and ActiveRecord.
    
    Rethoth is ideal for newcomers to Ruby who have experience with other web frameworks and want to quickly appreciate the language and become productive with it.
  EOF
  
  s.files        = FileList['{bin,lib}/**/*', 'LICENSE'].to_a
  s.executables  = ['thoth']
  s.require_path = 'lib'
  
  s.license = 'BSD-3-Clause'

  s.required_ruby_version = '>= 2.3.0'

  # Runtime dependencies.
  s.add_dependency('ramaze',    '~> 2012.12', '>= 2012.12.08')
  s.add_dependency('innate',    '~> 2015.10', '>= 2015.10.28')
  s.add_dependency('builder',   '~> 3.2', '>= 3.2.2')
  s.add_dependency('cssmin',    '~> 1.0', '>= 1.0.3')
  s.add_dependency('erubis',    '~> 2.7', '>= 2.7.0')
  s.add_dependency('json_pure', '~> 2.0', '>= 2.0.2')
  s.add_dependency('jsmin',     '~> 1.0', '>= 1.0.1')
  s.add_dependency('RedCloth',  '~> 4.3', '>= 4.3.2')
  s.add_dependency('sanitize',  '~> 4.4', '>= 4.4.0')
  s.add_dependency('sequel',    '~> 4.42', '>= 4.42.0')

  # Development dependencies.
  s.add_development_dependency('bacon', '~> 1.2', '>=1.2.0')
  s.add_development_dependency('rake',  '~> 12.0','>=12.0.0')

  s.post_install_message = <<POST_INSTALL
================================================================================
Thank you for installing Rethoth. If you haven't already, you may need to install
one or more of the following gems:

  sqlite3      - If you want to use Rethoth with a SQLite database
  mysql2       - If you want to use Rethoth with a MySQL database
  passenger    - If you want to run Rethoth under Apache using Phusion Passenger
  thin         - If you want to run Rethoth using Thin
================================================================================
POST_INSTALL
end

# This will create the Rake tasks :gem and :package
# see https://github.com/rubygems/rubygems/blob/master/lib/rubygems/package_task.rb
Gem::PackageTask.new(thoth_gemspec) do |pkg|
  pkg.need_tar_gz = true
end

RDoc::Task.new do |rd|
  rd.main     = 'Thoth'
  rd.title    = 'Thoth'
  rd.rdoc_dir = 'doc'

  rd.rdoc_files.include('lib/**/*.rb')
end

task :default => [:test]

task :test do
  sh 'bacon -a'
end

desc "install Rethoth"
task :install => :gem do
  sh "gem install pkg/rethoth-#{Thoth::APP_VERSION}.gem"
end

desc "remove end-of-line whitespace"
task 'strip-spaces' do
  Dir['lib/**/*.{css,js,rb,rhtml,sample}'].each do |file|
    next if file =~ /^\./

    original = File.readlines(file)
    stripped = original.dup

    original.each_with_index do |line, i|
      if line =~ /\s+\n/
        puts "fixing #{file}:#{i + 1}"
        p line
        stripped[i] = line.rstrip
      end
    end

    unless stripped == original
      File.open(file, 'w') do |f|
        stripped.each {|line| f.puts(line) }
      end
    end
  end
end
