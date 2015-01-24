program zhonghou;
var z,h:string;
procedure find(a,b:string);
 var s,l:integer;
 begin
     l:=length(b);
     if l=1 then write(b) else begin
	 write(b[l]);
	 s:=pos(b[l],a);
	 if (s-1>0) then find(copy(a,1,s-1),copy(b,1,s-1));
	 if (l-s>0) then find(copy(a,s+1,l-s),copy(b,s,l-s));
     end;
 end;

begin
    writeln('*******************************');
    writeln('Enter Zhong Xu Bian Ji=');
    readln(z);
    writeln('Enter Hou Xu Bian Ji=');
    readln(h);
    find(z,h);
    readln;
end.
