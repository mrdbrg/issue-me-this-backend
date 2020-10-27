Comment.destroy_all
Issue.destroy_all
UserSkill.destroy_all
User.destroy_all
Skill.destroy_all

skills = [
      { key: 'angular', text: 'Angular', value: 'angular', color: 'red' },
      { key: 'css', text: 'CSS', value: 'css', color: 'orange' },
      { key: 'design', text: 'Graphic Design', value: 'design', color: 'yellow' },
      { key: 'ember', text: 'Ember', value: 'ember', color: 'olive' },
      { key: 'html', text: 'HTML', value: 'html', color: 'green' },
      { key: 'ia', text: 'Information Architecture', value: 'ia', color: 'teal' },
      { key: 'javascript', text: 'Javascript', value: 'javascript', color: 'blue' },
      { key: 'mech', text: 'Mechanical Engineering', value: 'mech', color: 'violet' },
      { key: 'meteor', text: 'Meteor', value: 'meteor', color: 'purple' },
      { key: 'node', text: 'NodeJS', value: 'node', color: 'pink' },
      { key: 'plumbing', text: 'Plumbing', value: 'plumbing', color: 'brown' },
      { key: 'python', text: 'Python', value: 'python', color: 'grey' },
      { key: 'rails', text: 'Rails', value: 'rails', color: 'yellow' },
      { key: 'react', text: 'React', value: 'react', color: 'green' },
      { key: 'repair', text: 'Kitchen Repair', value: 'repair', color: 'blue' },
      { key: 'ruby', text: 'Ruby', value: 'ruby', color: 'black' },
      { key: 'ui', text: 'UI Design', value: 'ui', color: 'red' },
      { key: 'ux', text: 'User Experience', value: 'ux', color: 'olive' }
]

issues = [
  {
    title: "Why is processing a sorted array faster than processing an unsorted array?",
    syntax: "javascript",
    issue_body: "Here is a piece of C++ code that shows some very peculiar behavior. For some strange reason, sorting the data miraculously makes the code almost six times faster ```const handleDismissCountDown = () => {
      setTimeout(() => {
        setAlertStatus(false)
      }, 4000)```"
  },
  {
    title: "How do I undo the most recent local commits in Git?",
    syntax: "javascript",
    issue_body: "I accidentally committed the wrong files to Git, but I haven't pushed the commit to the server yet. How can I undo those commits from the local repository? ```const handleDismissCountDown = () => {
      setTimeout(() => {
        setAlertStatus(false)
      }, 4000)```"

  },
  {
    title: "How do I delete a Git branch locally and remotely?",
    syntax: "javascript",
    issue_body: "I want to delete a branch both locally and remotely. Failed Attempts to Delete a Remote Branch $ git branch -d remotes/origin/bugfix error: branch 'remotes/origin/bugfix' not found. ```const handleDismissCountDown = () => {
      setTimeout(() => {
        setAlertStatus(false)
      }, 4000)```"

  },
  {
    title: "What does the 'yield' keyword do?",
    syntax: "javascript",
    issue_body: "What is the use of the yield keyword in Python, and what does it do? For example, I'm trying to understand this code: ```const handleDismissCountDown = () => {
      setTimeout(() => {
        setAlertStatus(false)
      }, 4000)```"

  },
  {
    title: "How do I undo 'git add' before commit?",
    syntax: "javascript",
    issue_body: "I mistakenly added files to Git using the command: git add myfile.txt I have not yet run git commit. Is there a way to undo this, so these files won't be included in the commit? ```const handleDismissCountDown = () => {
      setTimeout(() => {
        setAlertStatus(false)
      }, 4000)```"

  },
  {
    title: "What is the correct JSON content type?",
    syntax: "javascript",
    issue_body: "I've been messing around with JSON for some time, just pushing it out as text and it hasn't hurt anybody (that I know of), but I'd like to start doing things properly. I have seen so many purported ```const handleDismissCountDown = () => {
      setTimeout(() => {
        setAlertStatus(false)
      }, 4000)```"

  },
  {
    title: "What is the '-->' operator in C++?",
    syntax: "javascript",
    issue_body: "After reading Hidden Features and Dark Corners of C++/STL on comp.lang.c++.moderated, I was completely surprised that the following snippet compiled and worked in both Visual Studio 2008 and G++ 4.4 ```const handleDismissCountDown = () => {
      setTimeout(() => {
        setAlertStatus(false)
      }, 4000)```"

  },
  {
    title: "How do I rename a local Git branch?",
    syntax: "javascript",
    issue_body: "I don't want to rename a remote branch, as described in Rename master branch for both local and remote Git repositories. How can I rename a local branch which hasn't been pushed to a remote branch? ```const handleDismissCountDown = () => {
      setTimeout(() => {
        setAlertStatus(false)
      }, 4000)```"

  }
]

comments = [
  {
    syntax: "javascript",
    comment_body: "This questions has been answered. ``` const handleDismissCountDown = () => {
      setTimeout(() => {
        setAlertStatus(false)
      }, 4000) ```"
  },
  {
    syntax: "javascript",
    comment_body: "I know that one... ``` const handleDismissCountDown = () => {
      setTimeout(() => {
        setAlertStatus(false)
      }, 4000) ```"
  },
  {
    syntax: "javascript",
    comment_body: "I can't wait to be like you guys ``` const handleDismissCountDown = () => {
      setTimeout(() => {
        setAlertStatus(false)
      }, 4000) ```"
  },
  {
    syntax: "javascript",
    comment_body: "Simple ``` const handleDismissCountDown = () => {
      setTimeout(() => {
        setAlertStatus(false)
      }, 4000) ```"
  },
  {
    syntax: "javascript",
    comment_body: "Check out Marlon algorithm blog post! ``` const handleDismissCountDown = () => {
      setTimeout(() => {
        setAlertStatus(false)
      }, 4000) ```"
  },
  {
    syntax: "javascript",
    comment_body: "My friend Marlon wants to work in the field! Are you hiring?"
  },
  {
    syntax: "javascript",
    comment_body: "I got this one! ``` const handleDismissCountDown = () => {
      setTimeout(() => {
        setAlertStatus(false)
      }, 4000) ```"
  },
  {
    syntax: "javascript",
    comment_body: "JUST FIXED IT!!! ``` const handleDismissCountDown = () => {
      setTimeout(() => {
        setAlertStatus(false)
      }, 4000) ```"
  },
  {
    syntax: "javascript",
    comment_body: "Don't be afraid to ask questions. That's how you learn! ``` const handleDismissCountDown = () => {
      setTimeout(() => {
        setAlertStatus(false)
      }, 4000) ```"
  },
  {
    syntax: "javascript",
    comment_body: "I drank so much coffee right now! This is the 39th issue I help solving. ``` const handleDismissCountDown = () => {
      setTimeout(() => {
        setAlertStatus(false)
      }, 4000) ```"
  },
  {
    syntax: "javascript",
    comment_body: "Dude, relax! I got you. ``` const handleDismissCountDown = () => {
      setTimeout(() => {
        setAlertStatus(false)
      }, 4000) ```"
  },
  {
    syntax: "javascript",
    comment_body: "It booOOthers me ``` const handleDismissCountDown = () => {
      setTimeout(() => {
        setAlertStatus(false)
      }, 4000) ```"
  },
  {
    syntax: "javascript",
    comment_body: "Franklin, you better be watching this. ``` const handleDismissCountDown = () => {
      setTimeout(() => {
        setAlertStatus(false)
      }, 4000) ```"
  }
]

# !NOTE! =====> could have used this but it would have given me weird and long emails with possibly different names
# Faker::Internet.email #=> "kirsten.greenholt@corkeryfisher.info"

# generates a male or female first name randomly
def generate_first_name 
  return [*0..1].sample > 1 ? Faker::Name.male_first_name : Faker::Name.female_first_name
end

# create skills
skills.each do |skill| 
  if !Skill.exists?(key: skill[:key])
    Skill.create({
      key: skill[:key],
      text: skill[:text],
      value: skill[:value],
      color: skill[:color]
    })
  end
end

# check if user exists
def check_user
  # check if that email has already been saved for a user.
  first_name_pick = generate_first_name().downcase
  if User.exists?(email: "#{first_name_pick}@example.com")
    check_user()
  else 
    create_user(first_name_pick)
  end
end

# create users
def create_user(picked_name)
  # generate an array of ages between 19-60
  ages = [*19..60]
  # generate an array of professions
  professions = ["Jr. Software Engineer", "DevOps", "Senior Software Engineer", "Technical Support", "IT", "Electronic Engineer"]
  # array of semantic ui avatars
  avatars = ["ade", "chris", "christian", "daniel", "elliot", "helen", "jenny", "joe", "justen", "laura", "matt", "nan", "steve", "stevie", "veronika"] 

  User.create({
    email: ("#{picked_name}@example.com"),
    first_name: picked_name,
    last_name: Faker::Name.last_name,
    age: ages.sample,
    profession: professions.sample,
    avatar: avatars.sample,
    password: "1L*vesalami"
  })
end

20.times {
  check_user()
}

  # PASSWORD FORMAT
  # (?=.{8,})          # Must contain 8 or more characters
  # (?=.*\d)           # Must contain a digit
  # (?=.*[a-z])        # Must contain a lower case character
  # (?=.*[A-Z])        # Must contain an upper case character
  # (?=.*[[:^alnum:]]) # Must contain a symbol

# check if UserSkill association exists
def check_user_skill(current_user)
  # assign current_user to my_user
  my_user = current_user
  # randomly pick a skill instance and assign it to random_skill
  random_skill = Skill.all.sample
  # conditionally checks if association exists between skill and user
  if UserSkill.exists?(skill: random_skill, user: current_user)
    # invoke check_user_skill recursively if user and skill association already exists
    check_user_skill(my_user)
  else
    # create a new association if user and skill have not been associated
    create_user_skill(my_user, random_skill)
  end
end

# create association
def create_user_skill(user, skill)
  UserSkill.create({
    user: user,
    skill: skill
  })
end

# loop through users
User.all.each do |current_user| 
  # loop 5 times for each current user to create 5 different skills
  5.times {
    check_user_skill(current_user)
  }
end

# create issues and associate them to users
issues.each do |issue|
  Issue.create({
    title: issue[:title],
    issue_body: issue[:issue_body],
    syntax: issue[:syntax],
    user: User.all.sample
  })
end

# create comments and associate them to issues and users
comments.each do |comment|
  Comment.create({
    comment_body: comment[:comment_body],
    syntax: comment[:syntax],
    issue: Issue.all.sample,
    user: User.all.sample
  })
end


# marcelo = User.create(
#   email: "marcelo@example.com",
#   first_name: "Marcelo",
#   last_name: "Souza",
#   age: 61,
#   profession: "Senior Software Engineer",
#   avatar: "daniel",
#   password: "1L*vesalami"
# )
marlon = User.create(
  email: "marlon@example.com",
  first_name: "Marlon",
  last_name: "Braga",
  age: 31,
  profession: "Jr. Software Engineer",
  avatar: "chris",
  password: "1L*vesalami"
)

LikeIssue.create(
  is_like: true,
  user: marlon,
  issue: Issue.all[0]
)
LikeIssue.create(
  is_like: true,
  user: marlon,
  issue: Issue.all[1]
)
LikeIssue.create(
  is_like: true,
  user: marlon,
  issue: Issue.all[2]
)
LikeIssue.create(
  is_like: false,
  user: marlon,
  issue: Issue.all[3]
)
LikeIssue.create(
  is_like: false,
  user: marlon,
  issue: Issue.all[4]
)

# LikeIssue.create(
#   is_like: true,
#   user: marcelo,
#   issue: Issue.last
# )


# tables = [User, Skill, UserSkill, Comment, Issue]

# def loadingTables(tables)
#   tables.each do |name| 
#     puts "===> #{name.count} #{name.to_s}s created \n"
#     sleep(1)
#   end
#   sleep(1.5)
# end

# # run method
# loadingTables(tables)

puts "===> #{User.count} users created \n"
puts "===> #{Skill.count} skills created \n"
puts "===> #{Comment.count} comments created \n"
puts "===> #{UserSkill.count} userskills created \n"
puts "===> #{Issue.count} issues created \n"

puts "=============================="
puts "==>         SEEDED         <=="
puts "=============================="