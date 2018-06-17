#オリジナルファイル
origin_file = File.open("./original_data/ken_all_rome/KEN_ALL_ROME.CSV", "r")
#成形データファイル
prefecture_and_municipality_file = File.open("./molding_data/prefecture_and_municipality.csv", "w")

last_prefecture = ""
last_municipality = ""
origin_file.each do |line|
  record = line.split(",")
  #レコードがなくなったら終了
  if record[0] == ""
    break
  end
  #前レコードと重複が無い場合は書き込み処理を行う
  if (last_municipality != record[2]) || (last_prefecture != record[1])
    prefecture_and_municipality_file.puts("#{record[1]},#{record[2]}")
    last_prefecture = record[1]
    last_municipality = record[2]
  end
end



