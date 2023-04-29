FactoryBot.define do
  factory :note do
    title { |n| "桃太郎#{n}話"}
    slug { |n| "momotaro-#{n}"}
    eyecatch {"🍑"}
    content {"桃太郎は犬、猿、キジを仲間にして鬼ヶ島に向かった。"}
    published_at {"2021-04-29 14:48:19"}
  end
end
