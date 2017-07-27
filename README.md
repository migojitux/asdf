# asdf
Please forgive the generic nature of the repository's name.  It is to avoid random lookups by people searching for it

Many thanks to https://www.ruby-lang.org/en/documentation/quickstart/ for getting me on the right track
* `lib` contains library files for classes and methods that are intended for reuse
* `data` contains data, whether it was the originally-provided data or hand-cooked items
* `q2.rb` is the solution for Tech Question 2


## Tech q3
This is a black hole, in terms of how complicated it can become in order to model reality
* My implementation requires a simple graph, where the edge between two nodes is of equal weight in both directions
* Dijkstra's Algorithm is used to calculate the shortest paths and the weighted distances
* The implementation for Dijkstra's Algorithm was borrowed from (Roganartu|https://gist.github.com/roganartu/9407316)
* Travel times between stations is fixed, and cannot be made to account for the wait-time suffered by changing line/platforms
* The concept of "Piccadilly Circus Bakerloo Line" and "Piccadilly Circus Piccadilly Line" is a horrible hack.  It was necessary in order to avoid a much more glorious (complicated, time-consuming) data model that I started implementing.  Alas, the 'perfect' model would have required a complete re-write of the graph system and for me to write a whole new bi-directional shortest-path algorithm.  In this case, I went for "Done is better than perfect" 
* The traversal time from one line/platform to another is thus used to represent the wait-time for another train to arrive.  This is obviously going to be an 'average' value, but in reality it would need to be aware of peak and off-peak schedules
