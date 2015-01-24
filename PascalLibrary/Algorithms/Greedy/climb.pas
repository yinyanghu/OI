program climb;
const maxp=10;
type node=record
         no,need,take,hh:longint;
         t:double;
         flag:boolean;
     end;
var min,i,j,n,p,kneed,ktake,kd,kh,kk:longint;
    club,list:array[1..maxp] of node;
    q:node;
procedure sort(l,r:longint);
 var i,j:longint;
     x:double;
     y:node;
 begin
     i:=l; j:=r; x:=club[(l+r) div 2].t;
     repeat
        while club[i].t<x do inc(i);
        while club[j].t>x do dec(j);
        if i<=j then begin
            y:=club[i]; club[i]:=club[j]; club[j]:=y;
            inc(i); dec(j);
        end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

procedure init;
 var i:longint;
 begin
     readln(n,p);
     for i:=1 to p do begin
         club[i].no:=i;
         club[i].flag:=true;
         read(club[i].need);
     end;
     for i:=1 to p do begin
         read(club[i].take);
         club[i].t:=club[i].take/club[i].need;
     end;
     min:=maxlongint;
 end;

function trunc(a,b:longint):longint;
 begin
     if (a mod b=0) then trunc:=a div b
        else trunc:=(a div b)+1;
 end;

procedure print;
 var i:longint;
 begin
     writeln('Total=',kk,'  Min need=',min);
     for i:=1 to kk do writeln('No.',list[i].no,'  Climb height=',list[i].hh);
 end;

procedure search(k,need,take,h:longint);
 var i,knd,m:longint;
 begin
     for i:=1 to p do
         if (club[i].flag) and (club[i].t>h) then begin
             kneed:=need+club[i].need*2*h;
             if kneed>min then continue;
             club[i].flag:=false;
             ktake:=take+club[i].take;
             if (ktake>kneed) then kd:=0
                else kd:=kneed-ktake;
             knd:=0;
             for m:=1 to k do knd:=club[m].need+knd;
             kh:=trunc(kd,knd);
             list[k].no:=club[i].no;
             list[k].hh:=h;
             if kh=0 then begin
                if kneed<min then begin
                    min:=kneed;
                    kk:=k;
                end;
             end else search(k+1,kneed,ktake,kh);
             club[i].flag:=true;
         end;
 end;

begin
    init;
    sort(1,n);
    search(1,0,0,n);
    print;
end.