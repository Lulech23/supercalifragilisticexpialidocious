# supercalifragilisticexpialidocious
**Self-executing PowerShell scripts in a Batch wrapper**

## But why?
Have you ever wanted to execute a PowerShell script as easily as an application? This used to be the standard Windows experience with Batch files, but out of the box, Windows does not provide a one-click solution for this simple problem. Even the context menu "Run with PowerShell" feature added to Windows 11 may be limited by the current user's execution policy, creating additional setup steps for end users (other than yourself).

Wrapping PowerShell scripts as Batch files gives you the best of both worlds: application-like execution with a modern scripting language.

## No, really, but _why_?
Oh, you mean the name?

Dynamically executing Batch files to PowerShell scripts requires a header line of code to handle the conversion and passthrough of important context (working directory, arguments, etc.). This header line must also be able to identify itself for exclusion, thus leaving a valid PowerShell script behind.

The project name was chosen as a globally unique identifier which is highly unlikely to naturally occur anywhere else in PowerShell scripts. That's right: the bit of code `$script -notmatch 'supercalifragilisticexpialidocious'` is recursively matching itself!

## How am I supposed to use this?
If you need to deploy a PowerShell script as an executable file without any fuss, simply: 

1) Copy the magic header to the top of your script
2) Give your filename the extension ".bat"
3) Run it!

Note that two versions of the header are provided in the example files of this repository: "user.bat" and "admin.bat". For scripts that require elevation, "admin.bat" will automatically display a UAC prompt, saving yet another hassle for end users (and for you explaining it to them!).

## Isn't this dangerous?
If you're thinking that this trick works around safeguards intentionally placed by Microsoft, you're correct. However, there is an important distinction between _safeguards_ and _security_. Scripts executed using this method are still subject to all security policies. Also, you could consider it safer than the common alternative, which is compiling PowerShell scripts to ".exe" files, as the script code remains open to examination.

At the end of the day, it is up to developers to use this power responsibly, and users to exercise discretion with any untrusted scripts.

In my opinion, having the option is better than not.
