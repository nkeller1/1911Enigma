class CipherKey

  def code_key
    @code_key
  end

  def seperate_to_pairs(key = nil)
    if key == nil
      @code_key = rand(10000..99999)
    elsif key != nil && key.length != 5
      return "ERROR: ENTER A 5 DIGIT KEY TO CONTINUE"
    else
      @code_key = key
    end
    numbers = @code_key.to_s.split(//)
    numbers.reduce({}) do |pair, number|
      pair[:a] = numbers[0..1].join.to_i
      pair[:b] = numbers[1..2].join.to_i
      pair[:c] = numbers[2..3].join.to_i
      pair[:d] = numbers[3..4].join.to_i

      pair
    end
  end
end
