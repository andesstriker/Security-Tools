#! /bin/bash

RESPONSE=`openssl enc -d -aes-256-cbc -in $1.enc -out $1.md`
if ["$RESPONSE" == ""];
then 
rm $1.enc
fi