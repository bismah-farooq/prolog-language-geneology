# Prolog Language Genealogy

This project implements a genealogy of programming languages using Prolog.
It models how programming languages are historically related and allows
logical queries about language ancestry and influence.

## Overview

Programming languages rarely appear in isolation. Most languages are inspired
by or derived from earlier ones. This project represents those relationships
using Prolog facts and rules, demonstrating how logic programming can be used
to reason about hierarchical and historical data.

The program supports queries that explore parent–child relationships as well
as transitive ancestry between programming languages.

## File Structure

prolog_language_genealogy.pl  
Contains all Prolog facts and rules defining programming languages, their
creation dates, and genealogy relationships.

README.md  
Project documentation.

## Running the Program

This project uses SWI-Prolog.

Start the Prolog interpreter:
swipl

Load the program:
?- consult('prolog_language_genealogy.pl').

## Sample Queries

List all direct parent relationships:
?- parent(X, Y).

Find all ancestors of a language:
?- ancestor(X, Y).

Query languages created after a certain year:
?- date(Language, Year), Year > 2000.

## Purpose

The purpose of this project is to demonstrate:
- Representation of real-world relationships using Prolog facts
- Use of rules to define recursive relationships
- Logical querying and inference in a declarative programming language

## Author

Bismah Farooq  
Computer Science Student

## Notes

This project was created as part of an academic assignment focused on logic
programming and knowledge representation using Prolog.
