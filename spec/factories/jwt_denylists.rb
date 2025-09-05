FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2025-09-05 09:20:17" }
  end
end
