#! /bin/bash

# lt less than <
# gt greater than >
# le less than or equal to <=
# ge greater than or equal to >=
# eq equal to ==
# ne not equal to !=s

echo "Should I cross the road?"
read answer
if [ "$answer" = "yes" ]
then
    echo "Look left"
    sleep 1
    echo "Look right"
    sleep 1
    echo "Cross road"
elif [ "$answer" = "no" ]
then
    echo "Turn around"
    sleep 1
    echo "Every now and then I get a little bit lonely and you're never coming round"
    sleep 2
    echo "Turn around"
    sleep 1
    echo "Every now and then I get a little bit tired of listening to the sound of my tears"
    sleep 2
    echo "Turn around"
    sleep 1
    echo "Every now and then I get a little bit nervous that the best of all the years have gone by"
    sleep 2
    echo "Turn around"
    sleep 1
    echo "Every now and then I get a little bit terrified and then I see the look in your eyes"
    sleep 2
    echo "Turn around, bright eyes"
    sleep 1
    echo "Every now and then I fall apart"
    sleep 2
    echo "Turn around, bright eyes"
    sleep 1
    echo "Every now and then I fall apart"
    sleep 1
    echo "And I need you now tonight"
    sleep 1
    echo "And I need you more than ever"
    sleep 1
    echo "And if you only hold me tight"
    sleep 1
    echo "We'll be holding on forever"
    sleep 1
    echo "And we'll only be making it right"
    sleep 1
    echo "'Cause we'll never be wrong together"
    sleep 1
    echo "We can take it to the end of the line"
    sleep 1
    echo "Your love is like a shadow on me all of the time (all of the time)"
    sleep 1
    echo "I don't know what to do and I'm always in the dark"s
    sleep 3
    echo "Sorry, I got carried away there."
    echo "The funniest thing about it is that Copilot wrote most of that."
    echo "The best 10 dollars I ever spent."
    echo "Anyway, I'm going to cross the road now."

else
    echo "Wait"
fi

# Case example
echo "What is your favourite colour?"
read colour
case "$colour" in
    "blue")
        echo "Blue is my favourite colour too!"
        ;;
    "red")
        echo "Red is my favourite colour too!"
        ;;
    "green")
        echo "Green is my favourite colour too! Due to Palmeiras being the best team in the world."
        echo "Copilot wrote that last bit."
        echo "He is right though."
        ;;
    *)
        echo "I don't like that colour."
        ;;
esac