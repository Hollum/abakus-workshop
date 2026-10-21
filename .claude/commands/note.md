---
description: Write a note to workshop/NOTES.md in plain Norwegian
argument-hint: "[prompt|context|harness|loop|graph|other] <note>"
disable-model-invocation: true
---

Write a note to `workshop/NOTES.md`, the team's reflection sheet. The arguments are: $ARGUMENTS

1. Call the Skill tool with `simple-english`. Write every note in Norwegian (bokmål), like the questions. Apply the skill's sentence and structure rules to the Norwegian text, and choose plain Norwegian words in place of its English word lists.

2. Read `workshop/NOTES.md`. Each section is one question line, followed by its answer lines.

3. Pick the section for each note. If the first argument is one of these perspective words, it picks the section, and the rest of the arguments is the note:

   - `prompt`: the problem and the acceptance criteria
   - `context`: documented decisions and the information the agent can access
   - `harness`: tools, skills, permissions and verification
   - `loop`: how the agent evaluates and corrects its own work
   - `graph`: parallel tickets and their dependencies
   - `other`: Other relevant notes

   Without a perspective word, pick the question that the note answers. If the note answers none of them, use `other`.

   If the arguments are empty, take the notes from the current session: the decisions the team made, the problems the agent had, and what the team changed. Write one note for each question that the session gives evidence for.

4. Write each note into its section. If the section holds `_Fill in here_`, replace that line with the note. Otherwise, add the note on a new line after the last answer line of the section. Keep the question lines and the other sections exactly as they are.

5. Tell the user which section got which note.

6. Ask the team one follow-up question in Norwegian that makes them reflect. Base it on a note in one of the five perspective sections, if there is one. The question builds on that note and on the question of its section. Ask for the cause, the evidence, or what the team will change in their setup next time. If all notes are in `other`, ask which of the five perspectives the note is about, and what that tells the team about their setup.

7. If the team answers, write the answer into the same section with the rule in step 4. Then stop.
