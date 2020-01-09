class CipherKey

  def seperate_to_pairs(key = nil)
    if key == nil
      @code_key = rand(10000..99999)
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
