# DEVWF-T005 Catching Security Vulnerabilities

The team has implemented the multi staged Docker files. One of the reasons being a reduction of security risks. When you and your team browse through the source code and run it manually, you notice many security vulnerabilities that are reported by NPM. Many of them are because of old versions of NPM packages. Luckily a large number of them are innocent, but there are some really tricky vulnerabilities found as well.

Fixing security bugs once the application is in production is expensive, and takes a lot of time. You want to make sure that security issues like these are caught as soon as possible. GitHub offers some out of the box features to help you with that, and you advice the team to implement these features as quick as they can.

## Challenge

In this challenge you will enable two important security features. DependaBot and Code Scanning. DependaBot helps you to scan your repository for packages that are out of date and/or create security vulnerabilities. If it finds one, it creates a Pull Request with a fix, that you can directly merge in to your code. Code Scanning scans all your files for security issues, and reports those. Enable both features. When the features are enabled, fix the issue in the package [handlebars] as reported by DependaBot. After that, switch all low severity risks in Code Scanning to Won't Fix.

## Validation

* Code Scanning feature enabled
* DependaBot feature Enabled
* Fix for issue in [handlebars] package merged to main
* All low severity issues from Code Scanning are set to Won't Fix

> Tip
> Navigate to the security Tab in your repository to see the security features
>
> Use the default CodeQL Analysis workflow for Code Scanning
>
> Find the [handlebars] alert in the Dependabot alerts under the security Tab and Create Dependabot Security Update.
>
> Dependabot creates a Pull Request that you can merge

## Links & Information

* [About Code Scanning](https://docs.github.com/en/free-pro-team@latest/github/finding-security-vulnerabilities-and-errors-in-your-code/about-code-scanning)
* [How DependaBot Works](https://dependabot.com/#how-it-works)
* [Enable Code Scanning](https://docs.github.com/en/free-pro-team@latest/github/finding-security-vulnerabilities-and-errors-in-your-code/enabling-code-scanning-for-a-repository)

![](/Assets/2020-09-17-13-13-35.png)

## Solution

To read or view a step by step explanation of this challenge, please visit [this page](/Challenges/Module1-ImprovingDeveloperFlow/Step-By-Step/DEVWF-T005-SBS.md)

### Next Step

When you are done, move to the [next challenge](DEVWF-T006.md)