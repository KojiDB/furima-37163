FactoryBot.define do
  factory :user do
    nickname              { 'ハナコ' }
    email                 { Faker::Internet.free_email }
    password              { 'a00000' }
    password_confirmation { password }
    last_name             { '日本' }
    first_name            { '花子' }
    last_name_read        { 'ニホン' }
    first_name_read       { 'ハナコ' }
    birth_day             { '2000-01-01' }
  end
end