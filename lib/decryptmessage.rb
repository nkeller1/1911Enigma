require_relative 'alphabetconvertable'

class DecryptMessage
  include Aplhabetcovertable

  def decrypt_single_letter(letter, shift)
    convert(letter).map do |number|
      if number.is_a?(String)
        number = number
      elsif number + shift >= 27
        combine = number -= shift
        combine = combine % 27
        combine = alpha_with_index.key(combine)
      elsif number - shift < 0
        # less = (((-number - shift) / 2) + 1).abs
        less = (number - shift + 27).abs % 27
        # less = less + 27
        number = alpha_with_index.key(less)
      else
        number -= shift
        number = alpha_with_index.key(number)
      end
    end.first
  end
end
