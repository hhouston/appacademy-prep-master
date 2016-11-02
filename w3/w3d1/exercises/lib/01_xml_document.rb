require 'byebug'

class XmlDocument
  attr_reader :indention_length

  def initialize(indention=false)
    @indention = indention
    @indention_length = 0
  end

  def method_missing(method_name, *attrs, &blk)
    attrs = attrs.first || {}
    render_tag(method_name, attrs, &blk)
  end

  def newline
    if indention == true
      "\n"
    else
      ""
    end
  end

  def indent
    if indention == true
      @indention_length += 1
    end
  end

  def unindent
    if indention == true
      @indention_length -= 1
    end
  end

  def tabspace
    "  " * indention_length
  end

  def attr_strings(attrs)
    # attrs.map do |key, value|
    #   "#{key}=\"#{value}\""
    # end
    attrs.map { |key, val| "#{key}=\"#{val}\"" }

  end

  def tag_body(method_name, attrs)
    ([method_name] + attr_strings(attrs)).join(" ")
  end

  def opening_tag(method_name, attrs)
    "#{tabspace}<#{tag_body(method_name, attrs)}>#{newline}"
  end

  def closing_tag(method_name)
    "#{tabspace}</#{method_name}>#{newline}"
  end

  def solo_tag(method_name, attrs)
    "#{tabspace}<#{tag_body(method_name, attrs)}/>#{newline}"
  end

  def render_tag(method_name, attrs, &blk)
    xml = ""
    if block_given?
      xml << opening_tag(method_name, attrs)
      indent
      xml << blk.call
      unindent
      xml << closing_tag(method_name)
    else
      xml << solo_tag(method_name, attrs)
    end
  end


end

@xml = XmlDocument.new(true)

xml_string =
    @xml.hello do
      @xml.goodbye do
        @xml.come_back do
          @xml.ok_fine(:be => "that way")
        end
      end
    end

p xml_string

