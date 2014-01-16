FactoryGirl.define do 
  factory :post do
    title "First Post"
    body "This is the newest post. Needs at least 20 chars to be saved"
    user
    topic
  end
end