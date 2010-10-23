# -----------------------------------------------------------------------------
# 
# Geography helpers
# 
# -----------------------------------------------------------------------------
# Copyright 2010 Daniel Azuma
# 
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
# 
# * Redistributions of source code must retain the above copyright notice,
#   this list of conditions and the following disclaimer.
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
# * Neither the name of the copyright holder, nor the names of any other
#   contributors to this software, may be used to endorse or promote products
#   derived from this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
# -----------------------------------------------------------------------------
;


module RGeo
  
  module Geography
    
    module Common
      
      
      # This is an internal module used by Geography. You generally should
      # not need to call these methods directly.
      
      module Helper
        
        
        RADIANS_PER_DEGREE = ::Math::PI/180.0
        DEGREES_PER_RADIAN = 180.0/::Math::PI
        
        
        @basic_factory = false
        
        
        def self.factory
          if @basic_factory == false
            if Geos.supported?
              @basic_factory = Geos.factory(:srid => 0)
            else
              @basic_factory = nil
            end
          end
          @basic_factory
        end
        
        
        def self.parse_wkt(str_, factory_)
          helper_factory_ = self.factory
          obj_ = helper_factory_ ? helper_factory_.parse_wkt(str_) : nil
          obj_ ? factory_.cast(obj_) : nil
        end
        
        
        def self.parse_wkb(str_, factory_)
          helper_factory_ = self.factory
          obj_ = helper_factory_ ? helper_factory_.parse_wkb(str_) : nil
          obj_ ? factory_.cast(obj_) : nil
        end
        
        
        def self.unparse_wkt(obj_)
          helper_factory_ = self.factory
          helper_factory_ ? helper_factory_.cast(obj_).as_text : nil
        end
        
        
        def self.unparse_wkb(obj_)
          helper_factory_ = self.factory
          helper_factory_ ? helper_factory_.cast(obj_).as_binary : nil
        end
        
        
      end
      
      
    end
    
  end
  
end