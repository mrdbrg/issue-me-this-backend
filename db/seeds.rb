Comment.destroy_all
Issue.destroy_all
UserSkill.destroy_all
User.destroy_all
Skill.destroy_all

avatars = ["ade", "chris", "christian", "daniel", "elliot", "helen", "jenny", "joe", "justen", "laura", "matt", "nan", "steve", "stevie", "veronika"] 

issues = [
  {
    title: "Why is processing a sorted array faster than processing an unsorted array?",
    issue_body: "Here is a piece of C++ code that shows some very peculiar behavior. For some strange reason, sorting the data miraculously makes the code almost six times faster"
  },
  {
    title: "How do I undo the most recent local commits in Git?",
    issue_body: "I accidentally committed the wrong files to Git, but I haven't pushed the commit to the server yet. How can I undo those commits from the local repository?"
  },
  {
    title: "How do I delete a Git branch locally and remotely?",
    issue_body: "I want to delete a branch both locally and remotely. Failed Attempts to Delete a Remote Branch $ git branch -d remotes/origin/bugfix error: branch 'remotes/origin/bugfix' not found."
  },
  {
    title: "What does the 'yield' keyword do?",
    issue_body: "What is the use of the yield keyword in Python, and what does it do? For example, I'm trying to understand this code:"
  },
  {
    title: "How do I undo 'git add' before commit?",
    issue_body: "I mistakenly added files to Git using the command: git add myfile.txt I have not yet run git commit. Is there a way to undo this, so these files won't be included in the commit?"
  },
  {
    title: "What is the correct JSON content type?",
    issue_body: "I've been messing around with JSON for some time, just pushing it out as text and it hasn't hurt anybody (that I know of), but I'd like to start doing things properly. I have seen so many purported"
  },
  {
    title: "What is the '-->' operator in C++?",
    issue_body: "After reading Hidden Features and Dark Corners of C++/STL on comp.lang.c++.moderated, I was completely surprised that the following snippet compiled and worked in both Visual Studio 2008 and G++ 4.4"
  },
  {
    title: "How do I rename a local Git branch?",
    issue_body: "I don't want to rename a remote branch, as described in Rename master branch for both local and remote Git repositories. How can I rename a local branch which hasn't been pushed to a remote branch?"
  }
]

comments = [
  {
    title: "This questions has been answered.",
    comment_body: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Hic, necessitatibus!"
  },
  {
    title: "I know that one...",
    comment_body: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Hic, necessitatibus!"
  },
  {
    title: "I can't wait to be like you guys",
    comment_body: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Hic, necessitatibus!"
  },
  {
    title: "Simple",
    comment_body: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Hic, necessitatibus!"
  },
  {
    title: "Check out Marlon algorithm blog post!",
    comment_body: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Hic, necessitatibus!"
  },
  {
    title: "My friend Marlon wants to work in the field! Are you hiring?",
    comment_body: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Hic, necessitatibus!"
  },
  {
    title: "I got this one!",
    comment_body: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Hic, necessitatibus!"
  },
  {
    title: "JUST FIXED IT!!!",
    comment_body: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Hic, necessitatibus!"
  },
  {
    title: "Don't be afraid to ask questions. That's how you learn!",
    comment_body: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Hic, necessitatibus!"
  },
  {
    title: "I drank so much coffee right now! This is the 39th issue I help solving.",
    comment_body: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Hic, necessitatibus!"
  },
  {
    title: "Dude, relax! I got you.",
    comment_body: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Hic, necessitatibus!"
  },
  {
    title: "It booOOthers me",
    comment_body: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Hic, necessitatibus!"
  },
  {
    title: "Franklin, you better be watching this.",
    comment_body: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Hic, necessitatibus!"
  }
]

ages = [*19..60]
randomPick = [*1..5]
professions = ["Jr. Software Engineer", "DevOps", "Senior Software Engineer", "Technical Support", "IT", "Electronic Engineer"]

# create skills
20.times {
  if Skill.exists?(name: Faker::ProgrammingLanguage.name)
    Skill.create({
      name: Faker::ProgrammingLanguage.name
    })
  end
}

# create users
20.times {
  User.create({
    name: Faker::Name.first_name,
    age: ages.sample,
    profession: professions.sample,
    avatar: avatars.sample
  })
}

# associate skills to users
User.all.each do |current_user|
  randomPick.count.times {
    UserSkill.create({
      user: current_user,
      skill: Skill.all.sample
    })
  }
end

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