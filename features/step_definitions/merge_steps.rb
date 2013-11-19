# Given /^that an admin account exists$/ do
#   @admin_user = User.create!({:login => 'harry',
#                 :password => 'aaaaaaaa',
#                 :email => 'harry@snow.com',
#                 :profile_id => 2,
#                 :name => 'harry',
#                 :state => 'active',
#                 :profile_id => 1})
# end

# Given /^that a publisher account exists$/ do
#   @user = User.create!({:login => 'pete',
#                 :password => 'aaaaaaaa',
#                 :email => 'pete@snow.com',
#                 :profile_id => 2,
#                 :name => 'publisher',
#                 :state => 'active'})
# end

Given /^that the user "(.*?)" has authored the article "(.*?)"$/ do 
  |username, title|
  Article.create!({:type => "Article", 
      :title => title, 
      :author => User.find_by_name(username).name, 
      :body => "This is an article created by #{username}."})
end

# Given /^(?:|I )am on the edit page for article "(.*)"$/ do |page_name|

#   visit admin_content_path("edit", id)
# end