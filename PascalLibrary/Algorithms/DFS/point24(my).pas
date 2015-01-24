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
 var p,q,i,j,m,t:integer;
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
           for m:=1 to k do if (m<>i) and (m<>j) then begin
               inc(t);
               e[t]:=a[m];
           end;
           r[5-k,1]:=p; r[5-k,3]:=q; r[5-k,4]:=-1;
           for m:=1 to 4 do begin
               case m of
                   1:r[5-k,4]:=p+q;
                   2:r[5-k,4]:=p-q;
                   3:r[5-k,4]:=p*q;
                   4:if q<>0 then if p mod q=0 then r[5-k,4]:=p div q;
                   end;
               r[5-k,2]:=m;
               if r[5-k,4]<>-1 then begin
                   e[t+1]:=r[5-k,4];
                   try(k-1,e);
               end;
           end;
       end;
 end;
procedure init;
 var i,j,sum,p:integer;
     s:string;
     c:char;
 begin
     readln(s);
     sum:=0;
     j:=1;
     while sum<=4 do begin
         inc(sum);
         while s[j]=' ' do inc(j);
         if s[j] in ['1'..'9'] then begin
             p:=ord(s[j])-ord('0');
             if p=1 then begin
                 p:=10;
                 inc(j);
             end;
         end else case s[j] of
             'A':p:=1;
             'J':p:=11;
             'Q':p:=12;
             'K':p:=13;
         end;
         a[sum]:=p;
         inc(j);
     end;
 end;

begin
    init;
    try(4,a);
    writeln('No answer!');
end.
