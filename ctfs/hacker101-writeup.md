## Micro-CMS v1
- flag 1 
    - xss using a any payload that doesn't use the word script
    - the flag is only seen using inspect element
- flag 2 
    - noticed that got forbidden error message when doing url/page/5
    - payload https://0b6d9418aa541799bf4734fb089d9663.ctf.hacker101.com/page/edit/5 works to show the private page and the flag
- flag 3
    - <script> alert(0) </script> on title and when you are on homepage it executes
- flag 4 
    - sql injection in the url when doing edit 

## Postbook
- flags 
    - ^FLAG^3e5c4b4659f837726240277c91c20b1ae8ed91d51dd9f44cfbddfe69adff73a1$FLAG$
    - ^FLAG^04e271154b67f2b04c4838dfa09d421ceb290fa968e7e35bcfd859f152bef30f$FLAG$
- Notes
    - document.cookie = id=eccbc87e4b5ce2fe28308fd9f2a7baf3
- first flag 
    - a private post was accesible by guessing that there was one for id=2

## Petshop
- flag 1 change the values to get something cheaper
