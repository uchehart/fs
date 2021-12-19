# foodsub

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



i. Naming Convention:

|Naming Convention	                                                |Effective Style |	Example|
----------------------------------------------------------          |-----------------|----------
Classes, enum types,typedefs,and type parameters,etensions          |	PascalCase 	    | An example is HomeScreen
------------------------------------------------------------------  |----------------------------------------
Libraries, packages, directories, and source files, import prefixes |	snake_case 	     | An example is home_screen
Class members, top-level definitions, variables, parameters, and    | camelCase 	     | An example is verifiedUser
named parameters, constants 	

ii. Style Rule

    Always declare return types in your methods.
    Put required named parameters first.
    Always require non-null named parameters (@required).
    Indent your code where appropriate (e.g Use two-space indentation.) Click Here to know more
    
    
    Contribution Guide

Steps to collaborate on the repository for team members.
Forking and Cloning Repo

    Fork the project.
    Click on the "Code" button on the Repo page.
    Copy the URL for the forked Repo "https://github.com/your-github-username/FS.git"
    Open your Code Editor and run git clone "https://github.com/your-github-username/Fs.git"

Add "Remote To" and "Pull From" Upstream

    Add a Remote to Upstream to your Repo: Using the command : git remote add upstream "https://github.com/Valenteeena/Fs"
    Pull from upstream to download all changes in the project using git pull upstream develop

Complete assigned task/issue

    Open the project in your IDE or Code Editor.
    Complete your assigned task.

Create and Commit Changes to a New Branch

When your task is completed:

    Create a new branch with your task name e.g "feat- UserSignUP".
    run: git checkout -b feat/yourTask Push to github;
    git add .
    git commit -m "feat: Inplemented yourTask"

Push New Branch to "Origin" Repository

    To make sure there are no conflict, Pull from upstream using git pull upstream develop
    Push your branch changes to the Repo using git push origin "feat/yourTask" note how it end with a branch.

Creating Pull Request

When making a PR, your PR is expected to have the following comments"

    What is the task/issue completed?
    What does the PR actually do?
    How can the PR be manually tested?
    Screenshots(of your implementation - A mobile screen or an APi payload).


