
### markov3: Markov chain algorithm with three-word phrases

By Andrew Stewart ([http://andrewinfosec.com](http://andrewinfosec.com))

A Ruby implementation of the [Markov chain
algorithm](http://en.wikipedia.org/wiki/Markov_chain) with three-word phrases.
The objective is to read a source text and use it to generate random text that
"reads well", meaning the output is closer to proper-sounding English than
gibberish. For example, using the Project Gutenberg version of _Second Variety_
by Philip K. Dick:

    $ ./markov3.rb < second_variety.txt | fmt | head 
    The Russian began to walk aimlessly back the way they were, the
    children who had survived. Quiet. Stoic. A strange kind of fatalism
    gripped them. Nothing came as a surprise. They accepted anything
    that came along. There was something in it. Leone pried the fingers
    apart. A sealed container, aluminum. Still shiny. He put it in her
    pockets. She kicked the boot off, onto the moon--" "It only takes
    one of them." "Perhaps. I really don't know." Klaus pointed up at
    them and moving back, trying to concentrate. It was small, one of
    _them_?" "I don't know. Now I'm not sure.

Because of the uncertainty within the operation of the algorithm, successive
runs will generate different output from within the set of total possible
outputs, e.g.:

    $ ./markov3.rb < second_variety.txt | fmt | head 
    The Russian was uneasy. He knew something was wrong. He started
    forward again. A tall figure came out of action. They're delicate.
    Highly organized, I suppose." But he might not come back for me?
    You'll get me to the top of the Appenine, release the signal code.
    Because of him she was too risky; nobody wanted to be up early
    tomorrow." "Early?" "Our best chance to get away from the claws?"
    "The round things. That run and burrow." "I don't get anything.
    They may hear me but they may not want to take my chances. Maybe
    I could use a little

By default the program will generate 100 words of output. The `-i` command-line
option will remove that restriction, potentially generating an infinite stream
of text if a loop exists within the Markov chain.

