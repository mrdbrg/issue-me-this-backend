require "rest-client"
require 'date'
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
    issue_body: "
    Here is a piece of C++ code that shows some very peculiar behavior. For some strange reason, sorting the data miraculously makes the code almost six times faster First I will greet: 
    ``` 
    const greeting = () => {
      setTimeout(() => {
        console.log('Hello internet!')
      }, 1000) 
    }
    ```
    then I will ask you a question: 
    ```
    const askAQuestion = question => {
      setTimeout(() => {
        console.log(question)
      }, 3000)
    }
    ```
    Now I will invoke my functions:
    ```    
    greeting()
    askAQuestion('Do you like my projects?')
    ```
    Thank you for watching!"
  },
  {
    title: "How do I undo the most recent local commits in Git?",
    syntax: "javascript",
    issue_body: "I accidentally committed the wrong files to Git, but I haven't pushed the commit to the server yet. How can I undo those commits from the local repository?
    First I will greet: 
    ``` 
    const greeting = () => {
      setTimeout(() => {
        console.log('Hello internet!')
      }, 1000) 
    }
    ```
    then I will ask you a question: 
    ```
    const askAQuestion = question => {
      setTimeout(() => {
        console.log(question)
      }, 3000)
    }
    ```
    Now I will invoke my functions:
    ```    
    greeting()
    askAQuestion('Do you like my projects?')
    ```
    Thank you for watching!"

  },
  {
    title: "How do I delete a Git branch locally and remotely?",
    syntax: "javascript",
    issue_body: "I want to delete a branch both locally and remotely. Failed Attempts to Delete a Remote Branch $ git branch -d remotes/origin/bugfix error: branch 'remotes/origin/bugfix' not found.
    First I will greet: 
    ``` 
    const greeting = () => {
      setTimeout(() => {
        console.log('Hello internet!')
      }, 1000) 
    }
    ```
    then I will ask you a question: 
    ```
    const askAQuestion = question => {
      setTimeout(() => {
        console.log(question)
      }, 3000)
    }
    ```
    Now I will invoke my functions:
    ```    
    greeting()
    askAQuestion('Do you like my projects?')
    ```
    Thank you for watching!"

  },
  {
    title: "What does the 'yield' keyword do?",
    syntax: "javascript",
    issue_body: "What is the use of the yield keyword in Python, and what does it do? For example, 
    I'm trying to understand this code:
    First I will greet: 
    ``` 
    const greeting = () => {
      setTimeout(() => {
        console.log('Hello internet!')
      }, 1000) 
    }
    ```
    then I will ask you a question: 
    ```
    const askAQuestion = question => {
      setTimeout(() => {
        console.log(question)
      }, 3000)
    }
    ```
    Now I will invoke my functions:
    ```    
    greeting()
    askAQuestion('Do you like my projects?')
    ```
    Thank you for watching!"

  },
  {
    title: "How do I undo 'git add' before commit?",
    syntax: "javascript",
    issue_body: "I mistakenly added files to Git using the command: git add myfile.txt I have not yet run git commit. 
    Is there a way to undo this, so these files won't be included in the commit?
    First I will greet: 
    ``` 
    const greeting = () => {
      setTimeout(() => {
        console.log('Hello internet!')
      }, 1000) 
    }
    ```
    then I will ask you a question: 
    ```
    const askAQuestion = question => {
      setTimeout(() => {
        console.log(question)
      }, 3000)
    }
    ```
    Now I will invoke my functions:
    ```    
    greeting()
    askAQuestion('Do you like my projects?')
    ```
    Thank you for watching!"

  },
  {
    title: "What is the correct JSON content type?",
    syntax: "javascript",
    issue_body: "I've been messing around with JSON for some time, just pushing it out as text and it hasn't hurt anybody (that I know of), 
    but I'd like to start doing things properly. I have seen so many purported
    First I will greet: 
    ``` 
    const greeting = () => {
      setTimeout(() => {
        console.log('Hello internet!')
      }, 1000) 
    }
    ```
    then I will ask you a question: 
    ```
    const askAQuestion = question => {
      setTimeout(() => {
        console.log(question)
      }, 3000)
    }
    ```
    Now I will invoke my functions:
    ```    
    greeting()
    askAQuestion('Do you like my projects?')
    ```
    Thank you for watching!"

  },
  {
    title: "What is the '-->' operator in C++?",
    syntax: "javascript",
    issue_body: "After reading Hidden Features and Dark Corners of C++/STL on comp.lang.c++.moderated, 
    I was completely surprised that the following snippet compiled and worked in both Visual Studio 2008 and G++ 4.4
    First I will greet: 
    ``` 
    const greeting = () => {
      setTimeout(() => {
        console.log('Hello internet!')
      }, 1000) 
    }
    ```
    then I will ask you a question: 
    ```
    const askAQuestion = question => {
      setTimeout(() => {
        console.log(question)
      }, 3000)
    }
    ```
    Now I will invoke my functions:
    ```    
    greeting()
    askAQuestion('Do you like my projects?')
    ```
    Thank you for watching!"

  },
  {
    title: "How do I rename a local Git branch?",
    syntax: "javascript",
    issue_body: "I don't want to rename a remote branch, as described in Rename master branch for both local and remote Git repositories. 
    How can I rename a local branch which hasn't been pushed to a remote branch?
    First I will greet: 
    ``` 
    const greeting = () => {
      setTimeout(() => {
        console.log('Hello internet!')
      }, 1000) 
    }
    ```
    then I will ask you a question: 
    ```
    const askAQuestion = question => {
      setTimeout(() => {
        console.log(question)
      }, 3000)
    }
    ```
    Now I will invoke my functions:
    ```    
    greeting()
    askAQuestion('Do you like my projects?')
    ```
    Thank you for watching!"

  }
]

comments = [
  {
    syntax: "javascript",
    comment_body: "This question has been answered. 
      ``` 
    const openToWork = question => {
        setTimeout(() => {
          console.log(question)
        }, 100)
      }
      ``` 
      finally: 
      ```
      openToWork('Hello everyone, I'm open to work!')
      ```
      Good luck!
              "
  },
  {
    syntax: "javascript",
    comment_body: "I know that one... 
      ```
    const openToWork = question => {
        setTimeout(() => {
          console.log(question)
        }, 100)
      }
      ``` 
      finally: 
      ```
      openToWork('Hello everyone, I'm open to work!')
      ```
      Good luck!
              "
  },
  {
    syntax: "javascript",
    comment_body: "Franklin is a good friend
      ```
    const openToWork = question => {
        setTimeout(() => {
          console.log(question)
        }, 100)
      }
      ``` 
      finally: 
      ```
      openToWork('Hello everyone, I'm open to work!')
      ```
      Good luck!
              "
  },
  {
    syntax: "javascript",
    comment_body: "Simple 
      ```
    const openToWork = question => {
        setTimeout(() => {
          console.log(question)
        }, 100)
      }
      ``` 
      finally: 
      ```
      openToWork('Hello everyone, I'm open to work!')
      ```
      Good luck!
              "
  },
  {
    syntax: "javascript",
    comment_body: "What if you just applied to more jobs?
      ``` 
    const openToWork = question => {
      setTimeout(() => {
        console.log(question)
      }, 100)
    }
    ``` 
    finally: 
    ```
    openToWork('Hello everyone, I'm open to work!')
    ```
    Good luck!
            "
  },
  {
    syntax: "javascript",
    comment_body: "Are you hiring?
      ```
      const openToWork = question => {
        setTimeout(() => {
          console.log(question)
        }, 100)
      }
      ``` 
      finally: 
      ```
      openToWork('Hello everyone, I'm open to work!')
      ```
      Good luck!
            "
  },
  {
    syntax: "javascript",
    comment_body: "I learn quick! 
      ```
    const openToWork = question => {
        setTimeout(() => {
          console.log(question)
        }, 100)
      }
      ``` 
      finally: 
      ```
      openToWork('Hello everyone, I'm open to work!')
      ```
      Good luck!
              "
  },
  {
    syntax: "javascript",
    comment_body: "JUST FIXED IT!!! 
      ```
    const openToWork = question => {
        setTimeout(() => {
          console.log(question)
        }, 100)
      }
      ``` 
      finally: 
      ```
      openToWork('Hello everyone, I'm open to work!')
      ```
      Good luck!
              "
  },
  {
    syntax: "javascript",
    comment_body: "Don't be afraid to ask questions. That's how you learn! 
      ```
    const openToWork = question => {
        setTimeout(() => {
          console.log(question)
        }, 100)
      }
      ``` 
      finally: 
      ```
      openToWork('Hello everyone, I'm open to work!')
      ```
      Good luck!
              "
  },
  {
    syntax: "javascript",
    comment_body: "I don't drink coffee past 4pm... 
      ```
    const openToWork = question => {
        setTimeout(() => {
          console.log(question)
        }, 100)
      }
      ``` 
      finally: 
      ```
      openToWork('Hello everyone, I'm open to work!')
      ```
      Good luck!
              "
  },
  {
    syntax: "javascript",
    comment_body: "I have hobbies! 
      ```
    const openToWork = question => {
        setTimeout(() => {
          console.log(question)
        }, 100)
      }
      ``` 
      finally: 
      ```
      openToWork('Hello everyone, I'm open to work!')
      ```
      Good luck!
              "
  },
  {
    syntax: "javascript",
    comment_body: "#levelup ALL DAY.. ALL DAY... WHAT'S UP?! ALL DAY!!! - Schmidt (The New Girl) 
      ```
    const openToWork = question => {
        setTimeout(() => {
          console.log(question)
        }, 100)
      }
      ``` 
      finally: 
      ```
      openToWork('Hello everyone, I'm open to work!')
      ```
      Good luck!
              "
  },
  {
    syntax: "javascript",
    comment_body: "Bashir is a good friend 
      ```
    const openToWork = question => {
        setTimeout(() => {
          console.log(question)
        }, 100)
      }
      ``` 
      finally: 
      ```
      openToWork('Hello everyone, I'm open to work!')
      ```
      Good luck!
              "
  }
]

# generate an array of job_titles
job_titles = ["Jr. Software Engineer", "DevOps", "Senior Software Engineer", "Technical Support", "IT", "Electronic Engineer", "Data Analyst", "Data Scientist"]

def restructure_date(date)
  "#{Date.strptime(date,"%Y-%m-%d").to_s.split("-")[1]}/#{Date.strptime(date,"%Y-%m-%d").to_s.split("-")[2]}/#{Date.strptime(date,"%Y-%m-%d").to_s.split("-")[0]}"
end

data = RestClient.get "https://randomuser.me/api/?results=20&nat=US&seed=issue-me-this"
parsed_data = JSON.parse(data)

parsed_data["results"].each do |user|
  User.create(
      email: user["email"],
      first_name: user["name"]["first"],
      last_name: user["name"]["last"],
      birthday: restructure_date(user["dob"]["date"]),
      job_title: job_titles.sample,
      picture: user["picture"]["large"],
      password: "1L*vesalami"
  )
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

puts "===> #{User.count} users created \n"
puts "===> #{Skill.count} skills created \n"
puts "===> #{Comment.count} comments created \n"
puts "===> #{UserSkill.count} userskills created \n"
puts "===> #{Issue.count} issues created \n"

puts "=============================="
puts "==>         SEEDED         <=="
puts "=============================="
