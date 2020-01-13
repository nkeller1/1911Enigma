# 1911Enigma

**Command to encrypt a file:**
ruby encrypt.rb message.txt encrypted.txt

**Command to decrypt a file:**
ruby decrypt.rb encrypted.txt decrypted.txt (type in key then date)

example:
ruby decrypt.rb encrypted.txt decrypted.txt 82648 240818


Functionality: I have a solid 3 here. All of my encrypt/decrypt and command line interface are successfully working. Better than i had hoped in face. I am able to encrypt/decrypt a massive letter with no errors at all.

Object Orientated Programming: I believe i have earned a 4 in this category. I have a module that does significant work for two classes (encryptmessage and decryptmessage). My project is broken into 6 different classes that follow SRP. The logic for offset and cipherkey could probably be combined into a universal shift class but I use the components for each individual class separately in engima.  

Ruby Conventions and Mechanics: This is technically a 3 because I have one method that is 11 lines long. None of my code is excessively long, I have eliminated all unused local variables. I used multiple hashes and I like all of my enumerables are the correct ones for the job.

TDD: I have earned a 4 here as well. I have looked for edge cases, I have tested random data with mocks and stubs, i have a 100% simplecov rate.

Version Control: I believe I have earned a 4 here as well. I worked really hard at making my commit methods non-ambigious and all of my PR'ds have bullet points for the functions they put into production. All PRs are chunks of code that make sense for the methods they push to master. I don't think any commits include more than one piece of functionality. By the numbers I have well over 40 commits.
