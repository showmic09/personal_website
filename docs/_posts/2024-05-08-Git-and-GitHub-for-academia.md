---
layout: single
title:  "Git & GitHub Tutorial"
tags:
  - GitHub
  - Git
  - Tutorial
---
I started using git and GitHub mostly after I started working with [OSG](https://osg-htc.org/) and I realized that I should have started using it way before. My aim for this post is to let 
researchers know that even if you are not developing and maintaing a software and you are a `one-man-army`, you need to be familiar with git and GitHub.
# What is git and GitHub
- `git` is a version control software and `GitHub` 
- `GitHub` is a platform for hosting and collaborating on code and software projects.

# Why do you need git?
This pictures is a great example why git is required
<figure class="align-center">
  <img src="{{ site.url }}{{ site.baseurl }}/docs/assets/images/Phd_comics.jpeg" alt="Why version control and git are useful?">
  <figcaption>Necessity of using git</figcaption>
</figure>
Keeping track of codes, working and collaborating with colleagues on different projects are the perfect use cases for git.

# Common Misconceptions
- GitHub is only for the coders
- Git and GitHub are the same thing
- GitHub is meant to be used for public projects
  - Private code bases can be hosted on GitHub
- You need to learn a lot of coding to get started
  - Many things can be done from the GitHub web interface

# Useful git commands
- Commands that need to run once/machine
  - git config --global user.name `<your username>`
  - git config --global user.email `<your GitHub email>`
- Usual Command cycle
  - git clone `<HTTPS/SSH address>`
  - git checkout –b `<branch name>`
  - git add `<file/folders name>`
  - git commit -m `<useful message to identify the changes>`
  - git push origin <span style="color:red">main/master</span>
  - git checkout <span style="color:red">main/master</span>
  - git status
  - git pull
  
  