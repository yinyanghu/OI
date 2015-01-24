program point24;
type arr=array[1..4] of integer;
var i,n:integer;
    a:arr;
    r:array[1..3,1..4] of integer;
procedure print;
 var i,j:integer;
 begin
     for i:=1 to 3 do begin
       for j:=1 to 3 do
         if j<>2 then write(r[i,j])
            else case r[i,j] of
                    1:write('+');
                    2:write('-');
                    3:write('*');
                    4:write('/');
                 end;
         writeln('=',r[i,4])
     end;
     close(output);
 end;

procedure try(k:integer; a:arr);
 var p,q,i,j,l,t:integer;
     e:arr;
 begin
     if k=1 then if a[1]=24 then begin
         print;
         halt;
     end;
     for i:=1 to k-1 do
       for j:=i+1 to k do begin
           p:=a[i]; q:=a[j];
           if p<q then begin
               t:=p; p:=q; q:=t;
           end;
           t:=0;
           for l:=1 to k do if (l<>i) and (l<>j) then begin
               inc(t);
               e[t]:=a[l];
           end;
           r[5-k,1]:=p; r[5-k,3]:=q; r[5-k,4]:=-1;
           for l:=1 to 4 do begin
               case l of
                   1:r[5-k,4]:=p+q;
                   2:r[5-k,4]:=p-q;
                   3:r[5-k,4]:=p*q;
                   4:if q<>0 then if p mod q=0 then r[5-k,4]:=p div q;
                   end;
               r[5-k,2]:=l;
               if r[5-k,4]<>-1 then begin
                   e[t+1]:=r[5-k,4];
                   try(k-1,e);
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