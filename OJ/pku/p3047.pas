program p3047;
const
	a:array[0..6] of string = ('sunday','monday','tuesday','wednesday','thursday','friday','saturday');
var
	year,month,day,century,week:longint;
begin
	readln(year,month,day);
	if (month <= 2) then begin
		dec(year);
		month:=month + 12;
	end;
	century:=year div 100;
	year:=year mod 100;
	week:=year + trunc(year / 4) + trunc(century / 4) - 2 * century + trunc(26 * (month + 1) / 10) + day - 1;
	while (week < 0) do week:=week + 7;
	week:=week mod 7;
	writeln(a[week]);
end.