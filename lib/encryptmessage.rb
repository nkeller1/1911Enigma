require_relative 'alphabetconvertable'

class EncryptMessage
  include Aplhabetcovertable

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
