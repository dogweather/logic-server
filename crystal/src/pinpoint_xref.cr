module PinpointXref
  extend self

  def add_pinpoint(html : String) : String
    html
      .gsub(
        /">article (\d+)<\/a>, paragraph (\d+)/,
        "#\\2\">article \\1, paragraph \\2</a>"
      )
  end
end
