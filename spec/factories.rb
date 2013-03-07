FactoryGirl.define do
  factory :user do
    name    "Chris Haynes"
    email   "haynescw@uwec.edu"
    password "foobar"
    password_confirmation "foobar"
  end
end
