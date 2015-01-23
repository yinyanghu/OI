program p2141;
var a:array['a'..'z'] of char;
    i:longint;
    ch:char;
    s,t:string;
begin
    for ch:='a' to 'z' do read(a[ch]);
    readln;
    readln(s); t:='';
    for i:=1 to length(s) do
	if s[i] in ['a'..'z'] then t:=t+a[s[i]] else 
	    if s[i] in ['A'..'Z'] then t:=t+upcase(a[lowercase(s[i])])
		else t:=t+s[i];
    writeln(t);
end.