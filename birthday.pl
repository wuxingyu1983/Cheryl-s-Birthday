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


reverse_list([],[]).
reverse_list(List,ReverseList) :- List = [Head|Tail],
         reverse_list(Tail, ReverseTail),
		          append(ReverseTail,[Head],ReverseList).

