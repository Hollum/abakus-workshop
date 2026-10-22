---
description: Generate a random product idea and write it to workshop/PRODUCT_BRIEF.md
argument-hint: "[theme] [product type]"
disable-model-invocation: true
---

Create a fictional product for a software development workshop. Skilled students will use Claude Code to build it as a web application in two hours. The arguments are: $ARGUMENTS

1. Pick two words: a theme and a product type. A theme is a group, a world, or a topic (Vikings, pirates, retirement homes). A product type is a well-known kind of app or service (Tinder, Uber, Strava).
   - If the arguments give one or both words, use them, and pick only the missing word. Arguments that are only `regenerate` give no words.
   - Otherwise, brainstorm 10 funny themes and 10 product types. Then run `echo $((RANDOM % 10 + 1)) $((RANDOM % 10 + 1))` and take the theme and the product type at those two positions. The shell picks the numbers, so each team gets a different product.

2. Combine the two words into one product with a clear purpose and a specific target audience. "Viking" + "Tinder" becomes a dating platform for Vikings. Be playful and a little absurd: the product can be strange or ridiculous, as long as both words make sense together and the result works as an interactive website.

3. Write `workshop/PRODUCT_BRIEF.md` in Norwegian (bokmål), with these headings:

   - `# <product name>`: short and memorable.
   - `## Valgte ord`: the theme and the product type.
   - `## Produktbeskrivelse`: 150–200 words. Who uses the product, what problem it solves, and why people want it. Explain it through one concrete, entertaining scenario.
   - `## Eksempel på brukerreise`: one person who uses the product, in a few short, concrete steps.

   The brief describes the product from the user's side only. Every question about how to build it (technology, data model, design, tickets) stays open for the students. The brief is their starting point, not the solution.

4. Tell the user the product name and that the next step is `/grill-with-docs`. Always end the message by telling the user that they can write `regenerate` to get a new product description. Do this every time you write the brief, also after a `regenerate`.

5. If the user writes `regenerate`, go back to step 1 and make a new product. Use the words after `regenerate`, if there are any. Otherwise, brainstorm new lists and run the shell command again, until you get a combination that you have not used in this session. Replace the old brief in `workshop/PRODUCT_BRIEF.md`.

Only create or update `workshop/PRODUCT_BRIEF.md`. When the brief is ready, stop and wait for the user.
