module Sed
  module Commander
    
    extend self
    
    def replace(input_file_path, expression, replacement, opts = {})
      command = "sed #{argv(input_file_path, expression, replacement, opts)}"
      result  = Kernel.system command
    end
    
    def argv(input_file_path, expression, replacement, opts = {})
      result = []
      
      if opts[:output].nil?
        result << "-i ''"  if Sed::Util.osx?
        result << "-i"     if Sed::Util.gnu?
      end

      if opts[:ere]
        result << "-E"  if Sed::Util.osx?
        result << "-r"  if Sed::Util.gnu?
      end
      
      result << "'s/#{expression}/#{replacement}/g'"
      result << "'#{input_file_path}'"
      
      if opts[:output]
        result << "> '#{opts[:output]}'"
      end
      
      result.join(' ')
    end
    
  end
end