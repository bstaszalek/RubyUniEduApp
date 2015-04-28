FactoryGirl.define do
  factory :article do
    sequence(:title) { |n| "Title for the article is long #{n}"}
  end  
end  