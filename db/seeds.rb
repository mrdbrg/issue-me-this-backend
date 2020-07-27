Comment.destroy_all
Issue.destroy_all
UserSkill.destroy_all
User.destroy_all
Skill.destroy_all

avatars = ["ade", "chris", "christian", "daniel", "elliot", "helen", "jenny", "joe", "justen", "laura", "matt", "nan", "steve", "stevie", "veronika"] 

users = [
  {
    name: "MARLON",
    age: 30,
    profession: "JR. DEV",
  },
  {
    name: "SENADA",
    age: 23,
    profession: "JR. DEV"
  },
  {
    name: "JACK",
    age: 24,
    profession: "SENIOR DEV"
  },
  {
    name: "REI",
    age: 24,
    profession: "SENIOR DEV"
  }
]

skills = [
  {
    name: "HTML"
  },
  {
    name: "CSS"
  },
  {
    name: "JS"
  },
  {
    name: "REACT"
  },
  {
    name: "RUBY"
  }
]

issues = [
  {
    title: "Spring MVC controller problem, HTTP Status 404",
    issue_body: "I am learning Spring MVC and i have big trouble with running my web application. My controllers do not work, so I can not map my request. Here is my error:"
  },
  {
    title: "If I specify a has_many :through association in Ruby on Rails, do I have to create a model for the 3rd table?",
    issue_body: "1- Do I have to define again the associations on the model file? which leads me to my next question.... 2- Do I have to create a model for this third table of appointments or just run the migration and the Active Record will take care of updating it everytime a doctor and a patient updates? when will the insert to this third table will be triggered in this type of association?"
  },
  {
    title: "Running a React/Rails app locally",
    issue_body: "I am trying to run an application locally which has React/Redux front-end and communicates with a rails api. In my .env file I am referencing the port which is running my api (rails s has it running on port as API_URL 3000) and my react dev server is referenced in HOST running on localhost:3003."
  },
  {
    title: "CORS error on same domain?",
    issue_body: "I'm running into a weird CORS issue right now. Python simpleHTTPserver where I run y Javascript application. This app is executing Ajax requests on the server above. Any thought on what could be the problem?"
  }
]

comments = [
  {
    title: "WELL THAT'S EASY...",
    comment_body: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Hic, necessitatibus!"
  },
  {
    title: "HAVE YOU TRIED DROPING THE DATABASE?",
    comment_body: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Hic, necessitatibus!"
  },
  {
    title: "FIX IT!",
    comment_body: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Hic, necessitatibus!"
  },
  {
    title: "CAN YOU SHARE THE CODE?",
    comment_body: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Hic, necessitatibus!"
  },
  {
    title: "HAVE YOU TRIED DROPING THE DATABASE?",
    comment_body: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Hic, necessitatibus!"
  },
  {
    title: "FIX IT!",
    comment_body: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Hic, necessitatibus!"
  },
  {
    title: "HAVE YOU TRIED DROPING THE DATABASE?",
    comment_body: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Hic, necessitatibus!"
  },
  {
    title: "FIX IT!",
    comment_body: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Hic, necessitatibus!"
  }
]

# create skills
skills.each do |skill| 
  Skill.create({
    name: skill[:name]
  })
end

# create users
users.each do |user|
  User.create({
    name: user[:name],
    age: user[:age],
    profession: user[:profession],
    avatar: "https://semantic-ui.com/images/avatar/small/#{avatars.sample}.jpg"
  })
end

# associate skills to users
User.all.each do |current_user|
  Skill.all.each do |current_skill| 
    UserSkill.create({
      user: current_user,
      skill: current_skill
    })
  end
end

# firstUser = User.first
# lastUser = User.last
# firstIssue = Issue.first

# create issues and associate them to users
issues.each do |issue|
  Issue.create({
    title: issue[:title],
    issue_body: issue[:issue_body],
    user: User.all.sample
  })
end

# create comments and associate them to issues and users
comments.each do |comment|
  Comment.create({
    title: comment[:title],
    comment_body: comment[:comment_body],
    issue: Issue.all.sample,
    user: User.all.sample
  })
end

tables = [User, Skill, UserSkill, Comment, Issue]

def loadingTables(tables)
  tables.each do |name| 
    puts "===> #{name.count} #{name.to_s}s created \n"
    sleep(1)
  end
  sleep(1.5)
end

# run method
loadingTables(tables)

puts "=============================="
puts "==>         SEEDED         <=="
puts "=============================="
