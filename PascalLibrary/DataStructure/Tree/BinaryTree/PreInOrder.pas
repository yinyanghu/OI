program xianzhong;
var x,z:string;
procedure find(a,b:string);
 var s,l:integer;
 begin
     l:=length(a);
     if l=1 then write(a) else begin
	 s:=pos(a[1],b);
	 if (s-1>0) then find(copy(a,2,s-1),copy(b,1,s-1));
	 if (l-s>0) then find(copy(a,s+1,l-s),copy(b,s+1,l-s));
	 write(a[1]);
     end;
 end;

begin
    writeln('*************************************');
    writeln('Enter Xian Xu Bian Ji=');
    readln(x);
    writeln('Enter Zhong Xu Bian Ji=');
    readln(z);
    find(x,z);
    readln;
end.
