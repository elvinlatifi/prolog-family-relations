# prolog-family-relations  
This is a small repo containing some prolog code that I wrote as part of an assignment in a logic course at university.  
The code defines different family relations, for example the following piece of code:  
son(X, Y):- man(X), parent(Y, X).  
can be translated to mean that X is a son to Y if the following two things are true:  
1. X is a man
2. Y is a parent to X 
