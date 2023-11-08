# frozen_string_literal: true

# 現在のディレクトリを取得する
def just_ls(path = '.')
  # "." と ".." と隠しファイルを除外したものを取得する
  entries = Dir.entries(path) - %w[. ..] - Dir.glob('.*')

  # ABC順に並び替える
  sorted_entries = entries.sort

  # 必要な行数を3で割って計算、Ceil で4列目ができないようにする。
  rows = (sorted_entries.size / 3.0).ceil

  # ABC順に並べた entries を rows だけ分割する。後の変換をしやすいように to_aで配列化
  split_entries = sorted_entries.each_slice(rows).to_a

  # 正方形の transpose にしないとエラーになるので nil で空きを埋める
  split_entries.each { |slice| slice.fill(nil, slice.size...rows) }

  # 行と列を入れ替えて、nil を compact メソッドで消す。joinで一列にしたものを tab で区切る
  split_entries.transpose.each do |row|
    puts row.compact.join("\t")
  end
end
just_ls
