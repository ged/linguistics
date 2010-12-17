
# Linguistics

http://deveiate.org/projects/Linguistics

## Description

Linguistics is a framework for building linguistic utilities for Ruby objects
in any language. It includes a generic language-independant front end, a
module for mapping language codes into language names, and a module which
contains various English-language utilities.

## General Information

### Method Interface

The Linguistics module comes with a language-independant mechanism for
extending core Ruby classes with linguistic methods.

It consists of three parts: a core linguistics module which contains the
class-extension framework for languages, a generic inflector class that serves
as a delegator for linguistic methods on Ruby objects, and one or more
language-specific modules which contain the actual linguistic functions.

The module works by adding a single instance method for each language named
after the language's two-letter code (or three-letter code, if no two-letter
code is defined by ISO639) to various Ruby classes. This allows many
language-specific methods to be added to objects without cluttering up the
interface or risking collision between them, albeit at the cost of three or four
more characters per method invocation. For example:

	Linguistics::use( :en )
	"goose".en.plural
	# => "geese"


### Adding Language Modules

To add a new language to the framework, [...rewrite after 2.0 is more stable...]


## English Language Module

Linguistics comes with an English-language module; see the API documentation for 
Linguistics::EN for more information about it.


## Authors

* Michael Granger <ged@FaerieMUD.org>
* Martin Chase <stillflame@FaerieMUD.org>


## Requirements

* Ruby >= 1.9.2


## Optional

* [Ruby-WordNet](http://deveiate.org/projects/Ruby-WordNet) (>= 1.1.0) - adds integration for the Ruby binding for the WordNet® lexical refrence system.

* [LinkParser](http://deveiate.org/projects/Ruby-LinkParser) (>= 1.1.0) - Ruby high-level interface to the CMU Link Grammar library



