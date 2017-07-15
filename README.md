# Gilded Rose Refactoring Kata

## Refactoring

- The first step I took with this kata was to write tests, tests that covered every item and every method within the Guilded Rose <code>update_quality</code> method. This would allow me to confirmed that everything is working as it should.
- Before I implemented the missing item <i>Conjure</i> to the <code>update_quality</code> method, my next step was to refactor. With the test written, I was able to refactor but not change the outcome of the method.
- I split the conditionals with <code>update_quality</code> into smaller methods for each item category.
- With these smaller simpler methods, I then needed to extract an object and create classes.

## How to run tests

- Clone this repository
- Run <code> $ bundle install </code>
- Run <code> $ rspec </code>

![screen shot 2017-07-15 at 21 20 21](https://user-images.githubusercontent.com/17644847/28242574-43ede27e-69a7-11e7-8b28-28c2722d9b15.png)

## How to run the program

- Item must require a name / special item, quality amount and how many days it must sell in.

Example of how to update your items; quality and sell in.

![screen shot 2017-07-15 at 21 24 12](https://user-images.githubusercontent.com/17644847/28242573-43ed839c-69a7-11e7-80a0-49cb3a704db3.png)
