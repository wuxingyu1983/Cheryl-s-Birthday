birthday((may, 15)).
birthday((may, 16)).
birthday((may, 19)).
birthday((june, 17)).
birthday((june, 18)).
birthday((july, 14)).
birthday((july, 16)).
birthday((august, 14)).
birthday((august, 15)).
birthday((august, 17)).

birthdays([(may, 15), (may, 16), (may, 19), (june, 17), (june, 18), (july, 14), (july, 16), (august, 14), (august, 15), (august, 17)]).

month(X, Birthday) :- Birthday = (X, Y), birthday((X, Y)).
day(X, Birthday) :- Birthday = (Y, X),  birthday((Y, X)).

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

statement3(X) :- 	birthday(X),
				    birthdays(List),
					have_same_month(X, List, SameMonth),
					length(SameMonth, LengthM),
					LengthM > 1,
					funcA(SameMonth).

list3([], []).
list3([Head|Tail], X) :-	statement3(Head) -> list3(Tail, XTail), append(XTail, [Head], X);
										list3(Tail, XTail), append(XTail, [], X).

statement4(X) :-	birthday(X),
				    birthdays(List),
					list3(List, List1),
					have_same_day(X, List1, SameDay),
					length(SameDay, LengthD),
					LengthD = 1.

list4([], []).
list4([Head|Tail], X) :-	(statement3(Head), statement4(Head)) -> list4(Tail, XTail), append(XTail, [Head], X);
										list4(Tail, XTail), append(XTail, [], X).


cheryl(X) :-	statement3(X),
				statement4(X),
				birthdays(List),
				list4(List, List2),
				have_same_month(X, List2, SameMonth),
				length(SameMonth, LengthM),
				LengthM = 1.

