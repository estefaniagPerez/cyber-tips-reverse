# Cybersecurity Reverse Engineering Tips for Beginners

<a href='' target="_blank"><img alt='Cyber Security' src='https://img.shields.io/badge/Cyber_Security-100000?style=for-the-badge&logo=Cyber Security&logoColor=B60000&labelColor=FFA200&color=FFA200'/></a>

This repository contains a collection of simple, easy-to-follow lessons on various fundamental topics in binary analysis and reverse engineering, designed specifically for beginners.The main focus of these lessons is to explore common security concerns in binary files and learn how to mitigate them.

![alt text](image-1.png)

## Introduction

Most applications running on PCs, servers, mobile devices, and other platforms are binary files that the machine executes directly. In simple terms, an .exe file contains a set of instructions that the program carries out on the machine.

This raises a question: if the file includes a list of tasks for the machine to perform, can we modify those tasks so that it does something else instead? The answer is, in a way, yes. Moreover, by analyzing the information contained in the binary, we might uncover vulnerabilities that enable us to attack the application or system in unexpected ways. For instance, leftover debugging symbols, hard-coded credentials, or unprotected entry points could reveal opportunities for exploits or allow unauthorized access.

Simply opening a binary file in a text editor won’t be enough to analyze it because it isn’t written in a human-readable format. To understand and modify its instructions, we need specialized tools that interpret the file in the same way the machine does.

In this repository, we focus on executable files that are compiled directly into native machine binaries, such as those written in C/C++.

## Tools

To analyze binary files, there are many tools available. In this repository, I will primarily demonstrate how to use these tools on Linux. Many of these tools are available on Windows or have Windows equivalents. However, if you’re using Windows, I recommend setting up a virtual machine with a Linux distribution—such as Kali Linux—which includes these tools in its repository.

Here are a few of the tools we’ll be using:

+ strings: This tool is very simple and lists all the text within the executable.
+ radare2: This tool is a debugger for binaries, offering many features for analysis.
+ cutter: This tool is a graphical interface for radare2. Although it isn’t as powerful as radare2 itself, it serves as a useful starting point.
+ Ghidra: This very powerful tool is used for decompiling and analyzing binaries—essentially converting them into a higher-level source code representation. It also has debugging capabilities, but we will use radare2 for that.

Another popular tool is IDA Pro, a well-known solution in the field of binary analysis. It offers powerful features for analyzing binary files, decompiling code, and understanding program behavior.

## Sections

+ [01_coded_secrets](01_coded_secrets/README.md): a simple lesson on why secrets should not be hard-coded.
+ [02_jump_function](02_jump_function/README.md): a lesson on why it is bad practice to leave testing or debugging code in the program, even if you think it’s hidden or commented out.
