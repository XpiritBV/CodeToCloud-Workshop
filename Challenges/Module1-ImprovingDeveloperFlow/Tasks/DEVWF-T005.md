# Catching Security Vulnerabilities
The team has implemented the multi staged Docker files. One of the reasons being a reduction of security risks. When you and your team browse through the source code and run it manually, you notice many security vulnerabilities that are reported by NPM. Many of them are because of old versions of NPM packages. Luckily a large number of them are innocent, but there are some really tricky vulnerabilities found as well.

Fixing security bugs once the application is in production is expensive, and takes a lot of time. You want to make sure that security issues like these are caught as soon as possible. GitHub offers some out of the box features to help you with that, and you advice the team to implement these features as quick as they can.

## Challenge
DependaBot helps you to scan your repository for packages that are out of date and/or create security vulnerabilities. If it finds one, it creates a Pull Request with a fix, that you can directly merge in to your code. Code Scanning scans all your files for security issues, and reports those. In this challenge you will enable these 2 important security features. When this is enabled it is up to you to fix the issue in the package [Http-Proxy] as reported by DependaBot. Switch all low severity risks in Code Scanning to Won't Fix.

## Validation
* Code Scanning feature enabled
* DependaBot Enabled
* Issue in Http-Proxy package merged to master
* All low severity issues from Code Scanning are set to Won't Fix


![](/assets/2020-09-17-13-13-35.png)