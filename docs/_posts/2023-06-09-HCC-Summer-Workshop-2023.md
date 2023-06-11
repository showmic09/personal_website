---
layout: single
title:  "HCC Summer Workshop 2023"
comments: true
toc: true
toc_sticky: true
tags:
  - HCC
  - Blogs
  - Bash
---
# Holland Computing Center
Holland Computing Center **(HCC)** is located at University of Nebraska-Lincoln. It provides computing resources to the affiliates of `University of Nebraska` system. Currently, the most advanced cluster that `HCC` has is *swan*. HCC provides `High Performance Computing` to its researchers.

# June Summer Workshop
Every year `HCC` hosts a workshop in the summer teaching about the basics of `High Performance Computing (HPC)`. It is usually in June. This year I got the opportunity to teach at the workshop. The lesson started with an introduction to `Unix Shell`. The shell is a program where users can type commands. With the shell, it’s possible to invoke complicated programs. The most popular Unix shell is the **Bash**. Bash is a program that lets the user run different commands from a command line interface `(CLI)`. In case of the computing world, most of the clusters are designed to interact from a **CLI**. Learning `Bash` or shell commands is very helpful for researchers as it provides users with the tools to do a lot of pre and post processing directly from the `terminal` environment.<br/>

# Bash
Software carpentry has a great lesson for the `Unix Shell`. The workshop followed the [software carpentry's](https://swcarpentry.github.io/shell-novice/) lesson plan. The whole lesson is built in a way that makes it easier for anyone to start from scratch. Whenever I teach `Bash` I like to start by providing a background and usefulness for `Bash`. When I started using HPC for the first time at **UNL**, I had zero experience of using unix shell or terminal. I started to learn some of the very basic commands. I relied heavily on [WinSCP](https://winscp.net/eng/index.php) for editing job submit file, looking through output and error messages, finding empty folders or jobs that failed. When I switched to a mac that pushed me to get better in using Bash. Mac did not have a good substitute of `WinSCP`. Cyberduck comes close but is still very far away from the functionalities that WinSCP offer.<br/>

I shared all these experiences with the students. I hope my experience and different use cases of `Bash commands` in my research will motivate the students.<br/>

# Useful Tips and Tricks for Bash
Below are some of the commands and tips that I have found very useful for my work.
- `Ctrl` + `A` moves the cursor to the front of the line in the terminal.
- `ls -lthr` lets me easily find the last edited file in a directory.
- `chmod +x` or `chmod 755` to make a file executable
- execute the script from terminal using a `./<script_file_name>`
- `$@` enables a shell script to accept any number of arguments
