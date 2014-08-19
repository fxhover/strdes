Strdes
======

A simple string encryption and decryption

Installation
============

> gem install strdes

Or in rails:

> gem "strdes"

And run bundle install. 

Use
====
> require 'strdes'


String encryption:
  
> Strdes.encode("string")

String decryption:
  
> Strdes.decode("a secret string")

Acknowledgements
================
Copyright fxhover, released under the MIT License.

