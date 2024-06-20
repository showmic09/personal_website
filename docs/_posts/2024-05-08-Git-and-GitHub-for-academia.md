---
layout: single
title:  "Git & GitHub Tutorial"
toc: true
toc_sticky: true
tags:
  - GitHub
  - Git
  - Tutorial
---
I started using git and GitHub mostly after I started working with [OSG](https://osg-htc.org/) and I realized that I should have started using it way before. My aim for this post is to let 
researchers know that even if you are not developing and maintaing a software and you are a `one-man-army`, you need to be familiar with git and GitHub.
# What is git and GitHub
- `git` is a version control software 
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
  
# How git works?

I found a video online that helped me understanding how git works. I am including the link to the video here.

<iframe width="560" height="315" src="https://www.youtube.com/embed/e9lnsKot_SQ?si=e9SRJ0OcpUMVxxH6" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
  
Alongside this video, software carpentry's lesson on version control with [git](https://swcarpentry.github.io/git-novice/) is also a great resource. 
## Example Scenario 
I have made an animation to explain the concept better to my students. The scenario is that I have a **GitHub repository** named [MECH-892](https://github.com/showmic09/MECH-892). Those of you who are not familiar with the term repository, you can think of it as a set of files and folders for a project that you are working on and that you want to keep track of those files. Anyways, the purpose for this repository is to teach the concepts of git and GitHub to my students. Now, these set of files & folders exist in GitHub or a remote repository. And I want to make some changes to the files that are stored in the remote repository(in this case GitHub). We can use `GitHub's GUI interface` to do the changes but I want to highlight the process where we will be modifying those files from a command line interface which offers a ton of flexibility. Before making any changes to the repository I need to create a copy of the repository. I can do that using the `git clone` command. When I do `git clone` I get a copy of the remote repository on my machine. For this example, let's assume the [MECH-892](https://github.com/showmic09/MECH-892) repository only has 2 files and folders-`messy_files` and `Readme.md`. I want to create a folder named `Git_lessons` and when I create the folder on my local machine inside the `MECH-892` folder, git knows that new files/folders have been created but it doesn't automatically add the created files and folders to the repository. To add the newly created folder to the repository, `git add` command is used. But `git add` doesn't add the files directly to the local repository. It adds the folder to a intermediate location which is called `staging area`. From the `staging area` if we want to add the folder to the local repository, we will use `git commit` command. All these three things-your `working directory`, `staging area` and `local repository` exists in your local machine. How about if I want to make the changes to my remote repository? Then I need to push out the changes from my local machine to the remote repository. `git push` command does exactly that. All of these long texts are explained better in the animation below:
### Animation explaining different git commands
 <figure class="align-center">
  <img src="{{ site.url }}{{ site.baseurl }}/docs/assets/files/how-git-works-slide1.gif" alt="Why version control and git are useful?">
</figure>

And once the remote repository is updated, then a collaborator can grab the updated content from the repository using `git pull`. In this case, I am assuming that the collaborator already had cloned the repo and was working on their own research/computational work. So, they don't need to clone the `repo` again. They will just do a `git pull` to get the updated files in their current working directory as shown in the second animation below. 

 <figure class="align-center">
  <img src="{{ site.url }}{{ site.baseurl }}/docs/assets/files/how-git-works-slide2.gif" alt="Why version control and git are useful?">
</figure>