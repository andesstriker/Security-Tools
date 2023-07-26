#! /bin/bash

openssl enc -aes-256-cbc -salt -in $1.md -out $1.enc
read INPUT
if ["$INPUT" == ""];
then 
rm $1.md
fi