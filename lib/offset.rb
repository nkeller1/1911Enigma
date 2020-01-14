class Offset

  def generate_date
    Time.now.strftime("%d%m%y")
  end

  def offset_seperated(date = nil)
    last_four =
    if date == nil || date.length != 6
      (generate_date.to_i * generate_date.to_i) % 10000
    else
      (date.to_i * date.to_i) % 10000
    end

    last_four_seperate = last_four.to_s.split(//)

   {
    :a => last_four_seperate[0].to_i,
    :b => last_four_seperate[1].to_i,
    :c => last_four_seperate[2].to_i,
    :d => last_four_seperate[3].to_i
   }
  end
end
