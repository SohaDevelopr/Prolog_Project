
/* Car.pro
    start with ?- start.     */

start :- hypothesize(CarName,Seatingcapacity),

      write('Choose The Car Seat Capacity :  '),
      read(Seatingcapacity),
       nl,

      write('The perfect car to buy is: '),
      write(CarName),
      nl,
      undo.

/* hypotheses to be tested */
hypothesize('Volkswagen Id4 2024,colors is(black,red)',5) :- id4, !.
hypothesize('Volvo Ex90 2024,colors is(black,gray)',7):- 'ex90', !.
hypothesize('Abarth 500e 2024,colors is(black,green)',4):- '500e', !.
hypothesize('Audi A8 2022,colors is(black)',5):- 'A8', !.
hypothesize('Lamborghini Urus 2022,colors is(yellow)',4):- 'urus', !.
hypothesize('Porsche Boxster 2013,colors is(silver)',2):- boxster, !.
hypothesize('Jeep Wagoineer 2023,colors is(black,white,silver)',8):-'wagoineer',!.
hypothesize('Ram 1500 2022,colors is(black,white)',6):- '1500', !.
hypothesize('Chrysler 300 2023,colors is(black,red)',5):- '300', !.
hypothesize('Geely_auto Tugella 2022,colors is(silver,white)',5):- 'tugella',!.
hypothesize('Honda Civic Type R 2017,colors is(black,white)',5):- 'type r', !.
hypothesize('Toyota Corolla 2024,colors is(silver,white)',5):- 'corolla', !.
hypothesize(unknown,unknown).


/*identification rules */
id4 :-  elec,
        aut,
        mod,
        hig,
        de,
        verify(has_SUV).

'ex90':-  elec,
          aut,
          mod,
          mid,
          ch,
          verify(has_Sedan).

'500e' :- elec ,
          aut,
          mod,
          aff,
          nld,
          verify(has_Sport).

'A8'  :-   gaso,
           aut,
           mod,
           hig,
           de,
           verify(has_Sedan).

'urus' :-  gaso,
           aut,
           mod,
           hig,
           de,
           verify(has_SUV).

boxster :- gaso,
           aut,
           old,
           hig,
           de,
           verify(has_Convertible).

'wagoineer':-  gaso,
               aut,
               mod,
               hig,
               nld,
               verify(has_Awd).

'1500' :-  gaso,
           aut,
           mod,
           mid,
           nld,
           verify(has_pickup).

'300'  :-  gaso,
           aut,
           mod,
           mid,
           nld,
           verify(has_Sedan).

'tugella':-  gaso,
             aut,
             mod,
             mid,
             ch,
             verify(has_Awd).

'type r' :- gaso,
            manual,
            old,
            aff,
            jp,
            verify(has_sports).

'corolla' :- gaso,
             manual,
             mod,
             aff,
             jp,
             verify(has_sedan).


/* classification rules */
elec    :- verify(it_Electrical),!.
gaso    :- verify(it_Gasoline),!.

aut     :- verify(it_Automatic),!.
manual  :- verify(it_Manual),!.

mod     :- verify(is_it_Modern_version),!.
old     :- verify(is_it_old_version),!.

hig     :- verify(it_highend),!.
mid     :- verify(it_midrange),!.
aff     :- verify(it_affordable),!.

de      :- verify(frome_germans),!.
nld     :- verify(frome_holland),!.
ch      :- verify(frome_china),!.
jp      :- verify(frome_japan),!.

/* ask questions */
ask(Question) :-
    write('Do You Prefer For Car To Be: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1,no/1.

/* to verify something */
verify(S) :-
   (yes(S)
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(S))).

/* undo all yes/no assertions */
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.


