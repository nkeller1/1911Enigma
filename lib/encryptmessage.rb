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
    letter_into_array = []
    letter_into_array << letter
    letter_into_array.each do |char|
      if alpha_with_index.include?(char)
        convert.push alpha_with_index[char]
      else
        convert.push(char)
      end
    end
    convert
  end

  def encrypt_single_letter(letter, shift)
    convert(letter).map do |number|
      if number.is_a?(String)
        number = number
      elsif number + shift >= 27
        combine = number += shift
        combine = combine % 27
        combine = alpha_with_index.key(combine)
      else
        number += shift
        number = alpha_with_index.key(number)
      end
    end.first
  end
end
