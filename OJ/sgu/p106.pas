program p106;
const w=1e-6;
type tlim=record
         l,r:extended;
     end;
var a,b,c,x1,x2,y1,y2,
    d,x0,y0,ans:int64;
    limx,limy:tlim;
    e:extended;

function gcd(a,b:int64;var x,y:int64): int64;
 var t:int64;
 begin
     if b=0 then begin
        gcd:=a;
        x:=1;
        y:=0;
     end else begin
         gcd:=gcd(b,a mod b,x,y);
         t:=x; x:=y;
         y:=t-a div b*y;
     end;
 end;

procedure common(var limset1:tlim; limset2:tlim);
 begin
     if limset1.l<limset2.l then limset1.l:=limset2.l;
     if limset1.r>limset2.r then limset1.r:=limset2.r;
 end;

begin
    readln(a,b,c,x1,x2,y1,y2);
    ans:=0;
    if (a=0) and (b=0) then begin
        if c=0 then ans:=(x2-x1+1)*(y2-y1+1);
        writeln(ans);
        halt;
    end;
    if (a=0) or (b=0) then begin
        if (a=0) then begin
           e:=-c/b;
           if (abs(e-trunc(e))<w) and (y1<=e) and (e<=y2) then ans:=1
        end else begin
            e:=-c/a;
           if (abs(e-trunc(e))<w) and (x1<=e) and (e<=x2) then ans:=1;
        end;
        writeln(ans);
        halt;
    end;
    d:=gcd(a,b,x0,y0);
    if -c mod d<>0 then begin
        writeln(ans);
        halt;
    end;
    x0:=x0*(-c div d) mod b;
    y0:=-(a*x0+c) div b;
    a:=a div d; b:=b div d;
    if b>0 then begin
       limx.l:=(x1-x0)/b;
       limx.r:=(x2-x0)/b;
    end else begin
        limx.l:=(x2-x0)/b;
        limx.r:=(x1-x0)/b;
    end;
    if a>0 then begin
       limy.l:=(y0-y2)/a;
       limy.r:=(y0-y1)/a;
    end else begin
        limy.l:=(y0-y1)/a;
        limy.r:=(y0-y2)/a;
    end;
    common(limx,limy);
    if limx.r<limx.l then begin
        writeln('0');
        halt;
    end;
    if abs(limx.l-trunc(limx.l))>w then limx.l:=round(limx.l+0.5);
    if abs(limx.r-trunc(limx.r))>w then limx.r:=round(limx.r-0.5);
    ans:=trunc(limx.r-limx.l)+1;
    writeln(ans);
end.

{program p106;
var a,b,c,d,x1,x2,y1,y2,x0,y0:int64;
    i:longint;
    t:array[1..4] of int64;
    x,y:extended;

function extended_gcd(a,b:int64; var x,y:int64):int64;
 var t:int64;
 begin
     if (b=0) then begin
        extended_gcd:=a;
        x:=1;
        y:=0;
     end else begin
         extended_gcd:=extended_gcd(b,a mod b,x,y);
         t:=x; x:=y;
         y:=t-(a div b)*y;
     end;
 end;

begin
//    assign(input,'p106.in'); reset(input);
    readln(a,b,c);
    readln(x1,x2);
    readln(y1,y2);
  //  close(input);
    if (a=0) and (b=0) then begin
        if c=0 then writeln((abs(x2-x1)+1)*(abs(y2-y1)+1))
          else writeln('0');
        halt;
    end;
    if (a=0) then begin
        y:=(-c)/b;
        if (y>=y1) and (y<=y2) then writeln('1')
          else writeln('0');
        halt;
    end;
    if (b=0) then begin
        x:=(-c)/a;
        if (x>=x1) and (x<=x2) then writeln('1')
          else writeln('0');
        halt;
    end;
    d:=extended_gcd(a,-b,x0,y0);
    if c mod d<>0 then begin
        writeln('0');
        halt;
    end;
    a:=a div d; b:=b div d; c:=c div d;
    x0:=x0*(-c); y0:=y0*(-c);
    if b<0 then begin
       t[1]:=trunc((x2-x0)/b);
       t[2]:=trunc((x1-x0)/b);
    end else begin
        t[1]:=trunc((x1-x0)/b);
        t[2]:=trunc((x2-x0)/b);
    end;
    if a<0 then begin
       t[3]:=trunc((y0-y1)/a);
       t[4]:=trunc((y0-y2)/a);
    end else begin
        t[3]:=trunc((y0-y2)/a);
        t[4]:=trunc((y0-y1)/a);
    end;
    if (t[1]>t[2]) or (t[3]>t[4]) then begin
        writeln('0');
        halt;
    end;
    writeln(abs(t[1]-t[2])+1);
end.
}
