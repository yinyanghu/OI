program salesman;
var a:array[1..40,1..40] of integer;
    n,min,total:longint;
    ok:array[1..40] of boolean;

procedure init;
 var i,j:integer;
 begin
     assign(input,'salesman.in'); reset(input);
     readln(n);
     for i:=1 to n do
       for j:=1 to n do read(a[i,j]);
     fillchar(ok,sizeof(ok),true);
     min:=maxlongint;
     total:=0;
     close(input);
 end;

procedure try(k,m:longint);
 var i:integer;
 begin
     if (k=n) and (total+a[m,1]<min) then begin
         min:=total+a[m,1];
         exit;
     end;
     for i:=2 to n do
       if (i<>m) and ok[i] then begin
           total:=total+a[m,i];
           ok[m]:=false;
           if (total<min) then try(k+1,i);
           total:=total-a[m,i];
           ok[m]:=true;
       end;
 end;

procedure print;
 begin
     assign(output,'salesman.out'); rewrite(output);
     writeln(min);
     close(output);
 end;

begin
    init;
    try(1,1);
    print;
end.
