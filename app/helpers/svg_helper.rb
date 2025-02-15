module SvgHelper
  def text_wrap(text, max_line_length: 25)
    text.split.each_with_object([ "" ]) do |word, lines|
      if (lines.last + word).length <= max_line_length
        lines[-1] += word + " "
      else
        lines << word + " "
      end
    end.map(&:rstrip)
  end
end
