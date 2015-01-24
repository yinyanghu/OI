program shuhe;
var n:byte;
    num:array[0..255] of byte;
    total:word;
procedure output(dep:byte);
 var j:byte;
 begin
     for j:=1 to dep do write(num[j]:3);
     writeln;
     inc(total);
 end;
procedure find(n,dep:byte);
 var i,j,rest:byte;
 begin
     for i:=1 to n do if num[dep-1]<=i then begin
         num[dep]:=i;
         rest:=n-i;
         if (rest>0) then find(rest,dep+1) else if rest=0 then output(dep);
         num[dep]:=0;
     end;
 end;

begin
    writeln('Enter N=');
    readln(n);
    fillchar(num,sizeof(num),0);
    total:=0;
    num[0]:=0;
    find(n,1);
    writeln('Sum=',total);
end.