# Alloy-FOPC
Work on expressing Alloy models in first-order predicate calculus.

The Alloy modeling language (see http://alloytools.org/) and the Alloy
Analyzer are extremely helpful modeling tools.  The material in this
repository relates to efforts to write formulas in conventional
first-order predicate calculus which are equivalent to the constraints
expressed in the Alloy model.  

In some ways this is a purely notational exercise: Alloy is already a
first-order logic, and it's just a matter of spelling some operators
differently (∧ instead of `and` or `&&`, etc.).  In other ways, it
seems to be a matter of more than notation: the kind of notation we
have in mind for first-order logic is what is covered in standard
treatments like Smullyan 1968 or Jeffrey 1967, or what might be
accepted by a tableau-style theorem prover based on the proof method
they describe, and there is a certain gap between what one can write
in Alloy as a simple formula and what one can write in the syntax of
Smullyan or Jeffrey.  (Jeffrey describes what is sometimes referred to
a first-order logic with identity and functions; Smullyan does not
cover identity or functions.)

Jackson writes (p. 264):

> Alloy is a first-order relational logic.  The values assigned to
> variable, and the values of expressions evaluated in the context of
> a given instance, are *relations*.  These relations are first-order:
> that is, they consist of tuples whose elements are atoms (and not
> themselves relations).

Our goal, at least initially, is to find a way to express our Alloy
models in a first-order logic in which variables are bound only to
individuals (*atoms*, in the usage adopted by Jackson), not to
relations.  If we succeed, we will have an additional account of Alloy
semantics to put beside that offered by Jackson in Appendix C of his
book (and doubtless in more detail in working papers and technical
publications) -- perhaps of interest only to those whose preference
for desert landscapes makes them leery of assuming the existence of
things like sets and tuples, and perhaps mostly an exercise in changes
of notation and wording.  If we fail, we will have learned something
very important and helpful to us (although presumably not new to
Jackson or to those who have worked on set theory and the differences
between first- and higher-order logics in the last century or so).

For now, our target logic is defined informally as roughly what is
covered in Jeffrey.  We may or may not need functions, but we do
expect we'll need identity.

## License
All prose documents, schemas, and grammars in this project are
licensed under the [Creative Commons Attribution - ShareAlike 4.0
International](https://creativecommons.org/licenses/by-sa/4.0/)
license.

Any source code and software documentation in this project is licensed under the 
Gnu General Public License v3.0.

If we have been careful and done things right, there will be appropriate 
LICENSE or COPYING files in suitable locations.  But don't hold your breath.

## References

Daniel Jackson, *Software Abstraction: Logic, language, and analysis*,
rev. ed. (Cambridge, Mass.: MIT Press, 2012).

Richard C. Jeffrey, *Formal logic: its scope and limits* (New York:
McGraw-Hill, 1967).

Raymond Smullyan, *First-order logic* (New York: Springer, 1968;
corrected republication Mineola, NY: Dover, 1995).
