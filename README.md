# Sed ruby wrapper

Wrapper for the Linux shell command `sed`.

## How to use it

    Sed::Runner.new(<file_path>, [opts]) do |s|
      s.replace(<expresion>, <replacement>)
      s.replace(<expresion>, <replacement>)
      s.replace(<expresion>, <replacement>)
    end

## Options

The following options are currently supported

* output: <output_file_path>, default is `nil`, if `nil` the replacement will be _in place_
* ere: {true|false}, default is `false`. Activate _extended regular expresssions_

## Examples

    Sed::Runner.new(
      '/tmp/input.txt', 
      :output => '/tmp/output.txt', 
      :ere    => true
    ) do |s|
      s.replace("[aeiou]", "x")
      s.replace("\s", "-")
    end
    
## License

MIT License. (c) 2011 Fernando Guillen (http://fernandoguillen.info).

Built as a project for The Ruby Mendicant University, S7-E1.
