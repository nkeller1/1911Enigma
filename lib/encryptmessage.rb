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


end
