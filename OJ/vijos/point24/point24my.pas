program point24;
type node=record
         sign:integer;
         na,nb,total:integer;
     end;
     arr=array[1..4] of integer;
var a:arr;
    i:integer;
    ans:array[1..3] of node;
    ok:array[1..4] of boolean;

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


procedure try(k,sum:integer);
 var i,j,m,n,p,q,s,t:integer;
 begin
     for i:=1 to 4 do
       if ok[i] then begin
           ok[i]:=false;
           p:=sum; q:=a[i];
           if p<q then begin
               s:=p; p:=q; q:=s;
           end;
           ans[k].na:=p; ans[k].nb:=q;
           for j:=1 to 4 do begin
               ans[k].sign:=j;
               case j of
                   1:ans[k].total:=p+q;
                   2:ans[k].total:=p-q;
                   3:ans[k].total:=p*q;
                   4:if (q<>0) and (p mod q=0) then ans[k].total:=p div q;
               end;
               if (k=3) and (ans[k].total=24) then print
                 else if (k<3) then try(k+1,ans[k].total);
           end;
           ok[i]:=true;
       end;
 end;

begin
    assign(input,'point24.in'); reset(input);
    for i:=1 to 4 do read(a[i]);
    close(input);
    fillchar(ok,sizeof(ok),true);
    assign(output,'point24.out'); rewrite(output);
    for i:=1 to 4 do begin
        ok[i]:=false;
        try(1,a[i]);
        ok[i]:=true;
    end;
    writeln('No answer!');
    close(output);
end.
