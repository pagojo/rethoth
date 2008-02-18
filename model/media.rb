#--
# Copyright (c) 2008 Ryan Grove <ryan@wonko.com>
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

class Media < Sequel::Model(:media)
  include Ramaze::LinkHelper
  
  set_schema do
    primary_key :id
    
    varchar  :filename,   :null => false, :unique => true
    varchar  :mimetype,   :null => false
    datetime :created_at, :null => false
    datetime :updated_at, :null => false
  end
  
  before_create do
    self.created_at = Time.now
  end
  
  before_destroy do
    FileUtils.rm(path)
  end

  before_save do
    self.updated_at = Time.now
  end

  def created_at(format = nil)
    if new?
      format ? Time.now.strftime(format) : Time.now
    else
      format ? self[:created_at].strftime(format) : self[:created_at]
    end
  end
  
  def filename=(filename)
    self[:filename] = filename.strip unless filename.nil?
  end
  
  # Absolute path to this file.
  def path
    Riposte::Config.media/filename[0].chr.downcase/filename
  end
  
  def updated_at(format = nil)
    if new?
      format ? Time.now.strftime(format) : Time.now
    else
      format ? self[:updated_at].strftime(format) : self[:updated_at]
    end
  end

  # URL for this file.
  def url
    Riposte::Config.site.url.chomp('/') + R(MediaController, filename)
  end
end

Media.create_table unless Media.table_exists?
