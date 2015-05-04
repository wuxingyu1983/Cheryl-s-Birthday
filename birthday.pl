birthdays([(may, 15), (may, 16), (may, 19), (june, 17), (june, 18), (july, 14), (july, 16), (august, 14), (august, 15), (august, 17)]).

have_same_month(Day, [], []).
have_same_month(Day, [Head|Tail], Birthdays) :- Head = (Month1, X),
												Day = (Month2, Y),
												(Month1 = Month2) -> have_same_month(Day, Tail, BirthdaysTail), append(BirthdaysTail, [Head], Birthdays);
															 have_same_month(Day, Tail, BirthdaysTail), append(BirthdaysTail, [], Birthdays).

have_same_day(Day, [], []).
have_same_day(Day, [Head|Tail], Birthdays) :- Head = (X, Day1),
												Day = (Y, Day2),
												(Day1 = Day2) -> have_same_day(Day, Tail, BirthdaysTail), append(BirthdaysTail, [Head], Birthdays);
															 have_same_day(Day, Tail, BirthdaysTail), append(BirthdaysTail, [], Birthdays).

funcA([]).
funcA([Head|Tail]) :-	birthdays(List),
						have_same_day(Head, List, SameDay),
						length(SameDay, LengthD),
						LengthD > 1,
						funcA(Tail).

statement3([], _, []).
statement3([Head|Tail], List, Output) :- 	have_same_month(Head, List, SameMonth),
											length(SameMonth, LengthM),
											(LengthM > 1, funcA(SameMonth)) -> 	statement3(Tail, List, OutputTail), append(OutputTail, [Head], Output); 
																				statement3(Tail, List, OutputTail), append(OutputTail, [], Output).
statement4([], _, []).
statement4([Head|Tail], List, Output) :-	have_same_day(Head, List, SameDay),
											length(SameDay, LengthD),
											LengthD = 1 -> 	statement4(Tail, List, OutputTail), append(OutputTail, [Head], Output); 
															statement4(Tail, List, OutputTail), append(OutputTail, [], Output).

cheryl(X) :-	birthdays(List),
				statement3(List, List, Output3),
%				write(Output3),
				statement4(Output3, Output3, Output4),
%				write(Output4),
				member(X, Output4),
				have_same_month(X, Output4, SameMonth),
				length(SameMonth, LengthM),
				LengthM = 1.

