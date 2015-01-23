program point24;
type node=record
         sign:integer;
         na,nb,total:integer;
     end;
     arr=array[1..4] of integer;
var a:arr;
    i:integer;
    ans:array[1..3] of node;

procedure print;
 var i:integer;
 begin
     for i:=1 to 3 do begin
         write(ans[i].na);
         case ans[i].sign of
             1:write('+');
             2:write('-');
             3:write('*');
             4:write('/');
         end;
         write(ans[i].nb,'=',ans[i].total);
         writeln;
     end;
     close(output);
     halt;
 end;

procedure try(k:integer; a:arr);
 var i,j,m,s,p,q,t:integer;
     next:arr;
 begin
     if (k=1) and (a[1]=24) then print;
     for i:=1 to k-1 do
       for j:=i+1 to k do begin
           p:=a[i]; q:=a[j];
           if p<q then begin
               m:=p; p:=q; q:=m;
           end;
           fillchar(next,sizeof(next),0);
           t:=0;
           for m:=1 to k do if (m<>i) and (m<>j) then begin
               inc(t);
               next[t]:=a[m];
           end;
           ans[5-k].na:=p; ans[5-k].nb:=q; ans[5-k].total:=maxint;
           for m:=1 to 4 do begin
               case m of
                   1:ans[5-k].total:=p+q;
                   2:ans[5-k].total:=p-q;
                   3:ans[5-k].total:=p*q;
                   4:if (q<>0) and (p mod q=0) then ans[5-k].total:=p div q;
               end;
               ans[5-k].sign:=m;
               if (ans[5-k].total<>maxint) and (k-1>0) then begin
                   next[t+1]:=ans[5-k].total;
                   try(k-1,next);
               end;
           end;
       end;
 end;

begin
    assign(input,'point24.in'); reset(input);
    for i:=1 to 4 do read(a[i]);
    close(input);
    assign(output,'point24.out'); rewrite(output);
    try(4,a);
    writeln('No answer!');
    close(output);
end.
