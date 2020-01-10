class EncryptMessage
  def alphabet
    ("a".."z").to_a << " "
  end

  def alpha_with_index
    index_placement = alphabet.map.with_index do |letter, position|
      {letter => position}
    end
    index_placement.reduce({}, :merge)
  end

  def convert(letter)
    convert = []
    letter_array = []
    letter_array << letter
    letter_array.each do |char|
      if alpha_with_index.include?(char)
        convert.push alpha_with_index[char]
      else
        convert.push(char)
      end
    end
    convert
  end
end
