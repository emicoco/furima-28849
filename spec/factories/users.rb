FactoryBot.define do
  factory :user do
    first_name            { 'あああ' }
    first_name_kana       { 'カタカナ' }
    last_name             { 'あああ' }
    last_name_kana        { 'カタカナ' }
    nickname              { 'abe' }
    birthday { 20_200_101 }
    email                 { 'kkk@email.com' }
    password              { 'hoge22' }
    password_confirmation { 'hoge22' }
  end
end
