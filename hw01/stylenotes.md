# Style
1. Every top level function must have type defs
2. All significant code must have tests
3. Submitted code must copmile cleanly
4. Include a header comment: (name, date, number of assignment)
# Formatting
1. Don't use tab character, instead, use spaces to control indenting
2. 80 column lines
3. Naming conventions: (camelCase, module names begin with captial, pattern matching: x for head, xs for tail, don't capitalize all letters when using abbreviation)
# Comments
1. Use comments for what code do
2. Do not over comment
3. User proper english for comments
# Functionality
1. Write simple functions
2. No dead code, use different file or version control
3. Avoid partial functions (head, tail, fromJust)
# Pattern matching
1. No incomplete cases
2. Match in function args
3. Combine case matching
```
{
    case (x, y) -> match...
}
```
4. Misusing if statements, use boolean expression