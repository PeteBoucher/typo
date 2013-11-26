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

Given /^that the article "(.*?)" has body "(.*?)"$/ do |title, text|
  article = Article.find_by_title(title)
  article.body = text
  article.save!
end

Given /^that the article "(.*?)" has a comment "(.*?)"$/ do |title, text|
  article = Article.find_by_title(title)
  article.comments.create({
    # :type => "Comment",
    # :title => "A commnet",
    :author => "admin",
    :body => text,
    :user_id => 1})
  article.save!
end

Then /^the author of article "(.*)" should be "(.*)"$/ do |title, username|
  article = Article.find_by_title(title)
  user = User.find_by_name(username)
  article.author == user.id
end

Then /^the author of article "(.*)" should not be "(.*)"$/ do |title, username|
  article = Article.find_by_title(title)
  user = User.find_by_name(username)
  article.author != user.id
end

Then /^the article "(.*?)" should contain "(.*?)"$/ do |title, content|
  article = Article.find_by_title(title)
  article.body.should =~ /#{content}/
end

Then /^the article "(.*?)" should not exist$/ do |title|
  Article.find_by_title(title).should be_nil
end

Then /^the article "(.*?)" should exist$/ do |title|
  Article.find_by_title(title)
end

Then /^the article "(.*?)" should have a comment "(.*?)"$/ do |title, comment|
  article = Article.find_by_title(title)
  article.comments.each do |comment|
    if comment.body =~ /#{comment}/
      return true
    end
  end
end

# Given /^(?:|I )am on the edit page for article "(.*)"$/ do |page_name|

#   visit admin_content_path("edit", id)
# end