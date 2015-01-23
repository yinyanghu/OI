program list;
type exam=record
         sc:integer;
         na:string;
     end;
     inf=record
         na:string;
         num:integer;
     end;
var a:array[1..10000] of inf;
    p:array[1..50,1..10000] of exam;
    total:array[1..50] of longint;
    i,j,k,m,n,t,po:longint;
    s:string;
    c:char;

procedure sort(l,r:integer);
 var i,j,k:integer;
     x,y:string;
 begin
     i:=l; j:=r; x:=a[(l+r) div 2].na;
     repeat
       while a[i].na<x do inc(i);
       while a[j].na>x do dec(j);
       if i<=j then begin
           y:=a[i].na; a[i].na:=a[j].na; a[j].na:=y;
           k:=a[i].num; a[i].num:=a[j].num; a[j].num:=k;
           inc(i);
           dec(j);
       end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

function search(s:string; l,r:integer):integer;
 var y:integer;
 begin
     if l=r then exit(r);
     y:=l+(r-l+1) div 2;
     if a[y].na<s then search:=search(s,l,y-1)
       else if (a[y].na>s) then search:=search(s,y+1,r)
         else search:=search(s,y,y);
 end;

begin
    assign(input,'list.in'); reset(input);
    assign(output,'list.out'); rewrite(output);
    readln(n);
    for i:=1 to n do begin
        readln(a[i].na);
        a[i].num:=i;
    end;
    readln(m);
    for i:=1 to m do
      for j:=1 to n do begin
          read(p[i,j].sc);
          read(c);
          readln(p[i,j].na);
      end;
    close(input);
    fillchar(total,sizeof(total),0);
    sort(1,n);
    po:=search('JLY',1,n);
    for i:=1 to m do begin
        for j:=1 to n do begin
            s:=p[i,j].na;
            k:=search(s,1,n);
            total[k]:=total[k]+p[i,j].sc;
        end;
        t:=0;
        for j:=1 to n do if (total[j]>total[po]) then t:=t+1;
        t:=t+1;
        writeln(t);
    end;
    close(output);
end.