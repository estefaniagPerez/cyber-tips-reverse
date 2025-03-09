# CyberSecurity Reverse Engineer Tips for Beginners

<a href='' target="_blank"><img alt='Cyber Security' src='https://img.shields.io/badge/Cyber_Security-100000?style=for-the-badge&logo=Cyber Security&logoColor=B60000&labelColor=FFA200&color=FFA200'/></a>

This repository contains a collection of simple and easy-to-follow lessons on various fundamental topics in binary analysis and reverse engineering, designed specifically for beginners. The main focus of these lessons is to explore common security concerns in binary files and learn how to mitigate them.

![alt text](image-1.png)

## Introduction

Most applications running on PCs, servers, mobile devices, and other platforms are binary files that the machine executes directly. In simple terms, an .exe file contains a set of instructions that the program carries out on the machine.

This raises a question: if the file includes a list of tasks for the machine to perform, can we modify those tasks so it does something else instead? The answer is, in a way, yes. But not only that—simply by analyzing the information contained in the binary, we might uncover vulnerabilities that enable us to attack the application or system in unexpected ways. For instance, leftover debugging symbols, hard-coded credentials, or unprotected entry points could reveal opportunities for exploits or allow unauthorized access.

Simply opening opening a binary file in a text editor won’t be enough to analyze it because it’s not written in a human-readable format. To understand and modify its instructions, we need specialized tools that interpret the file in the same way the machine does.

In this repository, we focus on executable files that are compiled directly to native machine binaries - like those written in C/C++ -.

## Tools
For analyzing binary files, there are a variety of tools available. In this repository, I will primarily demonstrate how to use these tools on Linux. Some of these tools are also available on Windows, or there are equivalent tools for Windows. That said, if you are using Windows, I recommend downloading a Virtual Machine with a Linux distribution, such as Kali Linux, which includes these tools on their repository and readily available.

To analyze binary files, there are many tools available. In this repository, I will demonstrate how to use some of these tools on Linux. Some are also available on Windows, or have Windows equivalents. However, if you’re using Windows, I recommend setting up a virtual machine with a Linux distribution - such as Kali Linux - that includes these tools in its repository.

Here are a few of the tools we’ll be using:

+ strings: this tool is very symple, it list all the text inside the executable.
+ radare2: this tool is a debugger for binaries, offering lots of features for analysis.
+ cutter: this tool is a graphical interface for radare2, and while not as powerful as radare itself, it serves as a useful starting point.
+ Ghidra: this tool is a very powerfull tool, used for decompiling and analyzing binaries - essentially converting the binary back into a higher-level source code representation -. It also has debugging capabilities but we are going to use radare2 for that part.

Another very popular tool is IDA Pro, a well-known solution in the field of binary analysis. It offers powerful features for analyzing binary files, decompiling code, and understanding program behavior.

## Sections

+ [01_coded_secrets](01_coded_secrets/README.md): a simple lesson on why secrets should not be hard-coded.
+ [02_jump_function](02_jump_function/README.md) (WIP): a lesson on why it is a bad practice to leave testing or debugging code on the program, even if you think it’s hidden or commented out.

