import 'package:laughmaker_your_journal/models/guide.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';

final List<Guide> guides = [
  Guide(
    id: 0,
    title: "10 Ways to Write One-Liners",
    description: "When you break it down, it turns out most one-line jokes use one of the following techniques.",
    color: AppTheme.red,
    paragraphs: [
      Paragraph(content: "One-liners (a.k.a. Monologue Jokes) are an important part of our lives. The average person laughs 38.2 times a day because of one-liner jokes. It's true - it's in Wikipedia. I wrote it there myself.\n\nOne-liners have grown more and more popular in recent decades. They've replaced our grandparents' humor, based on long tales that were basically repeated the same joke:"),
      BoldParagraph(content: "Three people from three different ethnic groups walk into a bar. The first two say something smart, and the third says something that embarrasses his entire ethnic group. (Bill Bailey)"),
      Paragraph(content: "Thankfully they took the secret of how to write these jokes to their grave. R.I.P. lame long jokes! Hello short one-liners, tailored for a generation with attention deficit disorder and zero tolerance. Allow me to demonstrate it, but I need to warn you -"),
      BoldParagraph(content: "analyzing humor is like dissecting a frog. Few people are interested and the frog dies of it. (E.B. White)"),
      Paragraph(content: "Let's use the next one-liner as an example:"),
      BoldParagraph(content: "The hardest part about my grandmother's death was - making it seem like an accident. (Dick David)"),
      MixedParagraph(
        list: [
          Paragraph(content: "As you can see there are 2 parts for the one liner. The "),
          BoldParagraph(content: "SET-UP"),
          Paragraph(content: ", in that case - The hardest part about my grandmother's death was - sets your mind in one very clear direction. You are \"set up\" to hear all kinds of expected endings to that sentence - the usual platitudes regarding the difficulty of losing a beloved one. But instead, you get the PUNCHLINE, a surprising twist you weren't expecting, which changes the meaning of the entire sentence. In this case - making it seem like an accident.\n"),
        ],
      ),
      MixedParagraph(
        list: [
          Paragraph(content: "When writing One-Liners there are 2 basic ground rules. The first is the length of the joke - the shorter the distance between the setup and the punch line, the funnier it is. The second is that the punch line will "),
          BoldParagraph(content: "always"),
          Paragraph(content: " be at the end.\n"),
        ],
      ),
      Paragraph(content: "Now that we have the structure and the two simple rules, the question remains- what makes a joke funny? When you break it down, it turns out most jokes use one of the following techniques:"),
      MixedParagraph(
        list: [
          BoldParagraph(content: "1) Verbal Jokes: Pun\n\n"),
          Paragraph(content: ": One word, two meanings. Our brain hears the first part of the sentence and assumes meaning A, but then the punch-line twists it, and it turns out to be meaning B.It can be the word itself or its context in the sentence -For example:\n\n"),
          BoldParagraph(content: "Throwing acid is wrong, in some people's eyes. (Jimmy Carr)\n\n"),
          Paragraph(content: "Or:\n\n"),
          BoldParagraph(content: "I once shot an elephant in my pajamas; how he got in my pajamas I'll never know. (Graucho Marx)\n"),
        ],
      ),
      MixedParagraph(
        list: [
          BoldParagraph(content: "2) Verbal Jokes: Bun"),
          Paragraph(content: " (it's like a pun but not 100%): A Very tricky technique where the punch sounds a bit like the word expected from the setup, but not really. It's a very risky technique, as you may easily find yourself with a childish jest instead of a solid funny joke. The end result being a cough, instead of a laugh (that's a good example for a bad use of that technique)."),
        ],
      ),
      Paragraph(content: "For example:"),
      BoldParagraph(content: "Congratulations to Dolly Parton. She received an honorary degree from the University of Tennessee. It's a Ph.-Double-D. (Jay Leno)"),
      Paragraph(content: "Or:"),
      BoldParagraph(content: "In the year 3000 YouTube, Twitter & Facebook will merge into one super time wasting website called YouTwitFace. (Conan O'brien)"),
      MixedParagraph(
        list: [
          Paragraph(content: "3) "),
          BoldParagraph(content: "Reverse Humor"),
          Paragraph(content: ": The Set up makes the listeners expect one thing and the punch-line surprises them with the exact opposite. For example:\n"),
        ],
      ),
      BoldParagraph(content: "A mysterious man was knocking all night long on Paris Hilton's door. Come morning, she was fed up with it, so she let him out. (David Letterman)"),
      MixedParagraph(
        list: [
          Paragraph(content: "4) "),
          BoldParagraph(content: "Situation Humor"),
          Paragraph(content: ": In those kinds of jokes, it's crucial that the setup be as vivid as possible in order to help listeners picture the situation in their heads. Now that the necessary assumptions were made, the punch line adds an unexpected factor that changes the picture completely. The humor here is a result of the dissonance between the assumptions we made about the outcome of the situation- and the surprise generated by a completely different and usually absurd outcome.\nFor example:\n"),
        ],
      ),
      BoldParagraph(content: "The first ever spices festival opened this week. The festival ended earlier than expected when someone switched on the ceiling fan. (Omri Marcus)"),
      Paragraph(content: "Or:"),
      BoldParagraph(content: "I once saw my grandparents having sex, and that's why I don't eat raisins. (Zach Galifianakis)"),
      MixedParagraph(
        list: [
          Paragraph(content: "5) "),
          BoldParagraph(content: "Humor based on Stereotype\n"),
        ],
      ),
      Paragraph(content: "- Stereotypes are one of the techniques our brain uses to simplify the complicated reality around us. One of the most common ways of writing jokes is to treat those stereotypes as solid truth. Sometimes stereotypes can be offensive, but since all comedy writers are left wing Jews with glasses, who love money and porn - we're entitled.For example:"),
      BoldParagraph(content: "Two volunteer groups in Arizona have set up cameras on the Mexican border, so that people with fast internet connections can sign up to monitor the cameras remotely and report illegal immigrants. Said one illegal immigrant, 'Hey, free camera! (Alex Baze, SNL)"),
      Paragraph(content: "Or:"),
      BoldParagraph(content: "A new survey claims that in 67% of households - the woman is in charge of the cleaning. The rest of the houses are dirty. (Avi Ettinger & Asaf Beiser)"),
      MixedParagraph(
        list: [
          Paragraph(content: "6) "),
          BoldParagraph(content: "Humor based on Observations"),
          Paragraph(content: " - Humor based on common experience rather than common knowledge . It refers to the many things in life that are not written anywhere and most of them are so obvious that we don't even talk about them. We know them because we live in western society. It can be a can of juice that's hard to open, or the fact that with a certain brand you always get stuck with an annoying aftertaste. The humor is generated here by saying that \"secret\" out loud.\nFor example:\n"),
        ],
      ),
      BoldParagraph(content: "Ikea's founder said in an interview that he drives a 15 year old car. He bought it 15 years ago, but finished assembling it only this week. (Avi Ettinger & Asaf Beiser)"),
      Paragraph(content: "Or:"),
      BoldParagraph(content: "You know 'that look' women get when they want sex? Me neither (Steve Martin)"),
      MixedParagraph(
        list: [
          Paragraph(content: "7) "),
          BoldParagraph(content: "Humor based on a Common Everyday Problem"),
          Paragraph(content: " - Honestly, It's quite similar to the previous one, but the laughter comes from a sublimation of our anger or even rage into humor. It's most common in married life, where one has to deal with ongoing, regularly occurring, annoying actions by his/her spouse without losing their mind. To shout and argue would be one option - to laugh at it, can be much easier. Especially on your back, because you won't sleep on the couch afterwards.\nFor example:\n\n"),
        ],
      ),
      BoldParagraph(content: "A new study shows that drinking coffee can increase a women's sexual urge. Researchers warn however that the pillow talk will last all night long. (Jimmy Kimmel)"),
      Paragraph(content: "Or from a totally different field:"),
      BoldParagraph(content: "A hotel will be opened in UK's largest shopping mall. The main target audience - people who failed to find their car in the parking lot. (Omri Marcus)"),
      MixedParagraph(
        list: [
          Paragraph(content: "8) "),
          BoldParagraph(content: "Humor based on extreme approach\n"),
        ],
      ),
      Paragraph(content: "- Laughter can also deal with our deepest fears. If we can't control what scares us, the second best thing to do, is to laugh about it. The result is a great feeling of power - a small victory over fear. Come on - let's say the worst imaginable thing, and enjoy the one second our Id goes wild before our better judgment kicks in. For example here is a one-liner about the most common fear - death:"),
      BoldParagraph(content: "I want to die peacefully in my sleep like my grandfather... Not screaming and yelling like the passengers in his car(Bob Monkhouse)"),
      Paragraph(content: "Or another one about pedophiles:"),
      BoldParagraph(content: "I met an amazing girl on the internet. Smart, sexy, uninhibited...of course it turned out to be a twelve-year-old paraplegic boy. I'll be honest - the sex was disappointing. (Jimmy Carr)"),
      MixedParagraph(
        list: [
          Paragraph(content: "9) "),
          BoldParagraph(content: "Humor based on Surrealism"),
          Paragraph(content: "  - Surrealism can be quite a challenge. These jokes play by their own rules. You run the risk that people who weren't in the room when the joke was written won't get it. In order to understand these jokes you sometimes need to be in college, with a bag of weed, otherwise it might sound like a mistake rather than a joke.\n"),
        ],
      ),
      BoldParagraph(content: "Guns don't kill people, people kill people, and monkeys do too (if they have a gun).(Eddie Izzard)"),
      Paragraph(content: "Or:"),
      BoldParagraph(content: "According to Freud, what comes between fear and sex?Funf (from Jimmy Carr's book Only Joking)"),
      MixedParagraph(
        list: [
          Paragraph(content: "10) "),
          BoldParagraph(content: "Political Humor"),
          Paragraph(content: " - It's not necessarily that the others lack in meaning, but in a one-liner with a message the laughter is a side effect rather than the main objective. This is often when we use the laugh track to signal to the audience where the punch line is. Still - sometimes humor is the spoonful of sugar that helps the medicine go down.\nFor example:\n"),
        ],
      ),
      BoldParagraph(content: "If the evens of September 11th have proven anything, it's that the terrorists can attack us, but they can't take away what makes us American - our freedom, our liberty, our civil rights. No, only Attorney General John Ashcroft can do that. (Jon Stewart)"),
      Paragraph(content: "So the next time your favorite late night show is on, try to classify the jokes. For a short time, it might look easy and something that anyone can do. However, you should keep in mind that each joke involves hours of hard work. Scanning newspapers, writing and rewriting, passionately arguing that a mango is funnier fruit than a pineapple - and eventually it will be less than 10 seconds on the air, including the laughter of the audience. Still, we love it, and it's better than being a waiter."),
      Paragraph(content: "Don't forget: humor is the best medicine, though if you have cancer, you'd better go for chemotherapy."),
    ],
  ),
  Guide(
    id: 1,
    title: "9 Tips for Writing the Best Jokes",
    description: "While having a relatable sense of humor is helpful, honing your comedy writing skills and crafting the perfect punchline takes a lot of time and practice.",
    color: AppTheme.orange,
    paragraphs: [
      MixedParagraph(
        list: [
          Paragraph(content: "1. "),
          BoldParagraph(content: "Do comedy writing exercises."),
          Paragraph(content: " An important skill for comedy writing is the ability to take funny ideas and turn them into jokes or funny stories. You can practice your storytelling and joke writing skills through various prompts, as well as uncover new material along the way. Having a set up ready for you to finish can help brainstorm your own ideas, as well as get your creative juices flowing.\n"),
        ],
      ),
      MixedParagraph(
        list: [
          Paragraph(content: "2. "),
          BoldParagraph(content: "Know your audience."),
          Paragraph(content: " Not all humor writing hits equally. A raunchy comedy TV show about divorced moms probably won’t appeal to a teen demographic. A stand-up comic’s jokes about politics may not be funny in certain states. Humor is subjective, but knowing who your sitcom, stand-up set, or satirical short story is for can greatly improve the chance that your audience will find it relatable and funny.\n"),
        ],
      ),
      MixedParagraph(
        list: [
          Paragraph(content: "3. "),
          BoldParagraph(content: "Subvert expectations."),
          Paragraph(content: " Contrasting or changing up expectations—also known as incongruity—is a useful technique for writing jokes. Humor often comes from the unpredicted or abnormal, and when you use unexpected ideas, words, or images to replace what was logically anticipated for a punchline, you create incongruity. TV comedy screenwriters, improve actors, and stand-up comics all make use of incongruity to bring humor through surprise, which might make the audience members and viewers at home laugh.\n"),
        ],
      ),
      MixedParagraph(
        list: [
          Paragraph(content: "4. "),
          BoldParagraph(content: "Know when to pay it off."),
          Paragraph(content: " The more you build up a joke, the better the pay off should be. A set up that meanders too long or tries to do too much will eventually lose steam, and you won’t get the big laughs you were planning for. A good tip to remember is “the rule of three,” where a particular joke hits twice, establishing a pattern and building tension, then pays off on the third time. You can use this style in many different ways, like in dialogue (“I came, I saw, I broke my toe”), or spread it out across the three acts of a screenplay. This works well in tandem with subverting expectations, as the third hit of the joke is usually the unexpected.\n"),
        ],
      ),
      MixedParagraph(
        list: [
          Paragraph(content: "5. "),
          BoldParagraph(content: "Ensure the joke fits."),
          Paragraph(content: " When you’re trying to write funny dialogue or scenarios for screenwriting, novels, or stories, don’t just put in a joke because it’s a funny joke—everything changes with context. Unless it’s relevant to the plot, if you’ve established your main character as a serious type who suddenly starts making the kinds of jokes a different, funnier character makes, it’ll create inconsistency for the viewer, and probably won’t be as funny.\n"),
        ],
      ),
      MixedParagraph(
        list: [
          Paragraph(content: "6. "),
          BoldParagraph(content: "Use callbacks."),
          Paragraph(content: " Bringing back a comedic line from earlier to play in a different context is a strategic way to refresh a joke or create a feeling of completion in the audience’s mind. Callbacks are not just useful for getting laughs, but tying together your material and helping the audience feel satisfied as well (famed humor columnist Dave Barry is especially known for this technique).\n"),
        ],
      ),
      MixedParagraph(
        list: [
          Paragraph(content: "7. "),
          BoldParagraph(content: "Reach beyond the low-hanging fruit."),
          Paragraph(content: " Puns are easy because they’re shallow wordplay, but real humor takes digging and true observation. If the joke feels too easy, it’s because it probably is. Take your time and think about the image or concept you’re trying to establish and convey to your audience, and do it in the most unique or different way you can to separate it from the hundreds of other jokes that may be just like it.\n"),
        ],
      ),
      MixedParagraph(
        list: [
          Paragraph(content: "8. "),
          BoldParagraph(content: "Tell the truth."),
          Paragraph(content: " The phrase “it’s funny because it’s true” exists for a reason—the most universally relatable feelings and experiences are generally the funniest because it’s something the majority of people can share. Self-awareness about a situation or event that others can empathize with and see the humor in is a good way to connect to your audience and make them laugh.\n"),
        ],
      ),
      MixedParagraph(
        list: [
          Paragraph(content: "9. "),
          BoldParagraph(content: "Do it again."),
          Paragraph(content: " If you think your funniest one-liner was written perfectly the first time, try writing it again—several more times, in fact. The first draft of a joke will probably not be its final form, and it’s important for humor writers to craft multiple versions to see which works best. Read it out loud, check the cadence, cut down on wordiness if possible, or see how many different iterations you can write.\n"),
        ],
      ),
    ],
  ),
  Guide(
    id: 2,
    title: "How to Write a Joke",
    description: "Every good joke begins as an idea. That idea is then tweaked and polished into a magical moment that makes people laugh. To start writing jokes:",
    color: AppTheme.greenAccent,
    paragraphs: [
      MixedParagraph(
        list: [
          BoldParagraph(content: "Study the greats."),
          Paragraph(content: " Watch performances by comedians that make you laugh. Take notes on their content, pacing, and delivery, and see if you can apply these elements to your own comedy.\n"),
        ],
      ),
      MixedParagraph(
        list: [
          BoldParagraph(content: "Research."),
          Paragraph(content: " If you’re stalling on joke ideas, research a variety of topics (for example, celebrities, politics, everyday experiences like riding the bus) and see if you can come up with a benign violation about those topics. “There are millions of topics out there,” Grant says. “There’s a whole world of jokes waiting to be written and delivered to an audience.”\n"),
        ],
      ),
      MixedParagraph(
        list: [
          BoldParagraph(content: "Write it out."),
          Paragraph(content: " Writing creates a tangible record of your ideas. It allows you to transform your ideas into jokes instead of losing them to the trappings of memory.\n"),
        ],
      ),
      MixedParagraph(
        list: [
          BoldParagraph(content: "Add structure."),
          Paragraph(content: " Now that you have some ideas, it’s time to structure them as jokes. Grant advises thinking of the joke as analogous to an essay: “When I write jokes, I follow that structure: beginning, middle, end. The topic is the beginning. The crazy stuff you do in the middle is the body. And you always have to end on some type of laugh that makes sense to sum up the joke, aka the punch line.”\n"),
        ],
      ),
      MixedParagraph(
        list: [
          BoldParagraph(content: "Build comedy throughout."),
          Paragraph(content: " Include multiple moments of humor throughout longer jokes. Jab lines make your audience laugh even before hearing the punch line.\n"),
        ],
      ),
      MixedParagraph(
        list: [
          BoldParagraph(content: "Create a powerful punch line."),
          Paragraph(content: " It’s called a punch line because it’s supposed to pack a punch. Surprise your audience by playing with differences between expectations and reality. Keep the punch line brief, surprising, and of course, funny.\n"),
        ],
      ),
      MixedParagraph(
        list: [
          BoldParagraph(content: "Revise."),
          Paragraph(content: " Once you’re done with the first draft of your joke, take a break to clear your mind, and then take your time revising. Unnecessary words and overly lengthy exposition can lose audiences. Clear those out and make your joke as brief and concise as possible—while still providing the narrative complexity needed to understand the joke.\n"),
        ],
      ),
      MixedParagraph(
        list: [
          BoldParagraph(content: "Test it out."),
          Paragraph(content: " Practice reading your joke aloud to refine pacing and delivery. Then, test it out on friends, family, internet strangers, whomever! If it gets a laugh, you’re on the right track. If not, take another tackle at the joke, or scrap it and try writing a new one. “I’ve written over 10,000 jokes in my career. Some I’ve used and some… I would never be able to use all of them,” Grant says. “But that’s OK. I would rather have an overflow of jokes than no jokes at all.”\n"),
        ],
      ),
      MixedParagraph(
        list: [
          BoldParagraph(content: "Perform. "),
          Paragraph(content: " Once you’re confident your joke can make people laugh, aim big by making a self-tape—or bigger by shooting your shot at a local comedy show. Performing will give you the most information about whether or not your jokes are landing the way you want. \n"),
        ],
      ),
      Paragraph(content: "You’re ready to start crafting your own witticisms, wisecracks, and japes. Have fun with the process—and remember to laugh."),
    ],
  ),
  Guide(
    id: 3,
    title: "HOW-TO: Understanding One-Liner Jokes",
    description: "One-liner jokes are concise and punchy statements that deliver humor in a single line. They often rely on wordplay, unexpected twists, or clever observations.",
    color: AppTheme.green,
    paragraphs: [
      BoldParagraph(content: "Key Elements of a One-Liner Joke"),
      MixedParagraph(
        id: '1',
        list: [
          BoldParagraph(content: "Setup and Punchline:"),
          Paragraph(content: " Even in a one-liner, there’s often a setup that creates a context and a punchline that delivers the surprise or twist.\n"),
        ],
      ),
      MixedParagraph(
        id: '2',
        list: [
          BoldParagraph(content: "Brevity:"),
          Paragraph(content: " Keep it short and to the point. The humor should be immediate.\n"),
        ],
      ),
      MixedParagraph(
        id: '3',
        list: [
          BoldParagraph(content: "Surprise or Twist:"),
          Paragraph(content: " The punchline should have an unexpected element that catches the audience off guard.\n"),
        ],
      ),
      MixedParagraph(
        id: '4',
        list: [
          BoldParagraph(content: "Wordplay:"),
          Paragraph(content: " Puns, double entendres, and clever word usage often enhance the humor.\n"),
        ],
      ),
      MixedParagraph(
        id: '5',
        list: [
          BoldParagraph(content: "Relatability: "),
          Paragraph(content: " The joke should resonate with a wide audience or tap into universal experiences or knowledge.\n\n"),
        ],
      ),
      BoldParagraph(content: "Steps to Write a One-Liner Joke"),
      MixedParagraph(
        id: '1',
        list: [
          BoldParagraph(content: "Identify a Topic or Theme:"),
          Paragraph(content: " Start with a subject you find funny or something current and relatable. For example, technology, everyday life, relationships, etc.\nExample: Technology\n"),
        ],
      ),
      MixedParagraph(
        id: '2',
        list: [
          BoldParagraph(content: "Brainstorm Associations and Ideas:"),
          Paragraph(content: " Jot down words, phrases, and ideas related to your topic. Think about common situations or clichés you can twist.\nExample: Phone, battery, charger, social media, notifications\n"),
        ],
      ),
      MixedParagraph(
        id: '3',
        list: [
          BoldParagraph(content: "Create a Setup:"),
          Paragraph(content: " Develop a statement that leads into the joke. This doesn’t need to be long, just enough to set the context.\nExample: “My phone's battery”\n"),
        ],
      ),
      MixedParagraph(
        id: '4',
        list: [
          BoldParagraph(content: "Think of a Twist or Punchline:"),
          Paragraph(content: " Add an unexpected twist or clever observation that subverts the setup.\nExample: “…is like my social life—it drains faster than I can recharge.”\n"),
        ],
      ),
      MixedParagraph(
        id: '5',
        list: [
          BoldParagraph(content: "Combine and Refine:"),
          Paragraph(content: " Put the setup and punchline together, then refine it to be as concise as possible.\nExample: “My phone’s battery is like my social life—it drains faster than I can recharge.”\n\n"),
        ],
      ),
      BoldParagraph(content: "Examples of One-Liner Jokes"),
      MixedParagraph(
        id: '1',
        list: [
          BoldParagraph(content: "Classic Example:"),
          Paragraph(content: " “I used to play piano by ear, but now I use my hands.\n"),
        ],
      ),
      MixedParagraph(
        id: '2',
        list: [
          BoldParagraph(content: "Observational Example:"),
          Paragraph(content: " “I told my computer I needed a break, and now it won’t stop sending me KitKat ads.”\n"),
        ],
      ),
      MixedParagraph(
        id: '3',
        list: [
          BoldParagraph(content: "Punny Example:"),
          Paragraph(content: " “I would tell you a joke about an elevator, but it’s an uplifting experience.”\n\n"),
        ],
      ),
      BoldParagraph(content: "Tips for Effective One-Liners"),
      MixedParagraph(
        id: '1',
        list: [
          BoldParagraph(content: "Practice Economy of Words:"),
          Paragraph(content: " Use the fewest words possible without losing clarity.\n"),
        ],
      ),
      MixedParagraph(
        id: '2',
        list: [
          BoldParagraph(content: "Use Common Experiences:"),
          Paragraph(content: " Jokes about universal experiences are more likely to resonate.\n"),
        ],
      ),
      MixedParagraph(
        id: '3',
        list: [
          BoldParagraph(content: "Test Different Angles:"),
          Paragraph(content: " Try out different setups and punchlines to see what works best.\n"),
        ],
      ),
      MixedParagraph(
        id: '4',
        list: [
          BoldParagraph(content: "Avoid Over-Complexity:"),
          Paragraph(content: " Keep it simple. Complexity can make the joke fall flat.\n"),
        ],
      ),
      MixedParagraph(
        id: '5',
        list: [
          BoldParagraph(content: "Read and Analyze:"),
          Paragraph(content: " Read one-liners from comedians and analyze why they work.\n\n"),
        ],
      ),
      BoldParagraph(content: "Common Pitfalls to Avoid"),
      MixedParagraph(
        id: '1',
        list: [
          BoldParagraph(content: "Clichés:"),
          Paragraph(content: " Avoid overused phrases unless you’re putting a fresh twist on them.\n"),
        ],
      ),
      MixedParagraph(
        id: '2',
        list: [
          BoldParagraph(content: "Offensive Content:"),
          Paragraph(content: " Steer clear of humor that might offend or alienate your audience.\n"),
        ],
      ),
      MixedParagraph(
        id: '3',
        list: [
          BoldParagraph(content: "Over-Explanations:"),
          Paragraph(content: " Don’t over-explain the joke. The humor should be clear immediately.\n"),
        ],
      ),
      MixedParagraph(
        id: '4',
        list: [
          BoldParagraph(content: "Forced Humor:"),
          Paragraph(content: " If the joke feels forced, it likely won’t land well. It should feel natural and effortless.\n\n"),
        ],
      ),
      BoldParagraph(content: "Practice Exercises"),
      MixedParagraph(
        id: '1',
        list: [
          BoldParagraph(content: "Daily Life Twist:"),
          Paragraph(content: " Think of something mundane and add a twist. E.g., “Doing laundry is my cardio—I call it the spin cycle workout.”\n"),
        ],
      ),
      MixedParagraph(
        id: '2',
        list: [
          BoldParagraph(content: "Inversion:"),
          Paragraph(content: " Take a well-known fact and flip it. E.g., “They say the early bird catches the worm, but I say the early worm gets eaten.”\n\n"),
        ],
      ),
      BoldParagraph(content: "Example Exercise"),
      MixedParagraph(
        id: '1',
        list: [
          BoldParagraph(content: "Topic:"),
          Paragraph(content: " Coffee\n"),
        ],
      ),
      MixedParagraph(
        id: '2',
        list: [
          BoldParagraph(content: "Associations:"),
          Paragraph(content: " Morning, energy, addiction, caffeine\n"),
        ],
      ),
      MixedParagraph(
        id: '3',
        list: [
          BoldParagraph(content: "Setup:"),
          Paragraph(content: " “I like my coffee like I like my mornings…”\n"),
        ],
      ),
      MixedParagraph(
        id: '4',
        list: [
          BoldParagraph(content: "Punchline:"),
          Paragraph(content: " “…nonexistent.”\n"),
        ],
      ),
      MixedParagraph(
        list: [
          BoldParagraph(content: "Result: "),
          Paragraph(content: "“I like my coffee like I like my mornings — nonexistent.”"),
        ],
      ),
    ],
  ),
];
