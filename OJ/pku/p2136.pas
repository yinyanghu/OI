program p2136;
var a:array['A'..'Z'] of longint;
    i,j,k,max:longint;
    s:string;
    ch:char;
begin
    fillchar(a,sizeof(a),0);
    for i:=1 to 4 do begin
        readln(s);
        for j:=1 to length(s) do
        	   if s[j] in ['A'..'Z'] then inc(a[s[j]]);
    end;
    max:=-1;
    for ch:='A' to 'Z' do 
    	if a[ch]>max then max:=a[ch];
    for i:=max downto 1 do begin
        s:='';
        for ch:='A' to 'Z' do
        	   if a[ch]>=i then s:=s+'* ' else s:=s+'  ';
        for j:=length(s) downto 1 do
        	   if s[j]='*' then begin
                for k:=1 to j do write(s[k]);
                writeln;
                break;
            end;
    end;
    for ch:='A' to 'Y' do write(ch,' ');
    writeln('Z');
end.